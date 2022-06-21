Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C80C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:28 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.1195.1655854165125221770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oyyNbLe7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id f16so13033175pjj.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZckK9x+2GYGeZaSzAFKxjNF/U+gRT7wwhV6F9nePaxU=;
        b=oyyNbLe7GerR1HVaXYHwSNd2McnX7SqBYrf6oZ1F3kuOwj75/gdTwXGaNa59ppmtTu
         SKbKbVfNu61X7nifEkr4Gai/QlkXTco97hn31zcUpxSoRxe4CeQQBjBTECyNLibGd5Vx
         mu7ZcCiEZfx2ZDdKyxQaTZcPqdXL+GKiUNfjY8dvwwc6slmFgujaqr1CKf9zabrlkZX9
         F6oxsr2pF5w1obvTALYA/xuVK9MyV5PjCQxHpgGgjhfLcISt+BD3X8rqCi08BjYl3PMe
         g160KDQz9QuP1iYnS6FC6b56FSbezPp0pZQXzDDdiGFtrTi6MvAcsH0FS5/wGy2zlQCD
         bqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZckK9x+2GYGeZaSzAFKxjNF/U+gRT7wwhV6F9nePaxU=;
        b=m/KiMaknTn43MRbCP/vVUWF3wRW2L9kLKEaT9fqCGgjE/hZl4FcI+rBPe7cI/4cNa6
         lDXP79vINjCwDTvc3P8U+5bXhk/BuDe3K1sVseqTcXbjjQmOp2wJVjpCpdAgrZ9bOYKI
         Gu+tB95/cVpCpXzm48z6Gyb0IirwcDBkLuUyFj61T55PsxYAJRao13Jw/gmiXTZBXtb9
         9i2Xf8Oa0l03M3vCpMR75id4vsVKEhToF+xnkIZ6/WcKbX/YXi9HWVUu6JXyWVbufFzv
         e8/gs2ysvNnPXLQbGaoQ1hJ37VLCjkHRNLAQMS+QBIM3TDxXOAf7PjBv9JZvSj9kK7m6
         Nr5Q==
X-Gm-Message-State: AJIora83Ee5F7JXmNb5r8zuOD5/uvelYEDSMYoLwPN2MHAdx3WePhgSV
	nRqqJbLVI16OuFIkecbbceXCICLDySWKyIls
X-Google-Smtp-Source: 
 AGRyM1uh6e1oHieudYfc5BODMbM9j15psV3EU0d0Un9waf0CuiCMkYKv4xJnx/BGPNaNddlW+hk9xA==
X-Received: by 2002:a17:902:b192:b0:16a:afe:3c76 with SMTP id
 s18-20020a170902b19200b0016a0afe3c76mr22730855plr.134.1655854164144;
        Tue, 21 Jun 2022 16:29:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] python-pip: CVE-2021-3572 Incorrect handling
 of unicode separators in git references
Date: Tue, 21 Jun 2022 13:28:58 -1000
Message-Id: 
 <841a8fb5b6351f79a4d756232a544d1a6480c562.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655836866.git.steve@sakoman.com>
References: <cover.1655836866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167205

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/pypa/pip
MR: 113864
Type: Security Fix
Disposition: Backport from https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b
ChangeID: 717948e217d6219d1f03afb4d984342d7dea4636
Description:
       CVE-2021-3572 python-pip: Incorrect handling of unicode separators in git references.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3-pip/CVE-2021-3572.patch    | 48 +++++++++++++++++++
 .../python/python3-pip_20.0.2.bb              |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch b/meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch
new file mode 100644
index 0000000000..a38ab57bc6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch
@@ -0,0 +1,48 @@
+From c4fd13410b9a219f77fc30775d4a0ac9f69725bd Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 16 Jun 2022 09:52:43 +0530
+Subject: [PATCH] CVE-2021-3572
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b]
+CVE: CVE-2021-3572
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ news/9827.bugfix.rst         |  3 +++
+ src/pip/_internal/vcs/git.py | 10 ++++++++--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+ create mode 100644 news/9827.bugfix.rst
+
+diff --git a/news/9827.bugfix.rst b/news/9827.bugfix.rst
+new file mode 100644
+index 0000000..e0d27c3
+--- /dev/null
++++ b/news/9827.bugfix.rst
+@@ -0,0 +1,3 @@
++**SECURITY**: Stop splitting on unicode separators in git references,
++which could be maliciously used to install a different revision on the
++repository.
+diff --git a/src/pip/_internal/vcs/git.py b/src/pip/_internal/vcs/git.py
+index 7483303..1b895f6 100644
+--- a/src/pip/_internal/vcs/git.py
++++ b/src/pip/_internal/vcs/git.py
+@@ -137,9 +137,15 @@ class Git(VersionControl):
+         output = cls.run_command(['show-ref', rev], cwd=dest,
+                                  show_stdout=False, on_returncode='ignore')
+         refs = {}
+-        for line in output.strip().splitlines():
++        # NOTE: We do not use splitlines here since that would split on other
++        #       unicode separators, which can be maliciously used to install a
++        #       different revision.
++        for line in output.strip().split("\n"):
++            line = line.rstrip("\r")
++            if not line:
++                continue
+             try:
+-                sha, ref = line.split()
++                ref_sha, ref_name = line.split(" ", maxsplit=2)
+             except ValueError:
+                 # Include the offending line to simplify troubleshooting if
+                 # this error ever occurs.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
index 08738fb2f9..e24c6f4477 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
+SRC_URI = "file://CVE-2021-3572.patch "
 SRC_URI[md5sum] = "7d42ba49b809604f0df3d55df1c3fd86"
 SRC_URI[sha256sum] = "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f"
 
-- 
2.25.1


