Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28403C7EE2A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.27804.1750604536219891941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qj+Psycw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1276002b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604535; x=1751209335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hEMm0u1wL3xoBoWHhDqULD/gWzsIq6q2IHDIjSVgH8=;
        b=qj+PsycwacXgTcKMG+k9rtb0ZjJdN7o/2Xcyvl9rq1jF3AAX5gMCA0whG1W9rmFmvP
         qV61uIDu6owLHtHwR015Oi0ad8bKr5UMyrDME1cpLaezUdfyCVChxTqWARcpearYgSBG
         PHyE5ej8Wl+AgCcpITwwFkt6vl5iQ9bUctVGUZQnDycKoO1FbpaZ4HD/knJzZ3zRxh24
         qfgwpV/71jIkwKrq4IHf/1YDiIVWBELTJvj1BqEoGPb8A3CZPdy03fYJSKcQpvqVX/2n
         Arg/z2UEeMkiRzAisvW+b6C8c9QikW+iMZatsdlCnx7E9hJS6fIwCeIe8BNXDGJa28N6
         GcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604535; x=1751209335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hEMm0u1wL3xoBoWHhDqULD/gWzsIq6q2IHDIjSVgH8=;
        b=YrqGIcIJkWLjLHfOpOzt44t1/AA10JtLu+21L8+EvoVk6rldibG8MoMpyT1ybKflRA
         W0rZjlqwgUQOHTUuIpF9723UCJ3imb7CxKQrYyvKmCdBXqcGP3uKlCd5ySJ61OfjWBuQ
         U+UgWqrZuAppZyAC6zesyzIGqt2V5J9NLsA7boqF+oBZ98KEpKqhGIgRwc9GvJqq4o/u
         t8XWVdo0dkusIif5u6Jn+5jlih0beE9QTpxjzpDyIEV4NmH/RvWZrZQbyfb/pRYKU7Wa
         5TMIaPoJD51gBPkX8NFw5+EPK4kRCYBkE35/xrV6cb0ykrNNY1idu0m7UYF4v01dYkEh
         ys/g==
X-Gm-Message-State: AOJu0Yxdkeq5ghqmZp2yYEty9fzVWnSfzV1SZI3lTSi/nDwcqzvwJV+4
	tgOvMI6ZKUOqO6akI3isuMGlwdDwS+IABvIigps4g5a8hHkIitnluVZSkS/vuFlfz1sBFLA2Uyo
	0LDW/9ys=
X-Gm-Gg: ASbGncvmCrkUMyh96lq5NDnIGtfGkFi6TG5Ol9TNET16mSsTGxEhKMwWsvstLtNzPET
	M8CWnSC+EE/BmvEQQ3nYdp4VqCVBMbnXfR+rmxaDyh7eNhueYmRufk/dzsH1N4NYbxTc5OLRLRo
	9F0SZk1fWCIoMZerKSutcl/L6wO7IRA3Qsn/9DwJ0+orULOul8WKPajL6RP+Ez11mYJaUkTOMd6
	sn7BZZjrs1x6cmvEFY9DmclK+ImFsg/93LU1FIc/+5UGE6RQEf6iN29qAIVv461bDBhXUHItD3l
	lIs6oArtefr/8SqTeR7QKUzlEv8Kfgt0/r9CLUOotdaeh8zCMUlj6Q==
X-Google-Smtp-Source: AGHT+IFXav58Pp1MlDPhtPs1K9rUiU2FNOMUh6Yuvg5nn1Fq6tH06iA5vquSgT6aXeJm6Bz9KuFGTw==
X-Received: by 2002:a05:6a00:3cca:b0:749:421:efcc with SMTP id d2e1a72fcca58-7490d74f563mr11318436b3a.5.1750604535194;
        Sun, 22 Jun 2025 08:02:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Patch review
Date: Sun, 22 Jun 2025 07:59:55 -0700
Message-ID: <cover.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219179

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, June 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1857

The following changes since commit e0857503de9f427d177fe85c32cf0d2748d779fb:

  glibc: nptl Use all of g1_start and g_signals (2025-06-17 08:05:29 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ashish Sharma (1):
  libsoup: patch CVE-2025-4476

Changqing Li (8):
  libsoup: fix CVE-2025-32907
  libsoup: fix CVE-2025-32051
  libsoup: fix CVE-2025-46421
  libsoup: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476

Hitendra Prajapati (2):
  libsoup: Fix CVE-2025-4969
  libsoup-2.4: Fix CVE-2025-4969

Moritz Haase (1):
  cmake: Correctly handle cost data of tests with arbitrary chars in
    name

Peter Marko (1):
  go: ignore CVE-2024-3566

Soumya Sambu (1):
  systemtap: add sysroot Python paths to configure flags

 .../cmake/cmake-native_3.22.3.bb              |   2 +-
 ...trary-characters-in-test-names-of-CT.patch | 205 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb   |   1 +
 .../go/go-binary-native_1.17.13.bb            |   3 +
 meta/recipes-devtools/go/go-common.inc        |   3 +
 .../recipes-kernel/systemtap/systemtap_git.bb |   7 +
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   5 +
 .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 +++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
 .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
 .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
 .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   8 +
 21 files changed, 1175 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch

-- 
2.43.0


