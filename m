Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37284C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:26 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.8617.1678229299776983764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1y1B+amy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y10so9088895pfi.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHBt1AB4i9acPcL4yrlDhHL74GV2WTXWPEf4HUx0FQE=;
        b=1y1B+amynMO9SUNTE099RUaYLtiMzdw33fEq8G0mALzhRfrW3q4PqBoWD6+SpOmj+H
         IwcjtA2a9E/epNvTH4qqqSuREe83gV2WLca9m5MdO7KuYpmQJzeao+fec/hx7GsUbWT9
         POtnRbRo6UEMTJAEWdTHbWW5o5Jnjz5Qdq0JNx9kWOG9v9qzrosCvxFSUl1Cs0w5q01c
         aZ017s1v8yDUm0XbueSSHJn3Lb2YVnTNhHn237Z+Fj2/J2buauLRE0aQDwnkkLXVBwu7
         Xlvz3gItsAFMCWTENk9gRj5b2z8/BMB/DRf2/qv0pZbzlAkHNlRHiDjuHJgKRlv13IJ8
         ionA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHBt1AB4i9acPcL4yrlDhHL74GV2WTXWPEf4HUx0FQE=;
        b=xDjIG6cWl/SvD/WtE+6yX6BOxfTGkyTZPT6youW2aD+4oVioqdTsWNNz0TfFvVqTuT
         76ydArk5YhKjCYoPtQoBz/hEC8hiVAD+jnLtJ8bS3SY1gzk4xcwKPcJOopvOPlZJ4JWi
         keZtoRTvXljfDpkjbJacu1WVQQBYi5JgogezYPlmtn0MPMrE6Vjga8qk2dFAQfxmvQt0
         EybrhSmxXod4u8h38Giz8yhReqxI/UVgCQ3w5/wY+KKmBWbsmEdatvbYMe1OA4Ah0ioH
         pn6saAjuv0wS8IEDFntHrrC1McSJkSpBXG8NqsEbe3s+Z1rxjh9yqXDW40fN/GFqsqPj
         SkNA==
X-Gm-Message-State: AO0yUKVPau/O/ZTc1LK/LqVpuEbywdkz9jGh7vZ4FJQY0jGqo6Q0iiWF
	d41q6D/pte3jY2wNeW+WrQmgywra2uAsbWhD++E=
X-Google-Smtp-Source: AK7set/UvuCa1v+QS+KoeOsCYBMiMlZA/ndaFeOIbyYk6MNqfmgojayuK0JdTp1u8ewaksiRUzciuQ==
X-Received: by 2002:aa7:9f85:0:b0:5a8:e9c0:7d0a with SMTP id z5-20020aa79f85000000b005a8e9c07d0amr13940064pfr.4.1678229298347;
        Tue, 07 Mar 2023 14:48:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/23] curl: fix CVE-2022-43552 Use-after-free triggered by an HTTP proxy deny response
Date: Tue,  7 Mar 2023 12:47:35 -1000
Message-Id: <e172a9d7dc92561e26b8ec7ff11d4c598dcaf5c8.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178123

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/4f20188ac644afe174be6005ef4f6ffba232b8b2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


