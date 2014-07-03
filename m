Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B525265C68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 03:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s633M5q0025904
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 20:22:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 2 Jul 2014 20:22:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 11:23:42 +0800
Message-ID: <40ebe9e8e227d169dc7b03ff14b1a83b55e4f186.1404351610.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404351610.git.Qi.Chen@windriver.com>
References: <cover.1404351610.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eglibc: check for required distro features
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
X-List-Received-Date: Thu, 03 Jul 2014 03:22:10 -0000
Content-Type: text/plain

If users accidently override the DISTRO_FEATURES in local.conf,
then build failures occur for lack of libc functions.

All features in DISTRO_FEATURES_LIBC should be in DISTRO_FEATURES.
That's why this patch let the recipe inherit distro_features_check
class and set REQUIRED_DISTRO_FEATURES to "${DISTRO_FEATURES_LIBC}".

[YOCTO #6381]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/eglibc/eglibc.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 68128e9..af7f6ad 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -38,9 +38,14 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools texinfo
+inherit autotools texinfo distro_features_check
 require eglibc-options.inc
 
+# The main purpose of setting this variable is to prevent users from accidently
+# overriding DISTRO_FEATRUES, causing obscure build failures because of lack
+# of libc functions.
+REQUIRED_DISTRO_FEATURES = "${DISTRO_FEATURES_LIBC}"
+
 LEAD_SONAME = "libc.so"
 
 CACHED_CONFIGUREVARS += " \
-- 
1.7.9.5


