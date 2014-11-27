Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C626A7235D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 00:49:57 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1XtnHR-0006wM-CS from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Nov 2014 16:49:57 -0800
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.3.181.6; Wed, 26 Nov 2014 16:49:56 -0800
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Nov 2014 19:49:54 -0500
Message-ID: <1417049395-15437-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] glew: Additional fix for generation of glew.pc.
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
X-List-Received-Date: Thu, 27 Nov 2014 00:49:57 -0000
Content-Type: text/plain

Without this fix, building mesa-demos with the glew
PACKAGECONFIG will result in errors like the below
being logged in tmp/work/*/mesa-demos/*/build/config.log:

    configure:16529: checking for GLEW
    configure:16536: $PKG_CONFIG --exists --print-errors "glew >= 1.5.4"
    Package @requireslib@ was not found in the pkg-config search path.
    Perhaps you should add the directory containing `@requireslib@.pc'
    to the PKG_CONFIG_PATH environment variable
    Package '@requireslib@', required by 'glew', not found
    configure:16539: $? = 1

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
index a20fbfc..70a99ae 100644
--- a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
+++ b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
@@ -39,7 +39,8 @@ Index: glew-1.11.0/glew.pc.in
 -Version: @version@
 -Cflags: -I${includedir} @cflags@
 -Libs: -L${libdir} -l@libname@
+-Requires: @requireslib@
 +Version: @VERSION@
 +Cflags: -I${includedir} @CFLAGS@
 +Libs: -L${libdir} -lGLEW
- Requires: @requireslib@
++Requires: glu
-- 
1.9.1


