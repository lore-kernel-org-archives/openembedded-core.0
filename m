Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1AFC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 23:44:31 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31205.1784936666471005418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 16:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JNfwnQ/T;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6689402c7bfso757271d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 16:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784936665; cv=none;
        d=google.com; s=arc-20260327;
        b=XGtKJqy74r9RkoeMbU7ZaDCMqW0zrW5xW4KVuAdz7/+VH/V49sM5M2isTVh/70OojV
         JtQCBhFaHn4eOEYxhL4cgwdDNJc5zS7ENg2CKf++4kE5ejY2pvW1mpHwXRa9nikOMwuv
         +ug/vDHA1Bow5rULAd7wZSsxx0pQtBtSDseLF+qdu3j6KDKvj2S2KfmHC2sa94f0ttr5
         4UNR42QuTILmW4AC/31RisKUEaoF9FkanepNHTItyRiWTqNaSFrmhVthmlCNQCygFBwv
         aEzjTLd2Kg9YASicgLZ9jpiyw+Qr7mBGWmiIYg056kPED1Qe/xYJpfSliZ61ipgFCDDb
         eEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a7crT/DOL6X5qiw9U5LR2JfH+IVTdNrdm1rY3Yfhl+Y=;
        fh=2ocdSVCTXGdBXNRVRw7yabCHzGK+XyFul2Ako7z39Pw=;
        b=jjXkX7qeiNkAeh/NvNxBMju7+WYsJ9q3YDPRMG5dDH3KzC4qocsxIzTagz5RkhGxk+
         z+gJjbBg+jshjWgfvrS+pMJIPIoYja48D+td9TpGtLPogVt13UOAWFZMz77SYewD9XjY
         qpiLeSD92g15o7Ggp4mF3vEByHi1AdnkQD5i6Qa3Ax92J5SNFSxFl++i8yqa32tmQ89J
         2NIch2DGgUwCDMFhI9/yf8FWCk7gi10mR5r2AQtYA2mxvsfePT3b06mQuavykMekrI1f
         +AXjt+Gn1zyNYcRaIz1licc9fNOgm2fMFeVVfLiPpZefglsILPocUK1EkMEXr3tpbS7S
         ULVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936665; x=1785541465; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7crT/DOL6X5qiw9U5LR2JfH+IVTdNrdm1rY3Yfhl+Y=;
        b=JNfwnQ/TK6tPaciKI8PXEj/gphrRU5fe8EI33siwi3LcEBcYpGzSdCZss/y6CvsRL2
         SoshLkVzybIoM7CDrVwULooN3qfgtiy/k1bt4B5BaWSWg+EH2fphO4j1OEx5cNyzeHUT
         TA8cLB5y9vOEanoP8ids5iZKYz44VCyzb27ob2H6anXeZX/BvZovlEr72LgxMYhOLVL2
         vnWVxDhE6781BaYQb/kYYBpwqB/Vm3tRliBLu7k9VWDyT6bRbRSYcOFnZcutRa3lmShk
         5cQF7IjaXQWhD/vPwFSrzjqdrteOsRN9MbdX3DFibtlF57qqSVuwpoiyeyHaR+fMZkoG
         976A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936665; x=1785541465;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a7crT/DOL6X5qiw9U5LR2JfH+IVTdNrdm1rY3Yfhl+Y=;
        b=eSpm1zkYylZzf19PRG8hALfdbZXma/us4FAIAM7F6qoU87w8GsSesS4IbaqVZwVQm3
         NVt8Z8aXgfZOAQIxlZ+RLol9LPsNQqPTClptDRJ9zxIih00Y589sboH0uhhKT6IQSdvD
         4/jeraaDgkoM7E1AO7mNhCoLsf91IXnnfqke6br1Q69jTf+cOXASkC2ixzA4GVHRh3Zj
         KRYY7bYxjC4CYfnFoQpHJkV1uZ5O5ZP9Sycj/dxgD3A8vNTHDMIrgIuFHq9hA3Frw93L
         8FeQJcROTVQgosEE4UjgOplBI8aEclI3VmJIOerkj0vx87IE6Zfge+x33vFY0h3sA7cu
         H3jg==
X-Gm-Message-State: AOJu0YyfCJYytR7NT7FQmx/X0TZ73hrWJNdkpCuMS2+jDaIjPmivGMF0
	yBX6LXuY5MXvYRvusEv/ao2DMbovOTVk0tykhqzR7n8MkJgsBO10+POGhcTF8RDDSy7gecIYf0j
	QW+PDwiUtEwjCuaRqRAYX5PEMWujfIQk=
