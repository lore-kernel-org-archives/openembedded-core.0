Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0369DC36008
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2922.1742372188618242625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxsaPkxB;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so14966335ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372188; x=1742976988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=QxsaPkxByBd9bZKTGYlHjcXuWSj3ixUaHsg9f/MQH400vKlKSL/GcPAaBJ/NR0LPfW
         DGE9/YRAb/ZWZR809g1FjmuwjymCU6COSXEzml6L8/psm7cLPC+xQ2Oej/rQ1PtjN/Uh
         VGpUiw5gxgyHkgAhlQx//nrs22XN1rzHnewpFZjY1HPxhlbQKOU8bPRTLn4y6sfSjB2u
         v68OY6iGAlVFWX61Tg+YbL6/C42v8yOfqUzs/obOgiG8F+jhgaROty03ke/OyEEnhN4U
         UnRtwkJudMl1DiZEpjV06KEAxSXIK/6ZQYUZRtRLdGkFk06CXOYZJHJ1VMxkD6jUAccL
         BRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372188; x=1742976988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=RR/RmQnTlEzAx/XYYzY7nLE1BlAAXuyZ/XNE7/7a0P2JgmUURdoNL1rJO3C4cRjdjN
         IeqlJAr2IU5/mboI4SPKuaqvZY6jpydzEDVd1bljqpWbTR7l8jm8Zu8npnvkBY6bpX4S
         93vnpw25xAkuxWB1NG9WeDjJmGEKWBqT8eZIGsotIXfHrF+2yko9TfnJZXgzvwYI2hho
         scWyd53/fPm8+Lbq/AJrzSoi/cb+w8Sa/Oiq9NYN0V4I8u1H3oHgpr2jIV96mv6+CJ8A
         z2tBAQWUUI7FEAoB5pFBJ2z53CYuDq8Yv8HEHOUErRoO9g1yShwd7lwThBxL2QJ2Stkr
         DHEA==
X-Gm-Message-State: AOJu0YxIaIMAYlIUws0uqjJytYVTyYimprrYbw69jE+JaUARpsmlrLDb
	r7F2m28LvtpaBaofr5+CyDZ+gn1CsggwuofnGBdaKyLkrm6u8hAOu/ur7VnA
X-Gm-Gg: ASbGncsOTkJMeewXYFYmjo0MSZtFcPrZUSVnm2NYeaSS5YnT0XUfIn4VnimQMIARdcG
	uK7Rq++p7mqaY6kmGOWqtoRn5vU5/Vfu5JfADhT7IAFD1QgaBP6yOB0bWGNMLpXq30MMJkGivCf
	RUqwPZQz3HXJZGz0+Kpgwlt0/c0MMNMGYflV2Tbyzs4VMgkgFuoAxLAVW/Am4PYZlI5nRipiIzY
	tC65YsMz9U+LyBlC1ybQdZlijh5NpwAd4XJsdpnbLR5ExIQeHLeGRmotKd6BHu7X4YjiGkQ2Jyj
	ftHtMOINnR8adFZRy67FyhQrEaKajgr7YbsA
X-Google-Smtp-Source: AGHT+IENrewDejniNsSvVgiJ1SPc10XgttVWgPYoiBgbSqK5IKkzgmbTxDlxE1mWEobbFBQQUCMvLA==
X-Received: by 2002:a05:6a21:7a4a:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-1fbeb18549amr3398058637.3.1742372187879;
        Wed, 19 Mar 2025 01:16:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 14/27] ppp: Fix build when shadow is enabled
Date: Wed, 19 Mar 2025 01:15:45 -0700
Message-ID: <20250319081610.3536475-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213283

GCC-15 patch is not sufficient when shadow is enabled, therefore fix
the remaining issues.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-session-Fixed-building-with-GCC-15.patch | 33 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
new file mode 100644
index 00000000000..d95c72e96ba
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 14:38:26 -0700
+Subject: [PATCH] pppd/session: Fixed building with GCC 15
+
+Fixed building with GCC 15 which defaults to C23
+and find conflicting declration of getspnam() here
+with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
+
+Fixes
+../../ppp-2.5.2/pppd/session.c: In function 'session_start':
+../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
+  185 |     struct spwd *getspnam();
+      |                  ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/session.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pppd/session.c b/pppd/session.c
+index f08d8e1..9cc7538 100644
+--- a/pppd/session.c
++++ b/pppd/session.c
+@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
+     char *cbuf;
+ #ifdef HAVE_SHADOW_H
+     struct spwd *spwd;
+-    struct spwd *getspnam();
+     long now = 0;
+ #endif /* #ifdef HAVE_SHADOW_H */
+ #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 5565ce51cff..602f98991dc 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
+           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"

