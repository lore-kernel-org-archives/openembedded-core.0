Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7DBE776F5
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 03:38:23 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.101033.1696304294448388193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 20:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Nl/BySBR;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-578b4997decso278526a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 20:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696304293; x=1696909093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSPVp7S5KmvrZAK/PWJQAOoVrFBRGezDykTQb/qBOuk=;
        b=Nl/BySBR7iehbx/X4pTidoKnju2euB77bN+2+RsVI2HIMGy46f2d1T+YDgLtXtwXrD
         04abVKOYXicKWxd0Uv40dP4HYBujgDYd8QVITH6qXGDJZgSNVrK6nalUgGfchIpWE9UR
         tn5Qget7iNXy44PuFDe+eSMAKMQizpWcVKApk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696304293; x=1696909093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSPVp7S5KmvrZAK/PWJQAOoVrFBRGezDykTQb/qBOuk=;
        b=wbL14iCFNW7yPxlUgf+tf/Q66OoPiinvxl2Hf1se/8EIsIjxQNJKcBkT4LwJVAHjoc
         hExguehzOdcFxWsZ0JUscxaitlBqVJdFgmdtgNX4x70xkStLFOLDliGNsfyat8SJxOhy
         cT43ot2444Rcz1UdpZo+wRYMCyIhqCrx9X9xFnvDbtIUjPHbbCmi+FxRJcEjh4g4YiDC
         ux4wfOIp/FE0Rcr6UyWmN0Lt1usFPWgy0zUBb7rPwF+RdPoZLDXh/wLiaTmXsd7JGgBB
         1SQuLpVwios7L8ARQm6rsfu6UuVHJA2nRP7DNYMVPb8qpjaxP2V1ICKU5xCu1R7X8p5m
         Yg+g==
X-Gm-Message-State: AOJu0Yw0GJ150WxTJ/oAdf66QWbyEjM9aEHrmDw1Wcm4oKMaKN865JhG
	UGLP5kI8Om2So33AAGgCdr/boSS9lfw2Kn9xc7o=
X-Google-Smtp-Source: AGHT+IEd/tah4iI6nTSSD2p8QOQq6NyHz1ktMvFlCeHCldB4DDnbqFK+M7LxyM49GOL3ukMrbLwkYw==
X-Received: by 2002:a05:6a21:a59d:b0:15c:b7ba:6a4d with SMTP id gd29-20020a056a21a59d00b0015cb7ba6a4dmr16621832pzc.50.1696304293480;
        Mon, 02 Oct 2023 20:38:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:5fcc:5ea:1020:984d])
        by smtp.gmail.com with ESMTPSA id a13-20020aa7864d000000b00690cd49cee2sm259446pfo.63.2023.10.02.20.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:38:12 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] cups: Backport fix for CVE-2023-32360 and CVE-2023-4504
Date: Tue,  3 Oct 2023 09:07:59 +0530
Message-Id: <20231003033759.832689-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 03:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188620

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream commits:
https://github.com/OpenPrinting/cups/commit/a0c8b9c9556882f00c68b9727a95a1b6d1452913
& https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |  2 +
 .../cups/cups/CVE-2023-32360.patch            | 31 ++++++++++++++
 .../cups/cups/CVE-2023-4504.patch             | 40 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32360.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1d2377486a..6cfe314f20 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://CVE-2022-26691.patch \
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
+           file://CVE-2023-32360.patch \
+           file://CVE-2023-4504.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
new file mode 100644
index 0000000000..4d39e1e57f
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -0,0 +1,31 @@
+From a0c8b9c9556882f00c68b9727a95a1b6d1452913 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <michael.r.sweet@gmail.com>
+Date: Tue, 6 Dec 2022 09:04:01 -0500
+Subject: [PATCH] Require authentication for CUPS-Get-Document.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c8b9c9556882f00c68b9727a95a1b6d1452913]
+CVE: CVE-2023-32360
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ conf/cupsd.conf.in | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/conf/cupsd.conf.in b/conf/cupsd.conf.in
+index b258849078..a07536f3e4 100644
+--- a/conf/cupsd.conf.in
++++ b/conf/cupsd.conf.in
+@@ -68,7 +68,13 @@ IdleExitTimeout @EXIT_TIMEOUT@
+     Order deny,allow
+   </Limit>
+ 
+-  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job CUPS-Get-Document>
++  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job>
++    Require user @OWNER @SYSTEM
++    Order deny,allow
++  </Limit>
++
++  <Limit CUPS-Get-Document>
++    AuthType Default
+     Require user @OWNER @SYSTEM
+     Order deny,allow
+   </Limit>
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
new file mode 100644
index 0000000000..be0db1fbd4
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
@@ -0,0 +1,40 @@
+From a9a7daa77699bd58001c25df8a61a8029a217ddf Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Fri, 1 Sep 2023 16:47:29 +0200
+Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
+
+We didn't check for end of buffer if it looks there is an escaped
+character - check for NULL terminator there and if found, return NULL
+as return value and in `ptr`, because a lone backslash is not
+a valid PostScript character.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31]
+CVE: CVE-2023-4504
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/raster-interpret.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+--- a/cups/raster-interpret.c
++++ b/cups/raster-interpret.c
+@@ -1113,7 +1113,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - S
+ 
+ 	    cur ++;
+ 
+-            if (*cur == 'b')
++	   /*
++	    * Return NULL if we reached NULL terminator, a lone backslash
++            * is not a valid character in PostScript.
++	    */
++
++	    if (!*cur)
++	    {
++	      *ptr = NULL;
++
++	      return (NULL);
++	    }
++
++	    if (*cur == 'b')
+ 	      *valptr++ = '\b';
+ 	    else if (*cur == 'f')
+ 	      *valptr++ = '\f';
-- 
2.25.1


