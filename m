Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E57FB6A963
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:28:03 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id m6so3140901wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 01:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=nxEKamruklp06cNjzzVnenITJA+rAVPvyTUjhdHRZok=;
	b=B+khC1eYqnVRrADV4+Om09YdxT9QyTCO9QcOYGFSSDNGr3ae9DPsFdYzGkJhkrrHhG
	wVLCOjPrJ1U2uu+yIMqiIyVJBxUFW3Lr5rP0oPxpHVHqpIDdfmpqT+uSsab+wmYxUqxh
	pi7Jpj//lIH+x7pAFdR2CGmy4CYoMyCNRv/sPTtIa6OZgGuYRzUTcBoFAO5nxj9UnIf9
	wLsMTbU43CQpgKo+NavFKT9c0XvdqPTD20g1LqeyDEtbWPDQTEZSaF95lb9sKOcfSi1D
	XATNYaugIt8RRQ7xNhPLOavpwVPejrjXciMrpaTNkbifkD4uOrlF8EWWc43UWohxZ0O6
	qvuQ==
X-Received: by 10.180.198.80 with SMTP id ja16mr6980540wic.53.1371544084680;
	Tue, 18 Jun 2013 01:28:04 -0700 (PDT)
Received: from flashheart.burtonini.com (92.40.253.155.threembb.co.uk.
	[92.40.253.155])
	by mx.google.com with ESMTPSA id f8sm484256wiv.0.2013.06.18.01.28.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 01:28:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2013 09:27:52 +0100
Message-Id: <1371544072-32169-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371544072-32169-1-git-send-email-ross.burton@intel.com>
References: <1371544072-32169-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQluztk7JZG1tcqrzWNIlHL3XRt+t8JAQPYtP/YQMsBnSNy9CHr+PRj5vmJ73Q8MyINGfYoQ
Subject: [PATCH 2/2] sato-screenshot: bump SRCREV for linkage fixes
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
X-List-Received-Date: Tue, 18 Jun 2013 08:28:04 -0000

Newer toolchains are stricter with linking.  Patches have been merged upstream
so bump the SRCREV to use them.

fix_ldadd_order was also merged upstream, so delete it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../sato-screenshot/files/fix_ldadd_order.patch         |   15 ---------------
 .../recipes-sato/sato-screenshot/sato-screenshot_git.bb |    5 ++---
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch

diff --git a/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch b/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
deleted file mode 100644
index 7d9689e..0000000
--- a/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix the ordering of LDADD options to fix a compilation failure.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Upstream-Status: Inappropriate [configuration] 
-
-diff -urN screenshot.orig//Makefile.am screenshot/Makefile.am
---- screenshot.orig//Makefile.am	2010-06-29 11:55:00.000000000 -0700
-+++ screenshot/Makefile.am	2011-03-01 11:09:01.215813968 -0800
-@@ -23,4 +23,4 @@
- # A standalone tool for running from a terminal and scripts
- bin_PROGRAMS = screenshot
- screenshot_SOURCES = main.c
--screenshot_LDADD = $(GTK_LIBS) libshot.la
-+screenshot_LDADD = libshot.la $(GTK_LIBS)
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index ff92142..3bad853 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
 
 DEPENDS = "matchbox-panel-2"
-SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
+SRCREV = "3a9688e8a01b63a78f402b4e7c0b8b005fcdfa29"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git \
-           file://fix_ldadd_order.patch"
+SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10.4


