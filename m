Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D18C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 05:25:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.35708.1676957129072123710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 21:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MnDtveAY;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id p6so1792599pga.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 21:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1M2Njfk+f4HO+G6CZd5xM8kpECdx+mMIYX2/PT2L4Y=;
        b=MnDtveAYXOgsa2UMDBOkK4/sl7v2ZqCrIUMpaScWJHohQE4v6FvZ0VIxbVWpv1ECj5
         FBg6tvEgqQr9KjPIdrjmLXGJs88QZNDC2hG84TbtYs6g/YrKaPVmfLN/VrThJLg0CJYD
         rqVC5N9z3dHgjyxCHXRC2uMlM8/ULyctWeHaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1M2Njfk+f4HO+G6CZd5xM8kpECdx+mMIYX2/PT2L4Y=;
        b=N6+GBM7EnEl2ano2nQpxMzunR/DJvtdIVDYxKwGJ/qmyEju4u/LJNKy3wSx0EVbKWz
         9WIugC0rwwuaAOW5aZV59vj/G0Ame8zrppAs9hmffzSjC6kmiG/j5b1H/91l80GIqs00
         otLBkwz990o0RcFDbfT598M+WeGzuIA0UaT62oKh9veQAMBi6blSRK2++06dt4sRw2aL
         kBoheOP7gU+vZOuSo62BQVX30QFKxl2dccNBhTH8XHNEqxRTklI1XN6YXj1Xh3T5Ya+q
         SuGvRRw2TE3H5RJdo7oQQUr2cBoNI/d6sB4jk+wQ3Y0xVW3away3++1hujfsJAX5LWZP
         2pMg==
X-Gm-Message-State: AO0yUKU/pEdCwwQnMXTMQbtPClidEivbN8yAFpnajBu0GPEp5anSaQmp
	cmkmjIG5U76wdlDCVc+tE6J791Px2oTNpxhR
X-Google-Smtp-Source: AK7set8CH5CwUob8W/qCrqMzFIuh5W8OrD6BKcikSFMG+89/C3JuAWs9zgDdGZtu8NcwWlYb3cXLLg==
X-Received: by 2002:a62:601:0:b0:5a8:c2bb:f0c4 with SMTP id 1-20020a620601000000b005a8c2bbf0c4mr2127923pfg.13.1676957128302;
        Mon, 20 Feb 2023 21:25:28 -0800 (PST)
Received: from MVIN00024 ([150.129.170.206])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78399000000b005897f5436c0sm8473050pfm.118.2023.02.20.21.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 21:25:27 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 21 Feb 2023 10:55:22 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] curl: fix CVE-2022-43552 Use-after-free triggered by an HTTP proxy deny response
Date: Tue, 21 Feb 2023 10:55:21 +0530
Message-Id: <20230221052521.76541-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 05:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177481

Upstream-Status: Backport from https://github.com/curl/curl/commit/4f20188ac644afe174be6005ef4f6ffba232b8b2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2022-43552.patch            | 82 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-43552.patch b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
new file mode 100644
index 0000000000..d729441454
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
@@ -0,0 +1,82 @@
+rom 4f20188ac644afe174be6005ef4f6ffba232b8b2 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/smb.c    | 14 ++------------
+ lib/telnet.c |  3 ---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 12f9925..8db3b27 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -61,8 +61,6 @@ static CURLcode smb_connect(struct connectdata *conn, bool *done);
+ static CURLcode smb_connection_state(struct connectdata *conn, bool *done);
+ static CURLcode smb_do(struct connectdata *conn, bool *done);
+ static CURLcode smb_request_state(struct connectdata *conn, bool *done);
+-static CURLcode smb_done(struct connectdata *conn, CURLcode status,
+-                         bool premature);
+ static CURLcode smb_disconnect(struct connectdata *conn, bool dead);
+ static int smb_getsock(struct connectdata *conn, curl_socket_t *socks);
+ static CURLcode smb_parse_url_path(struct connectdata *conn);
+@@ -74,7 +72,7 @@ const struct Curl_handler Curl_handler_smb = {
+   "SMB",                                /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -99,7 +97,7 @@ const struct Curl_handler Curl_handler_smbs = {
+   "SMBS",                               /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -919,14 +917,6 @@ static CURLcode smb_request_state(struct connectdata *conn, bool *done)
+   return CURLE_OK;
+ }
+ 
+-static CURLcode smb_done(struct connectdata *conn, CURLcode status,
+-                         bool premature)
+-{
+-  (void) premature;
+-  Curl_safefree(conn->data->req.protop);
+-  return status;
+-}
+-
+ static CURLcode smb_disconnect(struct connectdata *conn, bool dead)
+ {
+   struct smb_conn *smbc = &conn->proto.smbc;
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 3347ad6..e3b9208 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -1294,9 +1294,6 @@ static CURLcode telnet_done(struct connectdata *conn,
+ 
+   curl_slist_free_all(tn->telnet_vars);
+   tn->telnet_vars = NULL;
+-
+-  Curl_safefree(conn->data->req.protop);
+-
+   return CURLE_OK;
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 63faae6296..899daf8eac 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-35252.patch \
            file://CVE-2022-32221.patch \
            file://CVE-2022-35260.patch \
+           file://CVE-2022-43552.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


