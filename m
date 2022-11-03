Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D731C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 12:41:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.18686.1667479287955929874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 05:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I4HsGU5v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so1097517wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESLkm6tKEVTVonu4zseOGuXhs/q/pMOVn84StOHaG0o=;
        b=I4HsGU5vUYn1WlBh0kvuG5VwW420QQnh6ieZH2YScAAucfXO9dhWwujBy/KcAaWTE0
         V+umDIvePHcvovC/HrkoXca1ulq1IZAVZVnml+CHb6YUYJIAa8mQ1Cr8xh7WcVHPy1wu
         h2Sv+Vj+bbQOeLki/nLU33z5rySwuQ2Dsx2z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESLkm6tKEVTVonu4zseOGuXhs/q/pMOVn84StOHaG0o=;
        b=njmw7EfulERvsWTmhFBg5eFqFGFMAmCslgTZdtz7mO7KIrfS09FUPJyIls1FHV0LtO
         q5wL16Gosngl/4bNd3yPCBSyzHtK6YVGRjM5VMraNiBJyOHexrvwsR00CFpTVIm7trYD
         g4r4LkfO0VRkoeg7/1Jo5nogMFXRRwNu2owltxIxSAy+dFegUrqKjf8RASkVZzwwqI7c
         yF1zU5oTBc58wXCykkC316ozpeeCWNFHmLwamh0IO+1+h+t/x3Bv5L3nOtkgdnkGfFjD
         pdN+2TEmn4KIBU8HPM7/Yag3Aq9EWqz1si0RM8ehCGY5cgMsNw61O8aLKl+nMr06DIQC
         lmWQ==
X-Gm-Message-State: ACrzQf3uQeAqJgSk9BH31qTjXRKbBH3oTdAKco63RIalv2EoMdO8WEac
	rEeBqNI6IoZ15eFtPvkLBA4SwDPG+44Zqg==
X-Google-Smtp-Source: AMsMyM7Y3GYj3DDiSeahMr9rYfODDntXCumipxQL0zd6J7T+sX3F2UOQmtSHxy7nCBTOjz1q2WexFA==
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id dn15-20020a05600c654f00b003c3b5b743a9mr29906258wmb.201.1667479285432;
        Thu, 03 Nov 2022 05:41:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b003c6f8d30e40sm5661651wmq.31.2022.11.03.05.41.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 05:41:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gcc-shared-source: Fix source date epoch handling
Date: Thu,  3 Nov 2022 12:41:22 +0000
Message-Id: <20221103124123.842602-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 12:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172626

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
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313c..cdc27deffdb 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -9,3 +9,12 @@ SRC_URI = ""
 
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+do_deploy_source_date_epoch[depends] += "gcc-source-${PV}:do_deploy_source_date_epoch"
+
+# Copy the SDE from the shared workdir to the recipe workdir
+do_deploy_source_date_epoch () {
+	mkdir -p ${SDE_DEPLOYDIR}
+	cp -p ${S}/../source-date-epoch/__source_date_epoch.txt ${SDE_DEPLOYDIR}/__source_date_epoch.txt
+	mkdir -p `dirname ${SDE_FILE}`
+	cp -p ${S}/../source-date-epoch/__source_date_epoch.txt ${SDE_FILE}
+}
-- 
2.34.1


