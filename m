Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E928665CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 06:08:44 +0000 (UTC)
Received: by wgso17 with SMTP id o17so69423581wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 23:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5NlI3TnEijWAFPeWfvfC3nXbYqVAdzaAO1Gyebaiemc=;
	b=m9YDK+IpXNRSQLMwnjnZdmAFnF774IMwbSLp20fUQh0zOaWbDFTYRMeZ4vFRQ1/tP9
	dcNkmU34UBAl9FzBdyoSFkSN4+RfhfGCZQ03bCo9VB8Z6zsFpZTFlYDH4SzWmhIETVHs
	l3mXj/9PC2QwQ0DngWT91Jso/RYegahtqDdjuRL18X6xrx+xqd645IarNJ43mkwex3cW
	5Fm/LAhkL74iJCnYrzicqJKPQaOqcuK6ruTEoW/9xT/O4FCM56M6ISciGVNWy/E9uae5
	Xa26JEjDwV08ba2qYXvZ+Fc1f6jXyY8NqdAZUiljHd/TsKYuLdXC+NJB2ZIk/sUdQTbe
	dGEQ==
X-Gm-Message-State: ALoCoQnxMaQY6VXJFVlyGz+EW25+IErnyvJUWfp/Hv97S+Ei+xzi7XOuPyMVE4ShwFyQbzf72Xbz
X-Received: by 10.180.81.104 with SMTP id z8mr5426147wix.5.1428905325202;
	Sun, 12 Apr 2015 23:08:45 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id l10sm9899910wje.15.2015.04.12.23.08.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Apr 2015 23:08:44 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 08:08:40 +0200
Message-Id: <1428905320-15709-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] libgpg-error 1.18: simplify tupple handling and add armv8b support
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
X-List-Received-Date: Mon, 13 Apr 2015 06:08:48 -0000

Add a default option to the case statement and remove the duplicates. Also add support for armv8b architectures.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.18.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
index 268066b..c9a47a3 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
@@ -27,18 +27,14 @@ do_compile_prepend() {
 	fi
 
 	case ${TARGET_ARCH} in
-	  aarch64)    TUPLE=aarch64-unknown-linux-gnu ;;
+	  aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
 	  i586|i686)  TUPLE=i486-pc-linux-gnu ;;
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


