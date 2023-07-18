Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24282EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.9089.1689690378407363613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nf3RVyDi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-66c729f5618so5817125b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690377; x=1692282377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN2FSNDtvqyefG5h6cNjgbs2YxZShldtSNc77OER/7I=;
        b=nf3RVyDinrITtimhfzCzVhMfK6X9M2UsSx4pCVYIDZ787ljexYm8w3W6Ct+4Tgca+f
         P0vuaBtEMlcSCebL6AtdCLx1ljg/dNtA2mq3HG74W/akAOCqfSiQi+ACzPzt0W9eIlvW
         uG5PGvzNS1jwtET6uRxUdgaAPfG6UvVBMiyimcyWk8PcukD462CWOFu55wG8X54LAM5o
         HwMgs3/F+IhBRJhr2/dT6rlYBdE86lSNuUDybJJr7BABxoPqjEsJ1oI9uKw9P0Ix3erA
         G+i4XIANZCREgBIPqNcVwv0K//iaGkpThAkyZ64CAvnB0lOWflXmwAqnC+GzFMeMdl27
         QmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690377; x=1692282377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN2FSNDtvqyefG5h6cNjgbs2YxZShldtSNc77OER/7I=;
        b=JnyYfowj8XirKCWbd1PASAbFGjuY9c93DwpOr43SkKkpoCO0up/86xds8BZ01trxbR
         5sZE7ZbMV6sWvL21M79WcRnDx7yhJoYGliRuuL1EA1jeVKkR/qThiaSltewkmx4XU2iU
         dAjrQHYEat/V6wyGGY9mpuvFJoo36bN7AjjcBSKKbyLM9LM+xmbTDTxOtzYNLGWV3xVd
         ynxn7fiwO9AweETirB5YW+ZzLGlvCV03k8dzWsg2oz/088rPXI3Uf+XJ+QvUvNjH9kQi
         Xz8wW+gqIK2VwWXuHgqftHkjdBXmppi2xB4nDWa1uXIchw4VsE6TfcdtHRWEGDRYp1d3
         pigA==
X-Gm-Message-State: ABy/qLZGIyR0rZ1U5TpTdYliwiU/HWuPEjLlD1A7QKP+qMcaVEjQOIPd
	2vsmKlUAHajyfhqxGqT1dTRo9Zo3uipr6QvsSas=
X-Google-Smtp-Source: APBJJlF+bPD1/ffNM1/7POvHWpvATaKJqn215hoHgoxa7WPaa6GKNDxUpqpB1g66NZbZ/mcjrJJ62A==
X-Received: by 2002:a05:6a20:430b:b0:134:951c:acb3 with SMTP id h11-20020a056a20430b00b00134951cacb3mr8441920pzk.35.1689690377424;
        Tue, 18 Jul 2023 07:26:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/27] sqlite3: CVE-2023-36191 CLI fault on missing -nonce
Date: Tue, 18 Jul 2023 04:25:36 -1000
Message-Id: <663713b2f95dee1e70f8921ece23b21d84d93805.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184506

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://sqlite.org/src/info/cd24178bbaad4a1d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2023-36191.patch         | 37 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-36191.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-36191.patch b/meta/recipes-support/sqlite/files/CVE-2023-36191.patch
new file mode 100644
index 0000000000..aca79c334a
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2023-36191.patch
@@ -0,0 +1,37 @@
+From 4e8a0eb4e773b808d9e9697af94319599777169a Mon Sep 17 00:00:00 2001
+From: larrybr <larrybr@noemail.net>
+Date: Fri, 2 Jun 2023 12:56:32 +0000
+Subject: [PATCH] Fix CLI fault on missing -nonce reported by [forum:/info/f8c14a1134|forum post f8c14a1134].
+
+FossilOrigin-Name: cd24178bbaad4a1dafc3848e7d74240f90030160b5c43c93e1e0e11b073c2df5
+
+Upstream-Status: Backport [https://sqlite.org/src/info/cd24178bbaad4a1d
+Upstream commit https://github.com/sqlite/sqlite/commit/4e8a0eb4e773b808d9e9697af94319599777169a]
+CVE: CVE-2023-36191
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index 0200c0a..fa45d40 100644
+--- a/shell.c
++++ b/shell.c
+@@ -23163,8 +23163,12 @@ int SQLITE_CDECL wmain(int argc, wchar_t **wargv){
+     }else if( strcmp(z,"-bail")==0 ){
+       bail_on_error = 1;
+     }else if( strcmp(z,"-nonce")==0 ){
+-      free(data.zNonce);
+-      data.zNonce = strdup(argv[++i]);
++      if( data.zNonce ) free(data.zNonce);
++      if( i+1 < argc ) data.zNonce = strdup(argv[++i]);
++      else{
++        data.zNonce = 0;
++        break;
++      }
+     }else if( strcmp(z,"-safe")==0 ){
+       /* no-op - catch this on the second pass */
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 313c15dff4..55cc514412 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
            file://CVE-2022-46908.patch \
+           file://CVE-2023-36191.patch \
 "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.34.1


