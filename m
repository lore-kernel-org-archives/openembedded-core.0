Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHn5F-0001OI-It
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 03:10:25 +0200
Received: by ewy5 with SMTP id 5so520009ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 18:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Bpcr7+OnTTRIvwCt/au2ZOpCrGdwlE5S/j8TJP5XAoc=;
	b=Wf25djuJaYugjRfuV0DKn6SIP7VemnY5vZiT7Er3tF+UhU6+5KfgOWRWC9ojwhoJW4
	zoxtZ9NzkJZ5Rs0rSbf1udYwyeAxPbbPPk5Ua4nW6cTENa3lvbZRF5TejLNFu7nGvjIg
	lEXOgWH3BV9C3/J2Lw5Z88gAM071/1iULtejg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=HwE3KRJhqEEwZ9bpTbiz+UosubT33MvbSeHPqNytmkVk3pU6djyc1MhARXCdX09Sh0
	kBCNGn2VUn5N7K57++1/NsaAXZq6OMan5yEaPQ+9qfW9JYYnKdHuxb6oPtL2F20EuT62
	Rq0eNSiGQyME/7Twof7QP4VSXp/0GXn1CJyNo=
Received: by 10.14.4.32 with SMTP id 32mr826994eei.141.1304557662170; Wed, 04
	May 2011 18:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 4 May 2011 18:07:12 -0700 (PDT)
In-Reply-To: <1304462379.21461.144.camel@rex>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
	<1304424898.21461.107.camel@rex>
	<20110503180447.GB5436@sakrah.homelinux.org>
	<1304462379.21461.144.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 May 2011 18:07:12 -0700
Message-ID: <BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Thu, 05 May 2011 01:10:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2011 at 3:39 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-05-03 at 11:04 -0700, Khem Raj wrote:
>> This has the same problem It empties out DEPENDS_GETTEXT after they have
>> have already been added to DEPENDS via virtclass e.g. when you build
>> gcc-runtime-nativesdk it will report a dep loop since now it depends on
>> virtual/gettext-nativesdk (added by gettext class)
>> and virtual/gettext-nativesdk depends on compilerlibs
>> provided by gcc-runtime-nativesdk. This was same problem I was trying to
>> circumvent
>
> Ok, how about this version:
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 4f20bc2..3b83e42 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -89,9 +89,11 @@ def base_dep_prepend(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0deps +=3D " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}c=
ompilerlibs virtual/libc "
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return deps
>
> -DEPENDS_prepend=3D"${@base_dep_prepend(d)} "
> -DEPENDS_virtclass-native_prepend=3D"${@base_dep_prepend(d)} "
> -DEPENDS_virtclass-nativesdk_prepend=3D"${@base_dep_prepend(d)} "
> +BASEDEPENDS =3D "${@base_dep_prepend(d)}"
> +
> +DEPENDS_prepend=3D"${BASEDEPENDS} "
> +DEPENDS_virtclass-native_prepend=3D"${BASEDEPENDS} "
> +DEPENDS_virtclass-nativesdk_prepend=3D"${BASEDEPENDS} "
>
> =C2=A0FILESPATH =3D "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${=
FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${F=
ILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
> =C2=A0# THISDIR only works properly with imediate expansion as it has to =
run
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index a40e74f..6f79e5e 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,17 +1,17 @@
> -def gettext_after_parse(d):
> - =C2=A0 =C2=A0# Remove the NLS bits if USE_NLS is no.
> - =C2=A0 =C2=A0if bb.data.getVar('USE_NLS', d, 1) =3D=3D 'no':
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg =3D oe_filter_out('^--(dis|en)able-nls$'=
, bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg +=3D " --disable-nls"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D bb.data.getVar('DEPENDS', d, 1) =
or ""
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('DEPENDS', oe_filter_out('^(v=
irtual/libiconv|virtual/libintl)$', depends, d), d)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('EXTRA_OECONF', cfg, d)
> +def gettext_dependencies(d):
> + =C2=A0 =C2=A0if d.getVar('USE_NLS', True) =3D=3D 'no':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return ""
> + =C2=A0 =C2=A0if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not=
 oe.utils.inherits(d, 'cross-canadian'):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return ""
> + =C2=A0 =C2=A0return d.getVar('DEPENDS_GETTEXT', False)
>
> -python () {
> - =C2=A0 =C2=A0gettext_after_parse(d)
> -}
> +def gettext_oeconf(d):
> + =C2=A0 =C2=A0# Remove the NLS bits if USE_NLS is no.
> + =C2=A0 =C2=A0if d.getVar('USE_NLS', True) =3D=3D 'no':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return '--disable-nls'
> + =C2=A0 =C2=A0return "--enable-nls"
>
> -DEPENDS_GETTEXT =3D "gettext gettext-native"
> +DEPENDS_GETTEXT =3D "virtual/gettext gettext-native"
>
> -DEPENDS =3D+ "${DEPENDS_GETTEXT}"
> -EXTRA_OECONF +=3D "--enable-nls"
> +BASEDEPENDS =3D+ "${@gettext_dependencies(d)}"
> +EXTRA_OECONF +=3D "${@gettext_oeconf(d)}"
>
>

a build from scratch revealed few more issues with this patch too.

1. We have to only remove gettext from dependencies if its a target
package for all other it still it needed otherwise all native and
cross tools start failing to build
 e.g. binutils-cross this can be easily solved by a patch

iff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 6f79e5e..cc39204 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,5 +1,5 @@
 def gettext_dependencies(d):
-    if d.getVar('USE_NLS', True) =3D=3D 'no':
+    if d.getVar('USE_NLS', True) =3D=3D 'no' and not oe.utils.inherits(d,
'native', 'nativesdk', 'cross')
         return ""
     if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not
oe.utils.inherits(d, 'cross-canadian')
         return ""


second problem is that EXTRA_OECONF when recipes override it instead
of +=3D or appending etc.
then --enable|--disable-nls that we added via gettext_oeconf() is lost
as a result some packages complain about config.rpath
when USE_NLS is set to no the reason is their configure is missing the
argument --disable-nls this works ok
for eglibc based targets since default is to enable-nls if nothing is
specified but uclibc fails. As a testcase try to preprocess
utils-linux
recipe and check the contents of EXTRA_OECONF


