Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B676D3A68A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.1935.1730228407180739202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OP/8Q3mq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso134128a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228406; x=1730833206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mwd/w882Sdr3qMFECof4kEIVvr2DMGLbbYTuw7zwNIw=;
        b=OP/8Q3mqSXh31Ujg57Dqd8/PbfIep/NaI8+wEtbttme1Kao+rcq9Ygbnw3uA+6z+59
         EyltSSMVU7LgzE4amMON+zZjWejAVKoTyMaCdisarCSDzZSRK/BfFC65Airxg6N12usR
         JhKYiidxzA/VMrCeWQXxIE5URm90W/VWKq8hbaynkye6wRnuEkGo35PyxP1nt2/ZhLJP
         QkLrMOB12dBLh18jR06qllpYTKf3ReiKyiboqCDBt5Mxqp1KvA+EB0DsmQUek54ntvmU
         fUeguYVOr5l2QRLohZbchYRvXuLx0uOGqvKafFW+8iCj/gE95JmjLjERYSdjgqShCPVQ
         b9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228406; x=1730833206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mwd/w882Sdr3qMFECof4kEIVvr2DMGLbbYTuw7zwNIw=;
        b=nEL7zEmD8R+af0z2xT4XCXbvjrsv8YMbqFzFjIODg5X9L1xcneHK4awdFFR8Cyzp1x
         41HPNA7G/NDj04LoK6mHOufNtf0RA2h8WnoouyzGg9gTBW1ug4pYEIld+1Ik07GmOAAo
         6erx1bhb7/44LPLU6JJyziL22Yu3kTr1SxohNSBis0iH6to0ieiuj8lhsCnnhdQar5Fi
         5dkflgycXOKlsPKEtvbxi4Vh1zDF51SdN/kNDrmeJVytwIPPiIYl8QzZFskmSxl0mi3P
         6hxnw/DK6UBmjG4JqEfrNHmymC458TTOSI2EGpqVnLhgAEabeSK6OYcGQog2OTdcLc59
         Dbow==
X-Gm-Message-State: AOJu0YxL70R12nO+z5440iD5WbDOJt8iaOJZNL7dqiUpKuvVJzJwU+7l
	FDGvBHesIlBB4mSVoKeikbMEPGOzj/FDRrH+qH2isDRq+LJ+8Tl+rAuCIzmcat+XVwU3uKEu0eT
	n
X-Google-Smtp-Source: AGHT+IG0lrz2t7PpNdtaesWRs3xnn+KKXDBhKXX8XPqseQY5RvypFARea1tiiyKflOQQv199b2gFig==
X-Received: by 2002:a05:6a20:6f01:b0:1d9:1098:fab4 with SMTP id adf61e73a8af0-1d9e1ede29emr5223854637.5.1730228406390;
        Tue, 29 Oct 2024 12:00:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] python3: ignore fixed CVEs
Date: Tue, 29 Oct 2024 11:59:37 -0700
Message-Id: <2cf10084c56c83da3deff4e65e619afab80e08e1.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206514

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in 3.10.15

Commit 487e8cdf1df6feba6d88fa29e11791f4ebaaa362 removed patches in favor
of version upgrade, which caused the CVEs to re-appear in reports.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.15.bb b/meta/recipes-devtools/python/python3_3.10.15.bb
index 4157b8cb83..0eb619dfa2 100644
--- a/meta/recipes-devtools/python/python3_3.10.15.bb
+++ b/meta/recipes-devtools/python/python3_3.10.15.bb
@@ -63,6 +63,8 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
 CVE_CHECK_IGNORE += "CVE-2015-20107"
 # Not an issue, in fact expected behaviour
 CVE_CHECK_IGNORE += "CVE-2023-36632"
+# Fixes are included in 3.10.15
+CVE_CHECK_IGNORE += "CVE-2023-27043 CVE-2024-6232 CVE-2024-7592"
 
 PYTHON_MAJMIN = "3.10"
 
-- 
2.34.1


