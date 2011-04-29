Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFdCr-0007wL-KX
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 04:13:22 +0200
Received: by ewy5 with SMTP id 5so1042224ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 19:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Kc8l5e7qO9Vk9NmgHfmKfvTpYpsOystFOEyKupBCdEI=;
	b=I/7WUoxYqzz9fSLeFdCDFzerimflTJR+oqXLgv0zmrwjlQ4Rz3o319Swsg5cxm1XKB
	BglokeNztgBcRQY+gAGpLl8GoZDAxvWrZvE5VOQ9KfdFjKACnimGtJtwuM3qPAM5lxjc
	3B1mwSdoLypK6XDL0S0+FQ0GmDB0URO5NL9mk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hyhlgOLBdXEqB7JZKBz7REXHViB8LC6BwxpH4ZOKqYEtPX0J5/tme6Xon7Wohkz8n9
	iYQsoHvF2vToo/HrE6XGOvJe7JtKUuSVD/54jY943muwR4BTLX1AjcMawjL7JnojeVec
	sA9mekoKK15lNRcQvk3Ndf//E7+67FpKF6riY=
Received: by 10.14.125.4 with SMTP id y4mr1954484eeh.109.1304043048416; Thu,
	28 Apr 2011 19:10:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Thu, 28 Apr 2011 19:10:18 -0700 (PDT)
In-Reply-To: <4DBA11F0.8090409@mlbassoc.com>
References: <cover.1300731672.git.raj.khem@gmail.com>
	<c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>
	<4D87C5EA.1040602@mentor.com> <4DBA11F0.8090409@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2011 19:10:18 -0700
Message-ID: <BANLkTim=Jqkp=0REY1OPyQcmJJkwWtr4pw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha
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
X-List-Received-Date: Fri, 29 Apr 2011 02:13:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 6:18 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 03/21/2011 03:40 PM, Tom Rini wrote:
>>
>> On 03/21/2011 11:23 AM, Khem Raj wrote:
>>>
>>> Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
>>> /lib/${arch}-linux-gnu so we need that to be added to glibpth in
>>> Configure.
>>>
>>> Currently we set LD=3Dld in environment for recipes inheriting native
>>> class. This overrides the LD settings in the Makefiles of perl and
>>> it tries to link by calling ld which does not work since its using
>>> -l<x> on commandline and ubuntu linker seems not to look into
>>> the new location for these libraries. Its better to use gcc for linking
>>> here anyway
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>> .../perl/files/Configure-multilib.patch | 10 +++++++---
>>> meta/recipes-devtools/perl/perl-native_5.12.2.bb | 4 +++-
>>> 2 files changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>> b/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>> index d3948a9..b561b6a 100644
>>> --- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>> +++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>> @@ -1,11 +1,15 @@
>>> ---- perl-5.8.7/Configure.orig 2006-01-30 10:50:04.000000000 +0000
>>> -+++ perl-5.8.7/Configure 2006-01-30 10:51:18.000000000 +0000
>>> -@@ -1240,7 +1240,7 @@
>>> +Index: perl-5.12.2/Configure
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +--- perl-5.12.2.orig/Configure
>>> ++++ perl-5.12.2/Configure
>>> +@@ -1316,8 +1316,9 @@ loclibpth=3D"/usr/local/lib /opt/local/lib
>>> loclibpth=3D"$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
>>>
>>> : general looking path for locating libraries
>>> -glibpth=3D"/lib /usr/lib $xlibpth"
>>> +glibpth=3D"/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
>>> glibpth=3D"$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
>>> ++test -f /usr/lib/`uname -m`-linux-gnu/libc.so&&
>>> glibpth=3D"/usr/lib/`uname -m`-linux-gnu $glibpth"
>>> test -f /usr/shlib/libc.so&& glibpth=3D"/usr/shlib $glibpth"
>>> test -f /shlib/libc.so&& glibpth=3D"/shlib $glibpth"
>>> + test -d /usr/lib64&& glibpth=3D"$glibpth /lib64 /usr/lib64
>>> /usr/local/lib64"
>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>> b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>> index 9af7b06..6776aed 100644
>>> --- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>> +++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>>> LICENSE =3D "Artistic|GPL"
>>> LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f253=
d81a \
>>> file://Artistic;md5=3Df921793d03cc6d63ec4b15e9be8fd3f8"
>>> -PR =3D "r7"
>>> +PR =3D "r8"
>>>
>>> LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f253=
d81a \
>>> file://Artistic;md5=3Df921793d03cc6d63ec4b15e9be8fd3f8"
>>> @@ -28,6 +28,8 @@ S =3D "${WORKDIR}/perl-${PV}"
>>>
>>> inherit native
>>>
>>> +export LD=3D"${CC}"
>>
>> We have CCLD for when we want to use CC as our LD (and yes, this usually
>> just ends up as CC, but lets be clear please).
>>
>
> This change is not working for me on Ubuntu 11.04 {released}.
> The libraries are found in /lib/i386-linux-gnu and /usr/lib/i386-linux-gn=
u
> At least on the machine where it fails, uname -m gives i686, so the test
> =C2=A0>> ++test -f /usr/lib/`uname -m`-linux-gnu/libc.so&&
> glibpth=3D"/usr/lib/`uname -m`-linux-gnu $glibpth"
> fails.
>
> I hard coded the i386-linux-gnu paths and was able to build perl-native o=
n
> Ubuntu 11.04

I used uname since I thought that was way to make it common for both x86_64
and x86 but it seems they made life harder than that. I did not have
32bit installation to verify

> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


