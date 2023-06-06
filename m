Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C134AC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 04:30:18 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.1635.1686025812214810329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 21:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rOx8Lbt7;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-55b00ad09feso361924eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 21:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686025811; x=1688617811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xkqea/mkfETAgC6C3yE+clqSDm2w/bnBvZrrTqhwtg=;
        b=rOx8Lbt7Okay7aZ/teo7udmfEOr0n056WY+NAMoZVbB7A5RJIp8hvnAvl8E2V1U2Te
         uNQos/jB84/x4jSraiGP+yh1iCPVCmJe/4CL3x6z6i8CsK5oan5m07ItavZ9j5Ga3xMw
         Hgr8+KjMpmypbQDr4kzVFoM73gU3fGlxdOJIukhF0vPGkjEi95gw6fImOVeLuEZAf1fo
         uW1j3Ju0qUBBVDLieuEB2uDJqq4T9tUIlHRv+NAG5IyCGvw0XJujeEPOOLsT4NV29G00
         haKIsrqe+i4IFpWGIbYv64VfSgOt3dGJs9tabbgQk1Iaqs33hNai0U29Sq00aQc65Uo+
         OSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686025811; x=1688617811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Xkqea/mkfETAgC6C3yE+clqSDm2w/bnBvZrrTqhwtg=;
        b=CrwChD3vlmaQoCxfiZvK0rGDsdU6e9a2nmY8q7RUscWLkMNpkd7iZmgIumzbrV08WI
         2rjCifaleuFhYGODl9poguOvMB97PeSXY3VwO/1tLZ0bPLTekwG+9F7RdGU2eIRWEO6X
         HC053w4E+iuY5dAGgDxNdTKNcxGsWEgVQVB9eW15jpIVRBtRAUy2AyjimA0vkxVRO5ym
         uwOPAj7oBTbpj8FKsgo8ovtfFeKYwybeicwMcQ7zaDT3ws6dSIqYrxZycbfXYHqkbA/y
         lTi5F1nVbD8Sc5B0gNeMRAiwrRWnqo4ZYuXOcenPQbECm5/YUMc9eWixLvZ+0qOaf03C
         rziA==
X-Gm-Message-State: AC+VfDyS8Sxg31CBDJJDg8Ts8zrFqjIqpX6dSoZyHDcCxxasTcDTMQ7u
	+8sHh/XxQH2leFS+mkzI7pHHPx2V91k=
X-Google-Smtp-Source: ACHHUZ50+ujk2ZNqjPxl88jaICqJQA1vbZRymEoaEXY5x9/2su6X5QrgmsjZiyuPnd505cyTZ44cpw==
X-Received: by 2002:a54:4487:0:b0:39a:55e5:c437 with SMTP id v7-20020a544487000000b0039a55e5c437mr954220oiv.21.1686025811152;
        Mon, 05 Jun 2023 21:30:11 -0700 (PDT)
Received: from w530-2.hsd1.ca.comcast.net ([2601:641:8080:1a70::f664])
        by smtp.gmail.com with ESMTPSA id oj9-20020a17090b4d8900b002535a337d45sm6622857pjb.3.2023.06.05.21.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 21:30:10 -0700 (PDT)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH] systemtap: upgrade 4.8 -> 4.9
Date: Mon,  5 Jun 2023 21:30:05 -0700
Message-Id: <20230606043005.4709-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 04:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182406

SystemTap 4.9 release went out with a little hick up: release date was not
set correctly and fix for it was added as ebb424eee5599fcc131901c0d82d0bfc0d2f57ab
commit and tagged as 'release-4.9'. Unfortunately by that time 'master'
branch already has moved on, and it turns out that now 'release-4.9' tag does
not belong to any branch. On other hand OE SRC_URI does complain about git
uri without branch. To deal with it we will use SRCREV set to
418f0a45ca4473491385b5c7eef777607bbdb3b7, commit one that precedes
ebb424eee5599fcc131901c0d82d0bfc0d2f57ab, and add separate patch for
ebb424eee5599fcc131901c0d82d0bfc0d2f57ab as 0001-release-date-fix.patch.

Note for any future version move: please remove 0001-release-date-fix.patch

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 .../systemtap/0001-release-date-fix.patch     | 37 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  5 ++-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
new file mode 100644
index 0000000000..3dcb369ec3
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
@@ -0,0 +1,37 @@
+From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Fri, 28 Apr 2023 13:51:27 -0400
+Subject: [PATCH] release date fix
+
+Upstream-Status: Backport
+---
+ NEWS           | 2 +-
+ systemtap.spec | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 695bc990c..46859e304 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,4 +1,4 @@
+-* What's new in version 4.9, 2023-04-27
++* What's new in version 4.9, 2023-04-28
+ 
+ - ISystemtap: the new interactive systemtap jupyter kernel. This provides
+   a simple GUI for writing/running Systemtap scripts in an easy, incremental
+diff --git a/systemtap.spec b/systemtap.spec
+index 59814f112..fd8023264 100644
+--- a/systemtap.spec
++++ b/systemtap.spec
+@@ -1307,7 +1307,7 @@ exit 0
+ 
+ # PRERELEASE
+ %changelog
+-* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
++* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
+ - Upstream release, see wiki page below for detailed notes.
+   https://sourceware.org/systemtap/wiki/SystemTapReleases
+ 
+-- 
+2.40.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index afeb3ce2d2..de3750ff04 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,12 +1,13 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "b176afb2e49119ef844d193d27b0752a6d84fe8f"
-PV = "4.8"
+SRCREV = "418f0a45ca4473491385b5c7eef777607bbdb3b7"
+PV = "4.9"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-release-date-fix.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.40.1


