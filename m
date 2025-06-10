Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F3FC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:49 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.96415.1749584086949367954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IubEWOsb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b1396171fb1so3069201a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584086; x=1750188886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsFW0c2kwLdW2dncq0cqyQNjfmqiZewBLI9Cgn1Qg54=;
        b=IubEWOsbCDfy/JLYOnCM+mLMSyLwZkV3MhE7DjpzQ32y1ZJ/YMaKf6ATrZ+UGMXap3
         isrjPanqfM7ndJOo4NNkR72US/U1xrFfGcXa/QCWIf4dfrnusneGCpgb5itw21RsEfqW
         yY1NvB80bvmkksp9vl9RyC3jMZTxRXfrx+PDYBJl8319gi0/BTyhRMtOXDTfG21+qNYu
         eH8bYKTY9Z+2WcvDBvm9MfWfOH46G4L8anBtHIFMOEPAXY4oHl0yhZCd1jGE4DGl100F
         AniD1x+keT70iCyTmXqEn5IULc/MF0TOn7h986o0a/QPqhF8extM6BjT+qVhcOnFCrv3
         8/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584086; x=1750188886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsFW0c2kwLdW2dncq0cqyQNjfmqiZewBLI9Cgn1Qg54=;
        b=vS4edBCz4HtK3E97+fACOrZL4WzvFPs/G6in/8Jf0YaiW3sOc+/e9+wGw5o/NHel1/
         s/Ooz2Obm0xTPaDnooyRngpvFonwB1FMkkbRIR2cQQdTsOj0vl99721BOkmoJr05bVkF
         yH6eesMrRPJ2GkdMmb69E/M6DtRlWLUq8r4oC3J8vuoy/fLschCMrf9BRPRcascdpf24
         6L4HL1ypBYXCKpw25z/MhVGNTQvfXfROuP3TPkSwf3IA+HJTcoRR8lG4M6xMsAyCXTTw
         rbtsymd/PHL0foJMfixwmsTVPYkEm0RvL4pQWf8heqjOi+EdM4+paQXtju8gIS4rQoEf
         hpBg==
X-Gm-Message-State: AOJu0Yy5LiKcZnEfpS6RsE/Nw/Ua0sR7fg1q7jfWFS2GmLhfWOo/hzIY
	su5Z/zIXcQa2oG/RJM8QGtW/MWrkh+z4zthk7M7v+oz/FzI1U4ijSyIhl05boAQgS3fHg3Snojk
	DIQPw
X-Gm-Gg: ASbGncsyj6PMucW9f0AJlutUYAlUGTBg+1SC7Hemz/ulPR4jpypR9uEepEDK5HPBuve
	/hEjleayjLMGHUUqwDAeKGQc3bUarUshWW3Vx6lnjMXqMT4EtoNmoWAOg62LYa2qVxmVw4yypUz
	n7xoK3oS71ppufo1myfK3U/iNVqHjR22PE2wDJOPCR4yK+pjkZ1fgmxAvWA23RGgvxI5As2OdpB
	7U7mEcd0PnP1ZF85nwNTskccSRNBevYfTb1snlXUQUm9X3pVFSOLqc57aNh4/uSeGWu/GuXp+EM
	xRkOBxlDOlshRtGBij6+VD9yBNGPbNeLmSUusl/OdN+TWQHSV21P8CqW2qKnt/Gm
X-Google-Smtp-Source: AGHT+IGeSVjsVA7QqS9BKDCw6tXxmr33rnTJcuGeu9p6XH1UYI0wkMoVntbljLIzlf6eXbqSFwMCkQ==
X-Received: by 2002:a17:90b:55d0:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-313af196987mr1093147a91.17.1749584086202;
        Tue, 10 Jun 2025 12:34:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/16] kea: upgrade 2.4.1 -> 2.4.2
Date: Tue, 10 Jun 2025 12:34:08 -0700
Message-ID: <2f3d2a2848472bdf87fbce00967bc780fc859e05.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218418

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog
https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.txt

License-Update: Update copyright year

Includes security fixes for CVE-2025-32801, CVE-2025-32802 and CVE-2025-32803

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.4.2.bb} (94%)

diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.2.bb
similarity index 94%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.4.2.bb
index fcdb4889d9..6bb7cb9164 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee16e7280a6cf2a1487717faf33190dc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "6e82fb319d3b871c0d39bbd504f2cda0c66fa1262865872985fb4fb91b4eaafc"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.43.0


