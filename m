Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB7CC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 11:36:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5603.1788435402801007354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 04:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ACMm161E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so14599925e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 04:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788435401; x=1789040201; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tj6ysthHHn/X1R6od/QxVcFwAHzashf1/KcvoOp/qdQ=;
        b=ACMm161EGiaIzrw4AJXwmpuPvX/c9yFjkmb476T4YLG9A2f76a9UYLTUlj5qoqpqd/
         2Kq1Kimm2UPniLYsrEW3vJnVQanbb9pB0az0UlQdxh/9UctpaAJNoaQuMWoGXt5U0abR
         Z/sqRMGIEJTbI8m0b+hF8sXgsiRYS6jeNQu6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435401; x=1789040201;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj6ysthHHn/X1R6od/QxVcFwAHzashf1/KcvoOp/qdQ=;
        b=BEyll0PWxmPFe08ECFaqR394sBgK0LJyDx5DyX0nPzN5JwbX5Vo7YVYzWbtt2KlkUE
         qw+WbGS+ePSRgUlo1Da+KKwmTRAHRlD99u4QtV+mk+vSbUSY3yrYAov8MP0N4bmIsGxN
         qlWmTXCJOHswWOSgg1qkb6XOnu1VYOHkh/K/fgr+5k8Pq7LuEA8d+V+O8zpMNUk5c0wi
         LmUo5lhM1wvdw3dbNzs3NegVHIF8zbBR+lS0kt5CXgLs9MEL5+hA2I7MG5XRnRISoJqX
         57ESFm3M5BvV3oIVa8ZHnhLFi6MKnJMmfXb3xeoDTQQT3bYcxaRxMh8Vh9c6OAB+D1mY
         dC3w==
X-Forwarded-Encrypted: i=1; AKwUvBxUwfeGXJ/nVmT1zPcSZ9/QuNQ7U8y/Ydx/+IXYyA+C1dZv/PL+Nuj4ihKFxllcqF9kNwwBOPebfOXgRRp3zQXIDg==@lists.openembedded.org
X-Gm-Message-State: AFuF++l41Y78CSXD7r7gHjmlN/cfZIDLGNWMqIMoIbbbOZceSTSLkemS
	HO4NFiHfttD2EoUjoqhkleYt8m/uzXMJDRgqiq4PWUr9Y+PxbYmXHQd//5WLB8bRpFQ=
X-Gm-Gg: AYBFou2leClRGX88e7FSI52hJIPN4QnoCgylBZXQ8BQHseIxUlYEP4i9JB2m35RzoTP
	HhNPmV42U0RmChiS3ZlDTaji/sXMc5CeqwYDombxhR7V6unbqbXkLjd8mK3EKImwcMFqgpEdjeG
	oKjnTJ/LPpnDpM6JnAjvYfZPnnZRu8O/jXE6fFUUQFwJaG5318CZlLh+obSyRyk5vnyp3h9gK9E
	qfrMpu1oxrJMFKNgPH3ShVZFYIs0S7MhKGw5+pUwjBbNz++IhA409yklNDURwsHWth1Je5KqCvE
	w6baD279NBCeouD6RwAz+CUutF+YGgHj2Ot46s4lTssFFOMpkKQLlMUt9q3j8+hUXo97703HlyB
	+3xqFS9o3UMvF+3A/yLRB+PcCH/ZDfoJmL539Z2yMSHYpqIkIot8T+tfQg3GQjLvTTAauSuJiAo
	XgSA69oecwXCrLCsv/Vy4mMPX1R+7aNBo2piZPz6VxncwZPjIOG794k1gHP/u9XZ6ggl3Hweo3/
	7rxGep9AjXUI0VR+ymg1H525OM8f7miudTeClsOsXdnuCbsQCTZjQ==
X-Received: by 2002:a05:600c:6209:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49ce582039fmr218960185e9.7.1788435400797;
        Thu, 03 Sep 2026 04:36:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41? ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm13012691f8f.3.2026.09.03.04.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:36:39 -0700 (PDT)
Message-ID: <a4725550357587748e1c4ae6cd76690886c6f596.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 15/25] runqemu-extract-sdk: refactor in
 Python
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2026 12:36:39 +0100
In-Reply-To: <20260830214912.1346063-16-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
	 <20260830214912.1346063-16-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 11:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245030

On Sun, 2026-08-30 at 23:48 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> Move the pseudo-backed rootfs extraction logic into a reusable Python
> module while preserving the existing command interface.
> Install the module with qemu-helper so the wrapper also works from an SDK=
.
>=20
> AI-Generated: Uses GitHub Copilot
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> =C2=A0.../qemu/nativesdk-qemu-helper_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0scripts/lib/runqemu_utils.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 124 +++++=
+++++++++++++
> =C2=A0scripts/runqemu-extract-sdk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 103=
 +--------------
