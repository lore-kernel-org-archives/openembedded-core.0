Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RYgC2-0007ds-KU
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:47:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8Fed5q017823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 07:40:39 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 8 Dec 2011 07:40:39 -0800
Message-ID: <4EE0DA76.8060807@windriver.com>
Date: Thu, 8 Dec 2011 09:40:38 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1323279247.30601.51.camel@ted>
	<201112080053.11966.schnitzeltony@gmx.de>
	<20111208070548.GB3761@jama.jama.net>
In-Reply-To: <20111208070548.GB3761@jama.jama.net>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pB8Fed5q017823
Subject: Re: [PATCH] bitbake.conf/image.bbclass: Ensure images use the correct passwd/group files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 15:47:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/8/11 1:05 AM, Martin Jansa wrote:
> On Thu, Dec 08, 2011 at 12:53:11AM +0100, Andreas M=FCller wrote:
>> On Wednesday, December 07, 2011 06:34:07 PM Richard Purdie wrote:
>>> We need pseudo to use the rootfs passwd/group files belonging to the
>>> rootfs when building images. This patch ensures that we use the rootf=
s
>>> files instead of those in the sysroot which can lead to incorrect fil=
e
>>> ownership issues.
>>>
>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index 4642fa6..865d430 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -121,6 +121,8 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
>>>
>>>   LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "locale-base-%s" % s=
,
>>> d.getVar('IMAGE_LINGUAS', 1).split()))}"
>>>
>>> +PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}"
>>> +
>>>   do_rootfs[nostamp] =3D "1"
>>>   do_rootfs[dirs] =3D "${TOPDIR}"
>>>   do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index e80cc32..eeb1fc4 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -580,11 +580,12 @@ SRC_URI =3D "file://${FILE}"
>>>
>>>   # Use pseudo as the fakeroot implementation
>>>   PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
>>> +PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}"
>>>   export PSEUDO_DISABLED =3D "1"
>>>   #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
>>>   #export PSEUDO_BINDIR =3D "${STAGING_DIR_NATIVE}${bindir_native}"
>>>   #export PSEUDO_LIBDIR =3D
>>> "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib -FAKEROOTENV =3D
>>> "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
>>> PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
>>> PSEUDO_PASSWD=3D${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=3D1
>>> PSEUDO_DISABLED=3D0" +FAKEROOTENV =3D
>>> "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
>>> PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
>>> PSEUDO_PASSWD=3D${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=3D1 PSEUDO_DISAB=
LED=3D0"
>>> FAKEROOTNOENV =3D "PSEUDO_UNLOAD=3D1"
>>>   FAKEROOTDIRS =3D "${PSEUDO_LOCALSTATEDIR}"
>>>   PREFERRED_PROVIDER_virtual/fakeroot-native ?=3D "pseudo-native"
>> dbus still needs manual call of
>>
>> 	chown messagebus:messagebus /var/run/dbus /var/lib/dbus
>>
>> ( it is root:root on my image) and
>>
>> 	chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
>>
>> ( it is avahi:netdev on my image )
>>
>> Does this one fix it?
>
> It did for me, see:
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711
>
>> To test: Is it enough to rebuild dbus?
>
> I had right owners in dbus package, wrong only in rootfs, so your issue
> could be different.

Andreas: What packaging type are you using?

I know that RPM never uses the uid/gid, it always does a look up.  If the=
 look=20
up fails it then falls back to "root".  So you should never see something=
 like a=20
70, unless there is a manual chown/grp somewhere making the change.

opkg had a bug before where it only used the uid/gid number, I know Richa=
rd=20
patched that -- but I'm not sure what happens if the look up fails.  It m=
ay fall=20
back to the embedded numeric ids.  If that is the case, the real issue ma=
y=20
simply be that the uname/gname hasn't yet made it into the passwd/group f=
iles.

If you are using opkg, try switching to RPM and see if the behavior on th=
ese=20
files changes, if it does what the new value is.

--Mark

> Regards,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



