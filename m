Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FE3C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:54:45 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.35427.1752324879655699572
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lW9LPY0W;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250712125437cf74704cd6b059e947-le4nux@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250712125437cf74704cd6b059e947
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:54:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bj7I6hahBzMBv5fS3IunnOHLRtFzxRAG9OYviap19sI=;
 b=lW9LPY0W4kDtusSc+U80vMGp/CJl6YlsZdlgT6LDHCu+4o20+qDu6hAtIchjX+2lYZyXGi
 YkTfT+5TAjdeMUkQNvj/GNZGHyHYV9YXbHOuArpW65pCE8SFAaUjNONN1NVpDKgoD9w/nfqb
 5zLlzWxBK0xlHj0q8QwqL3W7tU1MzG26pMpIsnyUSNzIIDS6GegXXzI7NYwZsrO5qdqoXJf1
 DIKtTZsA5UgEs8Y6MjYkvj/GFS6s92o7aRM+hnBUUEg1bvoMP6CBgx1fhX0fdqe57q28+6j8
 mSqR3IVqBpYxz9n9MF6sZbvJx1a0DwZwLs4CEzOeEaY7uGoWFaFbQGxQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] minifi-cpp: patch spdlog CVE-2025-6140
Date: Sat, 12 Jul 2025 14:53:44 +0200
Message-Id: <20250712125344.3281963-2-peter.marko@siemens.com>
In-Reply-To: <20250712125344.3281963-1-peter.marko@siemens.com>
References: <20250712125344.3281963-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 12:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220182

From: Peter Marko <peter.marko@siemens.com>

Same patch as in spdlog recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../minifi-cpp/files/CVE-2025-6140.patch      | 35 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.15.0.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch b/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
new file mode 100644
index 0000000000..3707d9e9c4
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
@@ -0,0 +1,35 @@
+From 10320184df1eb4638e253a34b1eb44ce78954094 Mon Sep 17 00:00:00 2001
+From: Gabi Melman <gmelman1@gmail.com>
+Date: Mon, 17 Mar 2025 15:46:31 +0200
+Subject: [PATCH] Fixed issue #3360 (#3361)
+
+CVE: CVE-2025-6140
+Upstream-Status: Backport [https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/spdlog/pattern_formatter-inl.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/spdlog/pattern_formatter-inl.h b/include/spdlog/pattern_formatter-inl.h
+index b53d8051..fd408ed5 100644
+--- a/include/spdlog/pattern_formatter-inl.h
++++ b/include/spdlog/pattern_formatter-inl.h
+@@ -65,6 +65,9 @@ public:
+             pad_it(remaining_pad_);
+         } else if (padinfo_.truncate_) {
+             long new_size = static_cast<long>(dest_.size()) + remaining_pad_;
++            if (new_size < 0) {
++                new_size = 0;
++            }
+             dest_.resize(static_cast<size_t>(new_size));
+         }
+     }
+@@ -259,7 +262,7 @@ public:
+         : flag_formatter(padinfo) {}
+ 
+     void format(const details::log_msg &, const std::tm &tm_time, memory_buf_t &dest) override {
+-        const size_t field_size = 10;
++        const size_t field_size = 8;
+         ScopedPadder p(field_size, padinfo_, dest);
+ 
+         fmt_helper::pad2(tm_time.tm_mon + 1, dest);
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
index beb247c254..f84f018ea9 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0008-libsodium-aarch64_crypto.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
+           file://CVE-2025-6140.patch;patchdir=${S}/thirdparty/spdlog-src \
           "
 
 SRCREV = "9b55dc0c0f17a190f3e9ade87070a28faf542c25"

