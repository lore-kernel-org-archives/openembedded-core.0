Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B37C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.8805.1748619620308444330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oJJ71wK/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2353a2bc210so7141805ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619619; x=1749224419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4H0utyNmxSMUbDyWHMaLnpf4qMJrESdBsn4e7bcM1Q=;
        b=oJJ71wK/5hhPAWsp5l6cjfu0cWScgT0be7K4wt7IHRsOSo1UfFIko2OpISq+xMMX8H
         VDA7Ihi1X7h2fVpYNAyU4rHVQRHODwnD9OTvwlN4yTf/iCty1WlLXhqkPmexA81A7FNC
         ym2Y2IdKPsjoLAj+uMiIT2GRmA2BeSr/iopIkqR/mpMXXJVLa5iXmpod+2dbDwwyrQJY
         bD4d9nTVuFfD47aYI9jxw/TLkNQvZ9/TLHRTzzXg/bWQt9uRSb/N3I4X0G1E0WSrA5+/
         43KScKSW8OcKJEzeaH85IUCl1+VjT1KfPwH4aY6S5aZDR6L7dc/6kwBI/58bRzPog+JF
         hahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619619; x=1749224419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4H0utyNmxSMUbDyWHMaLnpf4qMJrESdBsn4e7bcM1Q=;
        b=hGFxeI8ZTuOfSlLPmaUzsuRe0BniIEpE5pBCc88heOyGYJ2BSgNICbuAOlLV0LAh+7
         vOq7OrVDX3A1ys1RMkrFt87DIb8mJ2pXG1X5IRtHkZjRIVrn8bDw2PcozxEyIq1dPZ60
         EW8dZSPs07mW8R0kw/3BvKfTPd3+W2gNeqyQvUUB2U3/0UKdMqEoBaj6U0+93X0LDXxE
         JULjmnjFb7WWhrKgIKtyfNU0v31LeSiquTMSV7lsN4ANexc9XnsnMDpbTK017ZjTvLLY
         EJ624sHL++KZ/fk7u2htgZXiYVDusEtMP3GDpCl/O22HeqRBvAVq4vOKGfObK0YrpwPj
         D/SA==
X-Gm-Message-State: AOJu0Yy4sgIBLPXqViwINyhnHgSHGNRpCqoWUTzpnBPO0dSd5g0ZdVB+
	s83r/CgczMU2UIU99JtE/ywsiQBr7RSFg5yB/GZTX3NE1PIvq6AFPsOX3U9ZpALQYLm6SjG2n6x
	C2T5O
X-Gm-Gg: ASbGncvudReeTH9Mp6YcECEKyKMc9KhZXhAOobNDzqerPJ3DQZZFuXX3lxFU1FJF3py
	93LfbYL69MCWFfRigmgyzak620MtDUtM9yTW/7rhKc1f2ZLPq7T8j0NpBy8XmxvLIDUk+Y0AFRp
	QtKUn4F+ERA0oRz+j+FbYOiIW8OQqfRfDkM3tIDkQeSiDe2aZdP6jyZ6jrdGRvtHwakOYMRFQ4b
	MV+Q5/3kBR6hKhfNBSdhOUcUISkgOtX7hbJiK/LBWsQTb4r8jGfMm2nnl9ok2/UGvZzkZdpxv23
	GQNrqdlWPWrEtJn1mJYk5dnpd3mncbKysisKxdum43I=
X-Google-Smtp-Source: AGHT+IGK0na2F8P5N23IhK2zGdr9vA8hVWAX0QMXToErCoqcrfeumn7MRdVmSQWielXkASDftFKQiQ==
X-Received: by 2002:a17:903:1787:b0:234:d7b2:2ac5 with SMTP id d9443c01a7336-235395bfa8bmr42313105ad.21.1748619619576;
        Fri, 30 May 2025 08:40:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] sysstat: correct the SRC_URI
Date: Fri, 30 May 2025 08:39:52 -0700
Message-ID: <27c31ebd8e05adb2e248e421cbb94c897b3080f5.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217519

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI of http://pagesperso-orange.fr/sebastien.godard is not available
and the tarballs of sysstat are in https://sysstat.github.io/versions.html.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 77337722ea..45236e893a 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -1,15 +1,15 @@
 SUMMARY = "System performance tools"
 DESCRIPTION = "The sysstat utilities are a collection of performance monitoring tools for Linux."
-HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
+HOMEPAGE = "https://sysstat.github.io/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "console/utils"
 
-SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
+SRC_URI = "https://sysstat.github.io/sysstat-packages/${BP}.tar.xz \
            file://99_sysstat \
            file://sysstat.service \
           "
 
-UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+UPSTREAM_CHECK_URI = "https://sysstat.github.io/versions.html"
 
 DEPENDS += "base-passwd"
 
-- 
2.43.0


