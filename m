Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D807C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 12:39:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.12445.1670503187467986388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 04:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=gUY+2h4y;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.53, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f53.google.com with SMTP id y16so1480097wrm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 04:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8F57fL17Q090l9cZS92t/s2QI//ZxPgDHLOlq8SoSSA=;
        b=gUY+2h4yoplrniHLejdSu4vbhqx4pSmqXWPtHdaN2+CWBCZuwnbuCzKnfLfg1zLnxz
         VaGeKjIZfcFAO9lx2tKAdhGrAMDCKlxXe7pec4/65os5jo/VvEv9nAE8p4Zy5fVjvZXo
         iZ1q/F2JzLX9dGzm32uqBgK0AYp6TpdACWm5C/3xg7jaLkzSV0th724iq2wvuR69STQm
         8y2UJPN2Ox5Rt1NcIqoEFRBnec1vmdYFacoP8srI1JkTVrj2KOU01Y0fqnCkkbgO8dSY
         YlVMq63knB7zVulIXoVV7tc+HveD8mu8O1snPkCJtoOafyKTPFusKrszfQkn3pSncFJJ
         ai0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F57fL17Q090l9cZS92t/s2QI//ZxPgDHLOlq8SoSSA=;
        b=7/2ykDvtsTECynuXbWbZVzLCoKvwGkUDmfpurWf6qd/Ob65Rn0RE53I9Zqt9Hnolwb
         PeRoU3AUGmuY4SARlgpXkVLKDnpn1j0uEU8zTx/8MpvTBcVcN9WB0Y72KlNAz6B/bW5W
         EugSo3qPoUckKBgeazFyTIRrGISoFUH94xoyLqoxJaHOR92z/jivE/aWdkkQKa2qwK2f
         pb2pnROelTeyTIBfv5YDiWoRFHcc7wl2rcsYTcY0wruMFWlDWoHPAKgL47DiGSpSeYx9
         1451qk3ETUlUQ4oIV3GCwYiThE32ELlJs4BabfSruXyhnxnFa3MdTtOMvOi3m7xDx+V7
         fgBg==
X-Gm-Message-State: ANoB5pkSlEGLrsv4GXILZxCcmPauq+q7bKBVbuhZqfuUxvGU0czROYMc
	zDGIG90DYsWTb64lmXfkVf6zUeVJrvRExjr8
X-Google-Smtp-Source: AA0mqf5Uquq4JLKAerqoDnPmdiKUwttEvpvsSZd9ilQ5euHFP28LgokFau1F0CORMRLBhh/RPJ1u8A==
X-Received: by 2002:a05:6000:608:b0:242:2875:93c with SMTP id bn8-20020a056000060800b002422875093cmr1824975wrb.8.1670503185132;
        Thu, 08 Dec 2022 04:39:45 -0800 (PST)
Received: from WIPC21110265.. (130.167.185.81.rev.sfr.net. [81.185.167.130])
        by smtp.gmail.com with ESMTPSA id n10-20020adffe0a000000b00241bd7a7165sm21417316wrr.82.2022.12.08.04.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 04:39:44 -0800 (PST)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH] curl: Fix CVE CVE-2022-35260
Date: Thu,  8 Dec 2022 13:39:26 +0100
Message-Id: <20221208123926.48924-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 12:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174404

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../curl/curl/CVE-2022-35260.patch            | 68 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-35260.patch b/meta/recipes-support/curl/curl/CVE-2022-35260.patch
new file mode 100644
index 000000000000..476c996b0a8d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-35260.patch
@@ -0,0 +1,68 @@
+From 3ff3989ec53d9ddcf4bdd99f5d5788dd87486768 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2022 14:37:24 +0200
+Subject: [PATCH] netrc: replace fgets with Curl_get_line
+
+Upstream-Status: Backport
+CVE: CVE-2022-35260
+Reference to upstream patch: https://github.com/curl/curl/commit/c97ec984fb2bc919a3aa863e0476dffa377b184c
+
+Make the parser only accept complete lines and avoid problems with
+overly long lines.
+
+Reported-by: Hiroki Kurosawa
+
+Closes #9789
+---
+ lib/curl_get_line.c | 4 ++--
+ lib/netrc.c         | 5 +++--
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/curl_get_line.c b/lib/curl_get_line.c
+index c4194851ae09..4b9eea9e631c 100644
+--- a/lib/curl_get_line.c
++++ b/lib/curl_get_line.c
+@@ -28,8 +28,8 @@
+ #include "memdebug.h"
+ 
+ /*
+- * get_line() makes sure to only return complete whole lines that fit in 'len'
+- * bytes and end with a newline.
++ * Curl_get_line() makes sure to only return complete whole lines that fit in
++ * 'len' bytes and end with a newline.
+  */
+ char *Curl_get_line(char *buf, int len, FILE *input)
+ {
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 1c9da31993c9..93239132c9d8 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -31,6 +31,7 @@
+ #include "netrc.h"
+ #include "strtok.h"
+ #include "strcase.h"
++#include "curl_get_line.h"
+ 
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -83,7 +84,7 @@ static int parsenetrc(const char *host,
+     char netrcbuffer[4096];
+     int  netrcbuffsize = (int)sizeof(netrcbuffer);
+ 
+-    while(!done && fgets(netrcbuffer, netrcbuffsize, file)) {
++    while(!done && Curl_get_line(netrcbuffer, netrcbuffsize, file)) {
+       tok = strtok_r(netrcbuffer, " \t\n", &tok_buf);
+       if(tok && *tok == '#')
+         /* treat an initial hash as a comment line */
+@@ -169,7 +170,7 @@ static int parsenetrc(const char *host,
+ 
+         tok = strtok_r(NULL, " \t\n", &tok_buf);
+       } /* while(tok) */
+-    } /* while fgets() */
++    } /* while Curl_get_line() */
+ 
+     out:
+     if(!retcode) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 31aa9d718558..63faae629632 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
            file://CVE-2022-32221.patch \
+           file://CVE-2022-35260.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


