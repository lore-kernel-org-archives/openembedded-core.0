Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 551627E6B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BD451184AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:19 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id vehrXWelw-2U
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:19 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0F08918238
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:19 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFF971E087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4A0D1E07F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:18 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:18 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id D8B0CFDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:18 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8BG0IXU012961
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:00:18 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8BG0INC012960
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Sep 2019 18:00:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 18:00:16 +0200
Message-Id: <20190911160016.12916-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] glibc-testsuite: Depend on virtual/libc-locale instead of glibc-locale
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
X-List-Received-Date: Wed, 11 Sep 2019 16:00:19 -0000
Content-Transfer-Encoding: 8bit

This avoids the following error when using some other toolchain than
the one provided by OE-Core:

  ERROR: Nothing PROVIDES 'glibc-locale' (but
  .../meta/recipes-core/glibc/glibc-testsuite_2.30.bb DEPENDS on or
  otherwise requires it)
  glibc-locale was skipped: PREFERRED_PROVIDER_virtual/libc-locale set
  to some-other-glibc-locale, not glibc-locale

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I doubt glibc-testsuite will work when another toolchain is used, but
with this change it does at least not fail the build anymore.

 meta/recipes-core/glibc/glibc-testsuite_2.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
index 64fa8d87df..170e865cb0 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
@@ -8,7 +8,7 @@ PROVIDES = ""
 # setup depends
 INHIBIT_DEFAULT_DEPS = ""
 
-DEPENDS += "glibc-locale libgcc gcc-runtime"
+DEPENDS += "virtual/libc-locale libgcc gcc-runtime"
 
 # remove the initial depends
 DEPENDS_remove = "libgcc-initial"
-- 
2.21.0