> =C2=A03 files changed, 133 insertions(+), 97 deletions(-)
> =C2=A0create mode 100644 scripts/lib/runqemu_utils.py
>=20
> diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/me=
ta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> index e1f343989a..16fc07fadf 100644
> --- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> +++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> @@ -9,6 +9,7 @@ RDEPENDS:${PN} =3D "nativesdk-qemu nativesdk-unfs3 native=
sdk-pseudo \
> =C2=A0LIC_FILES_CHKSUM =3D "file://${COREBASE}/scripts/runqemu;beginline=
=3D5;endline=3D10;md5=3Dac2b489a58739c7628a2604698db5e7f"
> =C2=A0
> =C2=A0SRC_URI =3D "file://${COREBASE}/scripts/runqemu \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://${CO=
REBASE}/scripts/lib/runqemu_utils.py \
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
> +	install -m 0644 ${S}${COREBASE}/scripts/lib/runqemu_utils.py ${D}${bind=
ir}/
> =C2=A0}
> diff --git a/scripts/lib/runqemu_utils.py b/scripts/lib/runqemu_utils.py
> new file mode 100644
> index 0000000000..dff0ca8d3a
> --- /dev/null
> +++ b/scripts/lib/runqemu_utils.py
> @@ -0,0 +1,124 @@
> +#!/usr/bin/env python3
> +#
> +# Helpers shared by runqemu and NFS-rootfs preparation tools.
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +"""Extract and export rootfs tarballs for NFS booting."""
> +
> +import os
> +import subprocess
> +import sys
> +
> +
> +class RunQemuRootfsError(Exception):
> +=C2=A0=C2=A0=C2=A0 """Raised when an NFS rootfs cannot be prepared or ex=
ported."""
> +
> +
> +def native_environment():
> +=C2=A0=C2=A0=C2=A0 """Return the qemu-helper-native environment set by o=
e-find-native-sysroot."""
> +=C2=A0=C2=A0=C2=A0 command =3D '''
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 helper=3D$(command -v oe-find=
-native-sysroot) || exit 127
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . "$helper" qemu-helper-nativ=
e >/dev/null
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env -0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf 'PSEUDO=3D%s\\0OECORE_=
NATIVE_SYSROOT=3D%s\\0' "$PSEUDO" "$OECORE_NATIVE_SYSROOT"
> +=C2=A0=C2=A0=C2=A0 '''
> +=C2=A0=C2=A0=C2=A0 result =3D subprocess.run(['bash', '-c', command], ca=
pture_output=3DTrue)
> +=C2=A0=C2=A0=C2=A0 if result.returncode:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if result.returncode =3D=3D 1=
27:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 RunQemuRootfsError(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'Unable to find the oe-find-native-sysroot script.\n'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'Did you forget to source your build system environment =
setup script?')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise RunQemuRootfsError(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resul=
t.stderr.decode(errors=3D'replace').strip() or
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Unab=
le to set up the qemu-helper-native sysroot')
> +
> +=C2=A0=C2=A0=C2=A0 environment =3D {}
> +=C2=A0=C2=A0=C2=A0 for entry in result.stdout.split(b'\0'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if b'=3D' in entry:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key, =
value =3D entry.split(b'=3D', 1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 envir=
onment[key.decode()] =3D value.decode()
> +=C2=A0=C2=A0=C2=A0 return environment

This takes a relatively simple shell script and turns it into python
but the python is very machine generated and probably not great for
readability or maintainability in the future.

For example, in the above we're using the shell to find oe-find-native-
sysroot. Instead we could use shutil.which(). That would make the code
a lot more pythonic and readable. It also special cases some variables
specifically so it isn't quite a generic function but it is named
generically.

> +def _tar_options(rootfs_tarball):
> +=C2=A0=C2=A0=C2=A0 if rootfs_tarball.endswith('.tar.xz'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ['--numeric-owner', '-=
xJf']
> +=C2=A0=C2=A0=C2=A0 if rootfs_tarball.endswith('.tar.bz2'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ['--numeric-owner', '-=
xjf']
> +=C2=A0=C2=A0=C2=A0 if rootfs_tarball.endswith('.tar.gz'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ['--numeric-owner', '-=
xzf']
> +=C2=A0=C2=A0=C2=A0 if rootfs_tarball.endswith('.tar.zst'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ['--numeric-owner', '-=
-zstd', '-xf']
> +=C2=A0=C2=A0=C2=A0 if rootfs_tarball.endswith('.tar'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ['--numeric-owner', '-=
xf']
> +=C2=A0=C2=A0=C2=A0 raise RunQemuRootfsError(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Unable to determine sdk tarb=
all format\n'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Accepted types: .tar / .tar.=
gz / .tar.bz2 / .tar.xz / .tar.zst')

A human doing this would create a table and not duplicate the data. Its
a pain to maintain in future. I appreciate it matches the shell code
but if we're going to do it, we may as well do it well.

> +def pseudo_state_dir(rootfs_dir):
> +=C2=A0=C2=A0=C2=A0 """Return the pseudo database location associated wit=
h an extracted rootfs."""
> +=C2=A0=C2=A0=C2=A0 rootfs_dir =3D os.path.realpath(rootfs_dir)
> +=C2=A0=C2=A0=C2=A0 return os.path.join(os.path.dirname(rootfs_dir),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.path.=
basename(rootfs_dir) + '.pseudo_state')


os.path.join(os.path.dirname(rootfs_dir), os.path.basename(rootfs_dir)) ?=
=20

really? :)

I think this needs a bit more human TLC before it could be merged...

Cheers,

Richard

