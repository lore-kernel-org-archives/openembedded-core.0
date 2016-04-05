Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EFAE37712D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 21:26:02 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id u206so20637294wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 14:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9XfXrtnIuMVic+FZnArWV9nOX2SUNA3gSkYFZu9MfIQ=;
	b=YXWKwFUPC9fIsAxpcVZ7/6mmyzLoumnAuoWUG54QKVkO6TAk04FuJASAVu2cUzWI9a
	hySBMfnqZnUov5IroUaMWcodjBq1NZDP4qPRma66UrFxLclwr5hYnalPDRiNQSyPjq1a
	c3usBaW1gHRXKmHETTfFmyI8ERsyRpl+DhWjsDXuZJoCWQFEge9bGn6m21Qu3bWu0tFB
	nIrUvVLjBo9eYu2o0M7gebxgXN6P5/0lpaBEvCCgAWc4XY+C2rJbv3huZta0cVhXhAwk
	wFlAjnpTOrrKK4OHD+GaxuePmPsiU/zf6LsOVQoSPe3jEBP7hUHAQ3FGy3HurlM4rc5e
	Cdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9XfXrtnIuMVic+FZnArWV9nOX2SUNA3gSkYFZu9MfIQ=;
	b=jleC7uVmsvcgDpmMV6/ciPOIcoL6jQOEzWDtWYxF9NB3LuzBJ0r+fNafBExzQ8/+l/
	HEgOV4ayMh81VnPeipWCaMgQ8e1cEaN0VP584iPbpgXbNYa4X+YHtXmeHohEv4VO8Ty9
	MiwliyQGAeGfB+lR5ChyMCn9BMQmh+QWjcijdPDkHdOncU9Su4Ila/SFrEjni4SoI55/
	iSmagL4qG0yhX83VpS6XEVwxtbCcq8ajt8htvbygVBw1TCyhYrIgHMbocno09ks0pfE5
	HPniXkZrCjH1VyWNKpRItvUgaTe+YQRbDwYUCsl5rDkHhbAPeRqSmw2yJwm9k0jgNPYW
	P6Gg==
X-Gm-Message-State: AD7BkJJKy+YTd2hq5g3vd/Cpqog9lqDdPCXZo3FLNbcna5zJS+vcjGrxYs8zlFT3dYVaadrp
X-Received: by 10.28.24.80 with SMTP id 77mr20012927wmy.16.1459891562996;
	Tue, 05 Apr 2016 14:26:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q139sm240726wmd.2.2016.04.05.14.26.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Apr 2016 14:26:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 22:26:00 +0100
Message-Id: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] bzip2: set correct soname
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
X-List-Received-Date: Tue, 05 Apr 2016 21:26:04 -0000

The correct name for the bzip2 shared library is libbz2.so.1.0.6, not
libbz2.so.0.0.0.  Pass -version-info to libtool to correct this.

Also fix the configure.ac so that is doesn't mention libXrender and has the
right version.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am  | 1 +
 meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
index 1d163b6..05d389f 100644
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
@@ -1,5 +1,6 @@
 
 lib_LTLIBRARIES = libbz2.la
+libbz2_la_LDFLAGS = -version-info 1:6:0
 
 libbz2_la_SOURCES = blocksort.c  \
                     huffman.c    \
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac b/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
index 47ee576..e2bf1bf 100644
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
@@ -1,12 +1,9 @@
 AC_PREREQ([2.57])
 
-AC_INIT(bzip2, 2.0.5, , libXrender)
+AC_INIT(bzip2, 1.0.6)
 AM_INIT_AUTOMAKE(foreign)
 AM_MAINTAINER_MODE
 
-#AM_CONFIG_HEADER(config.h)
-
-# Check for progs
 AC_PROG_CC
 AC_PROG_LIBTOOL
 
-- 
2.7.0


