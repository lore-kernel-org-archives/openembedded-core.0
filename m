Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735DFC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:22:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.21118.1750688546641497323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 07:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WWZDF6PD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a36748920cso3269686f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750688545; x=1751293345; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGaPRgIeo6o3EboJbT6s4ie9gDLD8LgtHDXb2qC0wEA=;
        b=WWZDF6PDUmr8K1N1nxQiBx6HuEpLe7ITNbZPUPwnQKuCuYTBgcxKRjLbj1Ecafpz/f
         fXbrhyo1uI7pycXAgcX5hBl8uwVkxLPjpcs5gDMp7mnIBytfKRcFCJGyiOmE5cTPvS4w
         f4oJQ1yW1iWGYDJLtVX4cVQuxMr5GAYKeXvtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688545; x=1751293345;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGaPRgIeo6o3EboJbT6s4ie9gDLD8LgtHDXb2qC0wEA=;
        b=oXKz0oY+pfYLlMS6BxuBkrQn5oHmNWmW/LNL1UeqK/HpqjrXq8IpTTNtMPkpPBiqMe
         vcSZlF+xVufaU9q5RH4wfLfm8tJ3t5jLo7FsDW2CeDE7nBes1QRQOc8EiL4RpJ0NzI/1
         PfoYPgj5JrZaH26N+Dpf7U+5sJG+898XO7e/kW38U+o+L2jV3A1gc9n8hs+D4PXxROYc
         yGdi/ao/vN9ny3dYQ3fIEdHid8TCwTCst1+KDZMAZ9FiJIrVCVCVGuv1PX2A0jrXbyTP
         EEjpra1wIaroGfdFNQ41s0nhXVAjBhXcanHEOGs0l3mph+UsBSh4fbsdu9PZTqNg+pdQ
         +7MA==
X-Forwarded-Encrypted: i=1; AJvYcCWp2CN8jYULA0QVRUp67Pjm0+cgbOfwQkXiEhWupGtRO2PAE2yWL5BjuSKbj/gy3Fi14lXwQD32a1jvVf/7c0/GCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFIyp/FREncEqRp7dmBgGE4LraE33N18Fgb02VRU3O104fjUIM
	uLWSnaZum3OG2x8hIHHozly8b7hQHXVKqINTm6R5I8NuhIKAacu2u55wx+mY55Pqvng=
X-Gm-Gg: ASbGncuHdxUd3XcBkM8AZIwH0sK8kmeahgSQCPMOeeY8uL7Yy3CYBOytRN/+aibgoQW
	qvatyoCxKvYbWNxTL63cIxxdwiWrcp2ZjlnN7j7McBQn3jIvH+OSABCqTqwcVH6lhGLKxnZBSkA
	qbdeYtJNCYff3dKBjXlk6V+7dCmlFY+UHlOdZ+BRP2LnRQ3ofXDge2QfQAyJIYsEwd+riimfWwe
	XiVPhQPKn2YiOgtxfCgBqGILCQiykU3mg0K+Vn0/EpED2D736j2/w0Sd2mrVUHzSk//N4jZcwyE
	1xGdpxT7zxx+dpR3YOSs0ug69ucZ/CAluk5tcz/a5ebnd4xmw2hG9k+XMrMYEx31C7k5eUzxGZP
	meadtf/EGTVrmjDbqNtzxOX9C4FAu2m4sr+qGCI6de50GrxkL
