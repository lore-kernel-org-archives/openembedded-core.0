Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B129C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 10:10:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4281.1742379010517587253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 03:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvWkoQGY;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso31273505e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742379009; x=1742983809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEHccNUO5AgSbA2pCYV4nqCQE7web6CB6OtZZ+KjVf4=;
        b=UvWkoQGYVaA1yDU3BV77ZOepR/aKSXDunjrNiwd1sy4qq0dlA2xHJSIew++4oBA79Z
         QULBrUhYWFSFVOXnUObw/mxLdAlUebZAPdxC+5RIWAn9iZcpbqVVDSyJkzrUCHUplG+d
         IkI1w0i5N4hZcpZIxt4vlkhCRL2JQmMafr3wJ3+PUsZB7NgmxpnQ8uyNYyYbko262gj8
         y2+WJja3DBUUHb0rNJST9IOIkaQo3uOlNNKPE1hsNR1CCiMSbT2bcpcKc75OxkGeWoJj
         NcUHtEcmREu6fYO693tFYybR3Ep9MPcE3MDoWP+pQSaxzBci1lIAdknPqdj12ZEv/KQ9
         7jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379009; x=1742983809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEHccNUO5AgSbA2pCYV4nqCQE7web6CB6OtZZ+KjVf4=;
        b=lR9Mu1+VfKpuKUuSdnxrbUiQGdGUvAXSW6C5/3IRq38ODirrwWI67msEEbvd0ix+M7
         wFCZ3HqOAiKhhBDq4B2VUf0aeiQU/t54wCnDdaYR5916D+gl5ey+GxhRx5a+4X1fP0Fs
         /TwvHP24lwe6TnDlJhGDHDSZ7WB0GjLX5BtgJEaeiSqj0ixsznFRVWbjtUwjyAnLIHNh
         4RduHIuifm9UKOF+7tq+Snk6fDqoWsS3pDHd/kaBosxSkmfBhdrTFCVo+QoW7Ox+v7W5
         UCQv1/9TuRpKYugeM9bTZhhqh7UhiaA4x2Wv/S8CzZ7jGlaG7S320aDpJqsgc9rL+HY9
         SEOQ==
X-Gm-Message-State: AOJu0YwqW5prtKiZob/IOszmSMUMnad+WI9Hsm7EUyLnSIEqF7R5Imor
	+P0r8j2d+TRR1RV3qsP5DTK7TkSRj7hMLufPB0UeaPUQc17bnqFyNPHWRA==
X-Gm-Gg: ASbGnctmD9MlhIokt6w7VNZlSQyc4N5b+xTZDAz2GwUB5srNjgJA2SUDO69xZqecLP3
	ngYBdbPYgdD1+dBU8C9c+oKE8Hj6ThrUo9rr7Fs9j18aRP1Kjv54TMbGz/UYHCP+xni5ZRJ1Yj2
	VR4/xbaO4Jh7GMKRLFwjM5lP4wXgYTaKop6rThmpok4Gj3SBd/YDlfLXirejNRCUDEfeP7mr6+/
	5FiDTv/Tru7iHrrxNMKzqnGKy6tfygf1xnP+eOUEwzs22ug4n58Vtm/9YQKSlQdyjZY6wXkvXir
	efJDagMWnNnSyFoQCDTFxcwWLRecNgtZHXFpftSJbbpenWm/rUwI9r22DVC8toSozNDelF7HSBu
	f6SZodg==
X-Google-Smtp-Source: AGHT+IFtKKZOxTZ0F6x2a3CL0lax/IS1wZsY2DyK4gMlzppy1BRUklzmRcFk/5AQaEyxxwg1St5r8A==
X-Received: by 2002:a05:600c:4fc8:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43d4378212cmr13667305e9.6.1742379008131;
        Wed, 19 Mar 2025 03:10:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f55c3dsm14226425e9.23.2025.03.19.03.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:10:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] mesa-demos: update 8.5.0 -> 9.0.0
Date: Wed, 19 Mar 2025 11:09:59 +0100
Message-Id: <20250319100959.4102512-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319100959.4102512-1-alex.kanavin@gmail.com>
References: <20250319100959.4102512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213319

From: Alexander Kanavin <alex@linutronix.de>

The new version is in a location that isn't discoverable
by upstream version checks, and so has been overlooked for a while.

Drop patches:
0001-mesa-demos-Add-missing-data-files.patch
(backport)
0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
(very old patch rejected by upstream as not necessary and not making sense:
https://gitlab.freedesktop.org/mesa/demos/-/issues/9 )

Disably wayland for now due to libdecor dependency,
adjust other feature dependencies as needed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-mesa-demos-Add-missing-data-files.patch | 624 ------------------
 ...-DEMOS_DATA_DIR-to-locate-data-files.patch | 234 -------
 ...esa-demos_8.5.0.bb => mesa-demos_9.0.0.bb} |  15 +-
 3 files changed, 8 insertions(+), 865 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
 rename meta/recipes-graphics/mesa/{mesa-demos_8.5.0.bb => mesa-demos_9.0.0.bb} (74%)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
