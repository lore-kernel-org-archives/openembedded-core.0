Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C19BC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 12:25:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10877.1715171113950069810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 05:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DlkbqHkj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5858ca950f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448AdhfR004337
	for <openembedded-core@lists.openembedded.org>; Wed, 8 May 2024 12:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=YQGn+GSjZeuHkatFFKe+j58WcXsRt93dizIPY4FAIlE=; b=
	DlkbqHkjET3wvogqROvVhdebht+f3hw8zXrLxLsPMhxOuYnute2mMYywy0j5f1zq
	9YjAeo2foUjy96BZprSDO1xxap45wUGmAffAE4krnyMb5WUjlyceuHAW5ZF4yzE1
	FNp2f4uWOZi2WwIMCOWFOtduQ0fJJvLP7Nc5ATSAQOKFpao0Vjg9fpb5hxtAjWdK
	+ZlXzj8q4IdDyBAVTLg2MPui3KyYIeCd0CkOoALgzvQT8qsf217UjoTkFBbf0/Kn
	ZBdMnN9zPQ4V1jwPKy29m4R0kocSqlQu2SE5Y6ZqLnnS2RBtZU3SW9PQXQG9FFgQ
	Cca3Evm2+zWvAZ3U2FNkzQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xysn50r10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 12:25:13 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 05:25:10 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/2] xserver-xorg: fix CVE-2024-31083
Date: Wed, 8 May 2024 12:24:56 +0000
Message-ID: <20240508122456.1977036-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240508122456.1977036-1-archana.polampalli@windriver.com>
References: <20240508122456.1977036-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: lZm8X0wVnSeiZm39cnzWimzv_wWja16B
X-Proofpoint-GUID: lZm8X0wVnSeiZm39cnzWimzv_wWja16B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_07,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 12:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199120

From: Archana Polampalli <archana.polampalli@windriver.com>

FreeGlyph() function declared in render/glyphstr_priv.h, it is not present in
current recipe version and introduced in later versions, added this change to
render/glyphstr.h

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xserver-xorg/CVE-2024-31083-0001.patch    | 117 ++++++++++++++++++
 .../xserver-xorg/CVE-2024-31083-0002.patch    |  76 ++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   2 +
 3 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
