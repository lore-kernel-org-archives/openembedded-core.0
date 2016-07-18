Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 736AB731C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:32:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I3Wqlg019046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:32:54 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:32:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:32:41 -0700
Message-ID: <d120adbc702e84ccc6996df429c44d9002e7057e.1468811788.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468811788.git.liezhi.yang@windriver.com>
References: <cover.1468811788.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] rpm: make --nosignature work
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
X-List-Received-Date: Mon, 18 Jul 2016 03:32:57 -0000
Content-Type: text/plain

OE-core uses rpm's --nosignature, but it never worked:
self._invoke_smart('config --set rpm-check-signatures=false')

Now fix it with:
* Define SUPPORT_NOSIGNATURES to 1 in system.h
* !QVA_ISSET(qva->qva_flags, SIGNATURE) -> QVA_ISSET(qva->qva_flags, SIGNATURE),
  otherwise, when use --nosignature would read database and verify
  signature, this is not expected.

This can fix some race issues, for example, when more than one process
are querying rpm file with "rpm -qp --nosignature", they may hang up
because of race issues (the processes are trying to get RW/RD lock on
the database, but they shouldn't read the database at all since -qp and
--nosignature are used).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...0001-system.h-query.c-support-nosignature.patch | 64 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch b/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
new file mode 100644
index 0000000..410ae78
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
@@ -0,0 +1,64 @@
+From d8fcc3cbeec4defb5babde5bd09ea294dd3fd08b Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 3 Jul 2016 19:01:59 -0700
+Subject: [PATCH] system.h/query.c: support nosignature
+
+* Define SUPPORT_NOSIGNATURES to 1 in system.h
+* !QVA_ISSET(qva->qva_flags, SIGNATURE) -> QVA_ISSET(qva->qva_flags, SIGNATURE),
+  otherwise, when use --nosignature would read database and verify
+  signature, this is not expected.
+
+Upstream-Status: Submitting [Sent email to rpm-devel@rpm5.org]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/query.c | 6 +++---
+ system.h    | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/query.c b/lib/query.c
+index 50a7453..b761d76 100644
+--- a/lib/query.c
++++ b/lib/query.c
+@@ -954,19 +954,19 @@ JBJDEBUG((stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, qva, argv));
+     vsflags = (rpmVSFlags) rpmExpandNumeric("%{?_vsflags_query}");
+     vsflags = (rpmVSFlags) 0;	/* XXX FIXME: ignore default disablers. */
+ #if defined(SUPPORT_NOSIGNATURES)
+-    if (!QVA_ISSET(qva->qva_flags, DIGEST)) {
++    if (QVA_ISSET(qva->qva_flags, DIGEST)) {
+ 	VSF_SET(vsflags, NOSHA1HEADER);
+ 	VSF_SET(vsflags, NOMD5HEADER);
+ 	VSF_SET(vsflags, NOSHA1);
+ 	VSF_SET(vsflags, NOMD5);
+     }
+-    if (!QVA_ISSET(qva->qva_flags, SIGNATURE)) {
++    if (QVA_ISSET(qva->qva_flags, SIGNATURE)) {
+ 	VSF_SET(vsflags, NODSAHEADER);
+ 	VSF_SET(vsflags, NORSAHEADER);
+ 	VSF_SET(vsflags, NODSA);
+ 	VSF_SET(vsflags, NORSA);
+     }
+-    if (!QVA_ISSET(qva->qva_flags, HDRCHK)) {
++    if (QVA_ISSET(qva->qva_flags, HDRCHK)) {
+ 	VSF_SET(vsflags, NOHDRCHK);
+     }
+     VSF_CLR(vsflags, NEEDPAYLOAD);	/* XXX needed? */
+diff --git a/system.h b/system.h
+index 2ff8906..ad4619a 100644
+--- a/system.h
++++ b/system.h
+@@ -787,9 +787,9 @@ static inline const char *rcsid(const char *p) { \
+ #define SUPPORT_I18NSTRING_TYPE	1
+ 
+ /**
+- * Eliminate signature/digest disablers.
++ * Signature/digest disablers.
+  */
+-#undef	SUPPORT_NOSIGNATURES
++#define SUPPORT_NOSIGNATURES 1
+ 
+ /**
+  * Permit ar(1) payloads. Disabled while rpmio/iosm.c is under development.
+-- 
+2.9.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 3adb29c..d264d50 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -117,6 +117,7 @@ SRC_URI += " \
 	   file://rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch \
 	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
 	   file://gcc6-stdlib.patch \
+	   file://0001-system.h-query.c-support-nosignature.patch \
 "
 
 # OE specific changes
-- 
2.9.0


