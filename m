Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86E4C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 15:22:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13150.1637853757382576579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LL2rSl6c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o29so5900705wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TY7MP0ubyGGNJHPiDNGyO3zCdzxAsMSG0hJrY0Wde3c=;
        b=LL2rSl6cJI5QijYq4NQj330MLDwGN/zN5UCCDLepeGRacRox+cn6Csbqz32yOa744A
         reKmcYYhrGloUegaByrLGoAs3f3uaM6jMsMqro99/ethcu0sQh/pg1O+I2+MZpsDpe0q
         uqx+f8rcw4ZoQXT6xpxrF8nhGit2bd4Z1TkBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TY7MP0ubyGGNJHPiDNGyO3zCdzxAsMSG0hJrY0Wde3c=;
        b=35AG+9F1wWQPpWQOSKSwAZdjr/gpaadLaw0pC/SoW4qFXcWTf/6NwVJwLyeMwBxGT4
         ZnZr3fEjpfi2wJJF/rTY1QwBchkVTnsW1ldlrqQqMK5PFn75RkoVGrQ3Krn/XRjOiyKc
         obIW0knv+/boK6EHZfI7whNmfIiJNREmR3hGDTRUiThE9zJYTck7CW03l197xTD9E4Qp
         L5aTfrsBisi9bLty2KLTi9mmMHzlUONh/sJNXGYUHy+r5tgTBewk1ojfO5pCKJzOudde
         S2EmVjYGCbG33b6P2TjyIyXriwpe9vy8G5gkegYhE/MTGopdrt/gXL5CRTKouGuq+cVa
         svhw==
X-Gm-Message-State: AOAM530oQGEJxXVP1sHrNoYokz+bD3e0MIdd9LZ4yJsteBX7V1+nn+Pj
	A92PjkSyU4RomlKsIrhFn4+7HsTWqJMQaA==
X-Google-Smtp-Source: 
 ABdhPJyXMXhY+QjrANelwb2aqk/cGrLBawfLYpyBms3MFoA2Uh4iFdJ5b0LkFbcV3RaUAxUuUh4/eg==
X-Received: by 2002:a05:600c:1083:: with SMTP id
 e3mr8127542wmd.167.1637853755427;
        Thu, 25 Nov 2021 07:22:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6a3f:a87f:f605:c96b])
        by smtp.gmail.com with ESMTPSA id
 g13sm3222243wmk.37.2021.11.25.07.22.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:22:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] nativesdk: Handle chown/chgrp calls in nativesdk
 do_install tasks
Date: Thu, 25 Nov 2021 15:22:32 +0000
Message-Id: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 15:22:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158782

We disable the useradd code for nativesdk targets since we don't support
postinstalls or multiple users in those cases. This means any usage
of chown/chgrp inside do_install tasks won't work and would have to be
conditional. Rather than require all recipes to do that, add intercepts
of the calls and map those to root/root user/groups. We can't just ignore
them as some calls are used to remove host contamination from the host
user ID so they need to be made, just as root.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/nativesdk.bbclass    |  2 ++
 scripts/nativesdk-intercept/chgrp | 27 +++++++++++++++++++++++++++
 scripts/nativesdk-intercept/chown | 27 +++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100755 scripts/nativesdk-intercept/chgrp
 create mode 100755 scripts/nativesdk-intercept/chown

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 14e210562f1..f8e96075134 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -113,3 +113,5 @@ do_packagedata[stamp-extra-info] = ""
 USE_NLS = "${SDKUSE_NLS}"
 
 OLDEST_KERNEL = "${SDK_OLDEST_KERNEL}"
+
+PATH:prepend = "${COREBASE}/scripts/nativesdk-intercept:"
diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercept/chgrp
new file mode 100755
index 00000000000..30cc417d3ac
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
index 00000000000..3914b3e3841
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
2.32.0


