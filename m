Return-Path: <jebr@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92240C4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 21:47:47 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web11.192416.1672264060537513598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 13:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=Lh1FXcSd;
 spf=pass (domain: flex--jebr.bounces.google.com, ip: 209.85.219.201, mailfrom: 3e7msywqkamqtol1qyyqvo.myw@flex--jebr.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id 195-20020a2505cc000000b0071163981d18so18144416ybf.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 13:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QEy0E0/Q7fbj1Ykh1AiTgn+MGH88tKiYqTg5FYoZVNs=;
        b=Lh1FXcSdQ4CLbXpEo1iRhhtGkImUnbv8Pm4Ve0QcarIsIMbqYmyCGL5N3mHkfr3FKg
         ZjA5B1kH65ZJ3/8jO1vXm/GdZDLURufYLwxEgqST7RF9uTY6grmz/ztX5jb7OdTqLwp5
         uGFq+00jot/6CVdqTziiXFnqdxLzrx1/wGBfb2nTjB6ohKg4HnqJMCGkTmzjc9Wdq1cx
         fN0NnCVqV7wC0Na0fSPDpwmTlxy9Paat3QhP5jYd5AgN7lgcTlhSskUw0z1w2HnjHycH
         P++ghQ+ZHRxyRufHibClh9oNX2TFwiMMYX1Bigs4tdD7iCzgphod9NjBA37oTseZtCsd
         C+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEy0E0/Q7fbj1Ykh1AiTgn+MGH88tKiYqTg5FYoZVNs=;
        b=W9y60YKn8iByJfumpXKTEEQqpvlazV+EuEismnq6CC/p5MW69f1DO2ElwZY2B/fgXe
         1rKqF9LLCxJbKVbGzWM+evincC4laQZ/VzWTLoGOHqcrl1UyRnuozpQheAENpUqw20o8
         25d2E1LNUkJtF7KNjnI1QGJj8qE9afNf7U7Pt6Fjd2KR7EWGrrhuI7bXt3ygqkD6kad4
         l7xtVZEjWXJUeGXsGXX4eD1TnNFR6hwLbPKbtA2nCA5YYRBjBieZhTEszRANyDsQCaPr
         gqGMYFuqCeLhmUtLgwRL1NKONAJVZZB1Qjo88A2HEaxrNfKf/oY0WJLPAG7zg0aTR5O1
         6PXg==
X-Gm-Message-State: AFqh2ko3dM623XBOUgRmTYkYKNlRanoYmwDwnF6BjnQ8/n5ArEQw4E0x
	43clnS+Ro/VOncBRk0P52M3g7oMN25JABZOx9UVUoaipHU5FNFI50x+VWSic3NUXM/HYFghuvIr
	b/5hHoQnb0H1r0x6qz/voM34ZALzIgf4f+gwAeXob1ZTzE8vdYvmTU/Vtw52WiomTwRRvg9p5/l
	FEwcdh
X-Google-Smtp-Source: AMrXdXvVMfXXan60u1aT253n9a5uxKcQN8WkeoCh8Tvz90mILGVLqsbzI7WTBJmNaCR5RP6+calPNwYs
X-Received: from jebr.svl.corp.google.com ([2620:15c:2c5:13:7bdf:6551:15bf:3fe3])
 (user=jebr job=sendgmr) by 2002:a25:4a05:0:b0:752:91e5:cf41 with SMTP id
 x5-20020a254a05000000b0075291e5cf41mr3085324yba.355.1672264059573; Wed, 28
 Dec 2022 13:47:39 -0800 (PST)
Date: Wed, 28 Dec 2022 13:47:32 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221228214732.758882-1-jebr@google.com>
Subject: [PATCH][V2] kernel_dep_check.bbclass: help track kernel depend
From: jebr@google.com
To: openembedded-core@lists.openembedded.org
Cc: brandonkim@google.com, edtanous@google.com, 
	John Edward Broadbent <jebr@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 21:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175088

From: John Edward Broadbent <jebr@google.com>

This recipe can be used to identify kernel dependencies, and
immediately throw build errors if those dependencies are not met.

Signed-off-by: John Edward Broadbent <jebr@google.com>
---
 meta/classes-recipe/kernel_dep_check.bbclass | 81 ++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta/classes-recipe/kernel_dep_check.bbclass

diff --git a/meta/classes-recipe/kernel_dep_check.bbclass b/meta/classes-recipe/kernel_dep_check.bbclass
new file mode 100644
index 0000000000..25bef1533c
--- /dev/null
+++ b/meta/classes-recipe/kernel_dep_check.bbclass
@@ -0,0 +1,81 @@
+# This class is meant to help in tracking recipe's dependencies
+# on certain Linux Kernel's compile time options, by making them
+# explicit.
+#
+# Usage.
+# 1. Inherit this class.
+# 2. If the Linux Kernel MUST have certain compile time options
+#       enabled, add them to KERNEL_OPTIONS_REQUIRED variable.
+#       Multiple options can be added, separated by whitespace.
+#       If the kernel built with the image does not have these
+#       options enabled, the build will fail.
+# 3. If some options are simply recommended, but not mandatory,
+#       they can be added to KERNEL_OPTIONS_RECOMMENDED variable.
+#       If the kernel built with the image does not have these
+#       options enabled, warning will be produced, but the build
+#       will succeed.
+# 4. If some options has alternatives, i.e. if only one of the
+#       options has to be enabled to pass the check, separate
+#       the alternatives with '|' with no spaces, like so:
+#           DECOMPRESS_GZIP|DECOMPRESS_BZIP2
+
+
+KERNEL_OPTIONS_REQUIRED ??= ""
+KERNEL_OPTIONS_RECOMMENDED ??= ""
+
+def report_opt_warn(pn, opt):
+    if len(opt_alt_list) > 1:
+        bb.warn("%s recommends one of the following Linux Kernel"
+                " options to be enabled: %s"
+                % (pn, ",".join(opt_alt_list)))
+    else:
+        bb.warn("%s recommends Linux Kernel option %s to be enabled"
+                % (pn, opt_alt_list[0]))
+
+
+def report_opt_fatal(pn, opt_alt_list):
+    if len(opt_alt_list) > 1:
+        bb.fatal("%s requires one of the following Linux Kernel"
+                " options to be enabled: %s"
+                % (pn, ",".join(opt_alt_list)))
+    else:
+        bb.fatal("%s requires Linux Kernel option %s to be enabled"
+                % (pn, opt_alt_list[0]))
+
+
+def check_kernel_option(pn, opt_expr, opt_map, report_f):
+    alt_list = opt_expr.split("|")
+    alt_list_full = []
+    for opt in alt_list:
+        if not opt.startswith("CONFIG_"):
+            alt_list_full.append("CONFIG_" + opt)
+        else:
+            alt_list_full.append(opt)
+
+    if not any(opt_map.get(o) == "y" for o in alt_list_full):
+        report_f(pn, alt_list_full)
+
+
+python do_package:qa:append () {
+    kconfig_path = os.path.join(d.getVar("STAGING_KERNEL_BUILDDIR"), ".config")
+
+    kconfig_map = dict()
+    with open(kconfig_path, "r") as kconfig:
+        for line in kconfig:
+            if not line.startswith("CONFIG"):
+                continue
+
+            cfg_chunks = line.strip().split("=")
+            kconfig_map[cfg_chunks[0]] = cfg_chunks[1]
+
+    pn = d.getVar("PN")
+    for opt in d.getVar("KERNEL_OPTIONS_REQUIRED", "").split():
+        check_kernel_option(pn, opt, kconfig_map, report_opt_fatal)
+
+    for opt in d.getVar("KERNEL_OPTIONS_RECOMMENDED", "").split():
+        check_kernel_option(pn, opt, kconfig_map, report_opt_warn)
+}
+
+# do_shared_workdir moves kernel's .config to STAGING_KERNEL_BUILDDIR,
+# so it must complete before we can run the qa checks above.
+do_package:qa[depends] = "virtual/kernel:do_shared_workdir"
-- 
2.39.0.314.g84b9a713c41-goog


