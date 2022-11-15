Return-Path: <jebr@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2883FC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 23:45:20 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web08.667.1668555913701690271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 15:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=dVaYkQcs;
 spf=pass (domain: flex--jebr.bounces.google.com, ip: 209.85.219.202, mailfrom: 3icr0ywqkammsnk0pxxpun.lxv@flex--jebr.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id e189-20020a25e7c6000000b006e37f21e689so4384176ybh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PkN9l9Sa6cuE+jS88FadqU39wk06EAiM6LRxi4GgU0I=;
        b=dVaYkQcsNTmCE81a1nhw7zLkhdCDyxQQt0mLzGqryDuIiG8JfcSPhd1BIVclx1XRLT
         GqvKPDFTou4ZELJE3ZOQ4w3E3GctGWqrWFsn4Kx7WX3yo7lzNSjksytgbIDfN99Af9eE
         gmNuNcAkzcmqaka1u93PRTE3v9g45YWm4mubRFQFEDu2+VzFuk+f4M4fDW3S+dfQn1AA
         oC2KrLH4b/ju7B2gC3dS0WyqX7sek0RV5hy4Omim8ADVV3XA51DToaCmFSZP2ZHkRgpS
         ll+squeyYf0XcfsjnYodVzrALUtmFQeBvhVBP8ygG6Pydk7+g/AUMXpRvqKKqht5DvaJ
         3PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkN9l9Sa6cuE+jS88FadqU39wk06EAiM6LRxi4GgU0I=;
        b=C8wWAnVRKJ5CvvRr4EGZi8Pcfqv9aIqnm089jZ+RmP2unCvx3vukM7jNpYwOQo0h8O
         8kCY78jCxfjz14bL0Lj0VhwidxVUsYorG+4hXLZ4gPkxyx9VlYlDwelFk5Ir32OrUoN1
         SVkmTAH4/fnEkLmjX9F4yt+nyulGBN4bS11FxGMDoLcPrvrWjiReigp6hl2I77w+AE0I
         Sssy8TyLR9856OV1284aTyQo/YYM+yQ0T8BiXFLiMr8llhEH9Bd1ZOWJwip17k/Ql1Ln
         BrU96PpQSP4nUB4g/EI87T1NLUREZYgmqK+19eQL6KYhOR2JxoeK7nVayVpoA41wpH6p
         T4VA==
X-Gm-Message-State: ACrzQf1Db+lVlsmcRtesrENZhoILwCpjqP7oeRtdbdhI8HlKuU2JOS0w
	anWEcsi33YnA1PTp170xI6yqTEJ63d+esfZt6cOGFj0Lf9ju/Qkif4tcTwlUGPZkpGxqvvkqrTQ
	qFn/+oIkhP6Bxmswmh4heQnL2DZpjjdHWTsux5NYaLdKdXXjQyKBPrvEst3vEa+JT2tpWBmcvdw
	uUtang
X-Google-Smtp-Source: AMsMyM5siEIPm5S67FoqnNXqIDW+thaNdXxiaydnxkW2KPekAQmwGFUwObkbpk9b84qo85Wz9+dITOs8
X-Received: from jebr.svl.corp.google.com ([2620:15c:2c5:13:e1a7:e6e7:ba5b:22ee])
 (user=jebr job=sendgmr) by 2002:a81:920e:0:b0:368:25a5:e82d with SMTP id
 j14-20020a81920e000000b0036825a5e82dmr66417372ywg.375.1668555912106; Tue, 15
 Nov 2022 15:45:12 -0800 (PST)
Date: Tue, 15 Nov 2022 15:44:58 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221115234458.2978376-1-jebr@google.com>
Subject: [PATCH] kernel_dep_check.bbclass: help track kernel depend
From: jebr@google.com
To: openembedded-core@lists.openembedded.org
Cc: brandonkim@google.com, edtanous@google.com, 
	John Edward Broadbent <jebr@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 23:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173362

From: John Edward Broadbent <jebr@google.com>

This recipe can be used to identify kernel dependencies, and
immediately throw build errors if those dependencies are not met.

Signed-off-by: John Edward Broadbent <jebr@google.com>
---
 meta/classes-global/kernel_dep_check.bbclass | 81 ++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta/classes-global/kernel_dep_check.bbclass

diff --git a/meta/classes-global/kernel_dep_check.bbclass b/meta/classes-global/kernel_dep_check.bbclass
new file mode 100644
index 0000000000..25bef1533c
--- /dev/null
+++ b/meta/classes-global/kernel_dep_check.bbclass
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
2.38.1.431.g37b22c650d-goog


