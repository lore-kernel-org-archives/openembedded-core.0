Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF37DC433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.1687.1641395981015725535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JZfgglnh;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395984; x=1672931984;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3MCTX6gFy/3LMFyFJ35mVtTAE40+Fs0Xb0e6pS7gtcY=;
  b=JZfgglnhKORnigD6KvOzS6WTDIspNitniaEBNCiiUIxyiToDcfntz8I0
   8N2f1IH5wrczX+T5CPIYkj5M8oZZGr/iof79bxDU0s1/pOVBS7HJY/Xv9
   f452UN3/3YazNTARP2maSEkmlsqeJjInn7kXN6ZU39UDrwMOji5l96uI3
   nKKdKyfyPvhsXD0pZpeMqpzES/rCqMp76Zk/6i3KA8QlkdmBYsTJEQ0X6
   Zzps7Jztwqqi/PWxhhaAWtQZPddRvecwjPvkdTuO3iKKJJCz/HM62xK/R
   zKt5XXC04i3K25zBoVTFES6VLPTQxNv+zKK5UqiMLg1bC3PQEKcQ47tvW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223147038"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="223147038"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128716"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/24] webkitgtk: Add reproducibility fix
Date: Wed,  5 Jan 2022 23:18:43 +0800
Message-Id: 
 <922db800adf7b616592b48e5e7bd295efeb2e206.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160208

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
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
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
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index 1fefc75c49..88b5056165 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-MiniBrowser-Fix-reproduciblity.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
-- 
2.33.1


