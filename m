Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3E05E767B4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 21:49:50 +0000 (UTC)
Received: by pdbmi9 with SMTP id mi9so7974078pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yqaASsLFZ2jmFypYtCE3ZnQw3pqQjLTUqBjM3B8DWIo=;
	b=odyFKTaZZ4TQLbNoHAW7QCC4cGY72V6ig/LIWiwuFe+css75NLyAgS8hc0IlS/klap
	A8lGoP6MlOyqsvBeZh3K82E2/BXBV/fqmybHFZ80FHpBZrZen1kvQOnhT38Mlfm710ts
	GgWQGSuRZ8wkShhPpG213WlV0BXNtuC3N/ZjoGnms+oCSwpGV4IqN/PQof59HJg6YSZ7
	Y/k7MIrpKReZjX44Oaj94BG+okAx9OfpabWraPVGpRr9wHd82qj0RFq/F2wEtSg4G/4W
	eUDAO8gWt0FDP4Xi425EI+Jv4wUwpGvsQFXnGz/UlUWVwUDryI4y3YJTD6bqK5QCnGoc
	9Qgw==
X-Received: by 10.70.53.101 with SMTP id a5mr35790013pdp.49.1439761790427;
	Sun, 16 Aug 2015 14:49:50 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	dw2sm3293132pab.18.2015.08.16.14.49.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 14:49:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2015 14:49:42 -0700
Message-Id: <1439761782-15310-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1439761782-15310-1-git-send-email-akuster808@gmail.com>
References: <1439761782-15310-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/2] tune-octeon: add tune file for Octeon
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
X-List-Received-Date: Sun, 16 Aug 2015 21:49:50 -0000

From: Armin Kuster <akuster@mvista.com>

this add Mips Octeon tune features.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/machine/include/tune-octeon.inc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-octeon.inc

diff --git a/meta/conf/machine/include/tune-octeon.inc b/meta/conf/machine/include/tune-octeon.inc
new file mode 100644
index 0000000..f80f970
--- /dev/null
+++ b/meta/conf/machine/include/tune-octeon.inc
@@ -0,0 +1,27 @@
+DEFAULTTUNE ?="octeon2"
+
+require conf/machine/include/tune-mips64.inc
+
+AVAILTUNES += "octeon2 octeon2_64 octeon3 octeon3_64"
+
+TUNEVALID[octeon2] = "Enable optimization related to octeon2 support"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon2", " -march=octeon2 ", "",d)}"
+TUNE_FEATURES_tune-octeon2 = "${TUNE_FEATURES_tune-mips64-n32} octeon2"
+MIPSPKGSFX_VARIANT_tune-octeon2 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-octeon2 = "mips64-n32 octeon2 octeon2_64-n32"
+
+TUNE_FEATURES_tune-octeon2_64 = "${TUNE_FEATURES_tune-mips64} octeon2"
+MIPSPKGSFX_VARIANT_tune-octeon2_64 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-octeon2_64 = "mips64 octeon2_64"
+
+
+TUNEVALID[octeon3] = "Enable optimization related to octeon3 support"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon3", " -march=octeon3 ", "",d)}"
+
+TUNE_FEATURES_tune-octeon3 = "${TUNE_FEATURES_tune-mips64-n32} octeon3"
+MIPSPKGSFX_VARIANT_tune-octeon3 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-octeon3 = "mips64-n32 octeon3 octeon3_64-n32"
+
+TUNE_FEATURES_tune-octeon3_64 = "${TUNE_FEATURES_tune-mips64} octeon3"
+MIPSPKGSFX_VARIANT_tune-octeon3_64 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-octeon3_64 = "mips64 octeon3_64"
-- 
2.3.5


