Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC066E872
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 01:44:05 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id up15so13960877pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 17:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=in+8o7vDsFijLURisG62zmZvJUkTTDA5C+mqcZRqs9A=;
	b=zbbs8YKH2G4eGThRhuyX+oR//3MxGhjOBa7OrrqhZfwhvms3CM+387dZFXoytWDFUs
	gEQfSfHihabCG46fqMtzID7T15lSZ+JdzvCBoYoy2OM+5Du5BbnrqQ8JSIyDFCtmQyHJ
	BvrpBSJ6YW2MpLC5Y16sDyHX6qAicUX/E+E8I6KsFG9E7/gWo7HjCkaSvRuT3rBb+CRf
	fin+HAcXy7DEfP7/MPUGgs5Aom7XLDWRSAcoHmZ9TlKOCnfEZXGgFRSKiImZtLRM6wTd
	GUOIeRVpE1yLjxJumc1Bq5PTijMede9IB7ovCrJaHNsilSemjafZUh1dlBc9hdymxT0w
	AwTg==
X-Received: by 10.66.16.131 with SMTP id g3mr135061pad.138.1392515046701;
	Sat, 15 Feb 2014 17:44:06 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	id1sm31390194pbc.11.2014.02.15.17.44.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Feb 2014 17:44:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2014 01:45:25 +0000
Message-Id: <1392515125-10593-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] openssl: Fix build on uclibc
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
X-List-Received-Date: Sun, 16 Feb 2014 01:44:05 -0000

we need to map OS string correctly to include linux-uclibcspe
which is what we use with ppc+spe on uclibc, additionally move
gnuspe triplet mapping to same code as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 373d329..e924914 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -66,6 +66,10 @@ do_configure () {
 		os=linux
 	elif [ "x$os" = "xlinux-uclibceabi" ]; then
 		os=linux
+	elif [ "x$os" = "xlinux-uclibcspe" ]; then
+		os=linux
+	elif [ "x$os" = "xlinux-gnuspe" ]; then
+		os=linux
 	elif [ "x$os" = "xlinux-gnueabi" ]; then
 		os=linux
 	fi
@@ -113,9 +117,6 @@ do_configure () {
 	linux-powerpc)
 		target=linux-ppc
 		;;
-	linux-gnuspe-powerpc)
-		target=linux-ppc
-		;;
 	linux-powerpc64)
 		target=linux-ppc64
 		;;
-- 
1.7.10.4


