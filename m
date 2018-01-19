Return-Path: <ole2mail@mail.com>
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
	by mail.openembedded.org (Postfix) with ESMTP id ECCC578744
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 13:54:37 +0000 (UTC)
Received: from localhost.localdomain ([109.0.249.169]) by mail.gmx.com
	(mrgmxus002 [74.208.5.15]) with ESMTPSA (Nemesis) id
	0Lh7bN-1f8WZ040v9-00oTTj; Fri, 19 Jan 2018 14:54:38 +0100
From: Oleg Kokorin <ole2mail@mail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 14:54:29 +0100
Message-Id: <1516370069-9287-1-git-send-email-ole2mail@mail.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K0:erNWcUEmzMtTo5gFNr5OsBrpPHDHQIfCzYF4xq5sRfbfz3uvnhr
	xaKE6iZOSuBxrSrGr7gRGVsfU/QJ9c9jHHZ5j/Og14FUOXQF9+FvAhho4RmL5c9dN0CEAoR
	9pYrA0nR0QLa1uRoJ3DFxvFizrUap2/xPKmyLEPy9QfBZS2dFjxTcQ052TVPKP8MiywxjTG
	QX/oIPVSutDkIxhxYthGA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:QyH6DsqfPPc=:K/uDhID5x5ZIaxtFrzug0D
	/My0OMP08aQA/Qmrwb55188c1y2mz2KmMaDTNPMwwtHYWkpG4r380JaXO5a6RgCkfQ6ErM7Nl
	k9mjDx3AX5lNbCAf2bhmVw7Ax54ZeJGN4mqBIE1SdcRPLEkb8Vodn73gPkY+dJIdFLJXHM/4q
	bCEPJ8t8HrZ6ycc8/gGdgT3PeFfHtfW8ckX3uT3s6oHjEIwwvZZCiMdkb7TeAmOtTeMsEho81
	YZ/gHrScpmtuNH5ZnBa+j2lHRGJo4FXaCQZUKR9lWElSA5qV9EZ/JF0SJRjPlA5jstbG9grDC
	ikkSql2e712qdbB7O6au1cZDu0iXN5oWC1yV/1U6Z82XTL7Kb7z5pbOidktrKgroswMeDYNlV
	cI8lEOsygB7gK+JIhTyaBxS2F3RoMmSmM2s76EHKsIMLrg8J+7Mbn5MlZyGlhyV7JNfjq9CgG
	k/Kj62fSQV190RO6UGDitWzmxz6YklmLi3TaNx7LJ7ti99bS9/srqIuMAuX4gq+j/sn76Hsuv
	Hw5rJZx9eBbH4VdLLIB2ZMY11qZl7Pkl/1qYecAdypP2q82KXxdOE88lRuRXqUXH3z4Cr9LGl
	r/AwMwf8ijZqxHpj79oYaSd8cBvYIzBGNcGK4BbAwlsG3B18DwnbeEc4o1zofalyZaOfmW7rp
	Pf269UfWmM7YDu6Xe02/rwxXCu3NldT0ciKkb/a0fvFup0vwRw/87xxTyJKDCodpSF9ypLj/x
	MccXAnWNozTylDUeH8ybZhQjd3+TzRnz9+YfemaSkLDn/sTGadrrp85NMBDtXHmS773fFd2XJ
	PhsbXECu62A1izJbYPY1d7vTLzxgQ==
Subject: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 13:54:38 -0000

hashtable_iterator_key and hashtable_iterator_value redefinition inside
mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error

Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
---
 .../mtd-utils-fix-hashtable_iterator.patch         | 43 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
new file mode 100644
index 0000000..c7a46bd
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+Author: Oleg Kokorin <ole2mail@mail.com>
+Date:   Fri Jan 19 11:52:12 2018 +0100
+
+    mtd-utils: remove double hashtable iterator definition
+
+    hashtable_iterator_key and hashtable_iterator_value redefinition inside
+    mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error
+
+    Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
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


