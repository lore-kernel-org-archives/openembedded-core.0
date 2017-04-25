Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 97601779CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 16:08:12 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id z52so70231229wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gVogh77M2c5k0HSkEAQRLwbl3E1aK1Jb2UQOuvxNijQ=;
	b=itUMKd272Rijb1o+1bL20pkp3hGyp/TIybHkrJiGmIP9MCxYSUlzkriUERCoulKqr0
	Wzd4IAjcO8ATRuAgvl6eEIjOQtoXyopCmsrb2rIKxxzF7eOZYNPLzdtvogm8vlilBOqt
	Iw3lcG9yOssOjgPkZ/kW4F1N0EnVAW415yvTKTyVGszJTUZo3DphKADs4AVNFvbOJ2kd
	DtvcE3qWXh5gt45j/4tuL7EvGswIJjzt59pgj82xbRAOFsENtkhUoAkUpTIBjJRt5Kjo
	QMEAwk7jrDEKUbXrKtmP4v/yhUmjT0dhln6FPEs4+y2rCgiRLboYT1Nm8zrMR3wauuyY
	vqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gVogh77M2c5k0HSkEAQRLwbl3E1aK1Jb2UQOuvxNijQ=;
	b=nfmVEjnYH4YCJ9Kjh4JypV3kR7gXN7a23nvxXx624oHAsH1qc5eyGH0OQLDFHYrsoV
	llMWAB9/VqLvo0SzxFnGynEKUlNFiHlX3+aS6M1YeKFX77VPV5gibMWMZmw/419BgzQR
	PDAvNX8d7bzQk2VNw0ErpyPFMvPfTjWP5WG6zqXq9C6TX06C4NxAg0CDYht8e/cDFks/
	uySQm03sYPvI66oiIfQ/RBkLJMeN4pKfGVwsJexHara+xqtRHn+aT+uedGrhn9d/N6+y
	EWZqxKjr6lL+nPILx7K0NIDujOtDqyqAtETbJWnipvSJg6SOvCo2tXuahDcjT62hDCZO
	RP5A==
X-Gm-Message-State: AN3rC/5vXfL/20KvpyLGrnDlOvTxJdZtZA0Uhm8khxub2Ml74jRlthl4
	+9b8HSPpL9SanAyTwkg=
X-Received: by 10.223.135.84 with SMTP id 20mr9658681wrz.199.1493136493160;
	Tue, 25 Apr 2017 09:08:13 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	s82sm4562898wmb.33.2017.04.25.09.08.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 09:08:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 17:08:10 +0100
Message-Id: <1493136490-30705-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] libcap: clean up gperf enabling logic
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
X-List-Received-Date: Tue, 25 Apr 2017 16:08:12 -0000

There's no need to sed the Makefile (especially the wrong Makefile) when there's
a variable we can pass.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 0587e77..5c2765f 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -22,9 +22,6 @@ do_configure() {
 	# on what should be replaced with ?=
 	sed -e 's,:=,?=,g' -i Make.Rules
 	sed -e 's,^BUILD_CFLAGS ?= $(.*CFLAGS),BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
-
-	# disable gperf detection
-	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
@@ -37,6 +34,7 @@ EXTRA_OEMAKE = " \
   lib=${@os.path.basename('${libdir}')} \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
+  BUILD_GPERF=yes \
 "
 
 EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
-- 
2.8.1


