Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03BAC83F24
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:51:55 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.35389.1752324706031578795
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=i70FMr6O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025071212514158378a8ea203284f16-t_cvi5@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025071212514158378a8ea203284f16
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:51:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JWaO0NqYwzUTNwJZbZe7sLe1ifVPQHLUh6ccKmwZp4E=;
 b=i70FMr6O9FWaXLwBxYwN9MhGpTJSjSt3VEJCk78YBWhpgEhBrMoaawVt517Sbi0Prx4Sw0
 OUcfydzaNl4eHuQ890H4MgPQ6gb5twN+aam3nNQpQGuOrSThTSYtp3zrG+zscYmJTCskDklK
 g0y5JLgA4HwnLjfMibUQWYMk2DzDhpQ9ufLmxl3/xmISc9e4dQiqgFsdwHVhPOMV+rH/w2QY
 ZCbniRsQcrulmoPQFOdL05VvCzgMpxJ8ZqqEnScSJGfC3JY5fFtrguQpE4gncBHaXq2Nnjzg
 3jzsT1n2uy/M9xplypPgWzuteBorx3JzAPYun1omqNa4gF6zElR6JGvA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][walnascar][PATCH 1/2] spdlog: patch CVE-2025-6140
Date: Sat, 12 Jul 2025 14:50:53 +0200
Message-Id: <20250712125054.3281625-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220176

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2] as listed in [3].

[1] https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094
[2] https://github.com/gabime/spdlog/issues/3360
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-6140

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../spdlog/spdlog/CVE-2025-6140.patch         | 46 +++++++++++++++++++
 .../recipes-support/spdlog/spdlog_1.15.0.bb   |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch

diff --git a/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch b/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
new file mode 100644
index 0000000000..af135adee2
--- /dev/null
+++ b/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
@@ -0,0 +1,46 @@
+From 10320184df1eb4638e253a34b1eb44ce78954094 Mon Sep 17 00:00:00 2001
+From: Gabi Melman <gmelman1@gmail.com>
+Date: Mon, 17 Mar 2025 15:46:31 +0200
+Subject: [PATCH] Fixed issue #3360 (#3361)
+
+CVE: CVE-2025-6140
+Upstream-Status: Backport [https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/spdlog/pattern_formatter-inl.h | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/include/spdlog/pattern_formatter-inl.h b/include/spdlog/pattern_formatter-inl.h
+index b53d8051..fd408ed5 100644
+--- a/include/spdlog/pattern_formatter-inl.h
++++ b/include/spdlog/pattern_formatter-inl.h
+@@ -70,6 +70,9 @@ public:
+             pad_it(remaining_pad_);
+         } else if (padinfo_.truncate_) {
+             long new_size = static_cast<long>(dest_.size()) + remaining_pad_;
++            if (new_size < 0) {
++                new_size = 0;
++            }
+             dest_.resize(static_cast<size_t>(new_size));
+         }
+     }
+@@ -264,7 +267,7 @@ public:
+         : flag_formatter(padinfo) {}
+ 
+     void format(const details::log_msg &, const std::tm &tm_time, memory_buf_t &dest) override {
+-        const size_t field_size = 10;
++        const size_t field_size = 8;
+         ScopedPadder p(field_size, padinfo_, dest);
+ 
+         fmt_helper::pad2(tm_time.tm_mon + 1, dest);
+@@ -926,9 +929,8 @@ private:
+     memory_buf_t cached_datetime_;
+ 
+ #ifndef SPDLOG_NO_TLS
+-    mdc_formatter<null_scoped_padder> mdc_formatter_{padding_info{}};
++    mdc_formatter<null_scoped_padder> mdc_formatter_{padding_info {}};
+ #endif
+-
+ };
+ 
+ }  // namespace details
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
index 963de54f73..dbe0e4c2aa 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
 PV .= "+git"
 SRCREV = "96a8f6250cbf4e8c76387c614f666710a2fa9bad"
-SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
+SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x \
+    file://CVE-2025-6140.patch \
+"
 
 DEPENDS += "fmt"
 

