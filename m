Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B0C74721E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 11:32:34 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so10172950wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 03:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9ALVVqYykBALM60gWKC1G+HPsd8FtRbrBcgAkvkJ5Zg=;
	b=mehlmvLsRkUhqjaSjxhxXGnAEQlVQ6afsYs95SuJdLe98HtZr5jZNc8vnG+AbSC4xO
	YUHJPTrHA6p4iC+vLWj6QSzzahaT8WkWu75OJIfkeukl5T4wWxW1NSJA4b9zZLxwII+m
	IKiNkVYCC4OTBHMXCqAZHrFbizigcD9lSGm8X1jx3Vm3+WT8p0SkXc9nclhaGaGDvOcz
	YzDx4pj1JEi2CKQD6lXcLNPR1Iw679qJCIbKM863HOOCz0SlMbsPRP0cZRHZS6M9fnEZ
	52KIjlOcI5mmp9YID2kGSmjfT+9aPG/nrbphgv7k6QVLLa32U9iNs4zSdB/yfqi/kOdS
	vhfw==
X-Gm-Message-State: ALoCoQnjenix6ILlxO5hMiyvKNYjI9NgI78t6q/hjp/fLJl0b1BOMvKh6MPu4yjGbI7shxUrKzyj
X-Received: by 10.194.92.116 with SMTP id cl20mr6305773wjb.71.1421235154480;
	Wed, 14 Jan 2015 03:32:34 -0800 (PST)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ep9sm2990957wid.3.2015.01.14.03.32.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jan 2015 03:32:33 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jan 2015 12:32:29 +0100
Message-Id: <1421235149-13079-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] libgpg-error 1.17: simplify tupple handling and add armv8b support
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
X-List-Received-Date: Wed, 14 Jan 2015 11:32:42 -0000

Add a default option to the case statement and remove the duplicates. Also add support for armv8b architectures.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.17.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
index c905bd1..843b9ae 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
@@ -28,18 +28,14 @@ do_compile_prepend() {
 	fi
 
 	case ${TARGET_ARCH} in
-	  aarch64)    TUPLE=aarch64-unknown-linux-gnu ;;
+	  aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
 	  i586)       TUPLE=i486-pc-linux-gnu ;;
-	  mipsel)     TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips64el)   TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips64)     TUPLE=mips-unknown-linux-gnu ;;
-	  mips)       TUPLE=mips-unknown-linux-gnu ;;
-	  powerpc64)  TUPLE=powerpc64-unknown-linux-gnu ;;
-	  powerpc)    TUPLE=powerpc-unknown-linux-gnu ;;
-	  sh4)	      TUPLE=sh4-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
+	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;; 
 	esac
 
 	cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
-- 
1.9.3


