Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC5D79C92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 23:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.me;
	h=from:subject:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type;
	s=smtpapi; bh=eu288QJGRuUw8qvpwCsWfElBNzAQIlH3WDdLz6PZuLc=;
	b=R76VffFWYHHZhe1siryOeS30XJYIfCQkdj/1CghJYkk6Q7n4zlprHno9sQBJCSycnX3H
	G07EAxo/Zh+AZfe4B84pGfLTbmzd5BEqJX6uVNxD3ptTVRVCl+P6hNpeMIqIwsJwAi/iB/
	jjyrUFUt0R3lfDCB1QTQM+N97ivGGeUGU=
Received: by filter0060p3iad2.sendgrid.net with SMTP id
	filter0060p3iad2-21542-5D534706-29
	2019-08-13 23:25:58.661991619 +0000 UTC m=+1572063.372870616
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0008p1hnd1.sendgrid.net (SG) with ESMTP id
	SNVVRoMVS9aA7jqJ2dK2sg Tue, 13 Aug 2019 23:25:58.256 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
Date: Tue, 13 Aug 2019 23:25:58 +0000 (UTC)
Message-Id: <20190813232542.16955-4-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813232542.16955-1-t-keweng@microsoft.com>
References: <20190813232542.16955-1-t-keweng@microsoft.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?5plbwHlDV1x0k2R0bHwCzxXjHeGg9GIuX3p3eyxUEIsO2BVtB=2F3iyHMXziEfDg?=
	=?us-ascii?Q?PZfL8EzAFZJc88Bp7OZWZwRdCI7mNQ0sfI3oYJX?=
	=?us-ascii?Q?1aekwUpFmN4h5C9MSA42+B++3qNyhG=2FWkgqqTvu?=
	=?us-ascii?Q?3Jz8mup4m+yjSkxxAXFoMpNrPaAekpOQ5gI+Tnc?=
	=?us-ascii?Q?hybGclKanCoy=2F4PYfSowY1uZBHPUnP5PEe9ZCZQ?=
	=?us-ascii?Q?JclKPX=2F2KwHnqG7O+47SqR4lmjADRKDl5E1niCb?=
	=?us-ascii?Q?+hc=2FKDArfeRWkM5G1WrCA=3D=3D?=
To: openembedded-core@lists.openembedded.org
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH v2 4/4] libcomps: fix CVE-2019-3817
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
X-List-Received-Date: Tue, 13 Aug 2019 23:25:57 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
---
 .../libcomps/libcomps/CVE-2019-3817.patch     | 97 +++++++++++++++++++
 .../recipes-devtools/libcomps/libcomps_git.bb |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch b/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch
new file mode 100644
index 0000000000..b8cfb3c4db
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch
@@ -0,0 +1,97 @@
+From cea10cd1f2ef6bb4edaac0c1d46d47bf237c42b8 Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <rschiron@redhat.com>
+Date: Mon, 21 Jan 2019 18:11:42 +0100
+Subject: [PATCH] Fix UAF in comps_objmrtree_unite function
+
+The added field is not used at all in many places and it is probably the
+left-over of some copy-paste.
+
+Upstream-Status: Backport
+[https://github.com/rpm-software-management/libcomps/commit
+/e3a5d056633677959ad924a51758876d415e7046]
+
+CVE: CVE-2019-3817
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ libcomps/src/comps_mradix.c    | 2 --
+ libcomps/src/comps_objmradix.c | 2 --
+ libcomps/src/comps_objradix.c  | 2 --
+ libcomps/src/comps_radix.c     | 1 -
+ 4 files changed, 7 deletions(-)
+
+diff --git a/libcomps/src/comps_mradix.c b/libcomps/src/comps_mradix.c
+index 338cb07..6ceb7c9 100644
+--- a/libcomps/src/comps_mradix.c
++++ b/libcomps/src/comps_mradix.c
+@@ -177,7 +177,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COMPS_MRTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+@@ -195,7 +194,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COMPS_MRTree *rt2) {
+         parent_pair = (struct Pair*) it->data;
+         free(it);
+ 
+-        pair->added = 0;
+         for (it = tmp_subnodes->first; it != NULL; it=it->next) {
+             pair = malloc(sizeof(struct Pair));
+             pair->subnodes = ((COMPS_MRTreeData*)it->data)->subnodes;
+diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix.c
+index 9be6648..8771c89 100644
+--- a/libcomps/src/comps_objmradix.c
++++ b/libcomps/src/comps_objmradix.c
+@@ -285,7 +285,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS_ObjMRTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+@@ -303,7 +302,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS_ObjMRTree *rt2) {
+         parent_pair = (struct Pair*) it->data;
+         free(it);
+ 
+-        pair->added = 0;
+         for (it = tmp_subnodes->first; it != NULL; it=it->next) {
+             pair = malloc(sizeof(struct Pair));
+             pair->subnodes = ((COMPS_ObjMRTreeData*)it->data)->subnodes;
+diff --git a/libcomps/src/comps_objradix.c b/libcomps/src/comps_objradix.c
+index a790270..0ebaf22 100644
+--- a/libcomps/src/comps_objradix.c
++++ b/libcomps/src/comps_objradix.c
+@@ -692,7 +692,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_ObjRTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+@@ -711,7 +710,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_ObjRTree *rt2) {
+         //printf("key-part:%s\n", parent_pair->key);
+         free(it);
+ 
+-        //pair->added = 0;
+         for (it = tmp_subnodes->first; it != NULL; it=it->next) {
+             pair = malloc(sizeof(struct Pair));
+             pair->subnodes = ((COMPS_ObjRTreeData*)it->data)->subnodes;
+diff --git a/libcomps/src/comps_radix.c b/libcomps/src/comps_radix.c
+index ada4fda..05dcaf2 100644
+--- a/libcomps/src/comps_radix.c
++++ b/libcomps/src/comps_radix.c
+@@ -529,7 +529,6 @@ void comps_rtree_unite(COMPS_RTree *rt1, COMPS_RTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+-- 
+2.22.0
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index e69bf67729..b657f3377c 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0002-Set-library-installation-path-correctly.patch \
            file://0001-Make-__comps_objmrtree_all-static-inline.patch \
+           file://CVE-2019-3817.patch \
            "
 
 PV = "0.1.8+git${SRCPV}"
-- 
2.22.0


