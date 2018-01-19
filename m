Return-Path: <ole2mail@mail.com>
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
	by mail.openembedded.org (Postfix) with ESMTP id 0881F60721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 16:15:42 +0000 (UTC)
Received: from ole2-ThinkPad-P50.encara.local.ads ([109.0.249.184]) by
	mail.gmx.com (mrgmxus001 [74.208.5.15]) with ESMTPSA (Nemesis) id
	0MGSQA-1eYBbj1w5Q-00DI9Y; Fri, 19 Jan 2018 17:15:43 +0100
From: Oleg Kokorin <ole2mail@mail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 17:15:31 +0100
Message-Id: <1516378531-23996-1-git-send-email-ole2mail@mail.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K0:WoWXc8vZJazC6pg2QTzRp6TY56zRmUP3ujwzHavlVmjvcBbAPVq
	zl6DRFBzuosCB5XiHnAIatJSdm/EM1vzYqonQshlc4Q234BHa2IM6vxjMCVOgC+qRU3aZKt
	r06F899gxDtWOanxXm8MDv5GYYsPJwUithrjEzWgEkt8q+lf455OG9skOkHoguD8OCwvxlj
	8Hmz6sCQnQJDgtXAN9yfg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ND6m39CSHms=:wFb0bMyvpOBM9CeWBCBsMt
	ofyPqXgRxXL9Z2ZD9WFy/3Qdrv/S+oc2Kj70vH6k86gnG2wFZW5LKbasxZcgYc9KpYWstL4dN
	xTQHvHId0dbHwerUzwEBRnd3OapARtq8EtQVKS838EMmdwG/QSQVMa8qz74MzsFVtirOCnUl+
	cCApXNSySWbXbC9U0YxTfXywUu3Unz5odA6XDDkMwmM5+7t5Z03XDRp2YDWpMuCZ0VxBJRKrZ
	Tbltbt4CWgop2/7ZCoTWtQcg1xeoMIQBRPE00N/uRjkryM26nbFx09c3BR1YV9lX6UO0HPb9T
	mvH8LnZ6W2RRBRlXV17MHrqJfb4kj16ZSX2Q3EB/sN9xbXvfypTTG0br7/2EUYzdeMYd6fMRE
	6yC8BLb39RolAzYzUpwi4OmjP36z+lDTAzw890FotLGoPd44otObUKrrXlChf+dUZkxFD7qh8
	/wpVRXfbU067DBKScwTvDglZ9z1Fml7w4UlZtLjjShLzzgFvMdLKKgvQYL/kN7avSfX0p7hPr
	3/jsiRVFgW02z3fXJymWeA+H6LAGrEYAbzFAkb8O7kJKuDF5tn6KJwK+QBzMHQbjOh5IDWDo7
	KAjqtRsI09ahMDFc2M9JcAGf/VM7qDwXHvAoFFob3YW582ZDvQJkRHNnBaG4FxMzbk+Dj/6LA
	t793aXyVa1gGG4JaBxT4/zd5EMVGcOnA4PsW0TRvPu1dJTZLjZoBoUDZs4bIvZDzInLBv6iUj
	IAmLME2Fygi2OK8c/rEs6OTCZzmhjqU9WDqA7fWL0PQ5HXRLYjaF5RkMuSXX6KTC+XgT9Mavi
	NFs1yuNIk2UdaJgfBVjhr4MQnmLDQ==
Subject: [PATCH] [PATCH v4] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 16:15:43 -0000

hashtable_iterator_key and hashtable_iterator_value redefinition inside
mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error

Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
---
 .../mtd-utils-fix-hashtable_iterator.patch         | 58 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
new file mode 100644
index 0000000..b6cf3a3
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Submitted to dizzy
+
+Author: Oleg Kokorin <ole2mail@mail.com>
+Date:   Fri Jan 19 11:52:12 2018 +0100
+
+mtd-utils: remove double hashtable iterator definition
+
+hashtable_iterator_key and hashtable_iterator_value redefinition inside
+mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error:
+
+|   CC      mkfs.ubifs/hashtable/hashtable_itr.o
+| mkfs.ubifs/hashtable/hashtable_itr.c:42:1: error: redefinition of 'hashtable_iterator_key'
+|  hashtable_iterator_key(struct hashtable_itr *i)
+|  ^
+| In file included from mkfs.ubifs/hashtable/hashtable_itr.c:5:0:
+| mkfs.ubifs/hashtable/hashtable_itr.h:32:1: note: previous definition of 'hashtable_iterator_key' was here
+|  hashtable_iterator_key(struct hashtable_itr *i)
+|  ^
+| mkfs.ubifs/hashtable/hashtable_itr.c:46:1: error: redefinition of 'hashtable_iterator_value'
+|  hashtable_iterator_value(struct hashtable_itr *i)
+|  ^
+| In file included from mkfs.ubifs/hashtable/hashtable_itr.c:5:0:
+| mkfs.ubifs/hashtable/hashtable_itr.h:41:1: note: previous definition of 'hashtable_iterator_value' was here
+|  hashtable_iterator_value(struct hashtable_itr *i)
+
+Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
+
+Index: setup-scripts/build/tmp-angstrom_v2014_12-glibc/work/x86_64-linux/mtd-utils-native/1.5.1+gitAUTOINC+9f107132a6-r0/git/mkfs.ubifs/hashtable/hashtable_itr.h
+===================================================================
+--- a/mkfs.ubifs/hashtable/hashtable_itr.h
++++ b/mkfs.ubifs/hashtable/hashtable_itr.h
+@@ -27,22 +27,22 @@ hashtable_iterator(struct hashtable *h);
+ /*****************************************************************************/
+ /* hashtable_iterator_key
+  * - return the value of the (key,value) pair at the current position */
+-
++/*
+ extern inline void *
+ hashtable_iterator_key(struct hashtable_itr *i)
+ {
+     return i->e->k;
+ }
+-
++*/
+ /*****************************************************************************/
+ /* value - return the value of the (key,value) pair at the current position */
+-
++/*
+ extern inline void *
+ hashtable_iterator_value(struct hashtable_itr *i)
+ {
+     return i->e->v;
+ }
+-
++*/
+ /*****************************************************************************/
+ /* advance - advance the iterator to the next element
+  *           returns zero if advanced to end of table */
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 52297c6..f903a65 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,6 +11,7 @@ SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
 		file://fix-armv7-neon-alignment.patch \
+		file://mtd-utils-fix-hashtable_iterator.patch \
 "
 
 PV = "1.5.1+git${SRCPV}"
-- 
2.7.4


