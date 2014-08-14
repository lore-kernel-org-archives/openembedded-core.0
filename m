Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF1665D5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:48:16 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so1135132pdj.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TqeegDCxcSptbXUU8xOBEkxtICAPz9/lZZo5cVejTDo=;
	b=glx2bHNkuO0ec1DO7YMWyk/711TlWbc02qRnefVBqZ3UBJ3krH73utJwtUbYOIjlXq
	CiCAhJ7btu7DBNkAN+QyLg+a1uSbCFbN2PxdWcxgNwGtkJwVqAcFixGYAdLJpCOZ8RbQ
	hYQrPcTM13UjDdfcj8ED8od3totzgkinWdZ3pIA6KLDHa6tMzekGb9/HLj+IPF/DpCsF
	M1et5pX7r1joG1PrOYceapWeOKQFihxBYgR3SDsCFdtJaYV92JVU9bPy1Qyp0hFCK/lb
	2LOI2Nn1yOC9Pf5fwtR9RFUirSbuLYgbLv6zsDi8RD02mS1DIL6WoSsqpM63eoNCih5l
	am+A==
X-Received: by 10.68.69.69 with SMTP id c5mr518167pbu.155.1408002497550;
	Thu, 14 Aug 2014 00:48:17 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id ha4sm4335221pbb.78.2014.08.14.00.48.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 00:48:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 00:51:25 -0700
Message-Id: <1408002686-5641-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
References: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc-cross-initial: Put limits.h in gccdir/include
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 07:48:19 -0000

musl e.g. is configured to not use fixed-include
which is an improvement btw. but libgcc-initial configure
has tests which probe for limits.h and since we put
it in include-fixed/ dir and that dir does not appear
in gcc's internal default search path the configure tests
for CPP detection fail and libgcc-initial can not be compiled.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 5a6da8b..448d311 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -66,7 +66,7 @@ do_install () {
 	# includes real limits.h but this real limits.h is not staged yet
 	# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
 	# to get rid references to real limits.h
-	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include/limits.h
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
 	case ${PN} in
-- 
1.7.10.4


