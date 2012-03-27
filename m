Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCcZ3-0007Ij-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 22:00:22 +0200
Received: by obqv19 with SMTP id v19so309402obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zZxf0aJaMCptINrLONZniwDZxUgcL9crRmOgQq5nLuQ=;
	b=FkjQa87iSCVX6T6p1ZzPahkvV3aNlbv8lGEeeuLv+eTkOgzKT3x/syQr3YwML7LxTT
	hhd3ocel507cEUv9zRHxHPwwlG+O4UXlqy1y9jk3OEUEzuPVSzwANIwwgamJziLkHLC4
	EdTbvLNWxGYE+0xanTw1rcWQhRjfjcNgVox02hXESKKrPwqw5t5XWorS9IiiK0jXxlOR
	WToUjNLH+7k3TUEddWgK3c1hclHOvs2NCXxjtDljw4CzgOIRYsKKBbLdh5WLZgNT9GnF
	90dFom23ZBTTEWfQpHViWdxG80ZBOfMcZgsVHbWCxmC1NfqaJ+KNR9Qg+1P99qjn7bsN
	Keig==
Received: by 10.182.172.100 with SMTP id bb4mr34916497obc.28.1332877878175;
	Tue, 27 Mar 2012 12:51:18 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id v9sm797626obo.9.2012.03.27.12.51.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 12:51:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 14:51:08 -0500
Message-Id: <1332877869-12195-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>, edmar@freescale.com
Subject: [PATCH 2/3] powerpc e500: set -mfloat-gprs=double
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 20:00:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

Use of FPRs instead of GPRs is incompatible with e500/SPE, so let's be
explicit about the use of GPRs to avoid potential errors. For example, with
the Sourcery G++ toolchain, one can hit: conftest.c:1:0: error: E500 and FPRs
not supported.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/machine/include/tune-ppce500.inc   |    2 +-
 meta/conf/machine/include/tune-ppce500v2.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 1326720..feb1967 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -7,7 +7,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "
 TUNE_PKGARCH_tune-ppce500 = "ppce500"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
 
 TARGET_FPU = "ppc-efs"
 
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index e7b51c6..f0158d0 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -7,7 +7,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548",
 TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
+TUNE_CCARGS += '${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}'
 
 TARGET_FPU = "ppc-efd"
 
-- 
1.7.7



