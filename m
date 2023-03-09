Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FC0C742A7
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16013.1678375206818307064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MIoq4ph+;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h11so2241863wrm.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbiQp8DADaujDCUZ+uyuK0iGL5MIgzZIIlK+HokPlKY=;
        b=MIoq4ph+f3IeJl6fTZmzbjbPzKP9E9k16p/VONk30Inijt1+71qHMghpMI2R2q7gyg
         oFnGR08yJkdslk3BiU7odliV0nk2RZUIniRcNhRY7Bn9EPrN7ARXYkj6rT67wEVZPpJC
         7N79Di0FENBzSGtH0i6hW1tUp9CIZOiB0x5hiaeAO0I0Lhq7dp2AfEoGpDIW9eR7fdcy
         b/YJZyvNkbVMNkIdS8IeRymSwclJB3D1fJozDqBK1vd9TOdVkAdL85BbAVtRLGzEdp0y
         0GFBl9ZOcqsurGyK47QcQu4rN5hu8pbE0B0hlTM+iOhBoD9B5YhRmf+M8ree/NOa7yUg
         aXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbiQp8DADaujDCUZ+uyuK0iGL5MIgzZIIlK+HokPlKY=;
        b=U1hX6vI9HdsCAHlDr8g3UL/5u3qJcvw0yQ/UOzPX5bPhzrbkvQ6ycskIRtLc4lUQH5
         Yf3bEV7uVzZkLq6nhzD8qmFM2sVsqeWgs24c+w1dMqhgODAXRE+FBA9I7DweCa17+2Hs
         L3r2+sxez+yGmRZJBI4+OXqUtJUnwaEEIJLNtv+DL6VB2Rary9z/JKTF09gMJKNUAiNv
         vMbIuNFESZmImKx71xstE3raUA9UfxnCNTcy6myCnDnasXxB7WveL6JAzG2u8Y3KHOvp
         TXwUx0E4+Im980/DNnDcREOgF2hVeCxDc3tXYaXW8Tx7TJEvyzj92i/BYATHPolawi82
         h1hQ==
X-Gm-Message-State: AO0yUKXKs2A4MMqSoFP9siExgcKvqj3uD79VnU4S9CmTz/I8X1MYgviY
	ZJKrQmywuWsT7D+HL1fuSiB65urQrwM=
X-Google-Smtp-Source: AK7set8NvpTGr1Ss3nRl4jTFL1AuUcKyzm4kA3LpKjjK4oDyjj6MYHRy5SWOP07XzSugsKGtH+4hlw==
X-Received: by 2002:adf:ec47:0:b0:2c7:e48:8ca3 with SMTP id w7-20020adfec47000000b002c70e488ca3mr14925271wrn.0.1678375205154;
        Thu, 09 Mar 2023 07:20:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/26] sudo: update 1.9.12p2 -> 1.9.13p2
Date: Thu,  9 Mar 2023 16:19:34 +0100
Message-Id: <20230309151958.3619193-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178227

License-update: copyright years, formatting.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o.conf.in-fix-conflict-with-multilib.patch | 21 ++++++++++---------
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p2.bb}    |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index f4fc376bb8..041c717e00 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,7 @@
-sudo.conf.in: fix conflict with multilib
+From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 17 Nov 2020 11:13:40 +0800
+Subject: [PATCH] sudo.conf.in: fix conflict with multilib
 
 When pass ${libdir} to --libexecdir of sudo, it fails to install sudo
 and lib32-sudo at same time:
@@ -12,12 +15,13 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
+
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 6535d3a..50afc8f 100644
+index 2187457..0908d24 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -33,8 +37,8 @@ index 6535d3a..50afc8f 100644
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_intercept.so file.
  #
--#Path intercept @plugindir@/sudo_intercept.so
-+#Path intercept $plugindir/sudo_intercept.so
+-#Path intercept @intercept_file@
++#Path intercept $intercept_file
  
  #
  # Sudo noexec:
@@ -42,8 +46,8 @@ index 6535d3a..50afc8f 100644
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_noexec.so file.
  #
--#Path noexec @plugindir@/sudo_noexec.so
-+#Path noexec $plugindir/sudo_noexec.so
+-#Path noexec @noexec_file@
++#Path noexec $noexec_file
  
  #
  # Sudo plugin directory:
@@ -55,7 +59,4 @@ index 6535d3a..50afc8f 100644
 +#Path plugin_dir $plugindir
  
  #
- # Sudo developer mode:
---
-2.17.1
-
+ # Core dumps:
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 498d60d534..bedf713d2c 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.12p2.bb b/meta/recipes-extended/sudo/sudo_1.9.13p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.12p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.13p2.bb
index ae7207c081..a028bcc216 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.13p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539"
+SRC_URI[sha256sum] = "df2004fde4c1033b1fdca339958e0ec633d393d604fcff9d1513abef1f94574d"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.30.2


