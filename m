Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01691F364D1
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:08:36 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144057.1775772511473677347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0sQCXN9L;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15501655e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775772510; x=1776377310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh1S4I66m4GVSBIIy1BtX/Md276XqDavCSzcnFAEIKc=;
        b=0sQCXN9LhnFAib55LdcVJmyw4uz3oUE5AqzV4RnGzXahpEQ6jRq/V2KRs/2hplziVn
         OLVGpyR8MUYQCEY8uEDFwi/Xh5nzAw6cEanPxSfWPYo8oOSQe+DJsPgDnI8iJvy7hUW8
         D0gE8TyfCBFZHLz8kcetYEqgmQ0vuROB0KJ/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772510; x=1776377310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hh1S4I66m4GVSBIIy1BtX/Md276XqDavCSzcnFAEIKc=;
        b=YK9RtfTCV3vvqO1vDlJER2u27DDXXvzUcvejP9F3AyO1VS/17acs4XPRn+f+tspuis
         QadY/7AxYK5dCRXsLg3rrN8uT3pPlQ3XZmris2gZvBkBQicpJVEfw4lF3/sjcpQgfput
         MtwODR6yEMvQzgg+KvNJenqgFcfk7pdhjMbAcix2OvVnltgQOqz/X1BeWdX5LFR21gXP
         NOFZbR+oSmMvgbSFcOaJIUMpAr/wVGI12qkVntNmkDRSTilOgDb1owAKKMDi4HDk3Veu
         ci/d2uTnM0Su/7egAPypGJQLDy89Mc1PnLrHrq76El8N2BGYI4fAd488E0V8hg+PMPRi
         jy9Q==
X-Gm-Message-State: AOJu0Yzy7DW5GBOkJVZvMoG0LYMHUNvsNVCsNvhVfUDqFF9byZ+8VTOh
	wiN8ukaFIXpa1AsN3AMSJmbdzGsS3/CGq2b36c7G0mS/84LODoon6ry6sFfyz5hm5JUa6jdepqK
	9EXBfSvz6JXyE
X-Gm-Gg: AeBDies5GySmf5bi3B4tDFc4LPUqoPOXGdtZgrfGagPEStMhKYVBXnIgrVweeeVfmuh
	rzWV7FNFaUXu28prbSrujs9p8w/1VCCpTFg0tjzLgQcaDfrfBqXNhtyhZhCUXbNvAXYIrdzNd9G
	nL8z3P2znF2G++RHHJtcTw3fSXyjCcoMxWESLx/LnLJD7pTK3cccN70ynZbacDrvz40fddGu/SQ
	ZktQfeYlbHP89K+/DTekKkkXKuhzZW/aIPVPv/tM3unEv/I6GIdz3WZSAdAzS0Y0WI7xD5zQfOS
	nStBd/TpAEAEacjOS3wONHQoybUP+s+S41gyfAtq85COB1lkOv2+3mBklFr0WHU/WrV0XIssJ6W
	ZAONB4Ie3rZJczQNqYjzZvIG6itu5EmjfcMza1zGMbaVHyuB5/MEamAW0MG40CSfwSse9jFUUxa
	c+TtJHuiBQZhYHIUvlAmhOfNjut++V47YdTo8G7oc374e4n/mfTrc7RrX1wB6lOwhK0vY2PrN8H
	EuBizQHochcsbf1QpBIvUXAYbM=
X-Received: by 2002:a05:600c:1987:b0:488:b187:d8ed with SMTP id 5b1f17b1804b1-488d67bf765mr6269475e9.2.1775772509511;
        Thu, 09 Apr 2026 15:08:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm22123045e9.7.2026.04.09.15.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:08:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [kirkstone][PATCH v2 2/6] oeqa/manual: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 00:08:15 +0200
Message-ID: <20260409220819.2427583-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409220819.2427583-1-yoann.congal@smile.fr>
References: <20260409220819.2427583-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 22:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234954

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/manual/crops.json                  | 2 +-
 meta/lib/oeqa/manual/eclipse-plugin.json         | 2 +-
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops.json
index 5cfa6538432..cf6d19e6bf3 100644
--- a/meta/lib/oeqa/manual/crops.json
+++ b/meta/lib/oeqa/manual/crops.json
@@ -276,7 +276,7 @@
                     "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n"
                 },
                 "5": {
-                    "action": " 4a) git clone git://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
+                    "action": " 4a) git clone https://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
                     "expected_results": " This should automatically create the recipe npm.bb under /recipes/npm/npm.bb  \n\n"
                 },
                 "6": {
diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index 6c110d0656e..6f655a2ba90 100644
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -246,7 +246,7 @@
             ],
             "execution": {
                 "1": {
-                    "action": "Clone eclipse-poky source.   \n    \n    - git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
+                    "action": "Clone eclipse-poky source.   \n    \n    - git clone https://git.yoctoproject.org/eclipse-poky  \n\n",
                     "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
                 },
                 "2": {
diff --git a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
index 29d11a87d5b..3d1dba447b3 100644
--- a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
+++ b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
@@ -10,7 +10,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone git://git.yoctoproject.org/poky  \n\n",
+          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone https://git.yoctoproject.org/poky  \n\n",
           "expected_results": "NA \n\n"
         },
         "2": {

