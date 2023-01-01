Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BBAC3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.15996.1672594687122867369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SI3pH9sE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id g20so9199885pfb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIkrWl9q3oQTtUAFWEcsphm1aDMa8vJow2SGAGiEdKQ=;
        b=SI3pH9sECq3n2hCyVRkJqwYwp3SQqevKnCtnhwjihFOvCF9MUdoabrhVZpD7vx6AwW
         wBZH3jXctKq/39DUBzjxJsJvXSSYEPGtaBXA48t5A8R5fkx4TmFSvNQj8gWLZu/srN6g
         fvc+q44As/lgBzQB6AjLa5tTyV7qa7SECWaGTYGMhiquKm3o6DXMjDJ+JfgXsju2qYIC
         jAZGU50PHsvfNkdYVieDClpArD19y2wkpOQTR8xt+PPAZRUbCRDt0B/3mlMT0KAaRkVj
         D+O0oHYhl/WpfD6d4pq7OugPm5l/sTzvnplfGw7lu1p6ocEAnjrtpMlTMQ5+fVkfxbyc
         2egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIkrWl9q3oQTtUAFWEcsphm1aDMa8vJow2SGAGiEdKQ=;
        b=p4f6B/wbKP6SjQDI3Cuh7xdCcnATLHWw1M5haSKR+aNT/ugtAAyxW+8U93A6IEDydW
         aXJZAWlvhJERkia7eNBGoAwIlWQ+xmQ2x82YXS0Qy/SIQH9KJkeT3LAQIfnSek5J43/w
         DDrYSNiHG5y/cXmOzX798js+twLOyLapIr/efX+tZBUDp6OA/RnQZ4AEzNx+47GtzUeY
         W1XxTPARdJZ0/jtQk2NvECVMlKnWh/mRaKPKxt2hdh2xRFVpIJM3RbC2QIHrUYwRtw2x
         vYJn61R4XmL3SVcAFEyu4llDATBq7NQTuCUXvJlQA/yXS5PubYom5P1gF4y+762VeP0A
         u+KQ==
X-Gm-Message-State: AFqh2kpkJIPyLFG7+Lhayg+JXWA+tZG9UdWhGGOxqZPjF3iLH/xGarLr
	qx/abvUCCugkVC5xdjQbsqX51Rv5S38rDLGYXn4=
X-Google-Smtp-Source: AMrXdXt0eiu5cqjcQGNgZEkrB69yOseq4LKr39BnccJn2mbXirH84ucuzJ++Qp5s/Y8gIwcLliEoKQ==
X-Received: by 2002:a62:6d82:0:b0:580:da4d:d42a with SMTP id i124-20020a626d82000000b00580da4dd42amr28141768pfc.14.1672594686058;
        Sun, 01 Jan 2023 09:38:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/29] curl: Add patch to fix CVE-2022-43552
Date: Sun,  1 Jan 2023 07:37:27 -1000
Message-Id: <40c86ed254c7e6ddb974901774a6f6735e75d729.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175193

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix the security issue "curl can be asked to tunnel
virtually all protocols it supports through an HTTP proxy. HTTP proxies
can (and often do) deny such tunnel operations using an appropriate HTTP
error response code." as per below link
Link: https://curl.se/docs/CVE-2022-43552.html

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2022-43552.patch            | 80 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-43552.patch b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
new file mode 100644
index 0000000000..dfe6d8c6d5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
@@ -0,0 +1,80 @@
+From 4f20188ac644afe174be6005ef4f6ffba232b8b2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 19 Dec 2022 08:38:37 +0100
+Subject: [PATCH] smb/telnet: do not free the protocol struct in *_done()
+
+It is managed by the generic layer.
+
+Reported-by: Trail of Bits
+
+Closes #10112
+
+CVE: CVE-2022-43552
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f20188ac644afe174be6005ef4f6ffba232b8b2]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ lib/smb.c    | 14 ++------------
+ lib/telnet.c |  3 ---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 2cfe041dff072..48d5a2fe006d5 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -58,8 +58,6 @@ static CURLcode smb_connect(struct Curl_easy *data, bool *done);
+ static CURLcode smb_connection_state(struct Curl_easy *data, bool *done);
+ static CURLcode smb_do(struct Curl_easy *data, bool *done);
+ static CURLcode smb_request_state(struct Curl_easy *data, bool *done);
+-static CURLcode smb_done(struct Curl_easy *data, CURLcode status,
+-                         bool premature);
+ static CURLcode smb_disconnect(struct Curl_easy *data,
+                                struct connectdata *conn, bool dead);
+ static int smb_getsock(struct Curl_easy *data, struct connectdata *conn,
+@@ -74,7 +72,7 @@ const struct Curl_handler Curl_handler_smb = {
+   "SMB",                                /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -101,7 +99,7 @@ const struct Curl_handler Curl_handler_smbs = {
+   "SMBS",                               /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -936,14 +934,6 @@ static CURLcode smb_request_state(struct Curl_easy *data, bool *done)
+   return CURLE_OK;
+ }
+ 
+-static CURLcode smb_done(struct Curl_easy *data, CURLcode status,
+-                         bool premature)
+-{
+-  (void) premature;
+-  Curl_safefree(data->req.p.smb);
+-  return status;
+-}
+-
+ static CURLcode smb_disconnect(struct Curl_easy *data,
+                                struct connectdata *conn, bool dead)
+ {
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 24d3f1efb14c8..22bc81e755222 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -1248,9 +1248,6 @@ static CURLcode telnet_done(struct Curl_easy *data,
+ 
+   curl_slist_free_all(tn->telnet_vars);
+   tn->telnet_vars = NULL;
+-
+-  Curl_safefree(data->req.p.telnet);
+-
+   return CURLE_OK;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index bd68e40ca4..13f157ead8 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-42916.patch \
            file://CVE-2022-42915.patch \
            file://CVE-2022-43551.patch \
+           file://CVE-2022-43552.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


