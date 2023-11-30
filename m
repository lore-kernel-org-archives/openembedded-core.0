Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1FAC46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5281.1701377893408165653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xV+sOQFg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cdd214bce1so1399977b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377892; x=1701982692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GadeYSvcL7/chx/rTIFntvF2enZ1SUvbfiBB7MAs5XA=;
        b=xV+sOQFgRIUWiTkq566Y3sQVrCSeba8Toa6yP71vb/ha0oOaCeKgU8myKmtUBkmcvD
         bSm+T0x/Da8+2FtRsMCiz5hAfbN/BgO9KHPxzL6+4ecTwcuq/AxczeifB64r0mmxy6uY
         ULoR+AKXM9T2Dvurl6WYOT2/NK4DvFULp8bm4/sq2MaW+LZpkmJY2TeXdpuqwH2Wycvr
         CIp2rv+9Y+GNvVq7sSZOuBqcVRJkrCmEfrmiUW5xbItKh8mZfgycQT5Jfkg9BFNNq8iO
         rAXHlzDOC1LgPcavzMtNXTIxBCNRmTb+Z2vYWJP/gsRe80W+n+A3wcTklqMgo91mg70S
         M5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377892; x=1701982692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GadeYSvcL7/chx/rTIFntvF2enZ1SUvbfiBB7MAs5XA=;
        b=Eo806hFZNnXCPkF/xupZ9OUDv5oF5mU5BHYwGnUE1P7Qj0MTds3NdFjFIeUJVDdAqT
         k2CKroYLSRkWI+p1Q4EMl6/768Vt0yLdbmnuQ984MjiBigS2ONQKKKNDLfSwb9aTSYvk
         KshY2j2EjlZwKgzVHIdfvoQnCius91ueeKRqqTRIMinxl8R8S5l4qmjQxMz4CK+RmxTY
         4am3gwXxIzlPLVUS03eB0HI3YT+/QNq7DIbH722Q2LZcuYK/ab1rfKdojq56xSyNlSZZ
         TQ2W5qyoXZePVB5z7rT2iWtMUfV8QDy3B4IJyXI8Ds9Shl9WMQQOZgt90Utm5kwITlXZ
         kVSQ==
X-Gm-Message-State: AOJu0YyQ9K1SXZHn11yha4GTxWLo+U//+F329wxbIex9yxpTtHbDQ9Lx
	++ORy0zoy/7FoJIQgYS298lfZqJ4d9PpgnBlhyHJUA==
X-Google-Smtp-Source: AGHT+IEIRlqgkn7OUMdS08i8lA4ROVFDDW/4NabCTv/tVNAg3mPeuKH3EHXSh5L2+8NstWuSVQaqQA==
X-Received: by 2002:a05:6a00:2410:b0:6cb:903a:b064 with SMTP id z16-20020a056a00241000b006cb903ab064mr25014498pfh.22.1701377892328;
        Thu, 30 Nov 2023 12:58:12 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 19/25] lsb-release: use https for UPSTREAM_CHECK_URI
Date: Thu, 30 Nov 2023 10:57:27 -1000
Message-Id: <2060e7ba146a1e87d402af9557cdd5ce959a7bf6.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191537

From: Tim Orling <ticotimo@gmail.com>

http:// results in 301 Moved Permanently and redirects to https://

Also drop SRC_URI[md5sum].

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4bb3e1dd642802a16ac9526df4098d6dcb97a795)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsb/lsb-release_1.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index ad16554e98..00d8183a4f 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -14,10 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
            file://help2man-reproducibility.patch \
            "
 
-SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lsb/files/lsb_release/"
 UPSTREAM_CHECK_REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
 
 CLEANBROKEN = "1"
-- 
2.34.1


