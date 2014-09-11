Return-Path: <soeren.brinkmann@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 341B87108D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 20:34:00 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id c9so21921912qcz.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QRFZ3MNIii+nRw19alL5pK7kBWS7siKSAq00lceq9Pk=;
	b=rtyiVNIuNpLJRcIE6dLwDCsLjFxTNiKCBDi4UV1E6Cg31EzDjImzFZeIL+bFtQTf5i
	WGWL3Pjh+gEiJj7HT4YiF7mpV5I2PuMu2Di798kXObKg0cJ5GFlWdl2d7PoB609nNdjg
	79e9qTsGzrKForVsUUsjdgfvR5kUfaNYmDRW1xjLxMExygoB89/VA+k5h6no1z5bEsSG
	OvMBaHj/dfacGntlaQbSlD8lCHwr1DeAtAMemyJCPUFE8JFrmV/c//PqsPV3WG82Zw7F
	iDhyluDPQkyYBgtCuosDAa1sIKvZar0/JUzSC75ZLXazzBy2xzsLc+4XZh5oD5aP1Bz1
	BoAQ==
X-Received: by 10.224.12.199 with SMTP id y7mr5440513qay.49.1410467641357;
	Thu, 11 Sep 2014 13:34:01 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id b43sm1431195qge.24.2014.09.11.13.34.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Sep 2014 13:34:00 -0700 (PDT)
Sender: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soeren.brinkmann@gmail.com>
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Sep 2014 13:33:56 -0700
Message-Id: <1410467636-17638-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.1.0.1.g27b9230
Subject: [PATCH] base-files: Allow setting hostname through DISTRO_HOSTNAME
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
X-List-Received-Date: Thu, 11 Sep 2014 20:34:01 -0000

Add a distro variable to set the hostname. This allows easily assigning
a hostname in local.conf.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 meta/conf/documentation.conf                      | 1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index dd556857699a..970ce11d96bb 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -139,6 +139,7 @@ DISTRO_EXTRA_RRECOMMENDS[doc] = "Specifies a list of distro-specific packages to
 DISTRO_FEATURES[doc] = "The features enabled for the distribution."
 DISTRO_FEATURES_BACKFILL[doc] = "Features to be added to DISTRO_FEATURES if not also present in DISTRO_FEATURES_BACKFILL_CONSIDERED. This variable is set in the meta/conf/bitbake.conf file and it is not intended to be user-configurable."
 DISTRO_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from DISTRO_FEATURES_BACKFILL that should not be backfilled (i.e. added to DISTRO_FEATURES) during the build."
+DISTRO_HOSTNAME[doc] = "The hostname used in the image."
 DISTRO_NAME[doc] = "The long name of the distribution."
 DISTRO_PN_ALIAS[doc] = "Alias names used for the recipe in various Linux distributions."
 DISTRO_VERSION[doc] = "The version of the distribution."
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 07f5c54c97d8..71405ddc5337 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -60,9 +60,10 @@ conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/default"
 
 #
-# set standard hostname, might be a candidate for a DISTRO variable? :M:
+# set standard hostname
 #
-hostname = "openembedded"
+DISTRO_HOSTNAME ?= "openembedded"
+hostname = "${DISTRO_HOSTNAME}"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
-- 
2.1.0.1.g27b9230


