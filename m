Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B9FC2FC0F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.178663.1692240605477422283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=byAKinW7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf11b1c7d0so1485685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240604; x=1692845404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWO98MMXMiVxZie3TeHydyAZK5aU9np6T5nbJLW/dzg=;
        b=byAKinW7mpzKO9h5kDJU4mDgjo6K/tRNeGtndXlxXAFR/iRxmK9e2AoydpndMhIyp5
         VWcxThxSLL6ZhIqFR4XTXahy8ZkuMrxUXJmey3mabGowT2P2UW7Rv6krSVTA3euCn3pj
         WZg6jhbRNFPfSaZJrmrFd5Z/EuC2400CaHaA8je5tZ42CiEyWvAysRypEJb1StHHvEA1
         XSWmTL9I5Vnc7VZLaiBGqyLbDdEIF7o6Z8hLUFBRi+Ze6vaOWcWhHf9VTgV7C1tUANJB
         +MJiMum4FMDfhLppgeTB3wLQ9ldWC+/CVGWEXApPeqVHiXKlKP1iD5QMOOqM3rohKlI3
         OJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240604; x=1692845404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWO98MMXMiVxZie3TeHydyAZK5aU9np6T5nbJLW/dzg=;
        b=E5zfzauc6K6YYUm3SFl2xtThIsS0ghZMu6KNiwaSrfqGCjUE6dAclsKtZL+J4e7NM0
         3G7RKFQxpr3+S+4hd9PEtVlDhS8foixsvf1fvVoj6pCFqRXQuYcGKfaoieImDZHJ1d7Z
         lzkkoHpq4MhKZoqUI8cY3OsKVwbMfpDxRHJQbSfqQUj6zA6HM/ezDwQQ4e/w/HlcHjVT
         6IezoDKC684lznhDjMyTPvXQcppv/80nUujVnc57jBEGRA/xBfK9Tr3KiA+6EXA0koQi
         8C67ZaIPX5RrNQ67TP0QGgUBnqQS/FCfWvQ2dCXR5GyJmvuXc0ehmmRdFF7s3IKuMZOf
         XkFQ==
X-Gm-Message-State: AOJu0Yw6kjvHeV0yU/oAqP0C9uxZ2dJ3dHQd/9jIh8Q3w7Pzq5c6PycY
	zWuAghiwDvvZhcVVaScZK0LIQS8g0AeQYA47Jh4=
X-Google-Smtp-Source: AGHT+IGOJr/WmKCXeCu8DHCyghtOektmzJGgmNBa5bpAv3kQMed/YSpVBL81Qdb4wMenYN7dnFHnbQ==
X-Received: by 2002:a17:902:eccd:b0:1bc:210d:6365 with SMTP id a13-20020a170902eccd00b001bc210d6365mr1652996plh.2.1692240604400;
        Wed, 16 Aug 2023 19:50:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] procps: patch CVE-2023-4016
Date: Wed, 16 Aug 2023 16:49:37 -1000
Message-Id: <71d0683d625c09d4db5e0473a0b15a266aa787f4.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186270

From: Peter Marko <peter.marko@siemens.com>

Backport patch from upstream master.

There were three changes needed to apply the patch:
* move NEWS change to start of the file
* change file location from src/ps/ to ps/
* change xmalloc/xcmalloc to malloc/cmalloc

The x*malloc functions were introduced in commit in future version.
https://gitlab.com/procps-ng/procps/-/commit/584028dbe513127ef68c55aa631480454bcc26bf
They call the original function plus additionally throw error when out of memory.
https://gitlab.com/procps-ng/procps/-/blob/v4.0.3/local/xalloc.h?ref_type=tags
So this replacement is correct in context of our version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../procps/procps/CVE-2023-4016.patch         | 85 +++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.17.bb |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
new file mode 100644
index 0000000000..c530b1cfea
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
@@ -0,0 +1,85 @@
+From 2c933ecba3bb1d3041a5a7a53a7b4078a6003413 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 10 Aug 2023 21:18:38 +1000
+Subject: [PATCH] ps: Fix possible buffer overflow in -C option
+
+ps allocates memory using malloc(length of arg * len of struct).
+In certain strange circumstances, the arg length could be very large
+and the multiplecation will overflow, allocating a small amount of
+memory.
+
+Subsequent strncpy() will then write into unallocated memory.
+The fix is to use calloc. It's slower but this is a one-time
+allocation. Other malloc(x * y) calls have also been replaced
+by calloc(x, y)
+
+References:
+ https://www.freelists.org/post/procps/ps-buffer-overflow-CVE-20234016
+ https://nvd.nist.gov/vuln/detail/CVE-2023-4016
+ https://gitlab.com/procps-ng/procps/-/issues/297
+ https://bugs.debian.org/1042887
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+CVE: CVE-2023-4016
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/2c933ecba3bb1d3041a5a7a53a7b4078a6003413]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ NEWS        | 1 +
+ ps/parser.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index b9509734..64fa3da8 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,5 @@
++  * ps: Fix buffer overflow in -C option CVE-2023-4016     Debian #1042887, issue #297
++
+ procps-ng-3.3.17
+ ---------------
+   * library: Incremented to 8:3:0
+diff --git a/ps/parser.c b/ps/parser.c
+index 248aa741..15873dfa 100644
+--- a/ps/parser.c
++++ b/ps/parser.c
+@@ -184,7 +184,6 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   const char *err;       /* error code that could or did happen */
+   /*** prepare to operate ***/
+   node = malloc(sizeof(selection_node));
+-  node->u = malloc(strlen(arg)*sizeof(sel_union)); /* waste is insignificant */
+   node->n = 0;
+   buf = strdup(arg);
+   /*** sanity check and count items ***/
+@@ -205,6 +204,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   } while (*++walk);
+   if(need_item) goto parse_error;
+   node->n = items;
++  node->u = calloc(items, sizeof(sel_union));
+   /*** actually parse the list ***/
+   walk = buf;
+   while(items--){
+@@ -1031,15 +1031,15 @@ static const char *parse_trailing_pids(void){
+   thisarg = ps_argc - 1;   /* we must be at the end now */
+ 
+   pidnode = malloc(sizeof(selection_node));
+-  pidnode->u = malloc(i*sizeof(sel_union)); /* waste is insignificant */
++  pidnode->u = calloc(i, sizeof(sel_union)); /* waste is insignificant */
+   pidnode->n = 0;
+ 
+   grpnode = malloc(sizeof(selection_node));
+-  grpnode->u = malloc(i*sizeof(sel_union)); /* waste is insignificant */
++  grpnode->u = calloc(i,sizeof(sel_union)); /* waste is insignificant */
+   grpnode->n = 0;
+ 
+   sidnode = malloc(sizeof(selection_node));
+-  sidnode->u = malloc(i*sizeof(sel_union)); /* waste is insignificant */
++  sidnode->u = calloc(i, sizeof(sel_union)); /* waste is insignificant */
+   sidnode->n = 0;
+ 
+   while(i--){
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index 0f5575c9ab..897f28f187 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
            file://0001-w.c-correct-musl-builds.patch \
            file://0002-proc-escape.c-add-missing-include.patch \
+           file://CVE-2023-4016.patch \
            "
 SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
-- 
2.34.1


