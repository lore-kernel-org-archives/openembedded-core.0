Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD2FC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6518.1783510833393210027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EHKQzXpG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so4429165e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510832; x=1784115632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1E0QHnxhj3qwJ8JkUPtB5B00qgtEQ8N5QkAVRWqURyc=;
        b=EHKQzXpGUN+RM4t6QmT00OfjtAKU1+6cYczrtGcbMpLmq5U6U3IZxV2dg8pItmF9gg
         sQxUI01O00FgzBLCidhMdnAxs5I2NpNuwJ8viQCrisEpw2GHC2RLPNZKkrTXI9s1MLvE
         zqevDK81QNB429qXPYhrnccD51/iazVgkdvwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510832; x=1784115632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1E0QHnxhj3qwJ8JkUPtB5B00qgtEQ8N5QkAVRWqURyc=;
        b=cIwGjKYmbgHBQnY8GBP1VCZv8xJR5z2k0O1oInO1Y/+QZ9NCK6WgsyZKfH8oEVcajI
         WzYo7lcBywwWbe4VGgnbPEzIhsyU9bi2+3zvv2sV+s7qsefInbW4HpoHBL5efPOWdilb
         FLvRojrzRiBOYJWorIKy/JjS7vSHhwgaYda8soBZV5gESPNuByNtQpjKChoTM8xHi6E4
         nLi5m7VcCNDV7vx/L8r4/JfSjtS3uC3BPnwL/rcNcmYvnLnH/M2iLIyh7CzOYLED+NDn
         etn+UatOzUmg/IzwihKpmVOuHHnFIzFVBqgk0fsClR7PbQVCruunD6ZTJBPekm/GVWGq
         DVgw==
X-Gm-Message-State: AOJu0Yxz/L9ai4H8Gm0OldasYIVgKlZeNGZQW8v62A99b4fAaFMbWjmL
	OfTymmWPOOAIndxWGNRCTeQYutge7Kxldob/rA1BamfMpNRCDNDL1NUmgRQf1FYBAvYPbdN0dQV
	UrmN2gwY=
X-Gm-Gg: AfdE7cmfo+koawIe3YpzHddXKfmwtUhuJMnfOvW6JNX+8UgoVHfeW3/jjnrQ4WSGtrN
	X8bdISKwYG1v9ybgo3WmS0QVe3ReWZ0qtp5HKDkWdSCKRZkXg0Ve8w5JShwiwTSvL+YQ8Gr1S2M
	HX2XMfNzgiEQOg0CFH+uOK5fo8VGbCDq8CuMLHhO/KOJkVhTw1Q3+v99OJJMu2LLg9xCJRY+ypd
	e6zSDQg1Q+VPGl/LKjafL8gUYfOZrHbNAz9bbO576982rts1uyFMcfmrExjuQD8rupQ2uWqD1xJ
	yjGRmpJbFiefG+k8D/OmGGgZDetrvDIM2JQ6T58K9OEhVvrYMroqVIoCAasez4WCiigWzwbpnR5
	TFnWyzAU5OQ6/pNAWGpCKeJVLfWq+YksW9Hw+LzQOSHN/Uk5aS7rAnY0cQImBh4pF3bgsRYOd9D
	d+4Ka7Pk73wxMr3+NzUrhUcgSs+qR2ggfzF66moqis9g==
X-Received: by 2002:a05:600c:5308:b0:493:d0f7:69c3 with SMTP id 5b1f17b1804b1-493e68eefecmr20684015e9.33.1783510831561;
        Wed, 08 Jul 2026 04:40:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] dropbear: upgrade 2026.91 -> 2026.92
Date: Wed,  8 Jul 2026 12:40:18 +0100
Message-ID: <20260708114021.3484868-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240471

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-urandom-xauth-changes-to-options.h.patch         | 6 +++---
 .../dropbear/dropbear/0005-dropbear-enable-pam.patch      | 8 ++++----
 .../dropbear/0006-dropbear-configuration-file.patch       | 2 +-
 .../dropbear/{dropbear_2026.91.bb => dropbear_2026.92.bb} | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2026.91.bb => dropbear_2026.92.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index a662230b883..b0f8e61998a 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From e5f6c6e8d2b6315e509c610e7d13e7dd2b465a85 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 6e970bb..ccc8b47 100644
+index ffaf062..2eb7de1 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -323,7 +323,7 @@ group1 in Dropbear server too */
+@@ -347,7 +347,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9a..bfb78b1ee19 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From dce5d03ed4d28c6374e593b7ef2cc4688f795fbd Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ccc8b47..12768d1 100644
+index 2eb7de1..be85bee 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -228,7 +228,7 @@ group1 in Dropbear server too */
+@@ -240,7 +240,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index ccc8b47..12768d1 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -236,7 +236,7 @@ group1 in Dropbear server too */
+@@ -248,7 +248,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 44861088cca..7509efb88c5 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From 50d64008f722f0f9719fc6c1b44582316022b93e Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear_2026.91.bb b/meta/recipes-core/dropbear/dropbear_2026.92.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2026.91.bb
rename to meta/recipes-core/dropbear/dropbear_2026.92.bb
index cdddd64fe2c..44a4dcde037 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.91.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.92.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34"
+SRC_URI[sha256sum] = "91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \

