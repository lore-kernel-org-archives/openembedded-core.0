Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD625C282DE
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:58:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11449.1741355931884604541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BlniTk5K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224171d6826so6419285ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741355931; x=1741960731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+95GL6OCGuKTpC2XsXIVWT+IB0ZZQDGvUpR3wy+RG8=;
        b=BlniTk5K1+0aPPDRcPGZAWW13bkLygAGpEQpLe7BDHAOOPvN4z2+ZSTqk1ULn0j8l8
         KwBQl6umj9KT/tHIXGDvUzXqR4zmVU5DIk9DPaoOmTDEpfQltbJJEzqr9ErTWUlbLmXq
         r3KbDm8QAlpMwB3VoJuP4Bz4exDEkWdRddDEdMSelXE+rJZ4VHUYF/16dKrGck4bjT5F
         1C2MZDFCp2mD7YbyvA41shj0RIBUELWSPC9eQP2YvGV8uu7/DpsALX0Hip7hm+HLO1Gr
         GbpxA3MbMlY9VB2g1q4o9wwuEHA3WHCDy6lFQ9hYfwW0SMV9sGu5kuImruEAok5lNA8K
         ayKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355931; x=1741960731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+95GL6OCGuKTpC2XsXIVWT+IB0ZZQDGvUpR3wy+RG8=;
        b=Da878A1hBVdGaS6511979U1h4dCv2ky+bNyOwWjddK2fYEWzCuGLvM6Z1ElnkwuLgy
         SRTQICq1vSpWfFoRrjKh5KFEaEzjMMmqnMzoST2Oha7EIsVALN7bLQNoHkj7Ce6F3j+S
         QF3EliY3ULqlGX6pjQAXU89p+yWzAmU+5Sgs0zDxmp36Qm0vuRDjmRs7+mDPSD2W6ijn
         Q1PRhSW/3fMr8KNgA03FyneoRfYmhITvOIIvFkdgtKx6ChGBzWEAhMOIOCnbbXTYDlVr
         6KBjs1frWDSNZuhY7hdHqlYTO19b6PGxgDKzi4xmshXTdd+hEAEXm0I+NoaRWkEOXOGY
         FRYg==
X-Gm-Message-State: AOJu0YxFP7y24XtNVLAkoH7P6FQ9S4inkJJPaf063DVb59Qcl2cpNifD
	4KBWvU/G9LtJX2NEinciET8bfIBDdX1Bfr86qw1Vo5U3ogi0xshtS2DVl2j+PzYAVG1fTI/Csil
	R
X-Gm-Gg: ASbGncvGLED1IYQmaCdKN/oStFBuuTySAxhWLpAA/lHl3o+cuuxYb65R3zS6skMSk8w
	QWAJh9gK53lcTYRJ0eo9G2dUJEr0hGEYCLXxDGldUn6Wq6nUZAFovca57hhd1YWGHD23lTbo8QM
	kM9lLFYfoxMalfZxEgQQXIk42D3uaCWINsxmIysczPYNSryev5JqkaixM8EMFJSx+LioWcWSfuj
	+At6Z8lVVon3MwGmYAqeeFPZ+WMmJyuAA1SfoT6hBr7tcOjaGJJWwljqL4fTGdsurVGRZcl/f4d
	3Yz7ytNx+zKwjq+rvld6fq9o4Ut/zRLCpI7P
X-Google-Smtp-Source: AGHT+IGX6szRvd2tSX7laDS3j2elb+vz+ESn6JMm/qT3RBzo2y9SfLPx53ezukIMLE4rpbxuJhz1yg==
X-Received: by 2002:a05:6a00:3981:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-736aa9bba60mr6249182b3a.3.1741355931109;
        Fri, 07 Mar 2025 05:58:51 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369844cfeesm3230656b3a.77.2025.03.07.05.58.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:58:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 1/4] subversion: ignore CVE-2024-45720
Date: Fri,  7 Mar 2025 05:58:37 -0800
Message-ID: <1be6e32a75e40bc3e1d3c7256350579c37e3d22f.1741355808.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741355808.git.steve@sakoman.com>
References: <cover.1741355808.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212439

From: Peter Marko <peter.marko@siemens.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720

This CVE is relevant only for subversion running on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Reviewed-by: Sofiane Hamam <sofiane.hamam@smile.fr>
---
 meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
index 1cf4e1734b..b93c7ee5f8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
@@ -18,6 +18,8 @@ inherit autotools pkgconfig gettext python3native
 
 CVE_PRODUCT = "apache:subversion"
 
+CVE_STATUS[CVE-2024-45720] = "not-applicable-platform: Issue only applies on Windows"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[boost] = "--with-boost=${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"
-- 
2.43.0