deleted file mode 100644
index 93ee9c286d0..00000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
+++ /dev/null
@@ -1,624 +0,0 @@
-From b695c3a3fa3f4cd48c13aa26542110de27075518 Mon Sep 17 00:00:00 2001
-From: Drew Moseley <drew_moseley@mentor.com>
-Date: Mon, 12 May 2014 15:22:32 -0400
-Subject: [PATCH 1/9] mesa-demos: Add missing data files.
-
-Add some data files that are present in the git repository:
-   http://cgit.freedesktop.org/mesa/demos/tree/?id=mesa-demos-8.1.0
-but not in the release tarball
-   ftp://ftp.freedesktop.org/pub/mesa/demos/8.1.0/mesa-demos-8.1.0.tar.bz2
-
-Upstream-Status: Backport
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/fpglsl/depth-read.glsl      |   4 +
- src/fpglsl/infinite-loop.glsl   |   7 +
- src/glsl/CH11-bumpmaptex.frag   |  47 +++++++
- src/glsl/blinking-teapot.frag   |  31 +++++
- src/glsl/blinking-teapot.vert   |  16 +++
- src/glsl/convolution.frag       |  21 +++
- src/glsl/simplex-noise.glsl     | 279 ++++++++++++++++++++++++++++++++++++++++
- src/glsl/skinning.vert          |  24 ++++
- src/perf/glslstateschange1.frag |  19 +++
- src/perf/glslstateschange1.vert |  14 ++
- src/perf/glslstateschange2.frag |  17 +++
- src/perf/glslstateschange2.vert |  14 ++
- src/vpglsl/infinite-loop.glsl   |   8 ++
- 13 files changed, 501 insertions(+)
- create mode 100644 src/fpglsl/depth-read.glsl
- create mode 100644 src/fpglsl/infinite-loop.glsl
- create mode 100644 src/glsl/CH11-bumpmaptex.frag
- create mode 100644 src/glsl/blinking-teapot.frag
- create mode 100644 src/glsl/blinking-teapot.vert
- create mode 100644 src/glsl/convolution.frag
- create mode 100644 src/glsl/simplex-noise.glsl
- create mode 100644 src/glsl/skinning.vert
- create mode 100644 src/perf/glslstateschange1.frag
- create mode 100644 src/perf/glslstateschange1.vert
- create mode 100644 src/perf/glslstateschange2.frag
- create mode 100644 src/perf/glslstateschange2.vert
- create mode 100644 src/vpglsl/infinite-loop.glsl
-
-diff --git a/src/fpglsl/depth-read.glsl b/src/fpglsl/depth-read.glsl
-new file mode 100644
-index 0000000..86d298e
---- /dev/null
-+++ b/src/fpglsl/depth-read.glsl
-@@ -0,0 +1,4 @@
-+void main()
-+{
-+   gl_FragColor = gl_FragCoord.zzzz;
-+}
-diff --git a/src/fpglsl/infinite-loop.glsl b/src/fpglsl/infinite-loop.glsl
-new file mode 100644
-index 0000000..c6dc6ee
---- /dev/null
-+++ b/src/fpglsl/infinite-loop.glsl
-@@ -0,0 +1,7 @@
-+void main() {
-+   vec4 sum = vec4(0);
-+   for (int i = 1; i != 2; i += 2) {
-+      sum += vec4(0.1, 0.1, 0.1, 0.1);
-+   }
-+   gl_FragColor = sum;
-+}
-diff --git a/src/glsl/CH11-bumpmaptex.frag b/src/glsl/CH11-bumpmaptex.frag
-new file mode 100644
-index 0000000..b5dabb4
---- /dev/null
-+++ b/src/glsl/CH11-bumpmaptex.frag
-@@ -0,0 +1,47 @@
-+//
-+// Fragment shader for procedural bumps
-+//
-+// Authors: John Kessenich, Randi Rost
-+//
-+// Copyright (c) 2002-2006 3Dlabs Inc. Ltd. 
-+//
-+// See 3Dlabs-License.txt for license information
-+//
-+// Texture mapping/modulation added by Brian Paul
-+//
-+
-+varying vec3 LightDir;
-+varying vec3 EyeDir;
-+
-+uniform float BumpDensity;     // = 16.0
-+uniform float BumpSize;        // = 0.15
-+uniform float SpecularFactor;  // = 0.5
-+
-+uniform sampler2D Tex;
-+
-+void main()
-+{
-+    vec3 ambient = vec3(0.25);
-+    vec3 litColor;
-+    vec2 c = BumpDensity * gl_TexCoord[0].st;
-+    vec2 p = fract(c) - vec2(0.5);
-+
-+    float d, f;
-+    d = p.x * p.x + p.y * p.y;
-+    f = inversesqrt(d + 1.0);
-+
-+    if (d >= BumpSize)
-+        { p = vec2(0.0); f = 1.0; }
-+
-+    vec3 SurfaceColor = texture2D(Tex, gl_TexCoord[0].st).xyz;
-+
-+    vec3 normDelta = vec3(p.x, p.y, 1.0) * f;
-+    litColor = SurfaceColor * (ambient + max(dot(normDelta, LightDir), 0.0));
-+    vec3 reflectDir = reflect(LightDir, normDelta);
-+    
-+    float spec = max(dot(EyeDir, reflectDir), 0.0);
-+    spec *= SpecularFactor;
-+    litColor = min(litColor + spec, vec3(1.0));
-+
-+    gl_FragColor = vec4(litColor, 1.0);
-+}
-diff --git a/src/glsl/blinking-teapot.frag b/src/glsl/blinking-teapot.frag
-new file mode 100644
-index 0000000..0db060b
---- /dev/null
-+++ b/src/glsl/blinking-teapot.frag
-@@ -0,0 +1,31 @@
-+#extension GL_ARB_uniform_buffer_object : enable
-+
-+layout(std140) uniform colors0
-+{
-+    float DiffuseCool;
-+    float DiffuseWarm;
-+    vec3  SurfaceColor;
-+    vec3  WarmColor;
-+    vec3  CoolColor;
-+    vec4  some[8];
-+};
-+
-+varying float NdotL;
-+varying vec3  ReflectVec;
-+varying vec3  ViewVec;
-+
-+void main (void)
-+{
-+
-+    vec3 kcool    = min(CoolColor + DiffuseCool * SurfaceColor, 1.0);
-+    vec3 kwarm    = min(WarmColor + DiffuseWarm * SurfaceColor, 1.0);
-+    vec3 kfinal   = mix(kcool, kwarm, NdotL);
-+
-+    vec3 nreflect = normalize(ReflectVec);
-+    vec3 nview    = normalize(ViewVec);
-+
-+    float spec    = max(dot(nreflect, nview), 0.0);
-+    spec          = pow(spec, 32.0);
-+
-+    gl_FragColor = vec4 (min(kfinal + spec, 1.0), 1.0);
-+}
-diff --git a/src/glsl/blinking-teapot.vert b/src/glsl/blinking-teapot.vert
-new file mode 100644
-index 0000000..397d733
---- /dev/null
-+++ b/src/glsl/blinking-teapot.vert
-@@ -0,0 +1,16 @@
-+vec3 LightPosition = vec3(0.0, 10.0, 4.0); 
-+ 
-+varying float NdotL;
-+varying vec3  ReflectVec;
-+varying vec3  ViewVec;
-+ 
-+void main(void)
-+{
-+    vec3 ecPos      = vec3 (gl_ModelViewMatrix * gl_Vertex);
-+    vec3 tnorm      = normalize(gl_NormalMatrix * gl_Normal);
-+    vec3 lightVec   = normalize(LightPosition - ecPos);
-+    ReflectVec      = normalize(reflect(-lightVec, tnorm));
-+    ViewVec         = normalize(-ecPos);
-+    NdotL           = (dot(lightVec, tnorm) + 1.0) * 0.5;
-+    gl_Position     = ftransform();
-+}
-diff --git a/src/glsl/convolution.frag b/src/glsl/convolution.frag
-new file mode 100644
-index 0000000..e49b8ac
---- /dev/null
-+++ b/src/glsl/convolution.frag
-@@ -0,0 +1,21 @@
-+
-+const int KernelSize = 9;
-+
-+//texture offsets
-+uniform vec2 Offset[KernelSize];
-+//convolution kernel
-+uniform vec4 KernelValue[KernelSize];
-+uniform sampler2D srcTex;
-+uniform vec4 ScaleFactor;
-+uniform vec4 BaseColor;
-+
-+void main(void)
-+{
-+    int i;
-+    vec4 sum = vec4(0.0);
-+    for (i = 0; i < KernelSize; ++i) {
-+        vec4 tmp = texture2D(srcTex, gl_TexCoord[0].st + Offset[i]);
-+        sum += tmp * KernelValue[i];
-+    }
-+    gl_FragColor = sum * ScaleFactor + BaseColor;
-+}
-diff --git a/src/glsl/simplex-noise.glsl b/src/glsl/simplex-noise.glsl
-new file mode 100644
-index 0000000..b6833cb
---- /dev/null
-+++ b/src/glsl/simplex-noise.glsl
-@@ -0,0 +1,279 @@
-+//
-+// Description : Array and textureless GLSL 2D/3D/4D simplex
-+// noise functions.
-+// Author : Ian McEwan, Ashima Arts.
-+// Maintainer : ijm
-+// Lastmod : 20110223
-+// License : Copyright (C) 2011 Ashima Arts. All rights reserved.
-+// Distributed under the Artistic License 2.0; See LICENCE file.
-+//
-+
-+#define NORMALIZE_GRADIENTS
-+#undef USE_CIRCLE
-+#define COLLAPSE_SORTNET
-+
-+float permute(float x0,vec3 p) {
-+  float x1 = mod(x0 * p.y, p.x);
-+  return floor( mod( (x1 + p.z) *x0, p.x ));
-+  }
-+vec2 permute(vec2 x0,vec3 p) {
-+  vec2 x1 = mod(x0 * p.y, p.x);
-+  return floor( mod( (x1 + p.z) *x0, p.x ));
-+  }
-+vec3 permute(vec3 x0,vec3 p) {
-+  vec3 x1 = mod(x0 * p.y, p.x);
-+  return floor( mod( (x1 + p.z) *x0, p.x ));
-+  }
-+vec4 permute(vec4 x0,vec3 p) {
-+  vec4 x1 = mod(x0 * p.y, p.x);
-+  return floor( mod( (x1 + p.z) *x0, p.x ));
-+  }
-+
-+uniform vec4 pParam;
-+// Example
-+// const vec4 pParam = vec4( 17.* 17., 34., 1., 7.);
-+
-+float taylorInvSqrt(float r)
-+  {
-+  return ( 0.83666002653408 + 0.7*0.85373472095314 - 0.85373472095314 * r );
-+  }
-+
-+float simplexNoise2(vec2 v)
-+  {
-+  const vec2 C = vec2(0.211324865405187134, // (3.0-sqrt(3.0))/6.;
-+                      0.366025403784438597); // 0.5*(sqrt(3.0)-1.);
-+  const vec3 D = vec3( 0., 0.5, 2.0) * 3.14159265358979312;
-+// First corner
-+  vec2 i = floor(v + dot(v, C.yy) );
-+  vec2 x0 = v - i + dot(i, C.xx);
-+
-+// Other corners
-+  vec2 i1 = (x0.x > x0.y) ? vec2(1.,0.) : vec2(0.,1.) ;
-+
-+   // x0 = x0 - 0. + 0. * C
-+  vec2 x1 = x0 - i1 + 1. * C.xx ;
-+  vec2 x2 = x0 - 1. + 2. * C.xx ;
-+
-+// Permutations
-+  i = mod(i, pParam.x);
-+  vec3 p = permute( permute(
-+             i.y + vec3(0., i1.y, 1. ), pParam.xyz)
-+           + i.x + vec3(0., i1.x, 1. ), pParam.xyz);
-+
-+#ifndef USE_CIRCLE
-+// ( N points uniformly over a line, mapped onto a diamond.)
-+  vec3 x = fract(p / pParam.w) ;
-+  vec3 h = 0.5 - abs(x) ;
-+
-+  vec3 sx = vec3(lessThan(x,D.xxx)) *2. -1.;
-+  vec3 sh = vec3(lessThan(h,D.xxx));
-+
-+  vec3 a0 = x + sx*sh;
-+  vec2 p0 = vec2(a0.x,h.x);
-+  vec2 p1 = vec2(a0.y,h.y);
-+  vec2 p2 = vec2(a0.z,h.z);
-+
-+#ifdef NORMALISE_GRADIENTS
-+  p0 *= taylorInvSqrt(dot(p0,p0));
-+  p1 *= taylorInvSqrt(dot(p1,p1));
-+  p2 *= taylorInvSqrt(dot(p2,p2));
-+#endif
-+
-+  vec3 g = 2.0 * vec3( dot(p0, x0), dot(p1, x1), dot(p2, x2) );
-+#else
-+// N points around a unit circle.
-+  vec3 phi = D.z * mod(p,pParam.w) /pParam.w ;
-+  vec4 a0 = sin(phi.xxyy+D.xyxy);
-+  vec2 a1 = sin(phi.zz +D.xy);
-+  vec3 g = vec3( dot(a0.xy, x0), dot(a0.zw, x1), dot(a1.xy, x2) );
-+#endif
-+// mix
-+  vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x1,x1), dot(x2,x2)), 0.);
-+  m = m*m ;
-+  return 1.66666* 70.*dot(m*m, g);
-+  }
-+
-+float simplexNoise3(vec3 v)
-+  {
-+  const vec2 C = vec2(1./6. , 1./3. ) ;
-+  const vec4 D = vec4(0., 0.5, 1.0, 2.0);
-+
-+// First corner
-+  vec3 i = floor(v + dot(v, C.yyy) );
-+  vec3 x0 = v - i + dot(i, C.xxx) ;
-+  
-+// Other corners
-+#ifdef COLLAPSE_SORTNET
-+  vec3 g = vec3( greaterThan( x0.xyz, x0.yzx) );
-+  vec3 l = vec3( lessThanEqual( x0.xyz, x0.yzx) );
-+
-+  vec3 i1 = g.xyz * l.zxy;
-+  vec3 i2 = max( g.xyz, l.zxy);
-+#else
-+// Keeping this clean - let the compiler optimize.
-+  vec3 q1;
-+  q1.x = max(x0.x, x0.y);
-+  q1.y = min(x0.x, x0.y);
-+  q1.z = x0.z;
-+
-+  vec3 q2;
-+  q2.x = max(q1.x,q1.z);
-+  q2.z = min(q1.x,q1.z);
-+  q2.y = q1.y;
-+
-+  vec3 q3;
-+  q3.y = max(q2.y, q2.z);
-+  q3.z = min(q2.y, q2.z);
-+  q3.x = q2.x;
-+
-+  vec3 i1 = vec3(equal(q3.xxx, x0));
-+  vec3 i2 = i1 + vec3(equal(q3.yyy, x0));
-+#endif
-+
-+   // x0 = x0 - 0. + 0. * C
-+  vec3 x1 = x0 - i1 + 1. * C.xxx;
-+  vec3 x2 = x0 - i2 + 2. * C.xxx;
-+  vec3 x3 = x0 - 1. + 3. * C.xxx;
-+
-+// Permutations
-+  i = mod(i, pParam.x );
-+  vec4 p = permute( permute( permute(
-+             i.z + vec4(0., i1.z, i2.z, 1. ), pParam.xyz)
-+           + i.y + vec4(0., i1.y, i2.y, 1. ), pParam.xyz)
-+           + i.x + vec4(0., i1.x, i2.x, 1. ), pParam.xyz);
-+
-+// Gradients
-+// ( N*N points uniformly over a square, mapped onto a octohedron.)
-+  float n_ = 1.0/pParam.w ;
-+  vec3 ns = n_ * D.wyz - D.xzx ;
-+
-+  vec4 j = p - pParam.w*pParam.w*floor(p * ns.z *ns.z); // mod(p,N*N)
-+
-+  vec4 x_ = floor(j * ns.z) ;
-+  vec4 y_ = floor(j - pParam.w * x_ ) ; // mod(j,N)
-+
-+  vec4 x = x_ *ns.x + ns.yyyy;
-+  vec4 y = y_ *ns.x + ns.yyyy;
-+  vec4 h = 1. - abs(x) - abs(y);
-+
-+  vec4 b0 = vec4( x.xy, y.xy );
-+  vec4 b1 = vec4( x.zw, y.zw );
-+
-+  vec4 s0 = vec4(lessThan(b0,D.xxxx)) *2. -1.;
-+  vec4 s1 = vec4(lessThan(b1,D.xxxx)) *2. -1.;
-+  vec4 sh = vec4(lessThan(h, D.xxxx));
-+
-+  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
-+  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;
-+
-+  vec3 p0 = vec3(a0.xy,h.x);
-+  vec3 p1 = vec3(a0.zw,h.y);
-+  vec3 p2 = vec3(a1.xy,h.z);
-+  vec3 p3 = vec3(a1.zw,h.w);
-+
-+#ifdef NORMALISE_GRADIENTS
-+  p0 *= taylorInvSqrt(dot(p0,p0));
-+  p1 *= taylorInvSqrt(dot(p1,p1));
-+  p2 *= taylorInvSqrt(dot(p2,p2));
-+  p3 *= taylorInvSqrt(dot(p3,p3));
-+#endif
-+
-+// Mix
-+  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.);
-+  m = m * m;
-+//used to be 64.
-+  return 48.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1),
-+                                dot(p2,x2), dot(p3,x3) ) );
-+  }
-+
-+vec4 grad4(float j, vec4 ip)
-+  {
-+  const vec4 ones = vec4(1.,1.,1.,-1.);
-+  vec4 p,s;
-+
-+  p.xyz = floor( fract (vec3(j) * ip.xyz) *pParam.w) * ip.z -1.0;
-+  p.w = 1.5 - dot(abs(p.xyz), ones.xyz);
-+  s = vec4(lessThan(p,vec4(0.)));
-+  p.xyz = p.xyz + (s.xyz*2.-1.) * s.www;
-+
-+  return p;
-+  }
-+
-+float simplexNoise4(vec4 v)
-+  {
-+  const vec2 C = vec2( 0.138196601125010504, // (5 - sqrt(5))/20 G4
-+                        0.309016994374947451); // (sqrt(5) - 1)/4 F4
-+// First corner
-+  vec4 i = floor(v + dot(v, C.yyyy) );
-+  vec4 x0 = v - i + dot(i, C.xxxx);
-+
-+// Other corners
-+
-+// Force existance of strict total ordering in sort.
-+  vec4 q0 = floor(x0 * 1024.0) + vec4( 0., 1./4., 2./4. , 3./4.);
-+  vec4 q1;
-+  q1.xy = max(q0.xy,q0.zw); // x:z y:w
-+  q1.zw = min(q0.xy,q0.zw);
-+
-+  vec4 q2;
-+  q2.xz = max(q1.xz,q1.yw); // x:y z:w
-+  q2.yw = min(q1.xz,q1.yw);
-+  
-+  vec4 q3;
-+  q3.y = max(q2.y,q2.z); // y:z
-+  q3.z = min(q2.y,q2.z);
-+  q3.xw = q2.xw;
-+
-+  vec4 i1 = vec4(lessThanEqual(q3.xxxx, q0));
-+  vec4 i2 = vec4(lessThanEqual(q3.yyyy, q0));
-+  vec4 i3 = vec4(lessThanEqual(q3.zzzz, q0));
-+
-+   // x0 = x0 - 0. + 0. * C
-+  vec4 x1 = x0 - i1 + 1. * C.xxxx;
-+  vec4 x2 = x0 - i2 + 2. * C.xxxx;
-+  vec4 x3 = x0 - i3 + 3. * C.xxxx;
-+  vec4 x4 = x0 - 1. + 4. * C.xxxx;
-+
-+// Permutations
-+  i = mod(i, pParam.x );
-+  float j0 = permute( permute( permute( permute (
-+              i.w, pParam.xyz) + i.z, pParam.xyz)
-+            + i.y, pParam.xyz) + i.x, pParam.xyz);
-+  vec4 j1 = permute( permute( permute( permute (
-+             i.w + vec4(i1.w, i2.w, i3.w, 1. ), pParam.xyz)
-+           + i.z + vec4(i1.z, i2.z, i3.z, 1. ), pParam.xyz)
-+           + i.y + vec4(i1.y, i2.y, i3.y, 1. ), pParam.xyz)
-+           + i.x + vec4(i1.x, i2.x, i3.x, 1. ), pParam.xyz);
-+// Gradients
-+// ( N*N*N points uniformly over a cube, mapped onto a 4-octohedron.)
-+  vec4 ip = pParam ;
-+  ip.xy *= pParam.w ;
-+  ip.x *= pParam.w ;
-+  ip = vec4(1.,1.,1.,2.) / ip ;
-+
-+  vec4 p0 = grad4(j0, ip);
-+  vec4 p1 = grad4(j1.x, ip);
-+  vec4 p2 = grad4(j1.y, ip);
-+  vec4 p3 = grad4(j1.z, ip);
-+  vec4 p4 = grad4(j1.w, ip);
-+
-+#ifdef NORMALISE_GRADIENTS
-+  p0 *= taylorInvSqrt(dot(p0,p0));
-+  p1 *= taylorInvSqrt(dot(p1,p1));
-+  p2 *= taylorInvSqrt(dot(p2,p2));
-+  p3 *= taylorInvSqrt(dot(p3,p3));
-+  p4 *= taylorInvSqrt(dot(p4,p4));
-+#endif
-+
-+// Mix
-+  vec3 m0 = max(0.6 - vec3(dot(x0,x0), dot(x1,x1), dot(x2,x2)), 0.);
-+  vec2 m1 = max(0.6 - vec2(dot(x3,x3), dot(x4,x4) ), 0.);
-+  m0 = m0 * m0;
-+  m1 = m1 * m1;
-+  return 32. * ( dot(m0*m0, vec3( dot( p0, x0 ), dot( p1, x1 ), dot( p2, x2 )))
-+               + dot(m1*m1, vec2( dot( p3, x3 ), dot( p4, x4 ) ) ) ) ;
-+
-+  }
-+
-+
-+
-diff --git a/src/glsl/skinning.vert b/src/glsl/skinning.vert
-new file mode 100644
-index 0000000..28970ee
---- /dev/null
-+++ b/src/glsl/skinning.vert
-@@ -0,0 +1,24 @@
-+// Vertex weighting/blendin shader
-+// Brian Paul
-+// 4 Nov 2008
-+
-+uniform mat4 mat0, mat1;
-+attribute float weight;
-+
-+void main() 
-+{
-+   // simple diffuse shading
-+   // Note that we should really transform the normal vector along with
-+   // the postion below... someday.
-+   vec3 lightVec = vec3(0, 0, 1);
-+   vec3 norm = gl_NormalMatrix * gl_Normal;
-+   float dot = 0.2 + max(0.0, dot(norm, lightVec));
-+   gl_FrontColor = vec4(dot);
-+
-+   // compute sum of weighted transformations
-+   vec4 pos0 = mat0 * gl_Vertex;
-+   vec4 pos1 = mat1 * gl_Vertex;
-+   vec4 pos = mix(pos0, pos1, weight);
-+
-+   gl_Position = gl_ModelViewProjectionMatrix * pos;
-+}
-diff --git a/src/perf/glslstateschange1.frag b/src/perf/glslstateschange1.frag
-new file mode 100644
-index 0000000..0839436
---- /dev/null
-+++ b/src/perf/glslstateschange1.frag
-@@ -0,0 +1,19 @@
-+// Multi-texture fragment shader
-+// Brian Paul
-+
-+// Composite second texture over first.
-+// We're assuming the 2nd texture has a meaningful alpha channel.
-+
-+uniform sampler2D tex1;
-+uniform sampler2D tex2;
-+uniform vec4 UniV1;
-+uniform vec4 UniV2;
-+
-+void main()
-+{
-+   vec4 t3;
-+   vec4 t1 = texture2D(tex1, gl_TexCoord[0].xy);
-+   vec4 t2 = texture2D(tex2, gl_TexCoord[1].xy);
-+   t3 = mix(t1, t2, t2.w);
-+   gl_FragColor = t3 + UniV1 + UniV2;
-+}
-diff --git a/src/perf/glslstateschange1.vert b/src/perf/glslstateschange1.vert
-new file mode 100644
-index 0000000..cef50db
---- /dev/null
-+++ b/src/perf/glslstateschange1.vert
-@@ -0,0 +1,14 @@
-+// Multi-texture vertex shader
-+// Brian Paul
-+
-+
-+attribute vec4 TexCoord0, TexCoord1;
-+attribute vec4 VertCoord;
-+
-+void main()
-+{
-+   gl_TexCoord[0] = TexCoord0;
-+   gl_TexCoord[1] = TexCoord1;
-+   // note: may use gl_Vertex or VertCoord here for testing:
-+   gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
-+}
-diff --git a/src/perf/glslstateschange2.frag b/src/perf/glslstateschange2.frag
-new file mode 100644
-index 0000000..0df0319
---- /dev/null
-+++ b/src/perf/glslstateschange2.frag
-@@ -0,0 +1,17 @@
-+// Multi-texture fragment shader
-+// Brian Paul
-+
-+// Composite second texture over first.
-+// We're assuming the 2nd texture has a meaningful alpha channel.
-+
-+uniform sampler2D tex1;
-+uniform sampler2D tex2;
-+uniform vec4 UniV1;
-+uniform vec4 UniV2;
-+
-+void main()
-+{
-+   vec4 t1 = texture2D(tex1, gl_TexCoord[0].xy);
-+   vec4 t2 = texture2D(tex2, gl_TexCoord[1].xy);
-+   gl_FragColor = t1 + t2 + UniV1 + UniV2;
-+}
-diff --git a/src/perf/glslstateschange2.vert b/src/perf/glslstateschange2.vert
-new file mode 100644
-index 0000000..cef50db
---- /dev/null
-+++ b/src/perf/glslstateschange2.vert
-@@ -0,0 +1,14 @@
-+// Multi-texture vertex shader
-+// Brian Paul
-+
-+
-+attribute vec4 TexCoord0, TexCoord1;
-+attribute vec4 VertCoord;
-+
-+void main()
-+{
-+   gl_TexCoord[0] = TexCoord0;
-+   gl_TexCoord[1] = TexCoord1;
-+   // note: may use gl_Vertex or VertCoord here for testing:
-+   gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
-+}
-diff --git a/src/vpglsl/infinite-loop.glsl b/src/vpglsl/infinite-loop.glsl
-new file mode 100644
-index 0000000..bc7ae4b
---- /dev/null
-+++ b/src/vpglsl/infinite-loop.glsl
-@@ -0,0 +1,8 @@
-+void main() {
-+   gl_Position = gl_Vertex;
-+   vec4 sum = vec4(0);
-+   for (int i = 1; i != 2; i += 2) {
-+      sum += vec4(0.1, 0.1, 0.1, 0.1);
-+   }
-+   gl_FrontColor = sum;
-+}
--- 
-2.0.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
deleted file mode 100644
index f77b97f3e5d..00000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 5e10108d76a59abac21c7e540bcfd2ddaccca2cb Mon Sep 17 00:00:00 2001
-From: Drew Moseley <drew_moseley@mentor.com>
-Date: Fri, 9 May 2014 11:50:24 -0400
-Subject: [PATCH 4/9] Use DEMOS_DATA_DIR to locate data files
-
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=78496]
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
----
- src/glsl/bezier.c           |  2 +-
- src/glsl/blinking-teapot.c  |  4 ++--
- src/glsl/brick.c            |  4 ++--
- src/glsl/bump.c             |  6 +++---
- src/glsl/convolutions.c     |  2 +-
- src/glsl/mandelbrot.c       |  4 ++--
- src/glsl/multitex.c         |  4 ++--
- src/glsl/simplex-noise.c    |  2 +-
- src/glsl/skinning.c         |  4 ++--
- src/glsl/texdemo1.c         |  8 ++++----
- src/glsl/toyball.c          |  4 ++--
- src/objviewer/objview.c     | 12 ++++++------
- src/perf/glslstateschange.c |  8 ++++----
- 13 files changed, 32 insertions(+), 32 deletions(-)
-
-diff --git a/src/glsl/bezier.c b/src/glsl/bezier.c
-index 0b56bc1..e01603d 100644
---- a/src/glsl/bezier.c
-+++ b/src/glsl/bezier.c
-@@ -13,7 +13,7 @@
- #include "glut_wrap.h"
- #include "shaderutil.h"
- 
--static const char *filename = "bezier.geom";
-+static const char *filename = DEMOS_DATA_DIR "bezier.geom";
- 
- static GLuint fragShader;
- static GLuint vertShader;
-diff --git a/src/glsl/blinking-teapot.c b/src/glsl/blinking-teapot.c
-index e3bf24d..7662b1f 100644
---- a/src/glsl/blinking-teapot.c
-+++ b/src/glsl/blinking-teapot.c
-@@ -63,8 +63,8 @@ init_opengl (void)
-      exit(1);
-   }     
- 
--  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, "blinking-teapot.vert");
--  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, "blinking-teapot.frag");
-+  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, DEMOS_DATA_DIR "blinking-teapot.vert");
-+  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, DEMOS_DATA_DIR "blinking-teapot.frag");
-   prog_id = LinkShaders (vshad_id, fshad_id);
- 
-   UseProgram (prog_id);
-diff --git a/src/glsl/brick.c b/src/glsl/brick.c
-index 3021856..fe5f190 100644
---- a/src/glsl/brick.c
-+++ b/src/glsl/brick.c
-@@ -14,8 +14,8 @@
- #include "shaderutil.h"
- 
- 
--static char *FragProgFile = "CH06-brick.frag";
--static char *VertProgFile = "CH06-brick.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH06-brick.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH06-brick.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/glsl/bump.c b/src/glsl/bump.c
-index 59f62cd..3a1b20a 100644
---- a/src/glsl/bump.c
-+++ b/src/glsl/bump.c
-@@ -15,9 +15,9 @@
- #include "readtex.h"
- 
- 
--static char *FragProgFile = "CH11-bumpmap.frag";
--static char *FragTexProgFile = "CH11-bumpmaptex.frag";
--static char *VertProgFile = "CH11-bumpmap.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH11-bumpmap.frag";
-+static char *FragTexProgFile = DEMOS_DATA_DIR "CH11-bumpmaptex.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH11-bumpmap.vert";
- static char *TextureFile = DEMOS_DATA_DIR "tile.rgb";
- 
- /* program/shader objects */
-diff --git a/src/glsl/convolutions.c b/src/glsl/convolutions.c
-index a120cfe..9312f00 100644
---- a/src/glsl/convolutions.c
-+++ b/src/glsl/convolutions.c
-@@ -340,7 +340,7 @@ static void init(void)
- 
-    menuInit();
-    readTexture(textureLocation);
--   createProgram("convolution.vert", "convolution.frag");
-+   createProgram(DEMOS_DATA_DIR "convolution.vert", DEMOS_DATA_DIR "convolution.frag");
- 
-    glEnable(GL_TEXTURE_2D);
-    glClearColor(1.0, 1.0, 1.0, 1.0);
-diff --git a/src/glsl/mandelbrot.c b/src/glsl/mandelbrot.c
-index 31ede1d..ab34a0f 100644
---- a/src/glsl/mandelbrot.c
-+++ b/src/glsl/mandelbrot.c
-@@ -14,8 +14,8 @@
- #include "shaderutil.h"
- 
- 
--static char *FragProgFile = "CH18-mandel.frag";
--static char *VertProgFile = "CH18-mandel.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH18-mandel.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH18-mandel.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/glsl/multitex.c b/src/glsl/multitex.c
-index 262ea50..546bd27 100644
---- a/src/glsl/multitex.c
-+++ b/src/glsl/multitex.c
-@@ -35,8 +35,8 @@
- 
- static const char *Demo = "multitex";
- 
--static const char *VertFile = "multitex.vert";
--static const char *FragFile = "multitex.frag";
-+static const char *VertFile = DEMOS_DATA_DIR "multitex.vert";
-+static const char *FragFile = DEMOS_DATA_DIR "multitex.frag";
- 
- static const char *TexFiles[2] = 
-    {
-diff --git a/src/glsl/simplex-noise.c b/src/glsl/simplex-noise.c
-index 13fdd5d..885f01e 100644
---- a/src/glsl/simplex-noise.c
-+++ b/src/glsl/simplex-noise.c
-@@ -169,7 +169,7 @@ SpecialKey(int key, int x, int y)
- static void
- Init(void)
- {
--   const char *filename = "simplex-noise.glsl";
-+   const char *filename = DEMOS_DATA_DIR "simplex-noise.glsl";
-    char noiseText[10000];
-    FILE *f;
-    int len;
-diff --git a/src/glsl/skinning.c b/src/glsl/skinning.c
-index bf38d77..536d475 100644
---- a/src/glsl/skinning.c
-+++ b/src/glsl/skinning.c
-@@ -20,8 +20,8 @@
- #define M_PI 3.1415926535
- #endif
- 
--static char *FragProgFile = "skinning.frag";
--static char *VertProgFile = "skinning.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "skinning.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "skinning.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/glsl/texdemo1.c b/src/glsl/texdemo1.c
-index 6cde239..a082342 100644
---- a/src/glsl/texdemo1.c
-+++ b/src/glsl/texdemo1.c
-@@ -35,11 +35,11 @@
- 
- static const char *Demo = "texdemo1";
- 
--static const char *ReflectVertFile = "reflect.vert";
--static const char *CubeFragFile = "cubemap.frag";
-+static const char *ReflectVertFile = DEMOS_DATA_DIR "reflect.vert";
-+static const char *CubeFragFile = DEMOS_DATA_DIR "cubemap.frag";
- 
--static const char *SimpleVertFile = "simple.vert";
--static const char *SimpleTexFragFile = "shadowtex.frag";
-+static const char *SimpleVertFile = DEMOS_DATA_DIR "simple.vert";
-+static const char *SimpleTexFragFile = DEMOS_DATA_DIR "shadowtex.frag";
- 
- static const char *GroundImage = DEMOS_DATA_DIR "tile.rgb";
- 
-diff --git a/src/glsl/toyball.c b/src/glsl/toyball.c
-index 5f27951..4e7e832 100644
---- a/src/glsl/toyball.c
-+++ b/src/glsl/toyball.c
-@@ -14,8 +14,8 @@
- #include "shaderutil.h"
- 
- 
--static char *FragProgFile = "CH11-toyball.frag";
--static char *VertProgFile = "CH11-toyball.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH11-toyball.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH11-toyball.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/objviewer/objview.c b/src/objviewer/objview.c
-index 6def726..78a6acf 100644
---- a/src/objviewer/objview.c
-+++ b/src/objviewer/objview.c
-@@ -162,12 +162,12 @@ init_model(void)
- static void
- init_skybox(void)
- {
--   SkyboxTex = LoadSkyBoxCubeTexture("alpine_east.rgb",
--                                     "alpine_west.rgb",
--                                     "alpine_up.rgb",
--                                     "alpine_down.rgb",
--                                     "alpine_south.rgb",
--                                     "alpine_north.rgb");
-+   SkyboxTex = LoadSkyBoxCubeTexture(DEMOS_DATA_DIR "alpine_east.rgb",
-+                                     DEMOS_DATA_DIR "alpine_west.rgb",
-+                                     DEMOS_DATA_DIR "alpine_up.rgb",
-+                                     DEMOS_DATA_DIR "alpine_down.rgb",
-+                                     DEMOS_DATA_DIR "alpine_south.rgb",
-+                                     DEMOS_DATA_DIR "alpine_north.rgb");
-    glmSpecularTexture(Model, SkyboxTex);
- }
- 
-diff --git a/src/perf/glslstateschange.c b/src/perf/glslstateschange.c
-index 7422b78..dbf8332 100644
---- a/src/perf/glslstateschange.c
-+++ b/src/perf/glslstateschange.c
-@@ -33,10 +33,10 @@
- #include "glmain.h"
- #include "common.h"
- 
--static const char *VertFile1 = "glslstateschange1.vert";
--static const char *FragFile1 = "glslstateschange1.frag";
--static const char *VertFile2 = "glslstateschange2.vert";
--static const char *FragFile2 = "glslstateschange2.frag";
-+static const char *VertFile1 = DEMOS_DATA_DIR "glslstateschange1.vert";
-+static const char *FragFile1 = DEMOS_DATA_DIR "glslstateschange1.frag";
-+static const char *VertFile2 = DEMOS_DATA_DIR "glslstateschange2.vert";
-+static const char *FragFile2 = DEMOS_DATA_DIR "glslstateschange2.frag";
- static struct uniform_info Uniforms1[] = {
-    { "tex1",  1, GL_SAMPLER_2D, { 0, 0, 0, 0 }, -1 },
-    { "tex2",  1, GL_SAMPLER_2D, { 1, 0, 0, 0 }, -1 },
--- 
-2.0.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
similarity index 74%
rename from meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
rename to meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index 1a64e16a2a9..0301b553611 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -9,11 +9,9 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "https://archive.mesa3d.org/demos/${PV}/${BPN}-${PV}.tar.bz2 \
-           file://0001-mesa-demos-Add-missing-data-files.patch \
-           file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
+SRC_URI = "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "cea2df0a80f09a30f635c4eb1a672bf90c5ddee0b8e77f4d70041668ef71aac1"
+SRC_URI[sha256sum] = "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed952329cdff1e9f1ed496b"
 
 inherit meson pkgconfig features_check
 # depends on virtual/egl, virtual/libgl ...
@@ -21,8 +19,10 @@ REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 EXTRA_OEMESON = "-Dwith-system-data-files=true"
 
+# Note: wayland is not included as the feature requires libdecor recipe,
+# which is not currently in core
 PACKAGECONFIG ?= "drm egl gles1 gles2 \
-                  ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11', d)}"
 
 PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
 PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
@@ -30,8 +30,9 @@ PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
 PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
 PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
 PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols"
-PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu"
+PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
 
 do_install:append() {
 	# it can be completely empty when all PACKAGECONFIG options are disabled
-- 
2.39.5


