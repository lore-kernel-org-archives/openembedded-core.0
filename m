Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5F4C46CA0
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 06:33:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.94617.1701757994259875199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 22:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxIO5Mcv;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d075392ff6so20285855ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 22:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701757993; x=1702362793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwRXaEh46vICHbEcCPBGlEq28jdpIWiu/iwEzPLK0Wo=;
        b=hxIO5Mcv2IugUQmB3GnZyGbejHRWRVTWmmI9pyGIXLwKABbqCQOXyAvY3KFL3PVjW1
         B4lrdim3ZFNgtuJcDeiIeteDO98Cu4zBqSvXTQg0bpKJPRxlOkNCwCo5vwTBuuoeMule
         l20I8RwfSSKD2DAK6ep0l/UQbbWMJj410mh3wHiR6um4diYfiKcvKw1JN46mCRJTcqh6
         gMNqeAsR2NiksG2Q9JeFGahD2DbB/IZUjrw1YpXB0tmnL/MS0/aMhhyh7VrbTxBRsc2t
         nS2kJ8Azd3HFS0kSC1k7CZ4xluvQ15R+if2/anrqYHsHw+iFuZfVI15ZDKmicnz0a+R9
         EjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701757993; x=1702362793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwRXaEh46vICHbEcCPBGlEq28jdpIWiu/iwEzPLK0Wo=;
        b=WRcQrvlGUwXLq0MGWKyhiVpeomPkykiyevvHvr0eNebSSUdOgRLZt3qxDAOEM/pGxu
         W5uJfyXJN5938c05atbG5Any/9o/UXBVdoqeLun/sD93EZWP4F7nf7B6VD55QZ+5oOBO
         HqHZA/tmG6OsE2z/sgfhCmJPMvuCXRGXtYPvhuVGfmRhmBtlcFUSFuykuHwyBR1M0jCt
         IpVEkBYmOq3ea2ef03TGmq/FIQzwL7T7jqScE6Qm7jzawt1TzStuLps8h2iR6Z/MEwUx
         Iy5MOBuDUI3eypYwMBMYeg3VMwPc9zWsd2rYlex2cfXFvsylBcADWgjI0vqfKYavInrB
         L28Q==
X-Gm-Message-State: AOJu0YyJYBnPtMFndK5jSRB8pBpVJ/pTdMouUuubyuo3yu3XUn6WT1Tt
	f0uoiepZacL70UVwSjAd/eSxZqAbxSk=
X-Google-Smtp-Source: AGHT+IExBDXWoISGqUlVJ1nXsP3cn6DnxozML3PJq6soegwgoLUnw/MG/8RwIy68+o4qh2XW1N8TYQ==
X-Received: by 2002:a17:902:b196:b0:1d0:8abf:a797 with SMTP id s22-20020a170902b19600b001d08abfa797mr1117985plr.42.1701757993191;
        Mon, 04 Dec 2023 22:33:13 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::7dab])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b001d0915435f8sm3722206plj.16.2023.12.04.22.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 22:33:12 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 1/3] systemtap: upgrade 4.9 -> 5.0
Date: Mon,  4 Dec 2023 22:32:47 -0800
Message-Id: <20231205063249.3433-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191795

Similar to 4.9 release, in 5.0 release release-5.0 tag is off any branch,
release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on the master
branch. Use this value for SRCREV and add catch up patch,
0001-prerelease-datestamp-fixes.patch, to bring source up to release-5.0 tag
level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrade.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 .../0001-prerelease-datestamp-fixes.patch     | 23 ++++++++++++
 .../systemtap/0001-release-date-fix.patch     | 37 -------------------
 .../systemtap/systemtap_git.inc               |  6 +--
 3 files changed, 26 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
new file mode 100644
index 0000000000..afdc10a3fe
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
@@ -0,0 +1,23 @@
+From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Sat, 4 Nov 2023 12:19:59 -0400
+Subject: [PATCH] prerelease datestamp fixes
+
+Upstream-Status: Backport
+---
+ NEWS | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index c7f31e8b7..f0f9056c4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,4 +1,4 @@
+-* What's new in version 5.0, 2023-11-03
++* What's new in version 5.0, 2023-11-04
+ 
+ - Performance improvements in uprobe registration and module startup.
+ 
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
deleted file mode 100644
index 3dcb369ec3..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Fri, 28 Apr 2023 13:51:27 -0400
-Subject: [PATCH] release date fix
-
-Upstream-Status: Backport
----
- NEWS           | 2 +-
- systemtap.spec | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 695bc990c..46859e304 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,4 +1,4 @@
--* What's new in version 4.9, 2023-04-27
-+* What's new in version 4.9, 2023-04-28
- 
- - ISystemtap: the new interactive systemtap jupyter kernel. This provides
-   a simple GUI for writing/running Systemtap scripts in an easy, incremental
-diff --git a/systemtap.spec b/systemtap.spec
-index 59814f112..fd8023264 100644
---- a/systemtap.spec
-+++ b/systemtap.spec
-@@ -1307,7 +1307,7 @@ exit 0
- 
- # PRERELEASE
- %changelog
--* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
-+* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
- - Upstream release, see wiki page below for detailed notes.
-   https://sourceware.org/systemtap/wiki/SystemTapReleases
- 
--- 
-2.40.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index de3750ff04..bc2a9ff434 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,13 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "418f0a45ca4473491385b5c7eef777607bbdb3b7"
-PV = "4.9"
+SRCREV = "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
+PV = "5.0"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-release-date-fix.patch \
+           file://0001-prerelease-datestamp-fixes.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.31.1


