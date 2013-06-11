Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 05CBD6A998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 17:03:26 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so5981142wes.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 10:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=IJ8bq0FxPJH/rINr4NVAUBvj2YuINAsQV4otJPWHo3I=;
	b=mWt92f3+VErICvqmorjmieNoj/XAOI8Zbha/WK2hDFpK3w96bESfAuDTFZzk1sJhLs
	fsRpjSXScAMz/xHe11iW1uY3CbFjOEJuYj1mT8O6U0pH+bNN5wmEA0XmL2ZMPDBQpPN8
	sTNz8ALP8QuOGTJECI9TkLwcROIR7EAIluRyQD5FDxgPF5+M8erK0xbyCLaBtgnKdiNX
	8ZvrLSGbdLCgGR3uk7wJsTwhBtl0C0AHdCDOwODsi5Q/58at1SaBQ1NlpeJoGH3R6v92
	1QOJ7uXfCEZpnPa0DUhS76KYx2os26ZghZiqBW5rvl1mqPwxw53ElcpNEGMRX2INhLwh
	PwOQ==
X-Received: by 10.180.105.74 with SMTP id gk10mr2016141wib.3.1370970207162;
	Tue, 11 Jun 2013 10:03:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fo10sm1528376wib.8.2013.06.11.10.03.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 10:03:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 18:00:03 +0100
Message-Id: <1370970003-28809-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmitc6fSXgAp2fz2QJafHFsBnAx9X6kff3SJin3MWxPjK/BT4JfYTpvAHjYoY3R5SCsU8QQ
Subject: [PATCH] systemd: don't install quotaon.service twice
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
X-List-Received-Date: Tue, 11 Jun 2013 17:03:28 -0000

If the same file is installed twice there's a race which can lead to "make
install" failing.  Remove the redundant installation of quotaon.service to
eliminate the race.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/install-quotaon-once.patch     |   32 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_204.bb           |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/install-quotaon-once.patch

diff --git a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
new file mode 100644
index 0000000..10280da
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=65659)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 44b7c4dc877984b5ea3f2c9fa09a93ee16dbe3b2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 11 Jun 2013 17:16:37 +0100
+Subject: [PATCH] build-sys: don't install quotaon.service twice
+
+quotaon.service is already installed through dist_systemunit_DATA, so it doesn't
+need to be added to nodist_systemunit_DATA.  Installing the same file twice
+results in a race condition where the install process can fail.
+---
+ Makefile.am |    3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 28ae7ed..197119e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3229,9 +3229,6 @@ endif
+ EXTRA_DIST += \
+ 	units/systemd-quotacheck.service.in
+ 
+-nodist_systemunit_DATA += \
+-	units/quotaon.service
+-
+ # ------------------------------------------------------------------------------
+ if ENABLE_RANDOMSEED
+ rootlibexec_PROGRAMS += \
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
index 5a63c7c..b8b1290 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://modprobe.rules \
            ${UCLIBCPATCHES} \
            file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
+           file://install-quotaon-once.patch \
            file://00-create-volatile.conf \
            file://init \
           "
-- 
1.7.10.4


