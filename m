Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2D2CCFA1C
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 07:08:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6165.1762499307245292851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 23:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0Ggxhk2;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-341b2e98486so403021a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 23:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762499306; x=1763104106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHOql69aWUJdmGInIE/YK65f5KvHuMDRcoitRpt30Q8=;
        b=O0Ggxhk2egnbXyb8/JZ0ZWv2q0R7FbMvmjCRcrTTycqvogIqJLn5l5l8/+ecoqB+DZ
         WweTTWr6g711OvJ8G2DAv2n1XkXcWg2TyX9rSgQOKhmNy9dmpv28mKEx3r/dlIzKqTud
         SnBt+QES/kB+bhQCQiphUuld3v4316Y286ZXqd1yvu6y1FIw6gvh3cBZwb58jcAquytF
         WyZ1FXt/SfJxm2MJGykx6a9lU6zfAcWFhTu9FJonEhbSaaG77iWAVnAUFNv+WzuMNVgJ
         QOaVOP7ndGC7lupMwE3A36JMPZyg36VvHMJrHsIsRDYN8D/H4KSsSl+zoArkl7r+WQvf
         cGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499306; x=1763104106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHOql69aWUJdmGInIE/YK65f5KvHuMDRcoitRpt30Q8=;
        b=Fh1Yrb+a7vP7vClqntUw66WnUu3DB6IwifhPUrzvUxmUmAFrr3QhRDflIUyMuyFOPz
         cN6nJ1N7sq9GFMnB5qTqc7FQ2CCVFtbr5np/nCUhobyrbZZtVaIppfiHGCT4AYfEGYA/
         l2rUn1Msl6yeTk2hCQ9MwUAU0w9uLTCNXQqsbA7ts7ijdMmc1y8ZdXYTQkl6+Jm52m5u
         V6HA6UXO3+p2cuG+muu2ymNa2ikwr+AYpsuImK0+dTVwfX8OqdE9EB8CLdp/izvnqg5n
         602DDSxVbNyEj1xgRQeCTdDTSakAhRkivLbkHz4sOh3C2V44A3dIT6ghW/RiTZ1K3RZX
         A2qw==
X-Gm-Message-State: AOJu0YwbDj0d59yHIbof5FCNQB+9bbzLp7k5BctfZFgy2rq8plgy4GOV
	y1X3duI2v75pjAK3/pN7zk+kI5mJDEUhxB11QszwrIVUSGV2qoMVDobAUzWfEriH2dk=
X-Gm-Gg: ASbGncutPpc370WQPPIr5kEEPqvfdKF8R1InEqj3fXjklVeCf7cL5cA/tn9Kbm+Qsbr
	a4ovH4dU5F9DHZV3tGGyf2BHashkCCAPd0fqGEEo2/k6KK7vpn36rHCxiW7Up6u0ehlbw3FklrN
	77rzGux79MFIdh8Nmsq2YfEVJohB6qJuAsawqlxMjyfJ3yRByCPRCRd07HKtA09G7uKJMgAm7eI
	hyYajGXOrIaka1EylmHwSz8q6FdelTJ+bqI5m7RNl+ljS1QGiQTbtnxI3yjPNU8wjKZEjWDYAtA
	ulClTEwkchXDXbf4Pnquz/vRa6lVWjulTuzcfVIXqrZhkxIS3m7izA2swjV57UYUthgKSwR5ZFX
	9EiAN/MopIkhnGqh0mKgiga1t5Dlm0uDMjSho69IA0fxh+UvX/S4JZkSNoZOhyHoX096TfdlyS9
	/6Pzj/Gc+si2vC2Q9UA7gxz7+IhVyNXVrrTtzLrMGQLSxDKWlKUrw4YMvKwra6EUw7Egb8f12W
X-Google-Smtp-Source: AGHT+IHbAE+86l10T8esolZnciSSG9Of2GAW6panpNPUgFVdLPw9+kiu6lfaVu3745ZfE7t48nS9Cg==
X-Received: by 2002:a17:90b:53c5:b0:341:2150:4856 with SMTP id 98e67ed59e1d1-3434c54eac2mr2651850a91.17.1762499306340;
        Thu, 06 Nov 2025 23:08:26 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm8561625a91.0.2025.11.06.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:08:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] dos2unix: upgrade 7.5.2 -> 7.5.3
Date: Thu,  6 Nov 2025 23:08:19 -0800
Message-ID: <20251107070819.3751599-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107070819.3751599-1-raj.khem@gmail.com>
References: <20251107070819.3751599-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226012

License-Update: Update Copyright years

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
index c3803f457be..ae69110c390 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=49ec74e0139712398b9ddb06d824929a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0802ff257bfeb9bb07ae4e4de04e3223"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
+SRCREV = "9df44447947a7b311c62ea0383be94080edcaf85"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 

