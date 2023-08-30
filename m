Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F91FC83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1269.1693417719475946088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gU/Kb1Mh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68a410316a2so4312104b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417718; x=1694022518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDhW3S9Fd/YLuW4UWpB8kWImrfUsnWAViWmrHf50TSs=;
        b=gU/Kb1MhiCVJGEAlPkbxlzdC2Tf6iEz425JUTLGXqyUrgRYlDfkuMzCGSS1p5w+rNv
         W33hspnaNNYdCe450kxmvGArkpkUAT6cUcZUGB9VB2F8mgE/4TppggAubqpffURTYHMZ
         +gJcKSKGI4imVFj9GQLXeUlfRlWCGNpjptMk1zuL3zn1Vq9rtC18FWS6AM7WnfO95xKz
         /hQXg/AhJ+VEz3TRnEwpBF7qCcx7mfbPI/HkYW2EXTDbT4CGKYsPgrT6dcwPJTKjRuv9
         TZm4GcE2hg/ovF2zW61du9q+qYGwO2G42quszw7ebRowCCtbJ4vGNl82Ik0KnIZM5T44
         ySXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417718; x=1694022518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDhW3S9Fd/YLuW4UWpB8kWImrfUsnWAViWmrHf50TSs=;
        b=WUKrPqKJ4/mZoFsYuu6ga1zEsQym8QvVq3W0XjHMTFTqXlvqdHnCSGvZgUsxcDO3rb
         G6qOZaK39wv47tnPx+ZmhUJsxLPKdeuTNZqY7Q3uRk5fAI2VdErD1Z9iJVfQP1B1AP5G
         jpCGVL4rjWHUr4c8ohtzc2hCWtNUByZEzWp5MdSZDVoleAz9QRerCtoK6Pbs35i6wrIw
         npOvv1lA+PsKSXh7Z3RxCb0vaakHNZLj2rQDG6xMTfR/9xsvpySmnwLWJ4EW2ePg6VAe
         9asEedwdKj5s/+Dbh+ASRker2J0GptO+qYKnTu39OSpHCU+VU+7JAIL98sAaM0pdI94W
         BCCQ==
X-Gm-Message-State: AOJu0Ywg3d1cJfhhvaNNmEFYAx6kY+TlWA8wKIGUV9KD51pea+Q63TyM
	1xxMioVZptojA7rLII0Yk+swl55Z/Mvd+K9n17Q=
X-Google-Smtp-Source: AGHT+IHSEz6T8mXoFcC6m78lSN0RLDT0w/027zHp9vQDWHr5vhEYMLOqdqWFwBXTz5jfd4jU1JDMtQ==
X-Received: by 2002:aa7:8883:0:b0:68b:fb93:5b48 with SMTP id z3-20020aa78883000000b0068bfb935b48mr3385979pfe.18.1693417718432;
        Wed, 30 Aug 2023 10:48:38 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/20] procps: backport fix for CVE-2023-4016
Date: Wed, 30 Aug 2023 07:48:07 -1000
Message-Id: <7841349843f0adbb1312729d81ab05b5c459db79.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186905

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: 255515e1b52fea6d72d37fae61667db08eb5b086)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eae2a94f5de78b95590ec45e11e930655dbd5caf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../procps/procps/CVE-2023-4016.patch         | 73 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.3.bb  |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
new file mode 100644
index 0000000000..202fea91f1
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
@@ -0,0 +1,73 @@
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
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ NEWS            | 1 +
+ src/ps/parser.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/ps/parser.c b/src/ps/parser.c
+index 248aa741..15873dfa 100644
+--- a/src/ps/parser.c
++++ b/src/ps/parser.c
+@@ -189,7 +189,6 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   const char *err;       /* error code that could or did happen */
+   /*** prepare to operate ***/
+   node = xmalloc(sizeof(selection_node));
+-  node->u = xmalloc(strlen(arg)*sizeof(sel_union)); /* waste is insignificant */
+   node->n = 0;
+   buf = strdup(arg);
+   /*** sanity check and count items ***/
+@@ -210,6 +209,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   } while (*++walk);
+   if(need_item) goto parse_error;
+   node->n = items;
++  node->u = xcalloc(items, sizeof(sel_union));
+   /*** actually parse the list ***/
+   walk = buf;
+   while(items--){
+@@ -1050,15 +1050,15 @@ static const char *parse_trailing_pids(void){
+   thisarg = ps_argc - 1;   /* we must be at the end now */
+ 
+   pidnode = xmalloc(sizeof(selection_node));
+-  pidnode->u = xmalloc(i*sizeof(sel_union)); /* waste is insignificant */
++  pidnode->u = xcalloc(i, sizeof(sel_union)); /* waste is insignificant */
+   pidnode->n = 0;
+ 
+   grpnode = xmalloc(sizeof(selection_node));
+-  grpnode->u = xmalloc(i*sizeof(sel_union)); /* waste is insignificant */
++  grpnode->u = xcalloc(i,sizeof(sel_union)); /* waste is insignificant */
+   grpnode->n = 0;
+ 
+   sidnode = xmalloc(sizeof(selection_node));
+-  sidnode->u = xmalloc(i*sizeof(sel_union)); /* waste is insignificant */
++  sidnode->u = xcalloc(i, sizeof(sel_union)); /* waste is insignificant */
+   sidnode->n = 0;
+ 
+   while(i--){
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/procps/procps_4.0.3.bb b/meta/recipes-extended/procps/procps_4.0.3.bb
index cc3420df4e..140e7bfd22 100644
--- a/meta/recipes-extended/procps/procps_4.0.3.bb
+++ b/meta/recipes-extended/procps/procps_4.0.3.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
            file://0001-src-w.c-use-utmp.h-only.patch \
+           file://CVE-2023-4016.patch \
            "
 SRCREV = "806eb270f217ff7e1e745c7bda2b002b5be74be4"
 
-- 
2.34.1


