Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 55B2676AC4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 15:25:15 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so30643289wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=wI2mkdSNHB0KwazbVjf/xlNekAKArpcnkYVmNqaAELQ=;
	b=PPDprSAu7UQSBkZhJu5Ud1KYoXNmZ2UedciMXLGaBAoUT/tHYQTPsPW557fIHHlW6q
	sevyL5hUiFOc9RPxQ5qoR4fCMP4X3fPbtnlrbwD2KHt+9PzkaYPVfF+bqSyL97AjqRwp
	Mgqd3LP4W9xIA565Yk6ttcvsNAlBFUVHd0/4vIJI4cbmwcehV09b3lok896xMaL2MdLp
	oJ+Bf+7J5UX7rJ8zuJwjqRnaw/w8rKBLdizkhJzUn0MaYaNAGb8AXqdevTAG8s+jMh7O
	ENR5Sd6N1/Ll3L9iwNz0BKHYo56FCpJvMr9/LWnmGdsLlkwH0eQRs7A9E1dg21i7hGTg
	bzhw==
X-Received: by 10.194.7.97 with SMTP id i1mr9626714wja.87.1444317915635;
	Thu, 08 Oct 2015 08:25:15 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	jt3sm43675307wjc.12.2015.10.08.08.25.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 08:25:15 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <08F364C2-6DFB-4E4A-A775-AD0AEEC8D7BE@gmail.com>
Date: Thu, 8 Oct 2015 17:25:13 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 1/2] gbm: Fix "configure: error: gbm requires --enable-dri"
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
X-List-Received-Date: Thu, 08 Oct 2015 15:25:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


When building mesa without X11 enabled, and disabling dri package =
config,
the enforced "--enable-gbm" fails building mesa, because this feature
requires "--enable-dri", too - which has been disabled by package =
config.

Consequently, when gbm requires dri, --disable-dri causes in =
--disable-gbm,
which makes explicit --disable-gbm in case of --disable-dri redundant.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc =
b/meta/recipes-graphics/mesa/mesa.inc
index af7a2c4..13a8b9d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -37,11 +37,9 @@ PACKAGECONFIG[wayland] =3D ",,wayland"
 DRIDRIVERS =3D "swrast"
 DRIDRIVERS_append_x86 =3D ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 =3D ",radeon,r200,nouveau,i965,i915"
-PACKAGECONFIG[dri] =3D "--enable-dri --with-dri-drivers=3D${DRIDRIVERS}, =
--disable-dri, dri2proto libdrm"
+PACKAGECONFIG[dri] =3D "--enable-dri --with-dri-drivers=3D${DRIDRIVERS} =
--enable-gbm, --disable-dri, dri2proto libdrm"
 PACKAGECONFIG[dri3] =3D "--enable-dri3, --disable-dri3, dri3proto =
presentproto libxshmfence"
=20
-EXTRA_OECONF +=3D "--enable-gbm"
-
 PACKAGECONFIG[gles] =3D "--enable-gles1 --enable-gles2, --disable-gles1 =
--disable-gles2"
=20
 EGL_PLATFORMS  =3D "drm"
--=20
2.4.3

--=20
Jens Rehsack - rehsack@gmail.com


