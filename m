Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E458C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 17:46:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20794.1789062358827322473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 10:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NNAbnTix;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so736705e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789062357; x=1789667157; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y9x7stnwkxBIFIJmpYVepNvqPTfVT/4yu1s1EvR39Pk=;
        b=NNAbnTixXOy1dXx0tAmukekyBJIW06PMoW0krAXamY8/U67djUTQmfPCfg8yT5nhjg
         b9FHOhriVx2SHCwQQSBA/UBnhjKjePg9A3FdNbac+P5VuvhAf80VZONPK5nZqrDljmVa
         qr6OtJfhtg07gbWwDpDALIOVruuZZ2MhIFP7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062357; x=1789667157;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9x7stnwkxBIFIJmpYVepNvqPTfVT/4yu1s1EvR39Pk=;
        b=pRP5NZREFCQohvw6TUeSWWpw1DWCQQ/xJgEpUQjNJPamb8HEGcIsPiDW06zNZ49eXj
         KpKg9ELRZbngUzAM4krIsn0vPPR6XXGrPwvDuzrXWUr9jTF24xQXXPXkENSO3XMyegL2
         hGYoMgcLyyBTIxqwkphaQZQS1+0WbfnkWQ9JZxdsZ5YF4sQtuTeIeFHdmhGRJ6Q6bzH7
         ZtHlVG5NnmV2M35jrpsENMj8fefmhPCpMN0aFZRJabi74ZqPMAYrV52VDS1ruOJqw45v
         HzHnUGWqCFYoszJGHKeKSwcnrzWbSb4ju+Ntqv8xrgRNxAfDnG6qV54r2/6KeWSamp5N
         0wiw==
X-Forwarded-Encrypted: i=1; AKwUvByRw517RhVQkwRigxSoakjSpvLMa9okSdM4hU5VwjbuCDCm3/7fJuV3S1NbPz6miVKuK/wiDRAi+cWfTc0cFS/TpQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nHfAWAJKkWivQ6BcDtb/Z993QXJB+DussKcs9VFeRKt8icQMO4
	EPWirizX2nl6Ep04YJIp3NaqLlsfSVv4bIZ5kTvTrarOAi3dsVAgAJ0Df4DnWH3+eqM=
X-Gm-Gg: AYBFou1ML2PZxgQSZ9TcPJ17jk9hlVXIUEYKEzxe5CzyzvUmtBM8SjdHJg5V6J0uyOQ
	9NftH2YGCMhw49tkht9kHa6JV0qu06tfZDGTG87VAwevOcodC4KKuoKrK3bP6TzO1wigUe/hze4
	kOEqlCqz0BefMGalfSJCgksGIWacVGOo0AyOtd8UAbFz7hS3hG5QjjZv/598CI+ANrztMu44sYM
	bqJLs8m1aN4nlevnw9nTj+fVL8hv9a88IFHau8xIQ1d75MjbWxFhQVRH2it1e/CROCGQuM0t0kd
	HmY7yT58nQXTGD+Cw80bGVPVsiIgzrZrDIe0Tn/grPjI0lqZdiKgmytU/bXhag6Zr2vt759LjtZ
	L0iRoCDLQVBgYGLd1PZ9prO+RjEY7VDfiitb6eI+aTHxJbbQJcxb/BvF9J32zB1I1UoVn/eeX6a
	AxPxyaOrKdztxI6s1L26TUCuM7aR+oOT4likLIE9K0vDvNWEc+atLT9/OaBJKoBgHVNGm7Krukr
	IivRsFWLMVWRNyI2em7QlKHrmlDhreKkh52kr59A6XcbXC2S8a+59x3GmZtRXK2
X-Received: by 2002:a05:600c:8a1a:10b0:49c:ee22:364c with SMTP id 5b1f17b1804b1-49e6198d0a6mr1684335e9.9.1789062356946;
        Thu, 10 Sep 2026 10:45:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:788a:18da:6c2a:9f16? ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm316313565e9.4.2026.09.10.10.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:45:56 -0700 (PDT)
Message-ID: <e96a5c72b21a10328862ebfd760d16a57cdc2d71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/15] runqemu-extract-sdk: refactor in Python
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2026 18:45:55 +0100
In-Reply-To: <20260909215337.89106-7-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
	 <20260909215337.89106-7-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 17:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245590

On Wed, 2026-09-09 at 23:53 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> Move the pseudo-backed rootfs extraction logic into a reusable Python
> module while preserving the existing command interface.
> Install the module with qemu-helper so the wrapper also works from an SDK=
.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> =C2=A0.../qemu/nativesdk-qemu-helper_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0scripts/lib/pseudo_rootfs_utils.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 113 +++++++++++++++++
> =C2=A0scripts/runqemu-extract-sdk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 116=
 ++++--------------
