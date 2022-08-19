Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872DCC25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.51220.1660877007440812671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J05lLoTb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id pm17so3390842pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=SbKxaCmzF61CntcucynZRbUpqV+xy5/f78+ObsZVN1c=;
        b=J05lLoTbmDx+Hr/Oo98s6Fbg/ZaMeBoQNRdaSUjtx1dcx+4jJhcL9VV64LCqXmVW8b
         Y7wLFEMaucra+eH5r7NV8O4NE0pUGPB2ENa9QPCsecQca9VSoamzkpM/7IGh6m6A9Abh
         9pgbWcqm3lzmNqH0tlIUR7N3t+o6Pb2ztvT/e57QsN7+AVcKX3LaTYYmzAImCEWv2TPs
         Rs09IOfMaVUd1gW+5R0/3tOuQARfJ/ZCP+jrPW1cBnBEo8KJYoOoPk8s5KDXWUOF43Be
         4yhYVDVBPO+kfPHGKJ/+vKhdmNOvuhXunKg1xvrzSR+oWwwwfIaByUBhF64TRfozMMvm
         V1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=SbKxaCmzF61CntcucynZRbUpqV+xy5/f78+ObsZVN1c=;
        b=cnjkoah/XxPO7npJk3GM8DKwClK3fho0OLj+THdzyynLXRe4qn1w/rgCqhhJInSDyx
         394DPXNiCdd+1oYWSMqFwpvfHl1WeiE4Xra2cQ2RLd06Q18lYBt91ir643O7KEi57yFX
         wDEl5/qWk0Mc3Jv6FiNzi1SeT602Bz8MeGHwiobLVqcxHQAcLJlZKWtTCxKeEBmh1XTU
         Pepw/upgDaDpAB+/GtZHFxCkB/9wbOrorC9+pCtE3H6+c2aeXtnRqkd673Rz6qD0m/c/
         D1MHrc8WixJlmTiDHqC3XclvcwHDwg1mJE+OB5Jc3mZA61TqG1VxlFo8da7u86QP/rwp
         vAeg==
X-Gm-Message-State: ACgBeo3rDhXRtboRX2Lp4FyyRHJt6NTY9fyHTDR1s4Vn/Ui+GtDTa2pG
	KNd/WHZlMqtNqym6iXUeCz93RqP29GpXI4v6
X-Google-Smtp-Source: 
 AA6agR6iPoW6xPTqSDzqPsF5oWZiy+Na1cvExP6DkHVctIWhX5ucLP5/ttSuuIP9R1Dfrh4GE1GGuQ==
X-Received: by 2002:a17:90b:4a50:b0:1f3:2a20:5a80 with SMTP id
 lb16-20020a17090b4a5000b001f32a205a80mr5936670pjb.96.1660877006413;
        Thu, 18 Aug 2022 19:43:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/26] zlib: CVE-2022-37434 a heap-based buffer
 over-read
Date: Thu, 18 Aug 2022 16:42:31 -1000
Message-Id: 
 <46ac4a9dc832edb1b3e75bb4003930085b086bef.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169552

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/madler/zlib
MR: 120525
Type: Security Fix
Disposition: Backport from https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
ChangeID: 94d9b7d372b83cc1022c0a15046c5449d39208c3
Description:
          CVE-2022-37434 zlib: a heap-based buffer over-read or buffer overflow in inflate in inflate.c via a large gzip header extra field.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zlib/zlib/CVE-2022-37434.patch            | 44 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
new file mode 100644
index 0000000000..d29e6e0f1f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
@@ -0,0 +1,44 @@
+From 8617d83d6939754ae3a04fc2d22daa18eeea2a43 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 17 Aug 2022 10:15:57 +0530
+Subject: [PATCH] CVE-2022-37434
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d]
+CVE: CVE-2022-37434
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Fix a bug when getting a gzip header extra field with inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+ Fix extra field processing bug that dereferences NULL state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index ac333e8..cd01857 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -759,8 +759,9 @@ int flush;
+                 if (copy > have) copy = have;
+                 if (copy) {
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index f8bcc0abcf..f768b41988 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://CVE-2018-25032.patch \
            file://run-ptest \
+	    file://CVE-2022-37434.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.25.1


