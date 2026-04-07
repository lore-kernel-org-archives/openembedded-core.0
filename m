Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6334EF46C7A
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75565.1775546024211796742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oE3kMAcP;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48896199cbaso40722895e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546022; x=1776150822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BycAHJNhLShubIRDGsoyzkVltaMd0HntOfC18cI34UQ=;
        b=oE3kMAcPvLuDy7U5PmNn8L+uNhQmdE2fD/ITZIbdDvjJD6HGA8TdB5Pl+e6T16Wffc
         AalB32CHURhp2ykTqiI48N1KPQraI3ow34qvoMRZlGvHPS6mVQfAjCCTZJzLj0sOmHJM
         +sQ5wTazcbxR3nZZtv69FoP6B0KWf/OwIKCEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546022; x=1776150822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BycAHJNhLShubIRDGsoyzkVltaMd0HntOfC18cI34UQ=;
        b=LS4BaT+bLpJlAE328/Lng80wvAXTctibzoZD4hs930J5KWX/VBK+sW6atIOS+DymLQ
         cLyPjhkb45DOwQFWh7Jzo9uIlXFESa9NYSSOSTM3j3tGGbbMdIVA+mHYjbQ2A5n3E9/x
         50nthImVElzGBNH/gWiVVoITpHYAcXpx+9Kdxebcu944ebU8mB7dUo5G1s6P7FvvDI9w
         b1hlQR1NzKZEoQM2u2Tjt+nA1lnhIVMUOJT0qZevdqn7spvvQJiH+BdewV3++x+lgGn5
         Jsyd5OdoSK1PMSuJRaHqthtbpA4fiF7V7mNAqGOxs6uM9i5RsRu8aekB6JDcUorK32GV
         C73Q==
X-Gm-Message-State: AOJu0YyFpaG3fQaq8tGyRvOO+xHHYT+v6ooJeUN/zywg9Mj00/3yYdP8
	4vRalcxSIr9P5csUGwWfLUzyeA/gMTxkWZZNmvdhiVj+1XfO2hjv+g59Eve6Se5+orGzEG+mU2Z
	OqZIKPPY=
X-Gm-Gg: AeBDietZ7djI/OFuRPn9eSJIVx6XyJO3fvW8XytVvfOF3ErDPnMEeRNy5wlxIJtSWoV
	AmlZLg1LsWflGlPcFACTLlb3hwPm8P+sxOLSHW2+mqKs9pMgmOCia1zQYXoq41XsiMDxfqxsteR
	3ONB714SCJg1BAA0KMfstkppH/hwgor1jJd7xtpFor9CHG2wgvITW+du8xD6vXReWK+bV3MtAjL
	FpuaYkOSUCounVAn2H4micyMVoOsrvQ4pI12f6MLnK6GWPeLuiaT7wQkZr4FKTbq+7IpAm9BsTc
	uaLyxXslPF7UIZwjsUg/eWoOx+VfkV4ihUVQnpgeFB9F7VhwqxXNldDCksOhAFLWzSPUno8wbjl
	l4OexdHcbbw3ZSEoKYLtBIJYXzerczl8Eds0aFUT2Fi1qq5awtINxUChbxnSJSDe6sKoBJnf+wF
	LO0IhpNe/j3Qt0HBgROvnaSu9cax7axYWPPyHkaUU/w1lytH+PyGfbXlj4ShJWpDyFgre/owt4m
	muojYmw9G3OdejGZ51KZc/JHkA=
X-Received: by 2002:a05:600c:628e:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488997da325mr203937895e9.25.1775546021979;
        Tue, 07 Apr 2026 00:13:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 00/18] Patch review
Date: Tue,  7 Apr 2026 09:13:08 +0200
Message-ID: <cover.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234704

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, April 8.

Please note:
- This will be the last review cycle for kirkstone.
- If you expect a patch to get merged and it is not in this series ping
  me as soon as possible.
- Some patches look OK to me and are included here but will only be
  merged if some patches are sent/fixed in more recent branches:
  - Pending an equivalement patch sent for whinlatter:
    - libarchive: Fix CVE-2026-4111

v1->v2:
- replaced "python3: Fix CVE-2025-15282" with
  "python3: upgrade 3.10.19 -> 3.10.20"
- Those patches are not held anymore since equivalent patches have been
  sent to more recent branches:
    - curl: patch CVE-2026-3784
    - curl: patch CVE-2026-3783
    - curl: patch CVE-2026-1965
    - vim: Fix CVE-2026-33412

I will try to send a v3 with this last minute patch:
[kirkstone][PATCH] ncurses: fix for CVE-2025-69720
https://lore.kernel.org/openembedded-core/20260407054403.21041-1-hprajapati@mvista.com/T/#m070f1177b6e08d547a9fe91a4546f4b5b8d6dcd3

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3606
(The warning is not related to this series)

The following changes since commit c4194cadb1180da37514c55cd97827eb0269c8e2:

  build-appliance-image: Update to kirkstone head revision (2026-03-20 09:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

for you to fetch changes up to 14ffe9ce3bfb10dc658d3bd648e531c9fadfe20a:

  scripts/install-buildtools: Update to 4.0.34 (2026-04-06 23:02:13 +0200)

----------------------------------------------------------------

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.200
  linux-yocto/5.15: update to v5.15.201

Fabien Thomas (1):
  README.OE-Core: update contributor links and add kirkstone prefix

Hitendra Prajapati (1):
  vim: Fix CVE-2026-33412

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2025c -> 2026a

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (1):
  libtheora: mark CVE-2024-56431 as not vulnerable yet

Vijay Anusuri (10):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c
  python3: upgrade 3.10.19 -> 3.10.20
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459
  libarchive: Fix CVE-2026-4111
  sqlite3: Fix CVE-2025-70873
  curl: patch CVE-2025-14524
  curl: patch CVE-2026-1965
  curl: patch CVE-2026-3783
  curl: patch CVE-2026-3784

Yoann Congal (1):
  scripts/install-buildtools: Update to 4.0.34

 README.OE-Core.md                             |  10 +-
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 106 +++++
 .../python/python3-pyopenssl_22.0.0.bb        |   5 +
 .../python/python3/CVE-2025-12084.patch       | 171 --------
 .../python/python3/CVE-2025-13836.patch       | 163 --------
 .../python/python3/CVE-2025-13837.patch       | 162 --------
 .../python/python3/CVE-2025-6075.patch        | 364 ------------------
 ...{python3_3.10.19.bb => python3_3.10.20.bb} |   6 +-
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 +++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../libtheora/libtheora_1.1.1.bb              |   3 +
 .../curl/curl/CVE-2025-14524.patch            |  42 ++
 .../curl/curl/CVE-2026-1965-1.patch           |  98 +++++
 .../curl/curl/CVE-2026-1965-2.patch           |  29 ++
 .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++
 .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++
 .../curl/curl/CVE-2026-3784.patch             |  73 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   6 +
 .../sqlite/files/CVE-2025-70873.patch         |  33 ++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 .../vim/files/CVE-2026-33412.patch            |  61 +++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/create-pull-request                   |   2 +-
 scripts/install-buildtools                    |   4 +-
 30 files changed, 1181 insertions(+), 893 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 rename meta/recipes-devtools/python/{python3_3.10.19.bb => python3_3.10.20.bb} (98%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


