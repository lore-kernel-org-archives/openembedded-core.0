Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6F427E024
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 14:31:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4SEVCG6016582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:31:12 -0700 (PDT)
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 28 May 2019 07:31:06 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 10:31:03 -0400
Message-ID: <20190528143104.30168-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] bash: add iso8859-1 gconv RDEPENDS needed by bash-ptest.
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
X-List-Received-Date: Tue, 28 May 2019 14:31:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

One of the ptests failed for internationalization.
From the failed ptest log:
   run-intl
   fr_FR.ISO8859-1: Error Encoding U+00000080 to  [ "$'\200'" != "\\u0080" ]
   (125 similar errors related to same encoding)
The test was unable to convert iso8859-1 encoding to perform comparison.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 4b3692c613..1e4dc55d01 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -26,8 +26,15 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make coreutils perl"
 
 DEPENDS_append_libc-glibc = " virtual/libc-locale"
-RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us locale-base-fr-fr locale-base-fr-fr.iso-8859-1 locale-base-de-de locale-base-zh-hk.big5-hkscs glibc-utils"
-
+RDEPENDS_${PN}-ptest_append_libc-glibc = " \
+	glibc-gconv-iso8859-1 \
+	glibc-utils \
+	locale-base-de-de \
+	locale-base-en-us \
+	locale-base-fr-fr \
+	locale-base-fr-fr.iso-8859-1 \
+	locale-base-zh-hk.big5-hkscs \
+	"
 USERADD_PACKAGES = "${PN}-ptest"
 USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
 
-- 
2.20.1


