Return-Path: <mickael.laventure+yocto@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D388C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 16:45:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1742.1632761156364096548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 09:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KCpiarbs;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: mickael.laventure+yocto@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id n18so18304931pgm.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wq41/ZI8qUp5vSz0gzB+XQ1XX+3XEl+lRSYrHJCBTMc=;
        b=KCpiarbsUWIqJpTpT63O4tqFerLcrDMKN/CF7ihDn7pl7wIg+imuumeBKua6Fv/vzE
         fCzWwEO/K0cHmcntiutaXrssPzHFSszEKUz7yheibbgoBrPbwNsh09VNHTCyZF+Pb758
         LX6Zlj8yJsQIsTaghXSCuExcPUvw63KPGhjWRePwMSKdDi+E92jmkVTgotrhqaAhVJjQ
         8Yc0NN8NA6j9yyH1z81Hcpdf3ZWaBGAhQKyoB8j0PNiQnUtsdU2gAE1UNnpE2LenQbPh
         yHb5ouTubJiE3bRorB2dA0U+VmUqPPyjZyVsolevz/Os9PAiXRUJP+IpSvsQuN8906Gv
         wafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=wq41/ZI8qUp5vSz0gzB+XQ1XX+3XEl+lRSYrHJCBTMc=;
        b=VfoDDb+flUg+J1/j/K6YvOsQcAElkJXMKkCkhmAE/dQZuwQXYknLzy2yD/uVKoTdXj
         1BhwFZrUkFINTRvQgfRSPwMtCRrKPc3Af7dOhOVgUQp3IBZ9SVp12ZehedDu08Q2KaeE
         FE9Dce/9Q93WmND/ydcK+7S+mj8a2+vpo4DPqF8n+BL1ExhHBixo0eqKpcclJD7SauoF
         fxLFIBq+cj52of6YbvbEmd3w3crJLQzLxP/whEcOzpE8D5MlWwQAlik35vprfgZC5IgO
         EXu6V+bkwL6lF5yHUW8b1Doctl8/UrSUa6w9xFm1DdEjVKlIYJlu43Dp4J9V58aChCRZ
         skVQ==
X-Gm-Message-State: AOAM533lMEofd4/31T+1KST3NM1O505b5TF7DVKBpkeUY2yfa5RT98PP
	VpUTubxQLAciNmcTfXl+/yseUzY6Nxxgjg==
X-Google-Smtp-Source: 
 ABdhPJye0vo82GUN+TSSoAEknjau86lLPPaG5tqvXTROhSW9xOercY9k5D2eoFdHG9C1c8d8wB8mPQ==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr566522pgh.190.1632761155562;
        Mon, 27 Sep 2021 09:45:55 -0700 (PDT)
Received: from kenshou.rds.amazonaws.com ([192.248.226.197])
        by smtp.gmail.com with ESMTPSA id
 o14sm18031907pfh.145.2021.09.27.09.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 09:45:55 -0700 (PDT)
Sender: =?UTF-8?Q?Kenfe=2DMicka=C3=ABl_LAVENTURE?=
 <mickael.laventure@gmail.com>
From: mickael.laventure+yocto@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Kenfe-Mickael Laventure <mickael.laventure@verkada.com>
Subject: [PATCH] package_ipk: Use localdata store when signing packages
Date: Mon, 27 Sep 2021 09:45:45 -0700
Message-Id: <20210927164545.178613-1-mickael.laventure+yocto@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 16:45:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156391

From: Kenfe-Mickael Laventure <mickael.laventure@verkada.com>

When signing a package, we were resolving the `PKGV` version using the
original data store (`d`). However, since that store does not have the
package name in its `OVERRIDES` list the wrong version can be returned in
recipes that produce multiple packages. One such example would be
`external-arm-toolchain.bb`.

The above issue is fixed by using `localdata` instead of `d` when
resolving the needed variables.

Signed-off-by: Kenfe-Mickael Laventure <mickael.laventure@verkada.com>
---
 meta/classes/package_ipk.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4fcb25ca70..776fe8ed23 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -230,8 +230,8 @@ def ipk_write_pkg(pkg, d):
                                 shell=True)
 
         if d.getVar('IPK_SIGN_PACKAGES') == '1':
-            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
-            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
+            ipkver = "%s-%s" % (localdata.getVar('PKGV'), localdata.getVar('PKGR'))
+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, localdata.getVar('PACKAGE_ARCH'))
             sign_ipk(d, ipk_to_sign)
 
     finally:
-- 
2.33.0


