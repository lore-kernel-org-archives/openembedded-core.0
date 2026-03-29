Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174BAFC980E
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:41:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38424.1774824099671175846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GkYX2a8Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd832155so255914f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824098; x=1775428898; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJt7GkgJIvbAeobVj9REmiwJx3dRdAbj0BgZLVTVQ6k=;
        b=GkYX2a8ZlYIphLo+T6yu7tos4KtYo3BjN/v4Kepgoc0wPQOgokBzznJuCpZ+aAXx0V
         STrhZ/JZCsPmvP2QsWsiZbalpkz31t8vV+STDL2CMTjWza4b2/w4hUnMHZnVV4U8GYYw
         +DcljVUI4rCdOQOoqXvkYvNcwzmnu78IDRZaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824098; x=1775428898;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJt7GkgJIvbAeobVj9REmiwJx3dRdAbj0BgZLVTVQ6k=;
        b=kMdJHJz9LdsPHn1edkdZVX5vO9vOiUVKsZ3VDFboqLylJ08XbAI1eOZCKEtTnzHe2Z
         wVOL9dHvMFqKW4WOOsRbzbiet8UBt1E/+8UU6EpkGw9l33ktQR+essnkoXJbzJ+dPfSY
         WAz1qZp/JmworbVU4OYoJJqFTCwFVzyWKhIu3IvFFSEAKh1AVKj6yPgUaHkmU1TKdjDo
         hld8+ZJsSrr7I/OLZNXM4LuPkCXPAorBQrxtimQVah/O48wdLWNol70ecu7tFSScMYHb
         6uJYbpqGOav/fT0fxuKkOhXrnBQ/+sxch2suPHSzkJTLLQWF2K3ZBFCoAKjBoZiG/TDU
         g4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUtl/jrcVGFMJ30MbjgRu0C+RiOse6AFTZUUt7v0VKXVFM/5WKPTlfmvEhZOEc1E2FjuRHr7yL3wcOczaHIDAiVPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6XmxIZBs3oyyQbzQI2UpQv9YmoblU9rB+eaEDkS80I49xGq6c
	Em7by740yCsCk1y4IVz0F4R4JsMS+vqy4/bfdYiuL0/2xC3lorBIVZyQcOYFbMK0IXl79niQWwl
	vNqzbIOQ=
X-Gm-Gg: ATEYQzyofQqh4KXtDdLxezmHvM/7W/A45sDUOFGhQJeRcWP0WWG7t7Kr7IKfcGRW8yR
	5Rpg7kJMVkiGpnba2aXFA7AVw0AgqZ/UPGoV9KKknemTeOgfnvHbUZqxe1czdsWgjhqY+aTwz2B
	tJpi3h1Ieu0jm63jUu9tDdITTTMNUCP7RHa67NvpPeKFrrtBEwbVms0qrt77xIRlIdiP1+1iEv9
	gTqIG5ZWON0wBalDXlHnhnaitylyieehBonTJAPBrZ4kKmi9y1W9sNG8BPV+ebym8Px/ud36x++
	kufg29HMBDjCskCREH0G5y7pxPa41cTo8XtfZa36dDIReRQV9KspT/KGOnXKA6sg1tGXRXNl7vN
	BWhYKJQ6euyWdvwO9/qbK2liTTrxKdZIcjL0xqecY0O4z6PAEmm8nvI97AA3vEVByMUQ5zFXBjT
	6eYpGryXufbBzUuWJDa5kP3X86JWzcv4JBDg1o0Xl62808Bsow4JLHLTWOdwaM4FzMLNTwEqQL0
	L/PNOrEmBdqaDE=
X-Received: by 2002:a05:6000:26cf:b0:43c:fe7a:491f with SMTP id ffacd0b85a97d-43cfe7a4c03mr3184760f8f.18.1774824097917;
        Sun, 29 Mar 2026 15:41:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e3602sm14800143f8f.4.2026.03.29.15.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:41:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 00:41:37 +0200
Message-Id: <DHFMMUDODD3R.1VXM77S8SK2AA@smile.fr>
Subject: Re: [OE-core][scarthgap 00/16] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1774823430.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234175