X-Gm-Gg: AR+sD137dJV0yWYS3TKOQJkWHWypqY+8FFH59NP4dQpibt9iXwDxmaGHTiBHZ8K9B0+
	4dp88JCtVzEPxe+WFdhTpFDF2uKNyZ2mMEf07CN2yr6Td9p9bIeLY0vwEHEzKP58znz9OVOM2bs
	2f3BAtp303bO92XDXhg/X9apOjpY3OIHXkGrwzOvuKW2J6GFP+4sjqKtIlLamZrbslo7ptoxOGu
	TkzOSiTpRSflcGWc/3i/U2Wm61iU7dju9EJDy9WloScJQNVlUG0BbeyAnhCzKVo94h3RllfJgZB
	COPHuvjGNxBBW1A/RQgs6UEt+aMvtlhvCh8nhjoZmy3cXl9GhcOPinBZhtSdY5zqmrrYCZWn8AL
	lAmm/CO5EfylZ4cszLZUiq+GUwqyXffQ0XW4mIi7ByKrucrpd/M6jInBlAdddhq6A9+wgg2c2dZ
	P9wJPhzHqG3JIdSK71zg==
X-Received: by 2002:a05:690e:1906:b0:668:90cd:1a31 with SMTP id
 956f58d0204a3-668c7c286f0mr117761d50.100.1784936665405; Fri, 24 Jul 2026
 16:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260724131537.1058940-1-igor.opaniuk@oss.qualcomm.com>
In-Reply-To: <20260724131537.1058940-1-igor.opaniuk@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jul 2026 16:43:59 -0700
X-Gm-Features: AUfX_mxLjBz9JsfOeyYioDVfqZ6cfjDQ-RyZ5gMTCOpbvvKv8DAG3agVXvYz86Y
Message-ID: <CAMKF1soaRXaijmYs7cG6d_GdebSG9fo=QX4v3s66RMmKBQQuUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libzip: import recipe from meta-oe
To: igor.opaniuk@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	dmitry.baryshkov@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com
Content-Type: multipart/alternative; boundary="000000000000e35f4a065763f3ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 23:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241953

--000000000000e35f4a065763f3ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am good with this moving to core, it justifies its existence there.
Couple of things I would ask for.
Please look into adding ptest support, it does have unit tests. I assume
you will send a removal patch to oe-devel
once its merged here.

On Fri, Jul 24, 2026 at 6:15=E2=80=AFAM Igor Opaniuk via lists.openembedded=
.org
<igor.opaniuk=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Recent versions of the qdl tool [1], used for flashing and provisioning
> Qualcomm-based boards, depend on libzip in order to flash images
> directly from zip-compressed flat builds without unpacking them: the
> device requests individual images on demand (in Sahara/Firehose
> device-driven order), which requires random access to archive members
> by name. Neither zlib (byte-stream compression only, no container
> format support) nor libarchive (streaming, sequential access only)
> covers this use case.
>
> qdl recipes are provided by the Qualcomm BSP layer (e.g. meta-qcom [2])
> and board flashing is core BSP functionality. Recipes from other layers
> also depend on libzip (libsigrok, idevicerestore and php in meta-oe,
> localsearch in meta-gnome), so it makes sense to move libzip to
> OE-Core in order to reduce inter-layer dependencies, following the
> example of commit 1a0196a794 ("libconfig: import recipe from meta-oe").
>
> Changes between meta-oe and this recipe:
> - Added SUMMARY, BUGTRACKER and SECTION
> - Fixed the tools and examples PACKAGECONFIGs to use the actual
>   BUILD_TOOLS and BUILD_EXAMPLES CMake options (ENABLE_TOOLS and
>   ENABLE_EXAMPLES do not exist and were silently ignored)
> - Fixed the tests PACKAGECONFIG to use BUILD_REGRESS consistently
> - Dropped the mbedtls PACKAGECONFIG, as mbedtls is not in OE-Core
> - Extended BBCLASSEXTEND with nativesdk
>
> [1] https://github.com/linux-msm/qdl
> [2] https://github.com/qualcomm-linux/meta-qcom
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  meta/recipes-extended/libzip/libzip_1.11.4.bb | 30 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-extended/libzip/libzip_1.11.4.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index b49386a27d..eac288126a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -469,6 +469,7 @@ RECIPE_MAINTAINER:pn-libxv =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libxvmc =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libxxf86vm =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libyaml =3D "Wang Mingyu <wangmy@fujitsu.com>"
> +RECIPE_MAINTAINER:pn-libzip =3D "Igor Opaniuk <
> igor.opaniuk@oss.qualcomm.com>"
>  RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
>  RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-firmware =3D "Vivek Puar <vpuar@qti.qualcomm.=
com
> >"
> diff --git a/meta/recipes-extended/libzip/libzip_1.11.4.bb
> b/meta/recipes-extended/libzip/libzip_1.11.4.bb
> new file mode 100644
> index 0000000000..36f7d1faf5
> --- /dev/null
> +++ b/meta/recipes-extended/libzip/libzip_1.11.4.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "C library for reading, creating, and modifying zip archives=
"
> +DESCRIPTION =3D "libzip is a C library for reading, creating, and modify=
ing
> \
> +zip archives. Files can be added from data buffers, files, or compressed=
 \
