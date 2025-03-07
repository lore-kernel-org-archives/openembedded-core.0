Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A1DC28B2E
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 21:50:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.103.1741384220012218018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 13:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u8EBuefY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2235189adaeso40716395ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741384219; x=1741989019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zudmKu0O/1jApobdAOuA7+TnUZuFTt5A5V+SbucWJFk=;
        b=u8EBuefYnAKGnHz75HEJuE+GncikbSjCLbl941jW8Fhzo85VU7VMAN3jlTZBQ9j8Bh
         CZZw7rvdKfJeLUuwbzB6tr3v+mSJGJ09BDdMvVGSWuwMYllZNuik8CIpeUa7PClNbkUh
         Lz7lnAneH3apO7UPVjTpN0PKSGgqlQBaOxQD4SZEa82JFfqh6GWppotUd1JtMF4tbLul
         y0yw6IqLE5UMNVgFlM4ZqOTPzyK5/an93MELwITyXdNMGmj3XBSbbQ3a7dGKrAqw//p3
         LvmDsjGk47U10bEoW3JUWIsFLRadvbw1+B9D7g0LcdkQ2MYppbJyoH5C2Ktl6km9/7/9
         /T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741384219; x=1741989019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zudmKu0O/1jApobdAOuA7+TnUZuFTt5A5V+SbucWJFk=;
        b=L2Gx3bHZTx52SJwSolK0Dn9k66XWEsvCIyXbEtM0wMQd0Ks0GuTETlhgsgTuuqXdgr
         lGtOvwXDNxAk29i3tJDHCVTJdubKbWQpfpImRGSR8QITw1Mro8Vj6TfVYbhv400u+nIH
         mxY3QeyhaGQGsizD83c7ijkHFV2waqYHvjvlZKFa8bsDQWFYlFoA2LnfvGvF+XxP00CH
         hEEmOESCqZqb+KM05EEo6/hTL7RaJsiTIzL+pi4H3+c/AktKLLWCrlFFbvm/J4FICMky
         MQhEWFHBybXRw8vqaaOdHsOvHgBApNhyPAV5HaWX6Yjna0KDhXkBwlagAgOdd29m3cFg
         Fm7g==
X-Gm-Message-State: AOJu0Yy49mIzT0bmFf43e6NgPbU/Jxr4pHIrexCQcPwsXzNs1cG/kRq3
	IjOW44FpeE4hovKkLgUh9UaWbk9nbf0bn6al1jPRe5z1gIMs0M0nXXQRMCquvPUFoPszoB/IavX
	+
X-Gm-Gg: ASbGnct/50mj2jVuBDWaF0Q9EiUuE20JaFLb6Nkkgtop6vIO8mDWJjxlMhm52qpRvy2
	ysaaAoSOGM9U7+KNXqAVd75g0c8kyd0cn8f9j11MZLO/cEbyzGfozw3QQmMp6QmOpTl8GM279Wv
	6NsGMabTWkzICEhKSPaEDJoy3AOBvrwYL9Zpz9V66N1Imj48YXUS0JtaMmjxAG8bXTAXU/DSUw/
	Q0NDJA/lyH1mBxaZiwHifPNxtonkGBx6mYsOmXvU4zURO2dqmD1v5umScvwD8nS+yQVXpYsAFsg
	WW3iRla3lGMlgpSBumSGIC26cAnrF/hRcsca
X-Google-Smtp-Source: AGHT+IEqJvJ6eM5Fez21kn0xkxtNmJ6sG7bpaAzhzRyjoViHAByEO5sv32Z31EZkYtXL+ti6lww/zw==
X-Received: by 2002:a17:902:d2cc:b0:224:7a4:b31 with SMTP id d9443c01a7336-224510dd710mr15400885ad.6.1741384219124;
        Fri, 07 Mar 2025 13:50:19 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa8a86sm35008645ad.240.2025.03.07.13.50.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 13:50:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/3] tzdata/tzcode-native: upgrade 2024b -> 2025a
Date: Fri,  7 Mar 2025 13:50:10 -0800
Message-ID: <34b0f99ffd9beab4d400b05f259fc26f3da0386b.1741384034.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741384034.git.steve@sakoman.com>
References: <cover.1741384034.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 21:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212469

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a15c4e6793c55c8084a61298ef3695e1db2f60cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf095280f..f1dbd7ba81 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024b"
+PV = "2025a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
-SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
+SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.43.0


