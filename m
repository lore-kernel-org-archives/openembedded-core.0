Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAF7C55191
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.8215.1650463723923201948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gvLCgYHe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id x1so2043969pfj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dJ+kENKrYstMyvydhUE/Rvqdqy4HN+UiozASh9LWQ5o=;
        b=gvLCgYHerX35SXehreLMg0BDVdH6+v5OPYIEZKJvzA/NJkguO7wcb0t3hPoDkhFHjx
         5RR6gghX42qcy6NuahsYzp/S5EtPvaF8dNvLRGrWg9wjIa/muCxoiLbx41yzk8NVujKB
         GJ5pYc9hgzISKfRuaSTjZrCghc4odNon0qZAbmtCO2cqpURIfWhykiWl76nD0NH9qH1Z
         g2CnkhJzpcGGCM6M32vkUP4mBF24celOWMs8ltDlvVkVD7CbO0eonIdD4AZBrfsWvJXg
         lO+AhB7Nf6bHT/JB8YwcDkHedROPxSnp715BHt3UcT1ouNKmS/dutHCHy82F7sSjwcUI
         wymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJ+kENKrYstMyvydhUE/Rvqdqy4HN+UiozASh9LWQ5o=;
        b=70Nu1URKzvNlaUApD+E/28V6atEZsQJL9wtPHFdzLKe2aa+GrNyxpxYQYHgaKK1D0J
         IaqN9NpyAGrQlhVDzVHcTMbC/TmPR3MmRH0w/IzOgZI8o2kmDgrevssCEvRWjuXoRYNS
         Dl9/h68zE62EqM6nHgUpNWCaAIcJ1SyeLQTfq7aVSwSKX7hcosTEm1DOo31wDrIge5z7
         3Mf4rW7S4hFm/mWAuaeoey7/oXVLNwudPX6+XUB1IBg3wi4K2kLMoBXVqDO80LMNb87p
         APYxZD422HgQ/aZpCo1bRKNLsPGornyfR4IC6VbcNlXXKxifJfgBKiInleravWCkIU0z
         sEnw==
X-Gm-Message-State: AOAM533/JSOIoCbTa4fgWLvGDXRodLVvT38IudIWLuaKHEZHHG/Odp5D
	/B1UDbEhJLtzFgVBnaheSNXKAFCyE6aCytnWkgc=
X-Google-Smtp-Source: 
 ABdhPJxg1VvXjplwnbwksn8DCZmGQrtkxSrxWINS49W0CI9wtbn1ZiB5mtkw1Y0WuyzFyeskfMdmXg==
X-Received: by 2002:a65:4b85:0:b0:399:8cd:5270 with SMTP id
 t5-20020a654b85000000b0039908cd5270mr19057612pgq.418.1650463722979;
        Wed, 20 Apr 2022 07:08:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/27] buildtools-tarball: Only add cert envvars
 if certs are included
Date: Wed, 20 Apr 2022 04:07:52 -1000
Message-Id: 
 <168eb6b00bf332f46823773a38649b8bdc68d570.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164672

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Users may or may not include the certificates in buildtools. Only set the
appropriate variables if they're present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0945a2a5d7c41af22e222a116aafacb4beee54d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index f9f36e68c4..6b59e4934d 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -69,8 +69,10 @@ create_sdk_files:append () {
 	touch $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt" ]; then
+		echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+		echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	fi
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
-- 
2.25.1


