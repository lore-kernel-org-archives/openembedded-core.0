Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9498E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8177.1733294982177656906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I8bbDqho;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso55264405e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294980; x=1733899780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDq8TwCqtY05hFkJrjq+QtJBKjOOFLM8RsRd4/sB/ag=;
        b=I8bbDqho1l/Mu1FIkdHYydQR9VJP2vRMCWzAEPKp4nCwYLE64NeaZixViSa+PSDWm/
         rISHYNrolu6SJwX3OG0RtKkHysn7lhhwDWBKtLWQTwS89WrKsfRhJ5bwSTXuWIHLWor9
         SKKnBbW+34xBwf4zXw56rXxVOq5huHZjDtgycT30YH3SbAOfUKzMvmtikRZ8D4WQaaNM
         a3oEw0cz57lfV8GcN5KnSA+W2+QjG4soacjk3rFYGJNCh2yBbG0wAZgBI/hXYmE4VfIe
         7aFjtmMlnNIhFdMUn7GCXGoFhGsPJJc5U1JQARHuP2TAUCvEUyaDoZNwK/a9W2JtCOP3
         Ofeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294980; x=1733899780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDq8TwCqtY05hFkJrjq+QtJBKjOOFLM8RsRd4/sB/ag=;
        b=euCuzt4cV5vsTDHK356CJlR2l9nVYxB+NKwM9ZWX0DS0NfuHC6/g2ECRAIAzaN4Qg7
         C/I5RJNgZa3jE/WxHKXU/cYXpkwi+m0heBP/UMm0okk6Rz/hmnbWpcfL7zbqp++AY9WZ
         OQQO110pOPWzsAYCE6orsQurbdQbQcz/Eox/C0ceIm2LPQ7+FL2nnQfHQb9k5Z8h+F1d
         e/RhS3FJJT5qRDvjzibiDz45FOaFoI9ptfu5tIBQbBVvjAPGRpY+jDVU20+zrRrZUpq1
         EfeWKfAuPNCiuuVEZXEIIEY48Z3UxBOMRq8iO09agT1Jou0AT0KdJ2DQt2jdpsiB85YV
         MqBg==
X-Gm-Message-State: AOJu0YwaRx6zoXEw2/JRDqoPIgAwh7Bhj+40E2Z+OK0SUxo8qaIPl+Wr
	EY/rMkKU4kG4UQjjZt1XUzYrQgE9E9aDvoP9pomjTNughbq53qOWzQ+SKg==
X-Gm-Gg: ASbGncuzTPKXENrB8HMu80hAGrdnc959KIIrR8lBr/9Kn+VCaHYWt6GalLseCu3Ewp5
	ArqcBIm2uZIt4I7s0b7eR/OILcJR8UgHfDISAUEa7bCihe8Ws+fBZwW96ViLs8rTiUsNA8oCnrw
	8TnmbSWOxRfh12bUvCia9bVQRItLnU6xRz/EuaM76eqyCY6gaZATVmz3UNbyl7kULG5g+jhAIwc
	W/zRBS76yMaXLLSphuPJi00DIpFq8xYrbmlsHCMTx6RJg58CWlWNEE6P9KRHpxHC7HdWVCxQBSl
	Cizqocx5XWg=
X-Google-Smtp-Source: AGHT+IHujxWS64/vy9y4RQHs1GVk+Ct1aQIhZj9nsTekfLZTb6bRNDzSX7H96IHdvjB1y1j6RIqxTg==
X-Received: by 2002:a05:6000:4028:b0:385:f271:a224 with SMTP id ffacd0b85a97d-385fd3e784amr3935798f8f.18.1733294980427;
        Tue, 03 Dec 2024 22:49:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/37] cups: upgrade 2.4.10 -> 2.4.11
Date: Wed,  4 Dec 2024 07:48:55 +0100
Message-Id: <20241204064920.817016-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208241

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/cups/cups.inc                         | 2 +-
 .../cups/cups/0001-use-echo-only-in-init.patch              | 2 +-
 .../cups/0002-don-t-try-to-run-generated-binaries.patch     | 2 +-
 .../0004-cups-fix-multilib-install-file-conflicts.patch     | 6 +++---
 meta/recipes-extended/cups/cups/libexecdir.patch            | 5 ++---
 .../cups/{cups_2.4.10.bb => cups_2.4.11.bb}                 | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.10.bb => cups_2.4.11.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 9688efafae3..b8761df0d57 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -96,7 +96,7 @@ do_install () {
 PACKAGES =+ "${PN}-lib ${PN}-libimage ${PN}-webif"
 
 RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
-FILES:${PN} += "${libexecdir}/cups/"
+FILES:${PN} += "${libexecdir}/cups/ ${systemd_system_unitdir}/system-cups.slice"
 
 FILES:${PN}-lib = "${libdir}/libcups.so.*"
 
diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e6bd4007796..c0cb7df5812 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
+From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 75270cb0cbd..cf2f1a67470 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
+From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index d49fb8f2c2d..31338822e6f 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
+From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 93584a1..65b7052 100644
+index f96f745..27d8be9 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 7ccad94f0f3..493c7970eaf 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
@@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  config-scripts/cups-directories.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 2033d47..230166e 100644
+index 069ee7b..2f67e5b 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
diff --git a/meta/recipes-extended/cups/cups_2.4.10.bb b/meta/recipes-extended/cups/cups_2.4.11.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.10.bb
rename to meta/recipes-extended/cups/cups_2.4.11.bb
index e16ad47cf5e..71568295cb7 100644
--- a/meta/recipes-extended/cups/cups_2.4.10.bb
+++ b/meta/recipes-extended/cups/cups_2.4.11.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
+SRC_URI[sha256sum] = "9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71"
-- 
2.39.5


