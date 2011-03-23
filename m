Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2Pv1-0002jq-Gh
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:24:19 +0100
Received: by bwz10 with SMTP id 10so6605000bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=lgl1DA/QPK9JKj+BJfShU2xOPMZc9fBPljgaBVyFLmY=;
	b=BrDaL1jJ63Pf847WaTKFKNs3uvHN2cK+SL8408VJVtKy0y2rAfVOsqkgablUcHffcE
	u/s5XDarbhTErsyZbPIM7P5Nt2rsE172Hew6OH8r6SGVk6Xh27c4d9/+6uKsxziyI/qL
	XXKsG8K632cQyihqwbcTSRH4JhxNgwJQY1OnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=QAP9Lky/71PQpXlp3U5Bvaiir3Thnte+HCOETuZtHvhwVl3lO7iUUmcxLOvZMZbyUc
	CxhsLb/7EzlMBKM4OvA2I6OuvtR3ywPbsC9xiIrdscsMGyb2um7JvhEdeatPtTYaaX/P
	4OblXuqsflDmM/8/bzk4Hh7QsPHHo52hplfxo=
Received: by 10.223.110.4 with SMTP id l4mr817397fap.125.1300893711736; Wed,
	23 Mar 2011 08:21:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Wed, 23 Mar 2011 08:20:22 -0700 (PDT)
In-Reply-To: <4D87C5EA.1040602@mentor.com>
References: <cover.1300731672.git.raj.khem@gmail.com>
	<c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>
	<4D87C5EA.1040602@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 08:20:22 -0700
Message-ID: <AANLkTi=sG6d_wkbr-7U-BjvS1g1MpQN5W8wgATuMxCYZ@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Mar 2011 15:24:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2011 at 2:40 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/21/2011 11:23 AM, Khem Raj wrote:
>>
>> Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
>> /lib/${arch}-linux-gnu so we need that to be added to glibpth in
>> Configure.
>>
>> Currently we set LD=3Dld in environment for recipes inheriting native
>> class. This overrides the LD settings in the Makefiles of perl and
>> it tries to link by calling ld which does not work since its using
>> -l<x> =C2=A0on commandline and ubuntu linker seems not to look into
>> the new location for these libraries. Its better to use gcc for linking
>> here anyway
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0.../perl/files/Configure-multilib.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 10 +++++++---
>> =C2=A0meta/recipes-devtools/perl/perl-native_5.12.2.bb =C2=A0 | =C2=A0 =
=C2=A04 +++-
>> =C2=A02 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch
>> b/meta/recipes-devtools/perl/files/Configure-multilib.patch
>> index d3948a9..b561b6a 100644
>> --- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
>> +++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
>> @@ -1,11 +1,15 @@
>> ---- perl-5.8.7/Configure.orig =C2=A02006-01-30 10:50:04.000000000 +0000
>> -+++ perl-5.8.7/Configure =C2=A0 =C2=A0 =C2=A0 2006-01-30 10:51:18.00000=
0000 +0000
>> -@@ -1240,7 +1240,7 @@
>> +Index: perl-5.12.2/Configure
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- perl-5.12.2.orig/Configure
>> ++++ perl-5.12.2/Configure
>> +@@ -1316,8 +1316,9 @@ loclibpth=3D"/usr/local/lib /opt/local/lib
>> =C2=A0 loclibpth=3D"$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
>>
>> =C2=A0 : general looking path for locating libraries
>> =C2=A0-glibpth=3D"/lib /usr/lib $xlibpth"
>> =C2=A0+glibpth=3D"/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
>> =C2=A0 glibpth=3D"$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
>> ++test -f /usr/lib/`uname -m`-linux-gnu/libc.so&&
>> =C2=A0glibpth=3D"/usr/lib/`uname -m`-linux-gnu $glibpth"
>> =C2=A0 test -f /usr/shlib/libc.so&& =C2=A0glibpth=3D"/usr/shlib $glibpth=
"
>> =C2=A0 test -f /shlib/libc.so&& =C2=A0glibpth=3D"/shlib $glibpth"
>> + test -d /usr/lib64&& =C2=A0glibpth=3D"$glibpth /lib64 /usr/lib64
>> /usr/local/lib64"
>> diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>> b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>> index 9af7b06..6776aed 100644
>> --- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>> +++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>> =C2=A0LICENSE =3D "Artistic|GPL"
>> =C2=A0LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f0256=
5f253d81a \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fil=
e://Artistic;md5=3Df921793d03cc6d63ec4b15e9be8fd3f8"
>> -PR =3D "r7"
>> +PR =3D "r8"
>>
>> =C2=A0LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f0256=
5f253d81a \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://Artistic;md5=3Df921793d03cc6d63ec4b15e9be8fd3f8"
>> @@ -28,6 +28,8 @@ S =3D "${WORKDIR}/perl-${PV}"
>>
>> =C2=A0inherit native
>>
>> +export LD=3D"${CC}"
>
> We have CCLD for when we want to use CC as our LD (and yes, this usually
> just ends up as CC, but lets be clear please).
>

yes that works too

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


