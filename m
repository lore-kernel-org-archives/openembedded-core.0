Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A530C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:25 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.883.1783881803758001781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=I7Y5PG/c;
 spf=pass (domain: underview.tech, ip: 74.125.224.41, mailfrom: vince@underview.tech)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-667627ae83aso3530495d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881803; x=1784486603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylsWSCR3M8HZw3y0Qd9EzvpFU7XBpR/p9T6uh8EiZ00=;
        b=I7Y5PG/cxml4v9J51JM225NDQ2dm0ehYuT64z+p13bvOAOMQ8OtLgVFJaPps5HMX3H
         pXCCy6tFm457o2JGOUB1ikgnl++8sT8AmfvyaamdMgA1oCR8xwZYXf0vSSerHSktQJut
         6Dg2AG02M6uEsR9TRGbA/qgzPov9MbrssITClaL6sBqt/LkuQxK11YTFoX2IjTzGkeHT
         w3jAizBDPrxXnGrMz6d17xGWhw9iPgwPABOdKc0kwVq3kF7HoOqryvHHDFkbcmWM7fmT
         tVjy4n3Tl3w8nNB6HfbcAPkMdWvIR/C2cXaTe4i3tNmMJiYGdUMoDMe5wvU2M0S/lrhn
         felw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881803; x=1784486603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylsWSCR3M8HZw3y0Qd9EzvpFU7XBpR/p9T6uh8EiZ00=;
        b=ITEv9l/lOUym0ZxX3jh18KFkhMSPIJHH5a3v8vzduYg1xrBpC1D2X0spYK33M88dg3
         FsOlHDgUYc953cvKvYwiTsfAdBhX6eSOFfGRFFjm2WcX712xJA9GBe4zt5LNPEjelD+L
         X6qOGYx9ZQW+B1fXop9LYyoDyoyfYEg3Vythp8BAlVJrz08qlAMV/GyDlEFjLPKcVLEX
         P4DliUiIK+QqLr3bnPu7xI1u/OLY8x2M+FY4PvTIEIvbJ65GiPUgpN6fmjLW0YU6VFNN
         pIkLj9LTdmKqpgQluAtJAN+atNH37zbW0KHWN0wFgtJ8k3EAq2wGuWZq4kdBs4QHuOGl
         23Zw==
X-Gm-Message-State: AOJu0Yx/Mo0db51GbO20I8VvVEpUg2MZ1NeuPGwmOcPMt23MD0YTG0DM
	YmXnzCjOUtV0ZUCdSmsY5MERnzBv0ggSQfaXP6H9ba3uG/uqWzjJ9oGfPm5SQ1Ve8mxT6TfpXO6
	0yatqsVY=
X-Gm-Gg: AfdE7cn0QDOoK7vDOBBfFh2XplPW3xnfxSlVco44DiUZkssnc44sPMCFA86XUdv9lbt
	qjjVAJn7OCS21jn2WBFKf7IjshYN8lu2qn3zPYCL/y8GD5+woKsuZBb10k7uajmvuXqgtR8dN+D
	WLvKbECALRf+9V1hMqAxiZJE/P8lFGdZZib5QDBa0wfljRTmBNnr/QuSylULNfe8gVZ2t21ARlq
	vSPbmY2wzfeGDNHMTvAQ5srr3rDzmbxT9N4QQYmm1rdrhMXG5ODgVUKXydnQ0ymqxHLN1Blkg/7
	VyE+09WJYzrTIyW3Iv7COAMo3ZBY4swA7YQaAwPV4F0xVHF0zcQcNRUQ/NKR6r1fnuKhS76xNa2
	Ar/QaqwLt2iYerYz/wSrfPGSj/ji8+9I6vgRPzKJEy3lzPpKSwU7LaCEfdsz6cSQLARyTOTn0e/
	vsOasy/VTt/CkDZw==
X-Received: by 2002:a05:690e:43ce:b0:664:b559:d504 with SMTP id 956f58d0204a3-667d7a945c0mr3526552d50.9.1783881802810;
        Sun, 12 Jul 2026 11:43:22 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:22 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 06/27] packagegroup-self-hosted: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:46 -0400
Message-ID: <20260712184307.3259642-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240796

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index c386267781..16835e60df 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Packages required to run the build system"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
-inherit packagegroup  features_check
+inherit packagegroup features_check
 # rdepends on libx11-dev
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -51,12 +51,12 @@ PSEUDO = "pseudo"
 PSEUDO:libc-musl = ""
 
 RRECOMMENDS:packagegroup-self-hosted-host-tools = "\
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
-	"
+    ${KERNEL_PACKAGE_NAME}-module-tun \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-raw \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-mangle \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    "
 
 RDEPENDS:packagegroup-self-hosted-sdk = "\
     autoconf \
-- 
2.43.0