X-Google-Smtp-Source: AGHT+IFzjK/xW10O63usb5ZsgNefiiGhGS1AegQQp4wa3Mw5nuoDV79zDh7kjd6o2JY1XFESqAM9XA==
X-Received: by 2002:a05:6000:2d83:b0:3a4:fc3f:ed28 with SMTP id ffacd0b85a97d-3a6d1307124mr6897597f8f.29.1750688544886;
        Mon, 23 Jun 2025 07:22:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c4be:6247:aa7b:262? ([2001:8b0:aba:5f3c:c4be:6247:aa7b:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117bf84sm9836695f8f.52.2025.06.23.07.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:22:24 -0700 (PDT)
Message-ID: <c9ea47332de7a07cb201f9620bc54c76121b8ce5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] image_types_wic: fix dependencies on wks
 files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: fhoerni@witekio.com, openembedded-core@lists.openembedded.org, Trevor
 Woerner <twoerner@gmail.com>
Date: Mon, 23 Jun 2025 15:22:23 +0100
In-Reply-To: <20250520075325.64756-3-fhoerni.opensource@witekio.com>
References: <20250520075325.64756-1-fhoerni.opensource@witekio.com>
	 <20250520075325.64756-3-fhoerni.opensource@witekio.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219212

On Tue, 2025-05-20 at 09:53 +0200, fhoerni via lists.openembedded.org wrote=
:
> From: Frederic Hoerni <fhoerni@witekio.com>
>=20
> Add dependencies on all eligible files in WKS_SEARCH_PATH.
>=20
> Before this patch, adding a wks file earlier in the search path
> was not taken into account automatically.
>=20
> To reproduce the issue:
>=20
> 1. Init (use default WKS_FILE=3D"qemux86-directdisk.wks")
>=20
> =C2=A0=C2=A0=C2=A0 . oe-init-build-env
> =C2=A0=C2=A0=C2=A0 echo 'IMAGE_FSTYPES +=3D "wic"' >> conf/local.conf
>=20
> 2. First clean build
>=20
> =C2=A0=C2=A0=C2=A0 rm -f wic/qemux86-directdisk.wks
> =C2=A0=C2=A0=C2=A0 bitbake core-image-minimal -c cleansstate && bitbake c=
ore-image-minimal
>=20
> 3. Create an override for WKS_FILE (earlier in WKS_SEARCH_PATH)
> and introduce an error (a very small partition size) so that we can see i=
t happen (or not).
>=20
> =C2=A0=C2=A0=C2=A0 mkdir -p wic
> =C2=A0=C2=A0=C2=A0 echo "part / --source rootfs --fstype=3Dext4 --fixed-s=
ize 1M" > wic/qemux86-directdisk.wks
>=20
> 4. Build again
>=20
> =C2=A0=C2=A0=C2=A0 bitbake core-image-minimal
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 NOTE: Tasks Summary: Attempted 4670 tasks of which 467=
0 didn't need to be rerun and all succeeded.
>=20
> =3D> Nothing gets built, whereas we should see this error:
> > ERROR: Actual rootfs size (28713 kB) is larger than allowed size 1024 k=
B
>=20
> Signed-off-by: Frederic Hoerni <fhoerni@witekio.com>
> ---
> =C2=A0meta/classes-recipe/image_types_wic.bbclass | 18 ++++--------------
> =C2=A01 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index 61f028bd7b..33773db2e5 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -45,17 +45,11 @@ inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_B=
UNDLE', '1', 'kernel-artifa
> =C2=A0WKS_FILE ??=3D "${IMAGE_BASENAME}.${MACHINE}.wks"
> =C2=A0WKS_FILES ?=3D "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> =C2=A0WKS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p in =
'${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l fo=
r l in '${BBPATH}:${COREBASE}'.split(':'))}"
> -WKS_FULL_PATH =3D "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar=
('WKS_SEARCH_PATH')) or ''}"
> +WKS_FULL_PATH =3D "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar=
('WKS_SEARCH_PATH'), d) or ''}"
> =C2=A0
> -def wks_search(files, search_path):
> -=C2=A0=C2=A0=C2=A0 for f in files:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.isabs(f):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os=
.path.exists(f):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return f
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 searc=
hed =3D bb.utils.which(search_path, f)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if se=
arched:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return searched
> +def wks_search(files, search_path, d):
> +=C2=A0=C2=A0=C2=A0 from oe.searchfile import search_file
> +=C2=A0=C2=A0=C2=A0 return search_file(search_path, files, d)
> =C2=A0
> =C2=A0WIC_CREATE_EXTRA_ARGS ?=3D ""
> =C2=A0
> @@ -160,10 +154,6 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # We =
need to re-parse each time the file changes, and bitbake
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # nee=
ds to be told about that explicitly.
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.pa=
rse.mark_dependency(d, wks_file)
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
try:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 with open(wks_file, 'r') as f:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 body =3D f.read()

Sorry for the delay in replying to this. We need to get to the bottom
of what is going on with the dependencies here.

Looking at the code in the image_types_wic.bbclass, it has this:

IMAGE_CMD:wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES TOPDIR"

i.e. it specifically asks for there not to be a dependency on WKS_FILES
and WKS_FILL_PATH.

It then does:

# Rebuild when the wks file or vars in WICVARS change
USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join(=
'wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FUL=
L_PATH}') if '${USING_WIC}' else ''}"
do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"

i.e. the task should have a file-checksums entry.

Looking at:

"bitbake-dumpsig tmp/stamps/qemux86_64-poky-linux/core-image-minimal/1.0.do=
_image_wic.sigdata.XXX"

I don't see a file-checksums entry or any of the right dependencies. It
is that which we need to fix. To do that we need to track both the
found files and the files which we looked for but did not find in file-
checksums. Something like:

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-rec=
ipe/image_types_wic.bbclass
index 740ed946f8f..6180874a4cc 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -57,6 +57,16 @@ def wks_search(files, search_path):
             if searched:
                 return searched
=20
+def wks_checksums(files, search_path):
+    ret =3D ""
+    for f in files:
+        found, hist =3D bb.utils.which(search_path, f, history=3DTrue)
+        ret =3D ret + " " + " ".join(h + ":False" for h in hist[:-1])
+        if found:
+            ret =3D ret + " " + found + ":True"
+    return ret
+
+
 WIC_CREATE_EXTRA_ARGS ?=3D ""
=20
 IMAGE_CMD:wic () {
@@ -98,7 +108,7 @@ do_image_wic[cleandirs] =3D "${WORKDIR}/build-wic"
=20
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join=
('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
-WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FU=
LL_PATH}') if '${USING_WIC}' else ''}"
+WKS_FILE_CHECKSUM =3D "${@wks_checksums(d.getVar('WKS_FILES').split(), d.g=
etVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
 do_image_wic[depends] +=3D "${@' '.join('%s-native:do_populate_sysroot' % =
r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"

I'm hoping that patch will fix some of your other corner case issues
too!

Cheers,

Richard

