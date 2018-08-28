Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DC05B78E21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 22:20:10 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id q8-v6so3516302wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jk6gXKMdSntJcmgOTBcG7CY5luArwDzVj5U/oXCt7Yc=;
	b=mXLSp1+GQMl6sJ7gtsHvUNippczshmMhmv4/0BERiQpuX08/3mf5ezTvXsLzVtTBU1
	g1N4Rke79R+3zwfDnNu69hgo+KT/I5CTpnz+qcasLTd2Rjz22abYlVigkfiE4BKmXsfO
	1idryh20v5TPuiKer+AGyvM/IMvmceaX2e/1xurOl5jVexLXhsS6TjJ9phip9vu41tGl
	dSd14q3OF7XXP+HWux+eTRYdRFBtdOq+2h+30wjvLWZHGJc70yzwc2DCIkdyciYRBMdR
	Z8hjyYWz/sNGUFBtJ2C67rQkkouSx1kzGDuXa+y7l1v+t8MWFIV6F5sqQ6VvbVhOENyd
	30mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jk6gXKMdSntJcmgOTBcG7CY5luArwDzVj5U/oXCt7Yc=;
	b=sJc09n0x8ucw6LFKsDUCVEnX3YUPfx9Tv8OVmGiYhjpoCdA+iwguX26fWa3VgUc3AT
	cY0KcE8rbtSI7GS3xUvOOfusFW6OrGpdamGfXbPLZ+yB5k9waK/9lpJPSJ9axaPvUhAJ
	AdggilH8nfKTGbxSwkMJyJgoJsBx9Lr+oo/ftRLwWtNTUKdhcM5XSzl7wrPMz032YLkz
	sSCB9aFU9LtUnFieM4kVyImSS7PHzXJ+teFluKXoobqNz2kXd8WmSuwH8snv0mPnlaac
	3BE4MtN+zmsUrFjRSPmM8MZynzpEbFPB2iV0H9lScaf6MJwU+6vJVJh+/G8ONgVhHZgu
	9Peg==
X-Gm-Message-State: APzg51CMymqk0FGEgMBY34f8ovbIFDFNqTA2DZGWCtjoerkxUbdayeJv
	+2pKfcrPp+E0sMZAt/ZiTEkOg4QP
X-Google-Smtp-Source: ANB0VdZ9PekHks0Gv89rbES8Y18A051wyeYDZPs+d+H1gRHAPeB4x56FLPHhq6FSZOd+vxC5nQ0V6w==
X-Received: by 2002:a1c:938a:: with SMTP id
	v132-v6mr2644415wmd.114.1535494810925; 
	Tue, 28 Aug 2018 15:20:10 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BD956381E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bd9:5638:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm3263061wrq.73.2018.08.28.15.20.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Aug 2018 15:20:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 00:19:54 +0200
Message-Id: <20180828221954.3214-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH v2] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Tue, 28 Aug 2018 22:20:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch should increase performance for libsdl2 on GLES2 too.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141 +++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
new file mode 100644
index 0000000000..621b7ea1a0
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
+Upstream-Status: Submitted [4]
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
index accea38aaa..52bb93a17a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -14,6 +14,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.14.4


