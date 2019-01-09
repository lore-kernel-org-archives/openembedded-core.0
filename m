Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE4787C088
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:21:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x097KoLS031414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:21:00 -0800
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:20:39 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:39 +0800
Message-ID: <1547018383-19134-6-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 5/9] libsdl2: upgrade 2.0.8 -> 2.0.9
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
X-List-Received-Date: Wed, 09 Jan 2019 07:21:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop 0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch as it had been
merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141 ---------------------
 .../libsdl2/{libsdl2_2.0.8.bb => libsdl2_2.0.9.bb} |   5 +-
 2 files changed, 2 insertions(+), 144 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.8.bb => libsdl2_2.0.9.bb} (92%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
deleted file mode 100644
index 9b32b37..0000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From c215ba1d52a3d4ef03af3ab1a5baa1863f812aed Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 24 Aug 2018 23:10:25 +0200
-Subject: [PATCH] GLES2: Get sin/cos out of vertex shader
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The only place angle is activated and causes effect is RenderCopyEx. All other
-methods which use vertex shader, leave angle disabled and cause useless sin/cos
-calculation in shader.
-
-To get around shader's interface is changed to a vector that contains results
-of sin and cos. To behave properly when disabled, cos value is set with offset
--1.0 making 0.0 default when deactivated.
-
-As nice side effect it simplifies GLES2_UpdateVertexBuffer: All attributes are
-vectors now.
-
-Additional background:
-
-* On RaspberryPi it gives a performace win for operations. Tested with
-  [1] numbers go down for 5-10% (not easy to estimate due to huge variation).
-* SDL_RenderCopyEx was tested with [2]
-* It works around left rotated display caused by low accuracy sin implemetation
-  in RaspberryPi/VC4 [3]
-
-Upstream-Status: Accepted [4]
-
-[1] https://github.com/schnitzeltony/sdl2box
-[2] https://github.com/schnitzeltony/sdl2rendercopyex
-[3] https://github.com/anholt/mesa/issues/110
-[4] https://hg.libsdl.org/SDL/rev/e5a666405750
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- src/render/opengles2/SDL_render_gles2.c  | 17 ++++++++++++-----
- src/render/opengles2/SDL_shaders_gles2.c | 14 +++++++++-----
- 2 files changed, 21 insertions(+), 10 deletions(-)
-
-diff --git a/src/render/opengles2/SDL_render_gles2.c b/src/render/opengles2/SDL_render_gles2.c
-index 14671f7c8..7c54a7333 100644
---- a/src/render/opengles2/SDL_render_gles2.c
-+++ b/src/render/opengles2/SDL_render_gles2.c
-@@ -1530,7 +1530,7 @@ GLES2_UpdateVertexBuffer(SDL_Renderer *renderer, GLES2_Attribute attr,
-     GLES2_DriverContext *data = (GLES2_DriverContext *)renderer->driverdata;
- 
- #if !SDL_GLES2_USE_VBOS
--    data->glVertexAttribPointer(attr, attr == GLES2_ATTRIBUTE_ANGLE ? 1 : 2, GL_FLOAT, GL_FALSE, 0, vertexData);
-+    data->glVertexAttribPointer(attr, 2, GL_FLOAT, GL_FALSE, 0, vertexData);
- #else
-     if (!data->vertex_buffers[attr]) {
-         data->glGenBuffers(1, &data->vertex_buffers[attr]);
-@@ -1545,7 +1545,7 @@ GLES2_UpdateVertexBuffer(SDL_Renderer *renderer, GLES2_Attribute attr,
-         data->glBufferSubData(GL_ARRAY_BUFFER, 0, dataSizeInBytes, vertexData);
-     }
- 
--    data->glVertexAttribPointer(attr, attr == GLES2_ATTRIBUTE_ANGLE ? 1 : 2, GL_FLOAT, GL_FALSE, 0, 0);
-+    data->glVertexAttribPointer(attr, 2, GL_FLOAT, GL_FALSE, 0, 0);
- #endif
- 
-     return 0;
-@@ -1853,6 +1853,8 @@ GLES2_RenderCopy(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *s
-     return GL_CheckError("", renderer);
- }
- 
-+#define PI 3.14159265f
-+
- static int
- GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *srcrect,
-                  const SDL_FRect *dstrect, const double angle, const SDL_FPoint *center, const SDL_RendererFlip flip)
-@@ -1861,8 +1863,9 @@ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect
-     GLfloat vertices[8];
-     GLfloat texCoords[8];
-     GLfloat translate[8];
--    GLfloat fAngle[4];
-+    GLfloat fAngle[8];
-     GLfloat tmp;
-+    float radian_angle;
- 
-     GLES2_ActivateRenderer(renderer);
- 
-@@ -1872,7 +1875,11 @@ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect
- 
-     data->glEnableVertexAttribArray(GLES2_ATTRIBUTE_CENTER);
-     data->glEnableVertexAttribArray(GLES2_ATTRIBUTE_ANGLE);
--    fAngle[0] = fAngle[1] = fAngle[2] = fAngle[3] = (GLfloat)(360.0f - angle);
-+
-+    radian_angle = PI * (360.0f - angle) / 180.f;
-+    fAngle[0] = fAngle[2] = fAngle[4] = fAngle[6] = (GLfloat)sin(radian_angle);
-+    /* render expects cos value - 1 (see GLES2_VertexSrc_Default_) */
-+    fAngle[1] = fAngle[3] = fAngle[5] = fAngle[7] = (GLfloat)cos(radian_angle) - 1.0f;
-     /* Calculate the center of rotation */
-     translate[0] = translate[2] = translate[4] = translate[6] = (center->x + dstrect->x);
-     translate[1] = translate[3] = translate[5] = translate[7] = (center->y + dstrect->y);
-@@ -1901,7 +1908,7 @@ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect
-     data->glVertexAttribPointer(GLES2_ATTRIBUTE_CENTER, 2, GL_FLOAT, GL_FALSE, 0, translate);
-     data->glVertexAttribPointer(GLES2_ATTRIBUTE_POSITION, 2, GL_FLOAT, GL_FALSE, 0, vertices);*/
- 
--    GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_ANGLE, fAngle, 4 * sizeof(GLfloat));
-+    GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_ANGLE, fAngle, 8 * sizeof(GLfloat));
-     GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_CENTER, translate, 8 * sizeof(GLfloat));
-     GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_POSITION, vertices, 8 * sizeof(GLfloat));
- 
-diff --git a/src/render/opengles2/SDL_shaders_gles2.c b/src/render/opengles2/SDL_shaders_gles2.c
-index b0bcdff25..f428a4945 100644
---- a/src/render/opengles2/SDL_shaders_gles2.c
-+++ b/src/render/opengles2/SDL_shaders_gles2.c
-@@ -30,20 +30,24 @@
- /*************************************************************************************************
-  * Vertex/fragment shader source                                                                 *
-  *************************************************************************************************/
--
-+/* Notes on a_angle:
-+   * It is a vector containing sin and cos for rotation matrix
-+   * To get correct rotation for most cases when a_angle is disabled cos
-+     value is decremented by 1.0 to get proper output with 0.0 which is
-+     default value
-+*/
- static const Uint8 GLES2_VertexSrc_Default_[] = " \
-     uniform mat4 u_projection; \
-     attribute vec2 a_position; \
-     attribute vec2 a_texCoord; \
--    attribute float a_angle; \
-+    attribute vec2 a_angle; \
-     attribute vec2 a_center; \
-     varying vec2 v_texCoord; \
-     \
-     void main() \
-     { \
--        float angle = radians(a_angle); \
--        float c = cos(angle); \
--        float s = sin(angle); \
-+        float s = a_angle[0]; \
-+        float c = a_angle[1] + 1.0; \
-         mat2 rotationMatrix = mat2(c, -s, s, c); \
-         vec2 position = rotationMatrix * (a_position - a_center) + a_center; \
-         v_texCoord = a_texCoord; \
--- 
-2.14.4
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
similarity index 92%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
index 812a9ab..a5ec777 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
@@ -14,13 +14,12 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
-           file://0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "3800d705cef742c6a634f202c37f263f"
-SRC_URI[sha256sum] = "edc77c57308661d576e843344d8638e025a7818bff73f8fbfab09c3c5fd092ec"
+SRC_URI[md5sum] = "f2ecfba915c54f7200f504d8b48a5dfe"
+SRC_URI[sha256sum] = "255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.7.4


