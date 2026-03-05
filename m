Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B23FEDEC1D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:20:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40455.1772702445107392222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z3LU/cbO;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c944bb62so1233290f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 01:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772702443; x=1773307243; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VypkVT7BbhqBRG1P5j19O5/qn7x5887m35xmVxXUx8s=;
        b=z3LU/cbOtA2/cb0imAzEJBnzmc2n7RR5MQPf7g7KLeocnKtwvictOu2b2KrM7HCB/V
         UKEsJc4t1WhoaJ5w2EnnkiDzxFc0v+59YweXobd3EMyjDJKn+aT8eg6Dz7fDmaTrdA2u
         yg4Li1S0h5ZPLtHQX85ZWNJwmvs+zawfC81Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702443; x=1773307243;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VypkVT7BbhqBRG1P5j19O5/qn7x5887m35xmVxXUx8s=;
        b=GNTUEpQ9AYbFKBURDTka/mGltJbd7XcsyizAi4iwBSBTrDlCvJVXPYp/7xWz+++olR
         pze2lauF4I1kaMdHx3NgYuHk/Xy5cuAKPceltM7koVQPFpO5MQTlnmkBeKWpqxT6kGCp
         z9c4ujkcQG1P6oWn7HD3VxlGs2k0HsRy7TJ6VxjwXixnOVScgl5IU7sb2vFZt8cnRS9z
         7o0KRYamrwWAk/qRtEcOwbkV2Jzb2lLaHEF3kaTSqdDivRR512Ps+KV1QKMB0RBWQCIt
         9Jmcgipt5r04ybWq3g/o8azE7vU1tF/r2Og5I7yuaIij1gNAY454/nVDqRCkztT1BA2H
         t4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrr2g0M9RbtC1PM7cuNgYNaaVj1qYoJ5uwPLmx60qAyplUtbo5Bm9dFE67Pxx5Vq/2y/Ed7RmxY1wkcXQnqCEj6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOVG1BMelfpm5/JOXMGffjSBdUDOo/gqXd+sZkB3+nT6jrNpkD
	C8raXHSfZBg0tROffqWAAOiwXCgwrwHLkFtJXL2/FfDevTPP1S+qNCT6db4xmR7gRIw=
X-Gm-Gg: ATEYQzx16mCXIV6bAv+RYrHwj+h8FCSqPuS7EUB4vofoXR7PQ5Uq+im09Y0RJEihtTx
	9d6IgTp1vSjsb84J/xyFoyoep/hXLmFlaq/xvN23VQmTqeeT844xRot+uQBhxo+YHC0c9oV+Ed/
	bL/ryBK66pPsD1OhMGs4A3sIsrCRCOmmR6MzrzJdmj4+pJb3yyQ5b3aOvqa+XvLANDTXqiZ9G6N
	hYXeJkvo9hX94SFx0lf2IR++3HobtcCs/PUink2xgF8MRktbuPQbnWVYV4/ajD6kKGljnCUJ4ch
	3Vw4HHl3toiGzPUTozR5ZFiDvFsVAHliR1kG/sEzuhWSNZZpk9Nak9ersLj5npjMCCMpNsqDtT6
	1sKMRZ4pONnxjmr9XC9l/OMPyCBZdqiofZBbTZkBm+QDHIZApCIYlg923LjOdEGMiUl63DOv5Dv
	OuCJt+37cHsFblhfaA9oSwoSvHCVmemt8X91E9hB2K5C/wcEo3LemFHsqgPvQq136pBiX3PcVXy
	9L8gOmO73uqqBmt
X-Received: by 2002:a05:6000:430e:b0:439:c677:5145 with SMTP id ffacd0b85a97d-439c7fae275mr8987757f8f.22.1772702443295;
        Thu, 05 Mar 2026 01:20:43 -0800 (PST)
