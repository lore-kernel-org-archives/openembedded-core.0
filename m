Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B038C04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.8986.1690468599193203425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P+ozJ5GV;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so1814607e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468597; x=1691073397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpOHiShsZ6Q4PY0WpPwM694cVKXpLwq0M8XwWaHdTfY=;
        b=P+ozJ5GVyJrLojxjNGskxdI4n0Nsxu7UjdkXuSdnl80czDT7u6oLFgeBDGq3JEt6ea
         VuNFKsSYnbPBNiBKPVr8ga7miqyz6Ux3XTV4zk+S5PXLMQVEoU4RLypid2YUaV+2crMq
         3NPnbk9ey6z9svPC4TqmjbmitBQRo4MoW4u+YWhxeY4SrXTDh50LLrgykCJRjWkKM6ub
         9c97J+zHPNKYVVyruNBlckCjzTRb03LxXNGn17XXbuVlR7mIrO1ojVsV281gfWNibWhN
         c+789HnRODpaScwYOV5vkl2Js1jjO/VHNmPDGLyzyozQ9Z1VI2OewDlMgWve81Fy5iNe
         K4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468597; x=1691073397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpOHiShsZ6Q4PY0WpPwM694cVKXpLwq0M8XwWaHdTfY=;
        b=JAWny9Yy5DHecANFPeET/OGsBcmp7xsIroCEZ6spX/YVXpUIcYmWF1UjrDHAz0ZXDF
         vvJc1irUzeJUa5dMjkWpZXtKU/nSIuQWgwYda18WOkiYPMHafYe6GDZ0f5LL6iAZ5Y6E
         RmLcTssG6wjc9XZTL6nhobz3ZpMVUt6jyIobGLe8ga8zotryzf88YK4pKbkW/x98Uy9c
         qa7ytb55p4HZGeGI3dNV/0P/97RTeUna/jCaWTChjC7q7Tvg6NN/n70SsSmpJ/BuvqJ5
         3dmXXJx2pe1VrvpzUxCF97vt7Gat3iRZId27dpSqQTbomUc6z0VrLctkciuQFgOaJMDn
         1yqw==
X-Gm-Message-State: ABy/qLYwRcd8LC2FHBzGJv2rKeyJH+efe0X3WrJW6nL5zxhWVvgk44ro
	uhBWlM4Vex8e7TgPlyoyv8Czk9Iq4J8=
X-Google-Smtp-Source: APBJJlG5yYGhh58VHXzedVYY4S7BVbYw9SMhoIagoC3V40Yz0spKR/gUz6kpPaNc0mf4t+8MtS1R7Q==
X-Received: by 2002:a05:6512:ad4:b0:4fd:faf0:6591 with SMTP id n20-20020a0565120ad400b004fdfaf06591mr2398258lfu.10.1690468597273;
        Thu, 27 Jul 2023 07:36:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/21] jquery: upgrade 3.6.3 -> 3.7.0
Date: Thu, 27 Jul 2023 16:36:19 +0200
Message-Id: <20230727143627.3718496-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184953

License-Update: needed lines shifted upwards

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jquery/{jquery_3.6.3.bb => jquery_3.7.0.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.6.3.bb => jquery_3.7.0.bb} (75%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.6.3.bb b/meta/recipes-devtools/jquery/jquery_3.7.0.bb
similarity index 75%
rename from meta/recipes-devtools/jquery/jquery_3.6.3.bb
rename to meta/recipes-devtools/jquery/jquery_3.7.0.bb
index db4745ad7ab..eceed9c9dd4 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.3.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://jquery.com/"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=8;endline=10;md5=9c7c6e9ab275fc1e0d99cb7180ecd14c"
+LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=5;endline=7;md5=9c7c6e9ab275fc1e0d99cb7180ecd14c"
 
 # unpack items to ${S} so the archiver can see them
 #
@@ -13,9 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "9d02ee01919145c20b03ee9d3013af7118793dedf5d2c0696a773af90066c953"
-SRC_URI[min.sha256sum] = "a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575"
-SRC_URI[map.sha256sum] = "156b740931ade6c1a98d99713eeb186f93847ffc56057e973becab4d037ed53a"
+SRC_URI[js.sha256sum] = "265a924c42de4784cba8fd0e1bd77133bc833ea5f5a31fc77e08922c18fcfa43"
+SRC_URI[min.sha256sum] = "d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8"
+SRC_URI[map.sha256sum] = "cae47e834ee977975a48c851b165cc52ea916cc968ba7d280b1293f573cd1a48"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.30.2


