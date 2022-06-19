Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4873CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:37 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.21959.1655667087644043294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xPd9N0G+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id x4so2138591pfq.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=okINGN9tgm7Iw3ag7ZtKloeetmi4k2NDRi/EmTdZVTY=;
        b=xPd9N0G+teMSqV82lG1zmyHQZaFxa3CFpKLCnCje4wmdsK0lSndp4pxffwRVMSahtG
         0EUalXcCn45g/VpEgoVb6tnvMQAWf/gcKF8+gezuvHMdOap/RJQlx57Y8b2t6ZNjK59o
         S9dita9Bs8ZnWkhy2+JxGTWBDpU9kwf+6vyU1EWovzWJw5sVnuQcaHeUYe/mJq3Nnce3
         v7Qh/oDF9qqtSIPd0uclvjVkuguEBurOpf8dlON7UMGSjVMSL6sQSoVCchZf3xsYVYXF
         tct2tvSzoArYc3T2l8O3WFSj+APuoDvkW2Ph42cVIstOXZ5b0kqPfgPQaZZ0gh0sz1BN
         ZYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=okINGN9tgm7Iw3ag7ZtKloeetmi4k2NDRi/EmTdZVTY=;
        b=mdTL+xLrrR2t5Kw+ItQJHMykH3veFSTvZkccxi5sNp6xRKGf1prrYJGC384UtGI3Hm
         03tZR6OvDR/TftP5rJsdmU/kQjI3PNubCbsQMo63BAIAHbYj5sj3swNprLZ57hbJwR9z
         ACRi5hIajFHPHh5/bSVqBnsHw+XgiyBSENlVlNZt677VDQIydwp8aRTFf7lScOseV4uj
         YtxBoJ746s6WlVuj2TPa1YxweuAfhwMrHVXPzAXAFR6AN7pMYxSbwJo9lpeEtam9KRSL
         i0J0pen4N8WsLMfylyzfumizt9yEk66AQH2TYCme1tZHd3fJC/Wqg/oLSlDRAihFOMHc
         IxMQ==
X-Gm-Message-State: AJIora+pSq+pZRXsezCoCh/wJAM9giQQCfvU2sKoZ3NqtL9jQDxX1e0f
	mtUKMzQUnjb7rRSulabfbCU995e5jrmyL3/B
X-Google-Smtp-Source: 
 AGRyM1s0TlmfwR73L5dAVIxES+LFQ7WOTysHoHLXIVVqm+prSX+3aFb8S58bD3CsxFO9FpBPU3AOfw==
X-Received: by 2002:a63:551e:0:b0:3fe:3f58:7ffb with SMTP id
 j30-20020a63551e000000b003fe3f587ffbmr18586416pgb.248.1655667086604;
        Sun, 19 Jun 2022 12:31:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] git: fix override syntax in RDEPENDS
Date: Sun, 19 Jun 2022 09:30:46 -1000
Message-Id: 
 <025d22e9c90ec0a46c1295149f1d43187c76cbe9.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167057

From: Yi Zhao <yi.zhao@windriver.com>

RDEPENDS_${PN}-tk -> RDEPENDS:${PN}-tk

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ed9267a318d53a302991a8ec7259d3bb809eaaa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.35.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git_2.35.3.bb b/meta/recipes-devtools/git/git_2.35.3.bb
index 68981d4fde..794045c8b7 100644
--- a/meta/recipes-devtools/git/git_2.35.3.bb
+++ b/meta/recipes-devtools/git/git_2.35.3.bb
@@ -147,7 +147,7 @@ RDEPENDS:${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
 # git-tk package with gitk and git-gui
 PACKAGES =+ "${PN}-tk"
-#RDEPENDS_${PN}-tk = "${PN} tk tcl"
+#RDEPENDS:${PN}-tk = "${PN} tk tcl"
 #EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
 FILES:${PN}-tk = " \
     ${bindir}/gitk \
-- 
2.25.1