> +data copied directly from other zip archives. Changes made without
> closing \
> +the archive can be reverted."
> +HOMEPAGE =3D "https://libzip.org/"
> +BUGTRACKER =3D "https://github.com/nih-at/libzip/issues"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8a9d2078f35e61cf1122ccd44068=
7cf"
> +
> +DEPENDS =3D "zlib bzip2"
> +
> +SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D
> "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b"
> +
> +inherit cmake
> +
> +PACKAGECONFIG ?=3D "ssl lzma tools examples"
> +
> +PACKAGECONFIG[ssl] =3D "-DENABLE_OPENSSL=3DON,-DENABLE_OPENSSL=3DOFF,ope=
nssl"
> +PACKAGECONFIG[gnutls] =3D "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF,gn=
utls
> nettle"
> +PACKAGECONFIG[lzma] =3D "-DENABLE_LZMA=3DON,-DENABLE_LZMA=3DOFF,xz"
> +PACKAGECONFIG[zstd] =3D "-DENABLE_ZSTD=3DON,-DENABLE_ZSTD=3DOFF,zstd"
> +PACKAGECONFIG[tools] =3D "-DBUILD_TOOLS=3DON,-DBUILD_TOOLS=3DOFF"
> +PACKAGECONFIG[examples] =3D "-DBUILD_EXAMPLES=3DON,-DBUILD_EXAMPLES=3DOF=
F"
> +PACKAGECONFIG[tests] =3D "-DBUILD_REGRESS=3DON,-DBUILD_REGRESS=3DOFF"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241932):
> https://lists.openembedded.org/g/openembedded-core/message/241932
> Mute This Topic: https://lists.openembedded.org/mt/120425404/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e35f4a065763f3ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am good with this moving to core, it justifies its exist=
ence there. Couple of things I would ask for.<div>Please look into adding p=
test support, it does have unit tests. I assume you will send a removal pat=
ch to oe-devel</div><div>once its merged here.</div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jul 24, 2026 at 6:15=E2=80=AFAM Igor Opaniuk via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;igor.opaniuk=3D<a hre=
f=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Recent versions of the qdl tool [1], used for flashing and=
 provisioning<br>
