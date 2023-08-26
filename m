Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1975AC83F19
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:07 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.10477.1693064341481563751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d05h3VMj;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a76d882080so1420326b6e.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064340; x=1693669140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+KRUQ2DRHBf9CRZ5HTG2gdjMTxsljAU7Tjzv7ZoPVQ=;
        b=d05h3VMjEwPxmS1QoL0vG0eGJxe5kBpLN8Mez5j5enUT8Q9BQ2FN62++4B09c6XY/H
         mWbCJ0DqUTov75jXCgwspOvEYfjb5lie4z9lha3/yzRM+s4oEQGy+gkWuKkSdRHL5gKr
         +tMbLVaa7KYCQ6X7OK8ewFKMIXQdEplpSBJkbixzjna8esBC++nY0vSgC4Rsx5tPwqSN
         3U1EADkJjYMa8gFtprqgbQBMS4DNV3F2WuP0QU4KeSsr8ytXcqCUQ1xRij1HLXVSpSjY
         H6InRJxIt7j4FnMFAqBN3Qf2WKqfYf68IbuOiTew9neR9dkMnsm9J2eOTCs3cYyLH2Xa
         vw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064340; x=1693669140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+KRUQ2DRHBf9CRZ5HTG2gdjMTxsljAU7Tjzv7ZoPVQ=;
        b=UF3pqp8IcpPS6933H2TT55JyRYszmPC2EoQnpcYcwhhn10MyoDEg79R7+qeQ4/J/tf
         glvc5nbEsGRlOkj2slLzrengitlo+H0Rso5rWnb2NV/cimvlyKzTogw1D6FG5xxERDTY
         +MnP9vNLOFN/L5yOiPeL4XM/1vTNZJq7ZFvNffjMv6DoX8ucmmH8PU/BdLSiBmQhFi+t
         5bE4NXc5ymq/8ZlP6sa395UDE9d5nVlDImi+qapitdnnRieDohCaEPdlqozbujMG1Hzt
         g3YEo5jiUGkuLl6mAcNf7aEpdIZLW+hyCZF621iB6pPWGVOqJgMWR1aQqpug35DhmUf5
         pT9Q==
X-Gm-Message-State: AOJu0YwcLOVm0OMRVwitGqwEHjR0YnIVxQmFRydB/B2b64UlRgtwVaSj
	2I1MVwAuhuktT4YV1+Bc7CC+/lyeaB9T2JMZ+64=
X-Google-Smtp-Source: AGHT+IFEZI05jpEJtSt1sA5kdfkppVgVu0HjOY4ZMkcXuF5hNvAaUeoSGKeh/zA6MKKkDO2EKD59vQ==
X-Received: by 2002:a05:6871:690:b0:1bd:f87e:6ad3 with SMTP id l16-20020a056871069000b001bdf87e6ad3mr6881011oao.30.1693064340432;
        Sat, 26 Aug 2023 08:39:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.38.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:38:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/20] ghostscript: fix CVE-2023-38559
Date: Sat, 26 Aug 2023 05:38:33 -1000
Message-Id: <9552f934ae5305b9154f1560d4823b168457b784.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186746

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-38559.patch          | 31 +++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
new file mode 100644
index 0000000000..4ef71cba7b
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
@@ -0,0 +1,31 @@
+CVE: CVE-2023-38559
+Upstream-Status: Backport [  https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=d81b82c70bc1 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index 7b14d9c71..6351fb77a 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1983,7 +1983,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
+         byte data = *from;
+ 
+         from += step;
+-        if (data != *from || from == end) {
++        if (from >= end || data != *from) {
+             if (data >= 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 9a900ee04f..9e2cd01ff4 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -36,6 +36,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://cross-compile.patch \
                 file://cve-2023-28879.patch \
                 file://cve-2023-36664.patch \
+                file://CVE-2023-38559.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