> =C2=A03 files changed, 137 insertions(+), 95 deletions(-)
> =C2=A0create mode 100644 scripts/lib/pseudo_rootfs_utils.py
>=20
> diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/me=
ta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> index e1f343989a..0558a564bb 100644
> --- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> +++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> @@ -9,6 +9,7 @@ RDEPENDS:${PN} =3D "nativesdk-qemu nativesdk-unfs3 native=
sdk-pseudo \
> =C2=A0LIC_FILES_CHKSUM =3D "file://${COREBASE}/scripts/runqemu;beginline=
=3D5;endline=3D10;md5=3Dac2b489a58739c7628a2604698db5e7f"
> =C2=A0
> =C2=A0SRC_URI =3D "file://${COREBASE}/scripts/runqemu \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://${CO=
REBASE}/scripts/lib/pseudo_rootfs_utils.py \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/${COREBASE}/scripts/runqemu-addptable2image \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/${COREBASE}/scripts/runqemu-gen-tapdevs \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/${COREBASE}/scripts/runqemu-ifup \
> @@ -30,4 +31,6 @@ do_install() {
> =C2=A0	install -d ${D}${bindir}
> =C2=A0	install -m 0755 ${S}${COREBASE}/scripts/oe-* ${D}${bindir}/
> =C2=A0	install -m 0755 ${S}${COREBASE}/scripts/runqemu* ${D}${bindir}/
> +	# The runqemu-* wrappers import this module from their own directory.
> +	install -m 0644 ${S}${COREBASE}/scripts/lib/pseudo_rootfs_utils.py ${D}=
${bindir}/
> =C2=A0}
> diff --git a/scripts/lib/pseudo_rootfs_utils.py b/scripts/lib/pseudo_root=
fs_utils.py
> new file mode 100644
> index 0000000000..89d082f672
> --- /dev/null
> +++ b/scripts/lib/pseudo_rootfs_utils.py
> @@ -0,0 +1,113 @@
> +#!/usr/bin/env python3
> +#
> +# Helpers for preparing pseudo-managed rootfs trees (NFS booting, SDK/ro=
otfs
> +# extraction, target deploy).
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +"""Extract rootfs tarballs and locate their pseudo state for NFS booting=
."""
> +
> +import os
> +import subprocess
> +from pathlib import Path
> +
> +
> +class PseudoRootfsError(Exception):
> +=C2=A0=C2=A0=C2=A0 """Raised when a pseudo-managed rootfs cannot be prep=
ared or exported."""
> +
> +
> +def pseudo_native_environment():
> +=C2=A0=C2=A0=C2=A0 """Return the pseudo native environment (PSEUDO and O=
ECORE_NATIVE_SYSROOT), from the
> +=C2=A0=C2=A0=C2=A0 qemu-helper-native recipe which provides a pseudo bin=
ary usable outside a recipe sysroot."""
> +=C2=A0=C2=A0=C2=A0 native_sysroot =3D os.environ.get('OECORE_NATIVE_SYSR=
OOT')
> +=C2=A0=C2=A0=C2=A0 if not native_sysroot:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 impor=
t bb.tinfoil
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except ImportError as exc:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 PseudoRootfsError(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'Unable to import bitbake.\n'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'Did you forget to source your build system environment =
setup script?') from exc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with =
bb.tinfoil.Tinfoil() as tinfoil:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tinfoil.prepare(quiet=3D2)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 native_sysroot =3D tinfoil.parse_recipe('qemu-helper-nat=
ive').getVar('STAGING_DIR_NATIVE')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Exception as exc:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 PseudoRootfsError('Unable to set up the qemu-helper-native sysroot') from =
exc
> +
> +=C2=A0=C2=A0=C2=A0 if not native_sysroot or not os.path.exists(native_sy=
sroot):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise PseudoRootfsError("%s d=
oesn't exist" % native_sysroot)
> +
> +=C2=A0=C2=A0=C2=A0 environment =3D {'OECORE_NATIVE_SYSROOT': native_sysr=
oot}
> +=C2=A0=C2=A0=C2=A0 environment['PSEUDO'] =3D os.path.join(native_sysroot=
, 'usr', 'bin', 'pseudo')
> +=C2=A0=C2=A0=C2=A0 return environment
> +
> +
> +def _tar_options(rootfs_tarball):
> +=C2=A0=C2=A0=C2=A0 tar_extract_options =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '.tar.xz': '-xJf',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '.tar.bz2': '-xjf',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '.tar.gz': '-xzf',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '.tar.zst': '--zstd -xf',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '.tar': '-xf',
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 for extension, option in tar_extract_options.items():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if rootfs_tarball.endswith(ex=
tension):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n ['--numeric-owner', *option.split()]
> +=C2=A0=C2=A0=C2=A0 raise PseudoRootfsError(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Unable to determine sdk tarb=
all format\n'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Accepted types: .tar / .tar.=
gz / .tar.bz2 / .tar.xz / .tar.zst')

This is breaking on RHEL8 era hosts, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/4591

"tar: unrecognized option '--zstd'"

:(

Cheers,

Richard



