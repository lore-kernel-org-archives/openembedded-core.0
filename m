Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BD8C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.84422.1747163302565404028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iN/MEeg1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af5085f7861so4299802a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163302; x=1747768102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sjel1dInFbvGcwZBwofvUD6Wg2xkMqZd6YGO+CM0ab4=;
        b=iN/MEeg1PTAFHeLULoZmoo5GzS/P/PrCOlUxOiHgnalbSzraMdwYCMOVv0nI9xet91
         DBP1VHJFMJioM3yXmcxJqI2J19/CtzpyucyN/YCc7bW9SB8FIwVJtLoAAcV2rxm0uUA4
         S2zb8gBzSPnId/bmV4mrYLva5Jd4R8OlKgqc7lwZXJrrxXaH0CynDsNao3WvAvu7hgFC
         YGZmpQzAUdpCLaqM3H7YAJ2kzt2W9H+MP7MEbttA0r911RCtqlwdBsbVuwooNcLYUYy0
         TId6pyWQmM+c+7GNfLJ2zhOv4WskWeJ9HuetN0f7kQDcQi4ocXlUBerIizXlTrFjldEO
         JITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163302; x=1747768102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sjel1dInFbvGcwZBwofvUD6Wg2xkMqZd6YGO+CM0ab4=;
        b=wyKl8Lg52BsE6ZYheQ1T+QEQhzgabhoKKqTwlX/kJBENsZtShbKNrvQNV0Xl70Qm75
         l8icelDk/GLgvM516+TbmoCyWCUEcrQ/H5FcwFoTzz4JUoXS9GZGEWFj3lROKD/E8LFL
         NB+v9v/nDqqkJgE0V8JuEhg+pMvcyBFnwk/skEmSny5dXBhrbfBuud6htwtYmM2TJ0eL
         /0OpIs/PB24wmBaYIT1LL5oC/xDIm+irhoFj3gfDUXG1p3pRUQoQsFEEf9L30yLrHbML
         RSWkfRKd+kgTeMm4B8AiIZAIhGqNC+1S7Oc2wjdFZYCb+eNjgI9+QDBcUI/ftq9m8TNP
         zDgw==
X-Gm-Message-State: AOJu0YwFBad/qnvnJDakijyKEQL4ydkcIL+qkvJbL/0fRHROo7QdbSwj
	sRhJls2S6YdtSC771kpIO/bAQicCYUBOkpk/n+S7Nh5RDkdT9GrEa/ZtGC9a0PxOoAxoMn8Nw8u
	Q
X-Gm-Gg: ASbGncvwzLxRY/fFyFUIkHZyEk5wVV0Gzw7wglCctif4EPU3wFuYJCZwy/L/qOmd7WG
	aIkUX+zSmeECXZh5z0lFEr+tl/GOv0CIjbr8kCgwrN/sv0a2Qv3qezsGZdncPek4vFM2SdBv8uL
	07IAduP3xTw0AsF3GQX0EYBwFtXpGtZzZw1QBWKdNO2DppsUAFC0YngA+wjrn5CuqiJVoZGzFn2
	YmYFzczyRRF9JwV+ly5yrfmzcKkh21eb+cw7XLpSR/tX5SY0Pu1ey6yhTRvlvxMnwqX5C15m3ZH
	SjxdLhMzdIv6VMiqqG/H24JpgHtvpH7/95++t9Obb3c=
X-Google-Smtp-Source: AGHT+IHMHqSzfgFjgSabj+O4ZDeqsaZbHCCvOQt66DV/euuKOSnTj0GeYzWNeWkw37eo1OOcDd8A5w==
X-Received: by 2002:a17:903:1790:b0:22e:7f20:52c6 with SMTP id d9443c01a7336-2319816c415mr9223845ad.23.1747163301801;
        Tue, 13 May 2025 12:08:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] perl: patch CVE-2024-56406
Date: Tue, 13 May 2025 12:07:58 -0700
Message-ID: <8e3c821e9ce8f3a9667847a284bc5a6f4973ea13.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216434

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD links for this CVE.
Tested by runniing ptest and CVE reproducer (before&after).
Ptest fails on test dist/threads/t/join, however the same test also
fails without this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...4-56406-Heap-buffer-overflow-with-tr.patch | 30 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.3.bb     |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch

diff --git a/meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch b/meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch
new file mode 100644
index 0000000000..377ef95f12
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch
@@ -0,0 +1,30 @@
+From 87f42aa0e0096e9a346c9672aa3a0bd3bef8c1dd Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Wed, 18 Dec 2024 18:25:29 -0700
+Subject: [PATCH] CVE-2024-56406: Heap-buffer-overflow with tr//
+
+This was due to underallocating needed space.  If the translation forces
+something to become UTF-8 that is initially bytes, that UTF-8 could
+now require two bytes where previously a single one would do.
+
+(cherry picked from commit f93109c8a6950aafbd7488d98e112552033a3686)
+
+CVE: CVE-2024-56406
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/87f42aa0e0096e9a346c9672aa3a0bd3bef8c1dd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ op.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/op.c b/op.c
+index 69ff030e88..298b292633 100644
+--- a/op.c
++++ b/op.c
+@@ -7515,6 +7515,7 @@ S_pmtrans(pTHX_ OP *o, OP *expr, OP *repl)
+                  * same time.  But otherwise one crosses before the other */
+                 if (t_cp < 256 && r_cp_end > 255 && r_cp != t_cp) {
+                     can_force_utf8 = TRUE;
++                    max_expansion = MAX(2, max_expansion);
+                 }
+             }
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index ed3518b62d..f6ebbf2d16 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2023-31484.patch \
            file://CVE-2023-31486-0001.patch \
            file://CVE-2023-31486-0002.patch \
+           file://0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


