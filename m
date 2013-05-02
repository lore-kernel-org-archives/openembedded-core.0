Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXw5y-0002YR-PO
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 18:11:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r42Fr0iC006175
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 May 2013 08:53:00 -0700 (PDT)
Received: from msp-dhcp2.wrs.com (172.25.34.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 08:53:01 -0700
Message-ID: <51828BDE.6050001@windriver.com>
Date: Thu, 2 May 2013 10:53:02 -0500
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
	<518281A4.6040900@windriver.com>
	<CALbNGRS4FLKC+_k9iuEeoMCx0o=DsXM-uu1X7uahtcrp24R=oA@mail.gmail.com>
	<CALbNGRRm15aBQXAuqcJDEsvQ2UNC-VKj8_brbGPHj-bqxTaSKw@mail.gmail.com>
In-Reply-To: <CALbNGRRm15aBQXAuqcJDEsvQ2UNC-VKj8_brbGPHj-bqxTaSKw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r42Fr0iC006175
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
X-List-Received-Date: Thu, 02 May 2013 16:11:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/2/13 10:31 AM, Andreas M=C3=BCller wrote:
> On Thu, May 2, 2013 at 5:18 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Thu, May 2, 2013 at 5:09 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>>> On 5/2/13 9:55 AM, Andreas M=C3=BCller wrote:
>>>>
>>>> On Thu, May 2, 2013 at 4:50 PM, Mark Hatle <mark.hatle@windriver.com=
>
>>>> wrote:
>>>>>
>>>>> On 5/2/13 9:34 AM, Paul Eggleton wrote:
>>>>>>
>>>>>>
>>>>>> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> on one of my build machines useradd.bbclass seem to use the UID/=
GID of
>>>>>>>> build host. On other machines useradd works correct.
>>>>>>>>
>>>>>>>> I have the follwing in gdm:
>>>>>>>>
>>>>>>>> <snip>
>>>>>>>> do_install_append() {
>>>>>>>>
>>>>>>>>         ...
>>>>>>>>         chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>>>>>>         chmod 0750 ${D}${localstatedir}/lib/gdm
>>>>>>>>
>>>>>>>> }
>>>>>>>>
>>>>>>>> ...
>>>>>>>>
>>>>>>>> USERADD_PACKAGES =3D "${PN}"
>>>>>>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>>>>>>> ${localstatedir}/lib/gdm --user-group gdm"
>>>>>>>> <snip/>
>>>>>
>>>>>
>>>>>
>>>>> I don't know how ipk and deb handle this.  But with the RPM system =
it
>>>>> captures the uname/gname (not uid/gid) and uses that when installin=
g the
>>>>> file(s).  This way the USERADD is processed before the install and =
the
>>>>> right
>>>>> value is used during the install.
>>>>>
>>>>> We may have a problem here where we need to also process the userad=
d
>>>>> -before- the do_install runs so that it's available for pseudo to u=
se for
>>>>> deb/ipk.  (But if deb/ipk capture uid/gid vs uname/gname..  unless =
we set
>>>>> a
>>>>> static value we could still have a problem.)
>>>>
>>>> 1. gdm's log.do_install starts with so I assume the useradd stuff is
>>>> performed before do_install.
>>>>
>>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>>> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
>>>> 'common']
>>>> | DEBUG: Executing shell function useradd_sysroot
>>>> | Running useradd commands...
>>>> | DEBUG: Shell function useradd_sysroot finished
>>>> | DEBUG: Executing shell function do_install
>>>
>>>
>>> Ahh yes, there it is.. I forgot as well.
>>>
>>> ok, so the obvious problems are resolved.  The only place I can sugge=
st you
>>> start looking would be in the sysroot's etc/passwd and etc/group file=
s.  If
>>> they are not correct -- then this indicates a failure in the easy cas=
e and
>>> could lead to incorrect values.
>> These are OK and as mentioned above (cleansstate/rebuild) definitely
>> prepared before do_install.
>>>
>>> The other thing you can do is add debugging to your script and see wh=
at uid
>>> and such it's looking for.. Dumping out the environment variables tha=
t start
>>> with 'PSEUDO_' may help.  I believe the value is PSEUDO_PASSWD for th=
e path.
>>> If it's not set it falls back to the chroot (which you won't be in) a=
nd then
>>> back to the system file --- so if PSEUDO_PASSWD isn't set this could =
be a
>>> clue as to the fault.
> [andreas@oe-core]$ bitbake -e gdm | grep ^PSEUDO_PASSWD
> PSEUDO_PASSWD=3D"/home/andreas/tmp/oe-core-eglibc/sysroots/overo"

Check that path contains 'etc/passwd' and 'etc/group'.  If not, that woul=
d be=20
the issue.. if it does contain them -- then something else is happening.

--Mark

>>>
>> I will check that - still strange to me is that I have different
>> behaviour for two hosts - both with gdm user/group.
>>
>> Andreas



