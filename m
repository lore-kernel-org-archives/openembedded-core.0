Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1446C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.54575.1718625936544011669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CsuUIoOE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-704313fa830so3237254b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625936; x=1719230736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ca0bdXqsDAjQpIqpgNvLcX2jibMDpsypVNgvxo0yS2o=;
        b=CsuUIoOEH53zHA/M/opbPZ8PayVAs5Y5XapI6AcRGKb4Dh2W/RDWt6x322fBRMOyd7
         SkHaP25FGXld728twHZrWvWsI3w/b2UNnSKNPuIxJp67HgcfmiXUPVP1H7S/FHufgbi8
         F7+R+cmk6GW/XBNvT9uIzCIXAxeQlqKypU2katcLCdTIXiZ0AVEaU+Ej6GG/F7/9ZGdk
         /yhQHZKWfNgEqa6LtpN01mwLD9ZbF7enjUkZym7jo7PkhJDdksFQBt2EMjaJ9fsiv4JW
         NrWtj4c9Kis35XPRN+guf5OJttl7APKnCFv5/cMYctf5dYJYuEYpKjHYpgWioVSmuPq8
         Y2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625936; x=1719230736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ca0bdXqsDAjQpIqpgNvLcX2jibMDpsypVNgvxo0yS2o=;
        b=gqaad06xnpH5TC7LhA4RyL3ZQbYNdD7onqnb3uMMpRuniF7Ybe8y2Mr/m+5C9Hygvf
         rJ7WrQVKN8u9S/xCDN8KpoGRAQkj9ZCY5GG/53MjuOqMtdn4fayEhxAEjOCcTtHxpno7
         f/Sj5iCqTgzAz3gwGyZto68BIMwrjDqbaBPEpviyvWkh99pHP2he/u749z/DQTr1ENDB
         ZodeHxUlK44grsQzYG1FeMYUFP2Z3n8bCLYRB/H4gXB4r/7839Kcr4cXGnimFtuuyQIw
         U1AUiH+Jh6Dsd1K4DF+8ZJp0KTX0dHSm+d4em3Q4UExmsFODDLj2vrXO4duqNrp1hhl+
         wrNQ==
X-Gm-Message-State: AOJu0YwBxc5xS9rHMBEFrkTNgc41fDeI6yMpaPYJKlPh0eQE3gW6X+FP
	hzDuQu45hW2gWSVDQDyFFO53rJwpVxmB0uK8ruMq2l4CFHdUjDz1Rby2/DpgOfm/htRcOt7DpwP
	1Nj0=
X-Google-Smtp-Source: AGHT+IE+f9I6ye8SnmwjAVp3GYCGPxqGd711XrzmTKGAjp84Egb8cAjZiZmtLmn85cn+8k0u2xeSNQ==
X-Received: by 2002:aa7:93c6:0:b0:704:2d64:747 with SMTP id d2e1a72fcca58-705d7123999mr10005338b3a.7.1718625935642;
        Mon, 17 Jun 2024 05:05:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/22] gawk: fix readline detection
Date: Mon, 17 Jun 2024 05:04:43 -0700
Message-Id: <b97aa1c3488b8f6aeb8e25f4ce810babc46a3ce5.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200816

From: Ross Burton <ross.burton@arm.com>

The code fragment used to detect readline in cross builds doesn't compile
cleanly with GCC 14.1, so readline is never enabled.

Add missing includes so the test works, and readline can be enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6e7c3ce700b82c57f1102187fea6b387339eca3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-m4-readline-add-missing-includes.patch | 38 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
new file mode 100644
index 0000000000..5be2fd97ee
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
@@ -0,0 +1,38 @@
+From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 21 May 2024 15:10:11 +0000
+Subject: [PATCH] m4/readline: add missing includes
+
+The cross-specific code fragment only includes stdio.h, where the native
+fragment also includes fcntl.h and unistd.h.  This is important because
+GCC 14.1 has made the implicit definitions an error:
+
+conftest.c: In function 'main':
+conftest.c:144:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+conftest.c:146:14: error: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
+
+Add the missing includes so that the check doesn't always fail due to
+these errors.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gawk/2024-05/msg00000.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ m4/readline.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/readline.m4 b/m4/readline.m4
+index 38f96326..efd52d4e 100644
+--- a/m4/readline.m4
++++ b/m4/readline.m4
+@@ -66,6 +66,8 @@ dnl action if false:
+ dnl action if cross compiling:
+ 		[AC_LINK_IFELSE(
+ 			[AC_LANG_PROGRAM([[#include <stdio.h>
++#include <fcntl.h>
++#include <unistd.h>
+ #include <readline/readline.h>
+ #include <readline/history.h>]],		dnl includes
+ 			dnl function body
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index d7a0fc616d..e94cf19db4 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -16,6 +16,7 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+           file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


