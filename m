Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB7AC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 17:31:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.1367.1667496682425562084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 10:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gHOWU+I2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l14so3851479wrw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgYLU1HQElFdZegwurDB1EBppE8aqa0krTkZo6KJ1xU=;
        b=gHOWU+I2XY5DI6tWm4Mp58WW1E7cvlTYVjRPLfj8ORb6QsP3KAxET9VWe2/z4T/Y1F
         OhV/LWCgTnUmj8sHQI2/cV+9AZFMO4To6GttzFZ5HQcb6lEBdCMAIt2QENLDP/tmBgv/
         +tMbOK8Ko9G0dmdNxYYUDAWqsmOyn1+y67F0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgYLU1HQElFdZegwurDB1EBppE8aqa0krTkZo6KJ1xU=;
        b=erj2vL/RS4+MOJw2Hge2Ib3HMo9xR0RMyixMdbfF1/KeJo9MXGll7z6e7AqPqxuMVL
         eF3y9huGg9meQsFlz4bs4JwVsF0EWx6cyj7s6GL2ZrNZIdGoURxWWiO5gXCqX00pNeWu
         zez6ZDdBd2ZYLRWqL4LMFHAO6fpXniBONF3Gg+MTefw8Z2MOQUkdsJNRanXcl63WBH8U
         WYTnRsxl3dg4sDpWQ7qNsOfV3jchcnDxE5jLk596wRADGhObB2gNYNfAdsNhDXMvMW8r
         ofcUBVBpFX3+gpp9Q7Zb5rBXJ6XdM5K06YEV15qNMXSy8w11RN0KpY5w4kkUckHTyV3U
         oLxQ==
X-Gm-Message-State: ACrzQf3uqFF5Ts1BDs8GBhsFZ6mLO2xesIiGhGXMC9egrpn7a9RZfrm2
	XvMavZiMBTh2W6+yU3T91Hf9O75ztHGc2g==
X-Google-Smtp-Source: AMsMyM49WOj69S+Mij5HHy6koQXmfGMa7TrTrOrwAZlqfyojHVyurtkTZFMdRelpgDcP413e1s3bBQ==
X-Received: by 2002:a5d:4410:0:b0:236:a8f9:268f with SMTP id z16-20020a5d4410000000b00236a8f9268fmr19856411wrq.405.1667496680034;
        Thu, 03 Nov 2022 10:31:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c3b9500b003b4c979e6bcsm605036wms.10.2022.11.03.10.31.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:31:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gcc-shared-source: Fix source date epoch handling
Date: Thu,  3 Nov 2022 17:31:17 +0000
Message-Id: <20221103173117.874301-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 17:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172645

The source date epoch for gcc isn't being transferred from the shared
workdir to the current WORKDIR for the specific recipe. This results in
the clamping code within sstate.bbclass using a value from 2011 which
changes the timestamps of many files. Since this happens part way
through the build, if pieces of gcc haven't built, or build/rebuild
later, we see things rebuilding when they should not and for generated
files, races are possible.

Fix this by copying the SDE from the shared workdir into the recipe
workdir.

[YOCTO #14953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

[v2: Rework to calculate sdk_file as Peter suggested]

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313c..cd2e3410995 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -9,3 +9,13 @@ SRC_URI = ""
 
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+do_deploy_source_date_epoch[depends] += "gcc-source-${PV}:do_deploy_source_date_epoch"
+
+# Copy the SDE from the shared workdir to the recipe workdir
+do_deploy_source_date_epoch () {
+	sde_file=${SDE_FILE}
+	sde_file=${sde_file#${WORKDIR}/}
+	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
+	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
+	cp -p ${S}/../$sde_file ${SDE_FILE}
+}
-- 
2.34.1


