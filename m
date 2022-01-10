Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D641FC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:32 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZLENliox;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787772; x=1673323772;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlAvkESZZKuc7LiLc00wt1HJyM1MsUZuMDKOmjzc6Uo=;
  b=ZLENlioxrje1c96pHttYS00/sTj0YdYKeF7fuFaju7S3P7ppsMtpGzpr
   6vLURXj/00Vg5/MkdmF2bEoI54BWhAPwbBSXbX9yb10/lqFkikOSgFLpz
   3bByqiqJDlkfU4aJ0QVBJ77OtdvUHww+8i4RucWTDKDS9iRpAzhAu/Wn9
   UWWf5TmxfQTT5eOYK8XxL5GmhT9R15c/zAEn9bQ6Un8zXyp++GFRiALXN
   QFsb56AH6EwJQkSwELR46Tg+F2YipLp3pd4JRaydPex5SRp8jdrKWtwlY
   eLAgQg7kFhaveHtUJsi7AkibBoNlT9iYOBecRLtNIT0YgZKyOAJZC+fIM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347376"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347376"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402239"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/10] webkitgtk: Add reproducibility fix
Date: Mon, 10 Jan 2022 12:09:11 +0800
Message-Id: 
 <3a5aa369b69cdad10682fae05aa0555d9eb8b228.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160328

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When the date rolled from one year to another this highlighted a reproducibility
issue. This could be better fixed by using SOURCE_DATE_EPOCH from the environment
but I'm not sure how you do that in ruby. Help from someone with that knowledge
to submit that upstream very welcome.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d561c98f4d2e68d595aae4b03df1420cb01c3f7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../webkit/webkitgtk/reproducibility.patch    | 22 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.32.3.bb  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
new file mode 100644
index 0000000000..e866a1a193
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -0,0 +1,22 @@
+Injection a year based on the current date isn't reproducible. Hack this
+to a specific year for now for reproducibilty and to avoid autobuilder failures.
+
+The correct fix would be to use SOURCE_DATE_EPOCH from the environment and
+then this could be submitted upstream, sadly my ruby isn't up to that.
+
+Upstream-Status: Pending [could be reworked]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+===================================================================
+--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+@@ -25,7 +25,7 @@ require 'date'
+ require 'digest'
+ 
+ $LICENSE = <<-EOF
+-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
++Copyright (C) 2021 Apple Inc. All rights reserved.
+ 
+ Redistribution and use in source and binary forms, with or without
+ modification, are permitted provided that the following conditions
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
index 1f3f7a9c00..bab1c17902 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-MiniBrowser-Fix-reproduciblity.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI[sha256sum] = "c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc"
-- 
2.33.1


