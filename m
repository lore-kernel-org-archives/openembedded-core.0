Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id E9658751AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 19:06:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j15-v6so3788198wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZqWjsyRbnF2vLhiJAeIudIEM9FhpYCbWIdauXiaF/QI=;
	b=N5Deqo/TsjmbmFRhC8SKFv2euE0uupvpDwsrre+p2YyS8yurCRYb/BEfPRrxwHlEM7
	LLwy9XJHggfm1ZqAICB3tzu9qWxhVbFXuQDz4qNbC26dfiwffImb7AqyL5MfjJRbuxEK
	JjHRO9n+U7ytWoVc2rpnzjhYo/xRwhD//qTnyb23L4spiOYFTDuqf5OBsDYfNXBrq/2T
	aOQpF/AEWuwfNlfkCLZ8aGqMg/iGo3VcvK87rI8NA+znRItJxi+KS8yZ3vuJzszVXALm
	T6mDqjfNOiNzQFKrmdIosrE7NsP42D6140cTZSZz8LHhxgKa9kU/kFvv4FynBNuQdqbP
	TTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZqWjsyRbnF2vLhiJAeIudIEM9FhpYCbWIdauXiaF/QI=;
	b=RgiJKjrq2Ga5ea9HnG310r+y6lzyRbneTydcXQVmCaMcHwL7H8hKob7dTySdmsfEZq
	2A8UhEmIk41F5b6LOUC9yxlbYbDIM9KLKXQY5qhOC4qvKkMKho9YcOKhEiANQ4uJLEls
	tVrtO+FOdBfqkm3c/7PAvSFxPBIFHp1j5KlYf4GWrDECp7XXBIvtqmYHsWu+ltpbMbva
	/mjdArGzOeKUXXWSGpg5s8knBpStD4d70gtOtsv23ZZ3xfeI7q+3GzV64CEnFuATGzo3
	xPYCVdiUGTIfZM9UFKJpicjdVTi2rCrqSgWuWRmxHnIjvPahrtHy483+eI7t4Pr8u5Ev
	2sDA==
X-Gm-Message-State: ABuFfohMpxYOc7uOPKB/6iemguad8NnfME9LL4vH9+WA3slBT1PzILQJ
	+6237EhRKYr3zMY7ul0XGpiwF0H6
X-Google-Smtp-Source: ACcGV603qroh8EayWel/EGtD86PDlSKmal4lJR2aQjsXekJGtXI72GMQiXQ2ilygbkYBcq3vNsO3ug==
X-Received: by 2002:adf:f90b:: with SMTP id
	b11-v6mr1704765wrr.307.1538075217985; 
	Thu, 27 Sep 2018 12:06:57 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC51E191E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc5:1e19:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	p18-v6sm2879192wrj.8.2018.09.27.12.06.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Sep 2018 12:06:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 21:06:48 +0200
Message-Id: <20180927190648.27553-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [sumo][PATCH] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Thu, 27 Sep 2018 19:06:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch should increase performance for libsdl2 on GLES2 too.