new file mode 100644
index 0000000000..1ef9d933ae
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
@@ -0,0 +1,117 @@
+From bdca6c3d1f5057eeb31609b1280fc93237b00c77 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 30 Jan 2024 13:13:35 +1000
+Subject: [PATCH] render: fix refcounting of glyphs during ProcRenderAddGlyphs
+
+Previously, AllocateGlyph would return a new glyph with refcount=0 and a
+re-used glyph would end up not changing the refcount at all. The
+resulting glyph_new array would thus have multiple entries pointing to
+the same non-refcounted glyphs.
+
+AddGlyph may free a glyph, resulting in a UAF when the same glyph
+pointer is then later used.
+
+Fix this by returning a refcount of 1 for a new glyph and always
+incrementing the refcount for a re-used glyph, followed by dropping that
+refcount back down again when we're done with it.
+
+CVE-2024-31083, ZDI-CAN-22880
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+CVE: CVE-2024-31083
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/bdca6c3d1f5057ee]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ render/glyph.c    |  5 +++--
+ render/glyphstr.h |  2 ++
+ render/render.c   | 15 +++++++++++----
+ 3 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/render/glyph.c b/render/glyph.c
+index f3ed9cf..d5fc5f3 100644
+--- a/render/glyph.c
++++ b/render/glyph.c
+@@ -245,10 +245,11 @@ FreeGlyphPicture(GlyphPtr glyph)
+     }
+ }
+
+-static void
++void
+ FreeGlyph(GlyphPtr glyph, int format)
+ {
+     CheckDuplicates(&globalGlyphs[format], "FreeGlyph");
++    BUG_RETURN(glyph->refcnt == 0);
+     if (--glyph->refcnt == 0) {
+         GlyphRefPtr gr;
+         int i;
+@@ -354,7 +355,7 @@ AllocateGlyph(xGlyphInfo * gi, int fdepth)
+     glyph = (GlyphPtr) malloc(size);
+     if (!glyph)
+         return 0;
+-    glyph->refcnt = 0;
++    glyph->refcnt = 1;
+     glyph->size = size + sizeof(xGlyphInfo);
+     glyph->info = *gi;
+     dixInitPrivates(glyph, (char *) glyph + head_size, PRIVATE_GLYPH);
+diff --git a/render/glyphstr.h b/render/glyphstr.h
+index 2f51bd2..68f8c9e 100644
+--- a/render/glyphstr.h
++++ b/render/glyphstr.h
+@@ -117,6 +117,8 @@ extern GlyphSetPtr AllocateGlyphSet(int fdepth, PictFormatPtr format);
+ extern int
+  FreeGlyphSet(void *value, XID gid);
+
++void FreeGlyph(GlyphPtr glyph, int format);
++
+ #define GLYPH_HAS_GLYPH_PICTURE_ACCESSOR 1 /* used for api compat */
+ extern _X_EXPORT PicturePtr
+  GetGlyphPicture(GlyphPtr glyph, ScreenPtr pScreen);
+diff --git a/render/render.c b/render/render.c
+index 456f156..5bc2a20 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -1076,6 +1076,7 @@ ProcRenderAddGlyphs(ClientPtr client)
+
+         if (glyph_new->glyph && glyph_new->glyph != DeletedGlyph) {
+             glyph_new->found = TRUE;
++            ++glyph_new->glyph->refcnt;
+         }
+         else {
+             GlyphPtr glyph;
+@@ -1168,8 +1169,10 @@ ProcRenderAddGlyphs(ClientPtr client)
+         err = BadAlloc;
+         goto bail;
+     }
+-    for (i = 0; i < nglyphs; i++)
++    for (i = 0; i < nglyphs; i++) {
+         AddGlyph(glyphSet, glyphs[i].glyph, glyphs[i].id);
++        FreeGlyph(glyphs[i].glyph, glyphSet->fdepth);
++    }
+
+     if (glyphsBase != glyphsLocal)
+         free(glyphsBase);
+@@ -1179,9 +1182,13 @@ ProcRenderAddGlyphs(ClientPtr client)
+         FreePicture((void *) pSrc, 0);
+     if (pSrcPix)
+         FreeScratchPixmapHeader(pSrcPix);
+-    for (i = 0; i < nglyphs; i++)
+-        if (glyphs[i].glyph && !glyphs[i].found)
+-            free(glyphs[i].glyph);
++    for (i = 0; i < nglyphs; i++) {
++        if (glyphs[i].glyph) {
++            --glyphs[i].glyph->refcnt;
++            if (!glyphs[i].found)
++                free(glyphs[i].glyph);
++        }
++    }
+     if (glyphsBase != glyphsLocal)
+         free(glyphsBase);
+     return err;
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch
new file mode 100644
index 0000000000..3cea29f001
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch
@@ -0,0 +1,76 @@
+From 337d8d48b618d4fc0168a7b978be4c3447650b04 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 5 Apr 2024 15:24:49 +0200
+Subject: [PATCH] render: Avoid possible double-free in ProcRenderAddGlyphs()
+ ProcRenderAddGlyphs() adds the glyph to the glyphset using AddGlyph() and
+ then frees it using FreeGlyph() to decrease the reference count, after
+ AddGlyph() has increased it.
+
+AddGlyph() however may chose to reuse an existing glyph if it's already
+in the glyphSet, and free the glyph that was given, in which case the
+caller function, ProcRenderAddGlyphs() will call FreeGlyph() on an
+already freed glyph, as reported by ASan:
+
+  READ of size 4 thread T0
+    #0 in FreeGlyph xserver/render/glyph.c:252
+    #1 in ProcRenderAddGlyphs xserver/render/render.c:1174
+    #2 in Dispatch xserver/dix/dispatch.c:546
+    #3 in dix_main xserver/dix/main.c:271
+    #4 in main xserver/dix/stubmain.c:34
+    #5 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+    #6 in __libc_start_main_impl ../csu/libc-start.c:360
+    #7  (/usr/bin/Xwayland+0x44fe4)
+  Address is located 0 bytes inside of 64-byte region
+  freed by thread T0 here:
+    #0 in __interceptor_free libsanitizer/asan/asan_malloc_linux.cpp:52
+    #1 in _dixFreeObjectWithPrivates xserver/dix/privates.c:538
+    #2 in AddGlyph xserver/render/glyph.c:295
+    #3 in ProcRenderAddGlyphs xserver/render/render.c:1173
+    #4 in Dispatch xserver/dix/dispatch.c:546
+    #5 in dix_main xserver/dix/main.c:271
+    #6 in main xserver/dix/stubmain.c:34
+    #7 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+  previously allocated by thread T0 here:
+    #0 in __interceptor_malloc libsanitizer/asan/asan_malloc_linux.cpp:69
+    #1 in AllocateGlyph xserver/render/glyph.c:355
+    #2 in ProcRenderAddGlyphs xserver/render/render.c:1085
+    #3 in Dispatch xserver/dix/dispatch.c:546
+    #4 in dix_main xserver/dix/main.c:271
+    #5 in main xserver/dix/stubmain.c:34
+    #6 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+  SUMMARY: AddressSanitizer: heap-use-after-free xserver/render/glyph.c:252 in FreeGlyph
+
+To avoid that, make sure not to free the given glyph in AddGlyph().
+
+v2: Simplify the test using the boolean returned from AddGlyph() (Michel)
+v3: Simplify even more by not freeing the glyph in AddGlyph() (Peter)
+
+Fixes: bdca6c3d1 - render: fix refcounting of glyphs during ProcRenderAddGlyphs
+Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1659
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1476>
+
+CVE: CVE-2024-31083
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/337d8d48b618d4fc]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ render/glyph.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/render/glyph.c b/render/glyph.c
+index d5fc5f3..f5069d4 100644
+--- a/render/glyph.c
++++ b/render/glyph.c
+@@ -291,8 +291,6 @@ AddGlyph(GlyphSetPtr glyphSet, GlyphPtr glyph, Glyph id)
+     gr = FindGlyphRef(&globalGlyphs[glyphSet->fdepth], signature,
+                       TRUE, glyph->sha1);
+     if (gr->glyph && gr->glyph != DeletedGlyph && gr->glyph != glyph) {
+-        FreeGlyphPicture(glyph);
+-        dixFreeObjectWithPrivates(glyph, PRIVATE_GLYPH);
+         glyph = gr->glyph;
+     }
+     else if (gr->glyph != glyph) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 0a8cb7d81a..fe577050d9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -19,6 +19,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-31080.patch \
            file://CVE-2024-31081.patch \
            file://CVE-2024-31082.patch \
+           file://CVE-2024-31083-0001.patch \
+           file://CVE-2024-31083-0002.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.40.0


