Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXv7q-0001c6-TI
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:09:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r42Eos22004870
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 May 2013 07:50:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 2 May 2013 07:50:53 -0700
Message-ID: <51827D4B.4070907@windriver.com>
Date: Thu, 2 May 2013 09:50:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
In-Reply-To: <1556536.BsQG791ajX@helios>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r42Eos22004870
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 02 May 2013 15:09:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/2/13 9:34 AM, Paul Eggleton wrote:
> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>> On 5/2/13 2:49 AM, Andreas M=FCller wrote:
>>> on one of my build machines useradd.bbclass seem to use the UID/GID o=
f
>>> build host. On other machines useradd works correct.
>>>
>>> I have the follwing in gdm:
>>>
>>> <snip>
>>> do_install_append() {
>>>
>>>       ...
>>>       chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>       chmod 0750 ${D}${localstatedir}/lib/gdm
>>>
>>> }
>>>
>>> ...
>>>
>>> USERADD_PACKAGES =3D "${PN}"
>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>> ${localstatedir}/lib/gdm --user-group gdm"
>>> <snip/>

I don't know how ipk and deb handle this.  But with the RPM system it cap=
tures=20
the uname/gname (not uid/gid) and uses that when installing the file(s). =
 This=20
way the USERADD is processed before the install and the right value is us=
ed=20
during the install.

We may have a problem here where we need to also process the useradd -bef=
ore-=20
the do_install runs so that it's available for pseudo to use for deb/ipk.=
  (But=20
if deb/ipk capture uid/gid vs uname/gname..  unless we set a static value=
 we=20
could still have a problem.)

Does anyone know how ipk/deb handle this?

>>>
>>> In sysroot /etc/group I see
>>> gdm:x:990:
>>>
>>> In sysroot /etc/group I see
>>> gdm:!:993:990::/var/lib/gdm:
>>>
>>> The folder in packet/image has IDs 42:42 which is taken from build ho=
st.
>>
>> This says that something ran an operation outside of the pseudo enviro=
nment.
>>   So it fell back to looking up the uid from the host system.  (The
>> alternative is the item was installed -before- the /etc/passwd,/etc/gr=
oup
>> was written to the disk.
>
> Right, do_install will be well before this stuff happens and it is not =
a
> fakeroot task anyway. This needs to be moved to a postinstall script (w=
hich
> should be able to run during image creation).

do_install is a 'fakeroot' task.  But ya, the useradd action doesn't nece=
ssarily=20
happen before it.

We should -not- be using a postinstall action to change user/groups on=20
files/directories.  This breaks the integrity checking that RPM has.  You=
 can=20
(on the target) issue an rpm -V <package> and it will go and verify the=20
installed files (including permissions, user, group) match what the RPM d=
atabase=20
says.  Making the change in a postinstall will cause a validation failure.

--Mark

> Cheers,
> Paul
>



