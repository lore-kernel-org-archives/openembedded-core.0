Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068FEF3D5E3
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49606.1775456858331312505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KUCXBMRH;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso15916015e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456856; x=1776061656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=KUCXBMRH3hdk4gBZtyCRLltXYay/LOaWb8f8lQ3Tys42qEaykcnttvM6c+aOcAht43
         niL7XjtKUmTIfL1DzNrVqzEgZ1NCi8JF2wY1bcb6INJ+1AhTtf+uSU84AVLXwIF5B0xb
         /jJdcLljDyYBbZoTMBAtJ9sXNiyp3GL1tlh1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456856; x=1776061656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=gIfwzbB5DoWzYlHPnZhcN1bqkfLJtDHKxX+9pVjtCqQNL7OGpZjUAiLSk4iSz0PzVZ
         P+PgMvl7+/vDqtwDGm2v+w4MHoU2XH32QqxvFWi2HWETmcFZvSG8GXMAeWx+v5NznXiS
         Iu5ag8/ijayid/Y41qoA9MNIdya18FOSwteRQ6N4+yg8hKf0yUZVMc9uHLyuK458STdE
         Sqsl78fOuikEJUq1Oj9o80Bg5kgYeDvWgKdHvo1X/31dU85ECbzA8r6Kq3FFdFzOgACt
         JXtIeL1BjeCv5iBHbtGSJmySz12Hv9kCFd60//5+sHK5/A1TCD3Ueab4dxEdgDPkXbSt
         MR2g==
X-Gm-Message-State: AOJu0YwgArgVLMVIj6Sa1N8drfYTqBkU45lPkWPwPozQF2dMBA9aqwDQ
	C9jzOCg2PMb5Mv4VMUMwRs6DLOiJQ75AQAnogzwAso+80+UJKSc/iNnFLJ8gQSAchXzytpDSgOq
	5F2iH0rY=
X-Gm-Gg: AeBDieuwI2cbe07QEk6T0sLVTbk0bZjDqlkJ5OHfxxGRpUmG0umStF+bfESZrpNJgPP
	yfqtyoYYFJCXL0ZVYPy3qFaQg8WDo8gUySZ6t6+MWZtGwt0Q9RxMYyr3g1VFIXC/rn87Bked0NY
	FJVD1L8jUuS0wjuSZO/pgaFIDQOqjD2gv3St/x3RzBcoTPSYw3R2+0YTspP2IgGPtmpco2H+548
	e1GvcYHnMlrumG1CnQlAMbkKat3Mq3D2beJW4skdk2yvTOaLqvX3xwO2EvxSA2OPDg7jdOoTwuu
	wYp7paba/Ec8MrOIYgY6QYbCztgP0RbzaqQC82IfHKBwUn+pgb3adJyvyr9bi3uzg7aIHnf7zGE
	WAnX07KotntnnSQEa858+8c7LB/ARqJxnObRBvBqAsHe7j0yJ+UYyYCQhvUZxc6Xpohnn+K3Uoq
	QYCh2XOqgD0mOJ+PnpTsUWumkeGfRMm9Pah+JJVYrxjauD0HoxcSgzGNA9MTV3n6JI+ZNMR4r/1
	wYzGUseoG7Sgs6SRUp9RQDjNf79xoL3x4JqVw==
X-Received: by 2002:a05:600c:15d2:b0:488:a14d:3d81 with SMTP id 5b1f17b1804b1-488a14d3ef0mr68325915e9.2.1775456856272;
        Sun, 05 Apr 2026 23:27:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/18] vim: Fix CVE-2026-33412
Date: Mon,  6 Apr 2026 08:26:41 +0200
Message-ID: <50d4357e4c38f90aaf64092dc5a2b7bb7c515f21.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234658

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in NVD report with [2]
[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 00000000000..62daa308b58
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,61 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/os_unix.c | 2 +-
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ # define SEEK_END 2
+ #endif
+ 
+-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+diff --git a/src/version.c b/src/version.c
+index 4f3912aedd..712a3e637c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1684,
+ /**/
+     1683,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be707..fc9b4db055a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"

