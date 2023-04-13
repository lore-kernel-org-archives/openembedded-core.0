Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E98C77B78
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 09:16:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.8161.1681377372739407905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 02:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=LNmkdRJg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id v6so13494505wrv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681377371; x=1683969371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLHIsSRGAJnNyaYCSpFG01ZFDSgWH/7g85Tp8EgU4/U=;
        b=LNmkdRJghzMB3Yzp4gWfwxmo7OoC620g31I4tcGxPcXb4mFcCS3nMHVPcnc/1qtDFH
         JBXlQLt3Y8RMetXBZ4WjFTSDxMfkp2eUmDnwH1o2HVGeWUYDU14WqXwBK/30drry6qGf
         2/PPIk83eSJlC8LnswwfgOsHW+qHrGof0C+13KEDPvKwofMVFyNzjef8nBOnxLKWLNFb
         6k9k5R3rmUrlUbvhEHEmD8KYS8rBTA9k0X+u/0G9zKX5sU0OGkMPgrSe7RuxvOyXtrmS
         C2FK/Vt8U2McaA1xOS6B+Q2N89Ey7oBUsWdj7hhsGxyCs4JrGou48617BFtLYm4ETJno
         Wvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377371; x=1683969371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLHIsSRGAJnNyaYCSpFG01ZFDSgWH/7g85Tp8EgU4/U=;
        b=N2uedM62yN5Tv2VFEw51aI4Z0WmO8RFNEUNjd3P5A7iyi/XUJcc+VNm1LB8cHu3/ta
         dpkEJS0rvol+C1i0UFBqTbL1oTfo1Ngr/bdq09iYt/Yjpb09WHJWyx/DDz5TtESDQJL0
         I74D77wdu8+C9/9Ud0WXHaEDZk5k5Y5idsCW3mIF6NDF5VUyQqSv68/KsIdkPkyT2R3f
         MveFjNw+72jUL53PqHJmRnqCgOAIHasN2rd0yZ34KCFwCWsJMUZ1QEDE7BvqfTVLiiEM
         YU9gejepQTKxdNsP/4H27X8JY6SsrvMt0v1XM0Cm9XsZNEafH0WuorqLAlXrtVjYB/eS
         S3cg==
X-Gm-Message-State: AAQBX9dncKb/aV9UHR4n7jOcjc/uhh0KqkYHRuCyr3WygWbAF/1AnWXY
	sS1I3uRL0KPFDjX4xEI3sHg7x7/V55n1VouThfI=
X-Google-Smtp-Source: AKy350baueh68gsY0MNylG29AbiigwMBHVxg7VSZEHA2Jql+GDLxh2ds06QSH2ngsQe+hR4B5QyI3A==
X-Received: by 2002:adf:f98e:0:b0:2f4:cfb4:57f7 with SMTP id f14-20020adff98e000000b002f4cfb457f7mr1024032wrr.61.1681377371276;
        Thu, 13 Apr 2023 02:16:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm851479wru.20.2023.04.13.02.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:16:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 2/5] python3-packaging: add missing run-time dependencies
Date: Thu, 13 Apr 2023 11:15:54 +0200
Message-Id: <20230413091557.10659-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413091557.10659-1-brgl@bgdev.pl>
References: <20230413091557.10659-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179963

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

python3-profile is required by python3-packaging at run-time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-packaging_23.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.0.bb b/meta/recipes-devtools/python/python3-packaging_23.0.bb
index 7b69c880c1..c3d748911c 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_23.0.bb
@@ -11,6 +11,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Bootstrap the native build
 DEPENDS:remove:class-native = "python3-build-native"
+RDEPENDS:${PN} += "python3-profile"
 
 do_compile:class-native () {
     python_flit_core_do_manual_build
-- 
2.37.2


