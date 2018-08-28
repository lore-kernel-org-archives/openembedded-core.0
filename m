Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 743A27531A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 21:17:48 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id s12-v6so3255147wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jwxDJsHJnb/YUtk+GIgqirV6spKXVwnH92+UIADMv74=;
	b=PrSJ1zPX5PXYSlybRp+0Qhs46w5DCJ+9jIEJUSz2eLLk5yW7mhqAm+kcktwouNLfJu
	DpeMJi1QxRvBhy1zmghBrafOziT4PU6wdvonW608uiNHF/qsuSPfL4Y4RXczGlOXuZOT
	6tMSpvUFcM0DNifFM1dbPme9d3YI1qvg5EaKet1ts08CrRJmW9lzhpwa8mHd+dmskpbp
	pxsfQVENmwFF82nMts+ElWzI8hCU3DWkQe4OPGMqVPZYJAU5kR1OBkCHjbAyU/7s+Qnj
	0Gfcp7xx2lBU2odvCbfUuwUNRmhHkipGMQpyIf75LxXpWS5s5lV2Hi5wLLAuctMBCZLe
	sz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jwxDJsHJnb/YUtk+GIgqirV6spKXVwnH92+UIADMv74=;
	b=jZ7NekfzvTpx4krdcHvYp4YfLSNP2vFSobjdj7R/YLcArJ1gKGVY3XBoPwl586jJhY
	Ux1iAv6IJLvr2seHfnlfm9lGteYy4dCMxACfiT373Phr/08f8mcY5UHuEWze++QfVKa1
	tYWIDln51oZb0RnDGnzjxPhaNjbBD1FB7Iyg64StPRG/WNgcTjZn9CgHaRR72/XVSSzV
	VxiaqLWo6lZyTAm5rBoceJiMW7Kbq3UQ0eLuzi2dnYUpBzGl8Jkybt3XYZYDbTXrTQna
	EanKaIs4WsJs9FZyd+BO0h59hNxbzOBdUQ4rLtv/cD/wLgE5rpoquwMw5HdO3tLhN0JB
	gdNQ==
X-Gm-Message-State: APzg51Da9C5q1qqtLtXooPJcYAdXT4VzlUO1g6VSybQeFtElciz6AXeM
	s/Basfp8yHkSOyjixcz3cu3MYH4J
X-Google-Smtp-Source: ANB0VdaZKzIrcJBlN9XaaMIBPigH9LjCVNdpejez/p/QAiAFSQyhgFfwKH5mnvDHWtXcS2Hm8nECUA==
X-Received: by 2002:a1c:2108:: with SMTP id
	h8-v6mr2351556wmh.108.1535491068623; 
	Tue, 28 Aug 2018 14:17:48 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BD956381E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bd9:5638:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	j66-v6sm3978233wrj.28.2018.08.28.14.17.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Aug 2018 14:17:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 23:17:37 +0200
Message-Id: <20180828211737.16865-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] libsdl2: Fix left rotated display for RaspberryPi/VC4
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
X-List-Received-Date: Tue, 28 Aug 2018 21:17:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch should increase performance for GLES2 too.

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
+Upstream-Status: Applied [4]
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


