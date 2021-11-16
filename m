Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4D2C433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:29 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.383.1637080346426941201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319941128"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="319941128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956802"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/17] uninative: Add version to uninative tarball
 name
Date: Wed, 17 Nov 2021 00:31:56 +0800
Message-Id: 
 <aca617aada3a06a6b460bf477541639f44681b32.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158358

From: Richard Purdie <richard.purdie@linuxfoundation.org>

uninative works via hashes and doesn't need the version in the tarball name but
it does make things easier to inspect in DL_DIR. There were reasons such as
ease of publication of the build tarballs but we can handle those differently
now and the signature issues from the early code aren't an issue now. From 3.4
onwards we can use a version'd name.

[YOCTO #12970]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dadba70d6a24d8ebb5576598efffa973151c7218)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/uninative.bbclass               | 2 +-
 meta/conf/distro/include/yocto-uninative.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 3c7ccd66f4..4412d7c567 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc-${UNINATIVE_VERSION}.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3165fc93b8..6833072cd3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,8 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.34"
+UNINATIVE_VERSION = "3.4"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.4/"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
 UNINATIVE_CHECKSUM[aarch64] ?= "3013cdda8f0dc6639ce1c80f33eabce66f06b890bd5b58739a6d7a92a0bb7100"
 UNINATIVE_CHECKSUM[i686] ?= "abed500de584aad63ec237546db20cdd0c69d8870a6f8e94ac31721ace64b376"
 UNINATIVE_CHECKSUM[x86_64] ?= "126f4f7f6f21084ee140dac3eb4c536b963837826b7c38599db0b512c3377ba2"
-- 
2.33.1


