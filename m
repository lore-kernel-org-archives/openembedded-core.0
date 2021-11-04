Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC3EC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:03:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.12061.1636034580658607822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hujiv0XE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id u18so8796210wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qn+NGZGz1+pePRM8k7l3Cfxbsrp9ZrtXD2VlN18iUXU=;
        b=Hujiv0XE6sKzrqOZaEsNQTgFTwFiycNOsvk2v5w/dRnb7u4595mYGZFZrGve33Zadu
         sMBA5tFD1k9pjCZq27q46uQVDB2PJeBLaIk2jzqgBpJQS2JqtfxtavXXTgdxOHYueYJY
         uf0w9vmAavmtAaUk/kzw5T3Knn/Ggx5FXkXcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qn+NGZGz1+pePRM8k7l3Cfxbsrp9ZrtXD2VlN18iUXU=;
        b=pckBUzscIcwdD0lLqnHPwL0fm2RPcVcRbQ3KmjMWhRXC2BcESqScjjwji/XHQ1W0zr
         Hesp/7ZeTDLRRA88lQn2mUkuzeXShRy0qdCPWKtaI9iWzcCGm/MEEDjK6T0Let3yX3aG
         eqwUxaIG6qS4ACjpOTSDjaNpHwHexdoq2vnYKva8lgrGGIdgiFjeSnT7wCaewpRIzt08
         NrT84qqj0EdkuzUAaDu8ufBN5HlnfdxbM+zgW/tIaaFATEzw7iLfTuzRSiFgG88ty97N
         X0ZCu8wLAK68kojW+Jv4AV/Cl10fqGw+HoOlfWzqdzgUzdkudy18S/aWB9kyysIs2iDm
         nLIw==
X-Gm-Message-State: AOAM533+gPF/dak8J4thpKFh+UZJzcpgnToeSYSyk83ESkAt5HCoR98u
	xZmPjHYnent3yVpjZswtPq2Qi2HAMmavXA==
X-Google-Smtp-Source: 
 ABdhPJyWC6vSD4x+z6MRljueWuke+3NobK//fGBkJ+mn1WAxfjRVPwNsrogTX0e19ZnSTg6an9ceGQ==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr31666975wrc.204.1636034578638;
        Thu, 04 Nov 2021 07:02:58 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2578:3d9c:c55b:5282])
        by smtp.gmail.com with ESMTPSA id
 o12sm7112086wrc.85.2021.11.04.07.02.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:02:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] opkg: Fix poor operator combination choice
Date: Thu,  4 Nov 2021 14:02:57 +0000
Message-Id: <20211104140257.3622680-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 14:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157844

Combining :append with += rarely makes sense. Improve it to use the standard
format (and tweak the implied spacing).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/opkg/opkg_0.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
index 2760fc58786..8af047a51ff 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -60,7 +60,7 @@ do_install_ptest () {
 	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
 
-WARN_QA:append += "openssl-deprecation"
+WARN_QA:append = " openssl-deprecation"
 QAPKGTEST[openssl-deprecation] = "package_qa_check_openssl_deprecation"
 def package_qa_check_openssl_deprecation (package, d, messages):
     sane = True
-- 
2.32.0