On Mon Mar 30, 2026 at 12:37 AM CEST, Yoann Congal wrote:
> Please review this set of changes for scarthgap and have comments back by
> end of day Tuesday, March 31.
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3546
> Note: This particular build had a gnutls patch that I removed because it =
needed a small change[0].
> Build (currently running) without the gnutls patch: https://autobuilder.y=
octoproject.org/valkyrie/#/builders/29/builds/3551
>
> [0]: https://lore.kernel.org/openembedded-core/DHFLXG1K82R7.3EOQRZ2H6KW8Q=
@smile.fr/T/#t

*sigh* I need to check on my tooling because it did not sent the right
branch. Please ignore this series. I'll send the correct one shortly.

Sorry for the noise.

> The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d61734=
eb:
>
>   Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09:48=
:20 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap=
-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
scarthgap-nut
>
> for you to fetch changes up to e6f3b2e043259650d80fb6f761797c5cf5587eb5:
>
>   python3-pyopenssl: Fix CVE-2026-27459 (2026-03-30 00:09:38 +0200)
>
> ----------------------------------------------------------------
>
> Hitendra Prajapati (2):
>   libxml-parser-perl: fix for CVE-2006-10003
>   busybox: fix for CVE-2026-26157, CVE-2026-26158
>
> Jo=C3=A3o Marcos Costa (Schneider Electric) (1):
>   spdx: add option to include only compiled sources
>
> Martin Jansa (3):
>   dtc: backport fix for build with glibc-2.43
>   elfutils: don't add -Werror to avoid discarded-qualifiers
>   binutils: backport patch to fix build with glibc-2.43 on host
>
> Michael Halstead (2):
>   yocto-uninative: Update to 5.0 for needed patchelf updates
>   yocto-uninative: Update to 5.1 for glibc 2.43
>
> Nguyen Dat Tho (1):
>   python3-cryptography: Fix CVE-2026-26007
>
> Paul Barker (1):
>   tzdata,tzcode-native: Upgrade 2025b -> 2025c
>
> Richard Purdie (1):
>   pseudo: Add fix for glibc 2.43
>
> Sunil Dora (1):
>   rust: Enable dynamic linking with llvm
>
> Vijay Anusuri (3):
>   python3-pyopenssl: Fix CVE-2026-27448
>   python3-pyopenssl: Fix CVE-2026-27459
>   gnutls: Fix CVE-2025-14831
>
> sureshha (1):
>   systemd: backport patch to fix journal-file issue
>
>  meta/classes/spdx-common.bbclass              |   3 +
>  meta/conf/distro/include/yocto-uninative.inc  |  10 +-
>  meta/lib/oe/spdx30_tasks.py                   |  12 +
>  .../CVE-2026-26157-CVE-2026-26158-01.patch    | 198 +++++++
>  .../CVE-2026-26157-CVE-2026-26158-02.patch    |  37 ++
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
>  ...not-trigger-assertion-on-removed-or-.patch |  65 +++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
>  .../binutils/binutils-2.42.inc                |   1 +
>  ...tect-against-standard-library-macros.patch |  31 ++
>  .../elfutils/elfutils_0.191.bb                |   1 +
>  ...001-config-eu.am-do-not-force-Werror.patch |  34 ++
>  .../libxml-parser-perl/CVE-2006-10003.patch   |  73 +++
>  .../perl/libxml-parser-perl_2.47.bb           |   1 +
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
>  .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++
>  .../python/python3-cryptography_42.0.5.bb     |   1 +
>  .../python3-pyopenssl/CVE-2026-27448.patch    | 124 +++++
>  .../python3-pyopenssl/CVE-2026-27459.patch    | 109 ++++
>  .../python/python3-pyopenssl_24.0.0.bb        |   5 +
>  meta/recipes-devtools/rust/rust_1.75.0.bb     |   2 +
>  meta/recipes-extended/timezone/timezone.inc   |   6 +-
>  .../0001-Fix-discarded-const-qualifiers.patch |  85 +++
>  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |   1 +
>  .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
>  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
>  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
>  .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
>  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++++
>  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
>  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
>  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
>  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 437 +++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
>  34 files changed, 2600 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-=
2026-26158-01.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-=
2026-26158-02.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-=
protect-against-standard-library-macros.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.a=
m-do-not-force-Werror.patch
>  create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-200=
6-10003.patch
>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE=
-2026-26007.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-20=
26-27448.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-20=
26-27459.patch
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-=
qualifiers.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.p=
atch


--=20
Yoann Congal
Smile ECS


