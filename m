Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD56C6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.28059.1676931640156998778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3J6utc1N;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id l15so4141971pls.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRSNfneR24nLphxumZzBxF5ZZ7l46UXilX0lHToNyIQ=;
        b=3J6utc1N0xLYrUnPex8TQsGHe+Ku5qH0XS4k2moZXhg2PFtokfFLaPLzM/hc0Iyzv8
         PflPo/ffoj0mvDz5p5OJs9qQY9voW0xK/FB0kM5tsnUS1mmGcoZLon++hD3RlJFjScT1
         fYHKBvnqZRuJnAA6+9TtsADTmdmA+O1b/G3j2VJgDOwZWVUYXefX4ohIpN/89Za9gk7k
         alYIfxZiwrC/ZGmyHLkrIcMA53iK2NtOIt+X7iS+mK4XCCAvHZ4zQKvYo0hZyeyxDDON
         mqORjgfNwMslqMSjEZ55NQ8wLsJCv2tWDE1JjE8i2fZcoRKhmEUKuTOp5HAZ52VOriTe
         TqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRSNfneR24nLphxumZzBxF5ZZ7l46UXilX0lHToNyIQ=;
        b=l5ZRn17GA1DJb/zlnYgUIiEKt2TpSHNrtzJ6FfbenSCZ3HS0qgEt4K0ssegFrfYcNp
         FSo7E4pBJesr3DGd8fN3uzWbig9DfvZkP9OlFWEWtQA7Rk5fOydojY+hFC37KLXQHc18
         knpmGt44RQiOTwg+jlcEsHdaovSfSHqNqY2Kj++qX9PBrTkWXI6zDLHC2RX2WXByC2xU
         pbyKHhuyQS/B3RjUzd7SVwDabjXCMBSS8/FvTD4/WGkUxA+I6f7QeA2M96MVAPT84Fju
         eDNmAHsBV95S4JpEacDYSLwf0KgNqZWEY9VMNru1yYHZINVoIf099k9NTW0j7lo9LxtM
         jB7w==
X-Gm-Message-State: AO0yUKXoY0cjh+Z0f3gRjxCsvVE8n/C5MPsHHrbg4FU6nbc/Hnu1ls94
	99QP4rNMHCTloANy7ceu94e+UcryGMgK5jQIJw4=
X-Google-Smtp-Source: AK7set8OVXB/G71sQdmDd4l41nEtpS3c9p6qaCD9NvcP7Haxp35CQaVYbWX9kbp+1Xnk5t9OV6AmHA==
X-Received: by 2002:a17:902:f54a:b0:19a:a647:1891 with SMTP id h10-20020a170902f54a00b0019aa6471891mr5885285plf.67.1676931639112;
        Mon, 20 Feb 2023 14:20:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/16] nativesdk: Handle chown/chgrp calls in nativesdk do_install tasks
Date: Mon, 20 Feb 2023 12:20:12 -1000
Message-Id: <a05c116c517e0700837c335d0691c3fcc4462dda.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177465

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We disable the useradd code for nativesdk targets since we don't support
postinstalls or multiple users in those cases. This means any usage
of chown/chgrp inside do_install tasks won't work and would have to be
conditional. Rather than require all recipes to do that, add intercepts
of the calls and map those to root/root user/groups. We can't just ignore
them as some calls are used to remove host contamination from the host
user ID so they need to be made, just as root.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1f40670c438e33cae87678425de72ca03566888)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/nativesdk.bbclass    |  2 ++
 scripts/nativesdk-intercept/chgrp | 27 +++++++++++++++++++++++++++
 scripts/nativesdk-intercept/chown | 27 +++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100755 scripts/nativesdk-intercept/chgrp
 create mode 100755 scripts/nativesdk-intercept/chown

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7f2692c51a..dc5a9756b6 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -113,3 +113,5 @@ do_packagedata[stamp-extra-info] = ""
 USE_NLS = "${SDKUSE_NLS}"
 
 OLDEST_KERNEL = "${SDK_OLDEST_KERNEL}"
+
+PATH_prepend = "${COREBASE}/scripts/nativesdk-intercept:"
diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercept/chgrp
new file mode 100755
index 0000000000..30cc417d3a
--- /dev/null
+++ b/scripts/nativesdk-intercept/chgrp
@@ -0,0 +1,27 @@
+#!/usr/bin/env python3
+#
+# Wrapper around 'chgrp' that redirects to root in all cases
+
+import os
+import shutil
+import sys
+
+# calculate path to the real 'chgrp'
+path = os.environ['PATH']
+path = path.replace(os.path.dirname(sys.argv[0]), '')
+real_chgrp = shutil.which('chgrp', path=path)
+
+args = list()
+
+found = False
+for i in sys.argv:
+    if i.startswith("-"):
+        args.append(i)
+        continue
+    if not found:
+        args.append("root")
+        found = True
+    else:
+        args.append(i)
+
+os.execv(real_chgrp, args)
diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-intercept/chown
new file mode 100755
index 0000000000..3914b3e384
--- /dev/null
+++ b/scripts/nativesdk-intercept/chown
@@ -0,0 +1,27 @@
+#!/usr/bin/env python3
+#
+# Wrapper around 'chown' that redirects to root in all cases
+
+import os
+import shutil
+import sys
+
+# calculate path to the real 'chown'
+path = os.environ['PATH']
+path = path.replace(os.path.dirname(sys.argv[0]), '')
+real_chown = shutil.which('chown', path=path)
+
+args = list()
+
+found = False
+for i in sys.argv:
+    if i.startswith("-"):
+        args.append(i)
+        continue
+    if not found:
+        args.append("root:root")
+        found = True
+    else:
+        args.append(i)
+
+os.execv(real_chown, args)
-- 
2.34.1


