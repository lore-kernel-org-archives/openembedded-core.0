Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 503737D35F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 08:21:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3B8Ki3I025037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 01:21:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 11 Apr 2019 01:20:47 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2019 16:20:46 +0800
Message-ID: <1554970846-190302-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] cogl: fix compile error caused by -Werror=maybe-uninitialized
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
X-List-Received-Date: Thu, 11 Apr 2019 08:21:14 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

When enable DEBUG_BUILD, cogl compile failed with error:

| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|      *out_gltype = gltype;
|      ~~~~~~~~~~~~^~~~~~~~
| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|      *out_glintformat = glintformat;
|      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~

Source: https://gitlab.gnome.org/GNOME/cogl/blob/master/cogl/driver/gl/gles/cogl-driver-gles.c
it can handle correctly, so fix with -Wnoerror

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 7a79aa7..3e392fa 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-examples-install	\
 	       	 --disable-gles1		\
 	         --disable-cairo                \
 	    	"
+DEBUG_OPTIMIZATION_append = " -Wno-error=maybe-uninitialized"
 
 # OpenGL/GLX
 PACKAGECONFIG[glx] = "--enable-gl --enable-glx,--disable-gl --disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11},${ERDEPENDS_GL}"
-- 
2.7.4