Qualcomm-based boards, depend on libzip in order to flash images<br>
directly from zip-compressed flat builds without unpacking them: the<br>
device requests individual images on demand (in Sahara/Firehose<br>
device-driven order), which requires random access to archive members<br>
by name. Neither zlib (byte-stream compression only, no container<br>
format support) nor libarchive (streaming, sequential access only)<br>
covers this use case.<br>
<br>
qdl recipes are provided by the Qualcomm BSP layer (e.g. meta-qcom [2])<br>
and board flashing is core BSP functionality. Recipes from other layers<br>
also depend on libzip (libsigrok, idevicerestore and php in meta-oe,<br>
localsearch in meta-gnome), so it makes sense to move libzip to<br>
OE-Core in order to reduce inter-layer dependencies, following the<br>
example of commit 1a0196a794 (&quot;libconfig: import recipe from meta-oe&q=
uot;).<br>
<br>
Changes between meta-oe and this recipe:<br>
- Added SUMMARY, BUGTRACKER and SECTION<br>
- Fixed the tools and examples PACKAGECONFIGs to use the actual<br>
=C2=A0 BUILD_TOOLS and BUILD_EXAMPLES CMake options (ENABLE_TOOLS and<br>
=C2=A0 ENABLE_EXAMPLES do not exist and were silently ignored)<br>
- Fixed the tests PACKAGECONFIG to use BUILD_REGRESS consistently<br>
- Dropped the mbedtls PACKAGECONFIG, as mbedtls is not in OE-Core<br>
- Extended BBCLASSEXTEND with nativesdk<br>
<br>
[1] <a href=3D"https://github.com/linux-msm/qdl" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/linux-msm/qdl</a><br>
[2] <a href=3D"https://github.com/qualcomm-linux/meta-qcom" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/qualcomm-linux/meta-qcom</a><br>
Signed-off-by: Igor Opaniuk &lt;<a href=3D"mailto:igor.opaniuk@oss.qualcomm=
.com" target=3D"_blank">igor.opaniuk@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0meta/recipes-extended/libzip/<a href=3D"http://libzip_1.11.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libzip_1.11.4.bb</a> | 30 +++++++++++++++=
++++<br>
=C2=A02 files changed, 31 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/libzip/<a href=3D"http://lib=
zip_1.11.4.bb" rel=3D"noreferrer" target=3D"_blank">libzip_1.11.4.bb</a><br=
>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index b49386a27d..eac288126a 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -469,6 +469,7 @@ RECIPE_MAINTAINER:pn-libxv =3D &quot;Unassigned &lt;<a =
href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yo=
ctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libxvmc =3D &quot;Unassigned &lt;<a href=3D"mail=
to:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.o=
rg</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libxxf86vm =3D &quot;Unassigned &lt;<a href=3D"m=
ailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoprojec=
t.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libyaml =3D &quot;Wang Mingyu &lt;<a href=3D"mai=
lto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;&quot;<=
br>
+RECIPE_MAINTAINER:pn-libzip =3D &quot;Igor Opaniuk &lt;<a href=3D"mailto:i=
gor.opaniuk@oss.qualcomm.com" target=3D"_blank">igor.opaniuk@oss.qualcomm.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-lighttpd =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-dummy =3D &quot;Unassigned &lt;<a href=3D"=
mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproje=
ct.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-firmware =3D &quot;Vivek Puar &lt;<a href=
=3D"mailto:vpuar@qti.qualcomm.com" target=3D"_blank">vpuar@qti.qualcomm.com=
</a>&gt;&quot;<br>
diff --git a/meta/recipes-extended/libzip/<a href=3D"http://libzip_1.11.4.b=
b" rel=3D"noreferrer" target=3D"_blank">libzip_1.11.4.bb</a> b/meta/recipes=
-extended/libzip/<a href=3D"http://libzip_1.11.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libzip_1.11.4.bb</a><br>
new file mode 100644<br>
index 0000000000..36f7d1faf5<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/libzip/<a href=3D"http://libzip_1.11.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libzip_1.11.4.bb</a><br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;C library for reading, creating, and modifying zip archi=
ves&quot;<br>
+DESCRIPTION =3D &quot;libzip is a C library for reading, creating, and mod=
ifying \<br>
+zip archives. Files can be added from data buffers, files, or compressed \=
<br>
+data copied directly from other zip archives. Changes made without closing=
 \<br>
+the archive can be reverted.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://libzip.org/" rel=3D"noreferrer" targ=
et=3D"_blank">https://libzip.org/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/nih-at/libzip/issues" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/nih-at/libzip/issues=
</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd8a9d2078f35e61cf1122ccd44=
0687cf&quot;<br>
+<br>
+DEPENDS =3D &quot;zlib bzip2&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://libzip.org/download/libzip-$%7BPV%7D.=
tar.xz" rel=3D"noreferrer" target=3D"_blank">https://libzip.org/download/li=
bzip-${PV}.tar.xz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0=
ec608d893180ed7097b&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+PACKAGECONFIG ?=3D &quot;ssl lzma tools examples&quot;<br>
+<br>
+PACKAGECONFIG[ssl] =3D &quot;-DENABLE_OPENSSL=3DON,-DENABLE_OPENSSL=3DOFF,=
openssl&quot;<br>
+PACKAGECONFIG[gnutls] =3D &quot;-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF=
,gnutls nettle&quot;<br>
+PACKAGECONFIG[lzma] =3D &quot;-DENABLE_LZMA=3DON,-DENABLE_LZMA=3DOFF,xz&qu=
ot;<br>
+PACKAGECONFIG[zstd] =3D &quot;-DENABLE_ZSTD=3DON,-DENABLE_ZSTD=3DOFF,zstd&=
quot;<br>
+PACKAGECONFIG[tools] =3D &quot;-DBUILD_TOOLS=3DON,-DBUILD_TOOLS=3DOFF&quot=
;<br>
+PACKAGECONFIG[examples] =3D &quot;-DBUILD_EXAMPLES=3DON,-DBUILD_EXAMPLES=
=3DOFF&quot;<br>
+PACKAGECONFIG[tests] =3D &quot;-DBUILD_REGRESS=3DON,-DBUILD_REGRESS=3DOFF&=
quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241932): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241932" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/241932</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120425404/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120425404/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e35f4a065763f3ef--

