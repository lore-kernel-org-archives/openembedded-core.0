Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85282C44501
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:53 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1265.1783747489948223856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=bKzEAWy/;
 spf=pass (domain: underview.tech, ip: 74.125.224.41, mailfrom: vince@underview.tech)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664d530fcfdso3058558d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747489; x=1784352289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7LlnscxAQm+/fISk24HD0icvpkGnqzkr0Aa/t3HSMA=;
        b=bKzEAWy/AO6csGKJgWZScZBbuv0zFxggzQq2VXF2G4BWjVhOIv2yJnBpU9YDpiKTBy
         6RK/VYWLU9ZQnvs+RFj9BzIFNg/rkWdGHp8VFiH4ML+5Act0yJOyo7uUxKbogHb3skJw
         9BzFm9k+BC9GVtd4VF6ZJb65HTaIiU5GBTCWZscWL2pwvXRGfOrm/tMJAYphTZp9JLi1
         PPWqsRnaZU2GsEE3esfwn67v3o12T81UpyAf1K3sEVtorSkOBk8CsAZ1x8+QH0gv5JZT
         zEK7IQZUTwJXlBveKbbKphl1kOs5cCWIwukKk5oQmET2pQeAMlO/uQbC5MAHQFQjecpo
         YiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747489; x=1784352289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7LlnscxAQm+/fISk24HD0icvpkGnqzkr0Aa/t3HSMA=;
        b=D6JHoe1zl6qAHlNStlrt7WtumBOXbJ76YP/Ig5q/wxhbj5zCXWFeKmNf86vo2cRaxG
         OvZQ5DkVrvhQrQ3Jd9ONPeaGwjU7vSC8GQAqmbns1fZih6IViDAQ31oJpj4L6pfoov7e
         KGJ/EZKlb8lsfpzEYFPhrk2hXe5OAGCjwn84Lyizo+vHexzh7P0cd4yI0lT2jWxmdPcr
         PyMmQdTIVPuQe0478QgKMikOZAVGo5oyqAhpsgShoi+pWcZaGLzm9sXDuAc2oeNAeHQe
         N4pgtqzzfCAkW58WpmxLS0taEQ5Gg0kxkuKHdGR/2Id6gMUwR97yOAHcoSDuKee4QqaN
         tadw==
X-Gm-Message-State: AOJu0Yz5x0n0DJI1aHdG1yTedyyDyUtSsQhRfH9HVVIlh9Lbx3Y3yzLx
	7/9mc/TLtTAQGp760RUThOxmrPMJcwzozJB0P6Bp5ARcy6fxnEe/NPktXcDsYmdZmciBedhXpV3
	Xg0V992M=
X-Gm-Gg: AfdE7ckhXS89pB+pmz1Vfa3kKtfRl++rOpL5VS6aGjtA61Bb1+q1Zy8+S+N/Y8PgTih
	qfXX4pNAfsvqNLTf5AGQ1JnEdo71oolJyW3nU1t+lfABaD9/TF0LTRuO40sie/aJWhHA4W7UhkO
	7iBSk/ZGnBFMRggFAXQYHIaBipdUNd10yDKLAQKpqJ5c/B74lI2F0oGwjlKjecOejJKji+ui2sJ
	4QHQurQ9Bq0cYfplS78/Fg9KtBeE3fn8tM4ERfiIiQZ2MAjb8smb5kqBlSAL5LQYF4U2aOCeZXE
	EtJXO3HX/LlsSlAgoJ5pXRq3pBJtj8Sns4mkQafjaJxYWCalZu6qAHS0YLdtEqVleRYaSWE2W8/
	01v+kKONxdD+V+L21S6ZW/la4qBbf/KK5To9ZZe2x0cj//L0cnBI3mkHsHB9UpHTecl2zCT8yrT
	avJeYwvTm7q3WGRw==
X-Received: by 2002:a05:690e:4845:b0:667:6e97:3b66 with SMTP id 956f58d0204a3-667d7afbe02mr949271d50.15.1783747489067;
        Fri, 10 Jul 2026 22:24:49 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:47 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 15/19] v86d: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:59 -0400
Message-ID: <20260711052403.1292286-15-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240696

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 3bc9b24487..a2b9dc2aa2 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,9 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-RRECOMMENDS:${PN} = "kernel-module-uvesafb"
+inherit kernel-vars
+
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-uvesafb"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
-- 
2.43.0


