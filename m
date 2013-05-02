Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXvPo-0003lh-NX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:27:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r42F9Rqu027730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 May 2013 08:09:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 2 May 2013 08:09:27 -0700
Message-ID: <518281A4.6040900@windriver.com>
Date: Thu, 2 May 2013 10:09:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
	<CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
In-Reply-To: <CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r42F9Rqu027730
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 15:27:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/2/13 9:55 AM, Andreas M=C3=BCller wrote:
> On Thu, May 2, 2013 at 4:50 PM, Mark Hatle <mark.hatle@windriver.com> w=
rote:
>> On 5/2/13 9:34 AM, Paul Eggleton wrote:
>>>
>>> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>>>>
>>>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>>>>>
>>>>> on one of my build machines useradd.bbclass seem to use the UID/GID=
 of
>>>>> build host. On other machines useradd works correct.
>>>>>
>>>>> I have the follwing in gdm:
>>>>>
>>>>> <snip>
>>>>> do_install_append() {
>>>>>
>>>>>        ...
>>>>>        chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>>>        chmod 0750 ${D}${localstatedir}/lib/gdm
>>>>>
>>>>> }
>>>>>
>>>>> ...
>>>>>
>>>>> USERADD_PACKAGES =3D "${PN}"
>>>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>>>> ${localstatedir}/lib/gdm --user-group gdm"
>>>>> <snip/>
>>
>>
>> I don't know how ipk and deb handle this.  But with the RPM system it
>> captures the uname/gname (not uid/gid) and uses that when installing t=
he
>> file(s).  This way the USERADD is processed before the install and the=
 right
>> value is used during the install.
>>
>> We may have a problem here where we need to also process the useradd
>> -before- the do_install runs so that it's available for pseudo to use =
for
>> deb/ipk.  (But if deb/ipk capture uid/gid vs uname/gname..  unless we =
set a
>> static value we could still have a problem.)
> 1. gdm's log.do_install starts with so I assume the useradd stuff is
> performed before do_install.
>
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | DEBUG: Executing shell function useradd_sysroot
> | Running useradd commands...
> | DEBUG: Shell function useradd_sysroot finished
> | DEBUG: Executing shell function do_install

Ahh yes, there it is.. I forgot as well.

ok, so the obvious problems are resolved.  The only place I can suggest y=
ou=20
start looking would be in the sysroot's etc/passwd and etc/group files.  =
If they=20
are not correct -- then this indicates a failure in the easy case and cou=
ld lead=20
to incorrect values.

The other thing you can do is add debugging to your script and see what u=
id and=20
such it's looking for.. Dumping out the environment variables that start =
with=20
'PSEUDO_' may help.  I believe the value is PSEUDO_PASSWD for the path.  =
If it's=20
not set it falls back to the chroot (which you won't be in) and then back=
 to the=20
system file --- so if PSEUDO_PASSWD isn't set this could be a clue as to =
the fault.

--Mark

> 2. I did a cleansstate + rebuild for gdm to ensure that user/groups
> are in sysroot - but the same I get host's IDs
>
> Andreas
>



