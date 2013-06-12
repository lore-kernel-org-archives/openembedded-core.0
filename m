Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D78846A613
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:32:37 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k13so6777760wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=qbzKJPFn664pI/OYZ5lu9HlpA2bo/3iVBLWgEGvafl0=;
	b=dDmEtL1ZCvenTmIdviIS1yjwSGGTWweP/XJKISVdbNPdIOlNBEDoUmAdjQzUgvA33s
	pqhL/wv8fYeT94x9rVL/QfeRIBVaKer0byAL1atdS+Xv9hYBH9I0O1QhtorX68rEKVux
	a5Da0CXjEPKNVNylI4UUw/GRjGRhkX+NzkE3aMUyjo7fhFyV80DI76DmCEyGFmlrNUEC
	HbX4loVKZ3tl4e0tgU05a2hCjR028+S2TEcfohutc5fv2E+CBkqE4GctyrOK1qA9cwKp
	RfftVoK8H1N4keaZE2mKeQwcaNjPR2DihE0ZbPPKFmoNIwuOpCrSrpwYP8NLGEvOU9SK
	eESQ==
X-Received: by 10.180.86.38 with SMTP id m6mr3814462wiz.25.1371029557890;
	Wed, 12 Jun 2013 02:32:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id h8sm23312279wiz.9.2013.06.12.02.32.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 02:32:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 10:29:13 +0100
Message-Id: <1371029353-31833-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmpfZvOWwpW7eKDdYXp/vQKEN+ZLSMVH8W/ATyleJJmN+fcwXoaa5D193FkKxIpwR7IeION
Subject: [PATCH] systemd: update install-quotaon-once.patch
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
X-List-Received-Date: Wed, 12 Jun 2013 09:32:38 -0000

This patch has been merged upstream now, so refresh the patch with a backport
(the patch was changed before being merged).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/install-quotaon-once.patch     |   32 +++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
index 10280da..098a5f8 100644
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
+index 28ae7ed..3219762 100644
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
+@@ -389,7 +389,6 @@ dist_systemunit_DATA = \
+ 	units/sound.target \
+ 	units/bluetooth.target \
+ 	units/smartcard.target \
+-	units/quotaon.service \
+ 	units/systemd-ask-password-wall.path \
+ 	units/systemd-ask-password-console.path \
+ 	units/systemd-udevd-control.socket \
 -- 
 1.7.10.4
 
-- 
1.7.10.4