Received: from localhost (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b6d540b2sm29293149f8f.36.2026.03.05.01.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:20:42 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:20:42 +0100
Message-Id: <DGUQKJKLZTVJ.Y3Q751XS5KRZ@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter 00/12] Patch review
X-Mailer: aerc 0.20.0
References: <cover.1772700454.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232466

On Thu Mar 5, 2026 at 9:54 AM CET, Yoann Congal wrote:
> Please review this set of changes for whinlatter and have comments back
> by end of day Monday, March 9.
>
> Passed a-full on autobuilder with warnings:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3334
> The sub-build qemux86-64-ptest had a ptest failure
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3207=
=20
> It is a known AB-INT bug: 15718 =E2=80=93 AB-INT: gstreamer ptest never e=
nding (Bitbake still alive)
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15718
> This is not related to this series.
>
> The following changes since commit 45cba1329d541fdc5857d6df2624b34c91133f=
7a:
>
>   build-appliance-image: Update to whinlatter head revisions (2026-02-27 =
17:46:44 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-nut

I plan to also add this patch to the branch:
[whinlatter][PATCH] create-pull-request: Keep commit hash to be pulled in c=
over email
https://lore.kernel.org/openembedded-core/20260305085838.1176663-2-yoann.co=
ngal@smile.fr/T/#u

>
> Adarsh Jagadish Kamini (1):
>   python3-pip: Backport fix CVE-2026-1703
>
> Ankur Tyagi (1):
>   wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
>
> Antonin Godard (1):
>   python3: skip flaky test_default_timeout test
>
> Hugo SIMELIERE (2):
>   zlib: Fix CVE-2026-27171
>   harfbuzz: Fix CVE-2026-22693
>
> Peter Marko (3):
>   linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
>   cve-exclusions: set status for 5 CVEs
>   ffmpeg: set status for CVE-2025-12343
>
> Shaik Moin (1):
>   gdk-pixbuf: Fix CVE-2025-6199
>
> Vijay Anusuri (1):
>   gnutls: Fix CVE-2025-14831
>
> Yoann Congal (2):
>   README: Add whinlatter subject-prefix to git-send-email suggestion
>   b4-config: add send-prefixes for whinlatter
>
>  .b4-config                                    |   1 +
>  README.OE-Core.md                             |   2 +-
>  .../zlib/zlib/CVE-2026-27171.patch            |  63 +++
>  meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
>  .../python/python3-pip/CVE-2026-1703.patch    |  41 ++
>  .../python/python3-pip_25.2.bb                |   4 +-
>  ...kip-flaky-test_default_timeout-tests.patch |  49 ++
>  .../python/python3_3.13.11.bb                 |   1 +
>  .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 ++
>  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
>  .../harfbuzz/files/CVE-2026-22693.patch       |  33 ++
>  .../harfbuzz/harfbuzz_11.4.5.bb               |   4 +-
>  meta/recipes-kernel/linux/cve-exclusion.inc   |  16 +
>  .../linux/linux-yocto-rt_6.12.bb              |   1 +
>  .../linux/linux-yocto-rt_6.16.bb              |   1 +
>  .../linux/linux-yocto-tiny_6.12.bb            |   1 +
>  .../linux/linux-yocto-tiny_6.16.bb            |   1 +
>  ....10.07.bb =3D> wireless-regdb_2026.02.04.bb} |   2 +-
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   1 +
>  .../gnutls/gnutls/CVE-2025-14831-1.patch      | 119 +++++
>  .../gnutls/gnutls/CVE-2025-14831-10.patch     | 424 +++++++++++++++
>  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  66 +++
>  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  30 ++
>  .../gnutls/gnutls/CVE-2025-14831-4.patch      |  45 ++
>  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 205 +++++++
>  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 505 ++++++++++++++++++
>  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 124 +++++
>  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 155 ++++++
>  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 110 ++++
>  meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  10 +
>  30 files changed, 2048 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-=
test_default_timeout-tests.patch
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-619=
9.patch
>  create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.p=
atch
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb =
=3D> wireless-regdb_2026.02.04.bb} (94%)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.=
patch
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


