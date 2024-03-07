Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A6CC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 22:33:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7151.1709850789638623745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 14:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a+EGKYjV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33e70d71756so426886f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709850788; x=1710455588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GmgmytdUCjmB9cWtHoDdQ/Wz5/GdPnE4N2AHtADV1A=;
        b=a+EGKYjVCD5smEcFlNt4THL0jN3tgXt5+0YeCITS2ZfP4h2oicM3mz0VgU5Be2k0J4
         HAvf1770Hm4ek8kmVwGVo9dYSYmQHwy4zyrhByzM5m5n5O65FxrDj/KPJsCFqzs/eiap
         tVunj5ZcQa6aRDnQkKkyPk3mUeUaNcWPJMkQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709850788; x=1710455588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GmgmytdUCjmB9cWtHoDdQ/Wz5/GdPnE4N2AHtADV1A=;
        b=f+v843qGM5Q/sLkHAQKAueeVshww8m91rmBBBjU3Ioln9zjKYuoOtnMK2uFUG54C04
         E2Tu4lyEQRjfZOYbg/49AKkdRntyoyahYpl0mwY4WYwoJQRtvkQnUdIW4eB0Lpy2Yq95
         CN12iGmOqnf5Eb3hqwH/q3DoQQFXvN62p1R3jWyUyALwNq+qJfxGYyHxsaGjCgMFJF+5
         7O6Mo5a7cLO7zJZLaw2XbT0NdWLFCK9+Nzhs2+3yG2/QFEmJuYY9G3EvN1lI1ZcghIfT
         gr0N1uHjii03F+9zpB2FhyZPsJgB7tyyq69DEDMyWy1vpcsVTPS0ZtRo2yeBt0P3sHJX
         y6KQ==
X-Gm-Message-State: AOJu0YydVV39VFCTVzbaEfhDw9vWcVyGN4zKTj2AiBQJhoqJHIoWYK+d
	zDvO2Ll9iFmeY3uglQrIR574wFNqqu+zDcTXSKpdsl/DVrgkDVtObZKZ9vvlWyHFm3+v/nPPMdj
	t
X-Google-Smtp-Source: AGHT+IGDuuSTHlL4RuTWIOqBvs3Ivu/pN3yzPWRu3bqBkqdL12QsESJVrjReXv3bz06G/ZwLfzpiCw==
X-Received: by 2002:adf:b1d3:0:b0:33e:1ee2:bd18 with SMTP id r19-20020adfb1d3000000b0033e1ee2bd18mr2650948wra.22.1709850787674;
        Thu, 07 Mar 2024 14:33:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd0d:9fb:2ae8:5152])
        by smtp.gmail.com with ESMTPSA id g1-20020adfd1e1000000b0033e3a24f17esm12873262wrd.76.2024.03.07.14.33.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 14:33:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Prepare for release, drop nanbield LAYERSERIES
Date: Thu,  7 Mar 2024 22:33:04 +0000
Message-Id: <20240307223304.2386241-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 22:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196824

As we're close to release, drop compatibility to nanbield, people
have had time to switch now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 2418ee7d53b..62f86f361ad 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "nanbield scarthgap"
+LAYERSERIES_CORENAMES = "scarthgap"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-- 
2.40.1