(From OE-Core rev: 52f9659f2bb44affec2f67935df01f13b6ff3e02)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141 +++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
new file mode 100644
index 0000000000..9b32b3788d
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
@@ -0,0 +1,141 @@
+From c215ba1d52a3d4ef03af3ab1a5baa1863f812aed Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 24 Aug 2018 23:10:25 +0200
+Subject: [PATCH] GLES2: Get sin/cos out of vertex shader
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The only place angle is activated and causes effect is RenderCopyEx. All other
+methods which use vertex shader, leave angle disabled and cause useless sin/cos
+calculation in shader.
+
+To get around shader's interface is changed to a vector that contains results
+of sin and cos. To behave properly when disabled, cos value is set with offset
+-1.0 making 0.0 default when deactivated.
+
+As nice side effect it simplifies GLES2_UpdateVertexBuffer: All attributes are
+vectors now.
+
+Additional background:
+
+* On RaspberryPi it gives a performace win for operations. Tested with
+  [1] numbers go down for 5-10% (not easy to estimate due to huge variation).
+* SDL_RenderCopyEx was tested with [2]
+* It works around left rotated display caused by low accuracy sin implemetation
+  in RaspberryPi/VC4 [3]
+
+Upstream-Status: Accepted [4]
+
+[1] https://github.com/schnitzeltony/sdl2box
+[2] https://github.com/schnitzeltony/sdl2rendercopyex
+[3] https://github.com/anholt/mesa/issues/110
+[4] https://hg.libsdl.org/SDL/rev/e5a666405750
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/render/opengles2/SDL_render_gles2.c  | 17 ++++++++++++-----
+ src/render/opengles2/SDL_shaders_gles2.c | 14 +++++++++-----
+ 2 files changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/src/render/opengles2/SDL_render_gles2.c b/src/render/opengles2/SDL_render_gles2.c
+index 14671f7c8..7c54a7333 100644
+--- a/src/render/opengles2/SDL_render_gles2.c
++++ b/src/render/opengles2/SDL_render_gles2.c
+@@ -1530,7 +1530,7 @@ GLES2_UpdateVertexBuffer(SDL_Renderer *renderer, GLES2_Attribute attr,
+     GLES2_DriverContext *data = (GLES2_DriverContext *)renderer->driverdata;
+ 
+ #if !SDL_GLES2_USE_VBOS
+-    data->glVertexAttribPointer(attr, attr == GLES2_ATTRIBUTE_ANGLE ? 1 : 2, GL_FLOAT, GL_FALSE, 0, vertexData);
++    data->glVertexAttribPointer(attr, 2, GL_FLOAT, GL_FALSE, 0, vertexData);
+ #else
+     if (!data->vertex_buffers[attr]) {
+         data->glGenBuffers(1, &data->vertex_buffers[attr]);
+@@ -1545,7 +1545,7 @@ GLES2_UpdateVertexBuffer(SDL_Renderer *renderer, GLES2_Attribute attr,
+         data->glBufferSubData(GL_ARRAY_BUFFER, 0, dataSizeInBytes, vertexData);
+     }
+ 
+-    data->glVertexAttribPointer(attr, attr == GLES2_ATTRIBUTE_ANGLE ? 1 : 2, GL_FLOAT, GL_FALSE, 0, 0);
++    data->glVertexAttribPointer(attr, 2, GL_FLOAT, GL_FALSE, 0, 0);
+ #endif
+ 
+     return 0;
+@@ -1853,6 +1853,8 @@ GLES2_RenderCopy(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *s
+     return GL_CheckError("", renderer);
+ }
+ 
++#define PI 3.14159265f
++
+ static int
+ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *srcrect,
+                  const SDL_FRect *dstrect, const double angle, const SDL_FPoint *center, const SDL_RendererFlip flip)
+@@ -1861,8 +1863,9 @@ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect
+     GLfloat vertices[8];
+     GLfloat texCoords[8];
+     GLfloat translate[8];
+-    GLfloat fAngle[4];
++    GLfloat fAngle[8];
+     GLfloat tmp;
++    float radian_angle;
+ 
+     GLES2_ActivateRenderer(renderer);
+ 
+@@ -1872,7 +1875,11 @@ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect
+ 
+     data->glEnableVertexAttribArray(GLES2_ATTRIBUTE_CENTER);
+     data->glEnableVertexAttribArray(GLES2_ATTRIBUTE_ANGLE);
+-    fAngle[0] = fAngle[1] = fAngle[2] = fAngle[3] = (GLfloat)(360.0f - angle);
++
++    radian_angle = PI * (360.0f - angle) / 180.f;
++    fAngle[0] = fAngle[2] = fAngle[4] = fAngle[6] = (GLfloat)sin(radian_angle);
++    /* render expects cos value - 1 (see GLES2_VertexSrc_Default_) */
++    fAngle[1] = fAngle[3] = fAngle[5] = fAngle[7] = (GLfloat)cos(radian_angle) - 1.0f;
+     /* Calculate the center of rotation */
+     translate[0] = translate[2] = translate[4] = translate[6] = (center->x + dstrect->x);
+     translate[1] = translate[3] = translate[5] = translate[7] = (center->y + dstrect->y);
+@@ -1901,7 +1908,7 @@ GLES2_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect
+     data->glVertexAttribPointer(GLES2_ATTRIBUTE_CENTER, 2, GL_FLOAT, GL_FALSE, 0, translate);
+     data->glVertexAttribPointer(GLES2_ATTRIBUTE_POSITION, 2, GL_FLOAT, GL_FALSE, 0, vertices);*/
+ 
+-    GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_ANGLE, fAngle, 4 * sizeof(GLfloat));
++    GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_ANGLE, fAngle, 8 * sizeof(GLfloat));
+     GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_CENTER, translate, 8 * sizeof(GLfloat));
+     GLES2_UpdateVertexBuffer(renderer, GLES2_ATTRIBUTE_POSITION, vertices, 8 * sizeof(GLfloat));
+ 
+diff --git a/src/render/opengles2/SDL_shaders_gles2.c b/src/render/opengles2/SDL_shaders_gles2.c
+index b0bcdff25..f428a4945 100644
+--- a/src/render/opengles2/SDL_shaders_gles2.c
++++ b/src/render/opengles2/SDL_shaders_gles2.c
+@@ -30,20 +30,24 @@
+ /*************************************************************************************************
+  * Vertex/fragment shader source                                                                 *
+  *************************************************************************************************/
+-
++/* Notes on a_angle:
++   * It is a vector containing sin and cos for rotation matrix
++   * To get correct rotation for most cases when a_angle is disabled cos
++     value is decremented by 1.0 to get proper output with 0.0 which is
++     default value
++*/
+ static const Uint8 GLES2_VertexSrc_Default_[] = " \
+     uniform mat4 u_projection; \
+     attribute vec2 a_position; \
+     attribute vec2 a_texCoord; \
+-    attribute float a_angle; \
++    attribute vec2 a_angle; \
+     attribute vec2 a_center; \
+     varying vec2 v_texCoord; \
+     \
+     void main() \
+     { \
+-        float angle = radians(a_angle); \
+-        float c = cos(angle); \
+-        float s = sin(angle); \
++        float s = a_angle[0]; \
++        float c = a_angle[1] + 1.0; \
+         mat2 rotationMatrix = mat2(c, -s, s, c); \
+         vec2 position = rotationMatrix * (a_position - a_center) + a_center; \
+         v_texCoord = a_texCoord; \
+-- 
+2.14.4
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index c0cf70d7fd..8092fad11e 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -16,6 +16,7 @@ DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtu
 
 SRC_URI = " \
     http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+    file://0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.14.4


