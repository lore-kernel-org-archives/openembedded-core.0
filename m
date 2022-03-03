Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D440DC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:33:33 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.9113.1646300012471234484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RwEKHmB6;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y11so5276951eda.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bAOHlK31vUFjlpUNFnEkqceWJdmkmiy/t2IEsetRNfI=;
        b=RwEKHmB697v2bt+uQvdDmpiSfdiJUcW9eSpa5+p6NOvJ3q+yX5aUAJK4AY1oNowp+Q
         LYCL481zKFezfHb8T5FFLGSGN/20GQILPqmBswa+MDLcaZ7qgXXkYYSKhnPg3uK9P8Q1
         FDzMnUBCWls63kUPAOOlfhilkfUExbQjA15W2aHOGTllmyFCv14LMvy96M70MWSoYVz1
         /+zrTQiZnanmCjByC1sD75AhMEAUD0lEeetJVoU1q7npa7n27yqcIv/shOIg5Kr5d7yz
         SU8LiNLbGHOcw2u+NbnNmiQmnv9coJ9QsA6RDGaHM8JOXyuYYuhRWB8WuJcBNqV0O0Xd
         WdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAOHlK31vUFjlpUNFnEkqceWJdmkmiy/t2IEsetRNfI=;
        b=jtTzhdDu/FCMyNGQhX9dgm6b0Vsd9dK8wCP7wNeLQO45C5D1cEg1TmEsThjdUu7bR6
         /uo1YTOWoM0QnSj8wcfV4vsShD4c/LNRa1CQaMIzN4wi8CkbV6x3iRel5l+VGgd/ahrH
         Fzd4PNx3mnTg1yHVT1df6TMXsdZrv3KEQXghvfKHxf29hc31fh/ggRKYMohyr0l2tkio
         llK9n4TDPReysQjHZs9KWvSYnO63FAQUKKKNQKeYTuMGl3Tlt7qayUOWQ4WoH9Zw5HNL
         0mX/frEO7HRBwSBhmRZUbP+nfT+FZ0uGPYYTGj6DWwdKXKqIYW+byWLJ79ZgB/N+PCy2
         DEcg==
X-Gm-Message-State: AOAM5303QQFVsPKEMydXaXZYRBn7PD7clOdRKDcSVqwZRYfnP/ql0/NK
	D9kYeikI4V4dpfs1no+ama1cb2SZaaQ=
X-Google-Smtp-Source: 
 ABdhPJxQO4wFg3Xfi+XJ3XURZwYJEhDMhUil5+mQtzaHWshO1DjGbZyvN9oWk/1nm5C+JyW8YS+0ng==
X-Received: by 2002:a05:6402:1c03:b0:413:3ff:91a5 with SMTP id
 ck3-20020a0564021c0300b0041303ff91a5mr33056507edb.139.1646300010946;
        Thu, 03 Mar 2022 01:33:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 fb21-20020a1709073a1500b006da6eefdf11sm504650ejc.49.2022.03.03.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 01:33:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] libarchive: correct upstream version check
Date: Thu,  3 Mar 2022 10:33:23 +0100
Message-Id: <20220303093324.1663870-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303093324.1663870-1-alex@linutronix.de>
References: <20220303093324.1663870-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 09:33:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162639

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/libarchive/libarchive_3.6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
index 31bc82515a..f078c8ad03 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
@@ -33,6 +33,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
 
-- 
2.30.2


