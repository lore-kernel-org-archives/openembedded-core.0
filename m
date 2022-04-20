Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C924C35294
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.3158.1650419978333112004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BxPMtP05;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419978; x=1681955978;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=s6X1onMP1r92K/eqqluv5EOj48oT+bwPv+Fqa7Egb8E=;
  b=BxPMtP052KTUdMkX07MQ90aUDZzZ2iD8w/4/yjhE66HFMJAiaZrMp52T
   pPjdm7J4e7v/Gd7WR1KEt+JJT3q79hO780ft7+/aJCshM/JVSQiEAc33C
   qqma76h+qZMP44GdEcSxwz2l0EK/TFhOOME3u0fei7vR31GKuLW7H+a1B
   +9r7bNmsQECwF4zesSIhB3uIgHRWM+7np7XoVp9l5Glgd+qzxJsaL7uXy
   EO6uCDW8xmgTjlPo00AWMjk0jKWVR4FJR7VGM9j6c6e5BQ+AoHF5XjUll
   CGnbaaY3RdudI4TPlhRSNXXfw7+6WKIcbH66vdhssPWSi5USfTcjZTtX8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263379401"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="263379401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071556"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:36 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/11] uninative: Upgrade to 3.6 with gcc 12 support
Date: Wed, 20 Apr 2022 09:59:12 +0800
Message-Id: 
 <5f23b1fde0a87896f2097749435abdc7963e24da.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164645

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are reports of issues with the new libstdc++ from gcc 12. This upgrades
to a gcc 12 version of uninative to allow builds on those systems. Gcc 12 isn't
finalised so we may need to add a new version of this if/as appropriate when it
is.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e3da4da7e5da5bb9e1d360e2be2fdd5132e69320)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index bfe05ce1eb..411fe45a24 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.35"
-UNINATIVE_VERSION = "3.5"
+UNINATIVE_VERSION = "3.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6de0771bd21e0fcb5e80388e5b561a8023b24083bcbf46e056a089982aff75d7"
-UNINATIVE_CHECKSUM[i686] ?= "8c8745becbfa1c341bae839c7eab56ddf17ce36c303bcd73d3b2f2f788b631c2"
-UNINATIVE_CHECKSUM[x86_64] ?= "e8047a5748e6f266165da141eb6d08b23674f30e477b0e5505b6403d50fbc4b2"
+UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
+UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
+UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
-- 
2.35.1


