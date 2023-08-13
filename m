Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144AAC04E69
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:19 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.94022.1691961554899775654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=clgmshUJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-564b8ea94c1so2211098a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961554; x=1692566354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk+mM/C+6/q79N6S80yVVGbbOtAGH6Bdbf2eCPFuZPQ=;
        b=clgmshUJPiNqZW5cMlZhBUzC3S+eGn5CYisBKd0DbZ++tMsNyOIWHGFU9U/xSMSbsN
         jc3+bEUeEtyAeeqDoJeV/fCBtqsHpoYQLH7M/g4MTmqh3e4y2sJqVx9EFe7ApeMj33ru
         kCuOflx8hSiXE1IwUL22wVVn2x/o+XBXIIfRJMSG08g/+zaCtJfBF3qAb5S3hp/nVKyA
         o1+LVq362gl+NeKgN2xsQJQOKg6HYa8ZBdne/LTysrhXbtxk3xXHpbhRqjCg5tC6uEen
         qdiDyZ/F7K62WCad3FpzmUWhPYCI0hacKn7r9ZjOxc9BX7F3uq0kOvi+5IczmNTRlvxG
         JPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961554; x=1692566354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bk+mM/C+6/q79N6S80yVVGbbOtAGH6Bdbf2eCPFuZPQ=;
        b=UTSbEcHdZkUMnG9sDBah8UYIcVgnocOggZOznF1wjRosSjKG87bvrwt4kvythxsb7z
         mIrqI04cJl4fiNQqMtTnyqAufdEbgphxmMyJNOSQLUS8Mo2dYSpDSWjYbmFuIKmy1g9x
         lLRCag+Vk/AtiRh2oiuyQ2mbYpAgud9jxmM9pODky55WRQKNisd36HrxCyd99FtK5f2n
         wMXeaaa7+JvQuuQy7sYxg/UjlnovciE70Pmqf31COQYc8HAOGDR96B2nZp6eT9mmDPLf
         Ska28SwS/w3l9AvkbKHG1wlcSW9Ueh2YDOLmoMIWx3Mf4T1Z+yS+5vrrpyvHudoCtaSa
         OBlQ==
X-Gm-Message-State: AOJu0Yw9aeoFMJzbObymMlaAUBKzizellAZybxsjDvGgOPSiRFo4RAWG
	0xlqDttirO0sO7L4TkncHysSBp3VcAv1n/7uH7k5Lw==
X-Google-Smtp-Source: AGHT+IF5YVcrjX4K7JNZRVrhrX30U5rPxxq4/2wDbcJBMXBurlzRwVzU8MCPolFclPtoQjUKX8aABQ==
X-Received: by 2002:a17:90a:6d43:b0:268:5fd8:d8ff with SMTP id z61-20020a17090a6d4300b002685fd8d8ffmr5344035pjj.0.1691961553968;
        Sun, 13 Aug 2023 14:19:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/22] procps: patch CVE-2023-4016
Date: Sun, 13 Aug 2023 11:18:19 -1000
Message-Id: <1632c7223b2f8cd595e1ba20bc006c68fc833295.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185904

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
 meta/recipes-extended/procps/procps_3.3.16.bb |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
new file mode 100644
index 0000000000..50582a8649
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
+ procps-ng-3.3.16
+ ----------------
+   * library: Increment to 8:2:0
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
diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 3a8289b359..ac27734a6f 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
+           file://CVE-2023-4016.patch \
            "
 SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
 
-- 
2.34.1


