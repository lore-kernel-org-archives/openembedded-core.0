Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651B5C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.1403.1746804238755698864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yWV4KSTs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7423df563d6so940928b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804238; x=1747409038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fftexCtShvRdY6gOjgwErttl0exaiWtU7tye0IbRrWk=;
        b=yWV4KSTs6VpLurw2YLjvYTl2kgCMeuSNNGMICBzwNtla8dAWHI6O9fU4BU/1GKc1xm
         ec/fXe0Th7LkHU/+V06/1dYt6kzOaiVHqvyWmCnowlcwqIlHhIyJT6KM64phnRXx7vOd
         jMsoNHmneREQ/6sL752bBaGodRDnfcQSl1jJha5OT/sTwVwc6rxP9+7xlAeltAgH+sPz
         q2v7kZqo3g97Sj4zVNroChTx6N3GkX63EB5rSVZe/qlGB5ZyJKkoQHFVMjtuI3oKSRD2
         x19v8UmiRBtZRW59wNgi2ge9vS5TgVWRC4dw+VH+5T4QY5y9Jd04CZRYlh+gCSCF5xhx
         uxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804238; x=1747409038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fftexCtShvRdY6gOjgwErttl0exaiWtU7tye0IbRrWk=;
        b=WPB+j9qDv2RjeG/oqB+k8GQRcOPPzblPSCIIkQqiS7/jcIAh2qsWh+XMW1QxiH6x5E
         Aez5HoLW4HICOzOAAS8R4bhDI78Tqp9BIYzi3Nv3d6j+XcrECyivW8uBlg98hBgWZrVS
         4Vt+KW+FTn7WpKF6dmtbC7S3n+pzwVburIBFdg6oXNl+rOd082ZxzYV/Rlrd0Pk2EZbh
         CeBhOPSBVQ23kpOwWssTFfkOHseNtO+CuYv3fj1OQH7M6LAEtbftA01zX3Qq9RMA58KS
         rtGsoyPFETOnno7b26l3FWb3FxkFrIDfWDf3biMyFJT5MVwAXWLFrJhXQU8AilZh1OMv
         Un5w==
X-Gm-Message-State: AOJu0Yz7bJf/cByJMfpXtVHwZjLeoa5naOkXjItjKzzAgGlC7dRWW99u
	x8BVRsBCFH0EbTtb1o3FNau2m8J3a6jvTtM0iqFv+ko5DUJCOdJLguxvoydyuD9DtXkiCCuQMIn
	o
X-Gm-Gg: ASbGncsLbGudiWgAp7VDFMikFERPlq4B+qhKLBiT5zB1X/7EZXpqVgqimjRnzMoJVcz
	opoSpNBM2Cj+7Asa8DRUZlVWej5uWL0W1vI/Z/HljGrhx+iIHbSR64A0f7DOpDZuxkNRV8bLctp
	cxiAfgnO/5Kfp2Vktg8jLYLPgKvh2ZfFJcPaUWAJmNcA7dGUPIJ6Yar8dv7NY6y/7b1k9UOcgqV
	S06n2V/9el5F9PS3MPpTIEHnjx4BICnruS28f0Q/tGr1uMByoRFAsAZLKIUxQP9MFetBs1PwrDp
	nL3vL52sWb9o/vn09aTyXyhQclA1op3O
X-Google-Smtp-Source: AGHT+IE9hySR4U5FHk5oFro6fbV8jnPWyu2AIe88/GnQV34TiYuAiepLfxjrU6btI9WcOYsElug5dQ==
X-Received: by 2002:a05:6a00:181b:b0:732:2923:b70f with SMTP id d2e1a72fcca58-7423bc478ccmr5086685b3a.11.1746804237889;
        Fri, 09 May 2025 08:23:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.23.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:23:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/17] tzdata/tzcode-native: upgrade 2025a -> 2025b
Date: Fri,  9 May 2025 08:23:20 -0700
Message-ID: <ca0f3036f6de3dbd06c132db8920189fd57912d4.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216212

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1ff8b45da27b533477cf6d9ace7a47f7f3a28b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ca9e29f72d..8f7868f098 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025a"
+PV = "2025b"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
-SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
+SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
+SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
-- 
2.43.0


