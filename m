Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 276896A49F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 11:27:10 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u53so385217wes.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 04:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=EkH5/JoBK9Ddu0kqnPcP1Pl6OKfhfts1Kg2H/+USEu4=;
	b=dcddWS3ZpYloQ0QfYo4OojuWXyYAob0MVZpm7leDr+8q+9kwF2VlD5vgAnNJiUxeug
	5UXEMTAF0OL0ROHzWb4k8AEA2xrcUHtJ2HGSwZdEvgUr54CEBRGxQR4TXa1w4RmNSyaI
	b5bY9qmjLjzZP+ylab7yaQm4t7e4qnOB+q8cEzYYpUPSiTcDlCqVWdm+qdvvoFkxSNGs
	uRVrV1PNmrKjJEZ+Mql0+wS/lzd5onaiuZKfSNUcUapUrrEqayXI/tAkc0HV5BgW3zi/
	o9VtIlog1xXSqKAZYWtpqHVHBs3Flv3crtb50wt5hTScDKcxFwMFYKwtt8bx8Owh1M+w
	I4xQ==
X-Received: by 10.194.157.99 with SMTP id wl3mr1129485wjb.76.1371209230165;
	Fri, 14 Jun 2013 04:27:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fs8sm2538281wib.0.2013.06.14.04.27.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 04:27:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2013 12:23:46 +0100
Message-Id: <1371209026-21167-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnPOtO8BJgXYefJeRfhGdjO4ThlM42rKm7ooi5uiM9nd6i6rw33sWqIZqOWu9aj9UJUv2t6
Subject: [PATCH][V2] systemd: update install-quotaon-once.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jun 2013 11:27:10 -0000

This patch has been merged upstream now, so refresh the patch with a backport
(the patch was changed before being merged).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/install-quotaon-once.patch     |   32 +++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
index 10280da..6b7cf2f 100644
--- a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
+++ b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
@@ -1,7 +1,7 @@
-Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=65659)
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-From 44b7c4dc877984b5ea3f2c9fa09a93ee16dbe3b2 Mon Sep 17 00:00:00 2001
+From 622004565eca385c685086cd478aa79afe73b785 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 11 Jun 2013 17:16:37 +0100
 Subject: [PATCH] build-sys: don't install quotaon.service twice
@@ -9,24 +9,26 @@ Subject: [PATCH] build-sys: don't install quotaon.service twice
 quotaon.service is already installed through dist_systemunit_DATA, so it doesn't
 need to be added to nodist_systemunit_DATA.  Installing the same file twice
 results in a race condition where the install process can fail.
+
+https://bugs.freedesktop.org/show_bug.cgi?id=65659
+
+[zj: actually remove quotaon.service from the other list.]
 ---
- Makefile.am |    3 ---
- 1 file changed, 3 deletions(-)
+ Makefile.am |    1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 28ae7ed..197119e 100644
+index 3a196a6..d444eac 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3229,9 +3229,6 @@ endif
- EXTRA_DIST += \
- 	units/systemd-quotacheck.service.in
- 
--nodist_systemunit_DATA += \
--	units/quotaon.service
--
- # ------------------------------------------------------------------------------
- if ENABLE_RANDOMSEED
- rootlibexec_PROGRAMS += \
+@@ -401,7 +401,6 @@ dist_systemunit_DATA = \
+ 	units/bluetooth.target \
+ 	units/smartcard.target \
+ 	units/systemd-tmpfiles-clean.timer \
+-	units/quotaon.service \
+ 	units/systemd-ask-password-wall.path \
+ 	units/systemd-ask-password-console.path \
+ 	units/systemd-udevd-control.socket \
 -- 
 1.7.10.4
 
-- 
1.7.10.4


