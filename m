Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 848307DD90
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t22so4203924pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+RdH4H4rie5OY9XFs2lrotx8lmWu5wDra2RyODJqzuc=;
	b=poIeUiiWdmP1lqpoO8dtR3YairxWZgXjcBe7g2wPy2Pwa45qH55wr0wsGkA+yy6NfM
	zdJ01C8H0+GOgXlQp83K/eMQfFEoXbxhzCUTnW9W7WGMoKFAgyfq+cbKRuPQiTBaWspM
	bIMHicgxO2/l+rX5xWbselA2RZUOYrIW3B/ck74uDyTmu58rRrT25msU49r5QdJkubMh
	8zt5Q4pgEk/6kMeK+CUkGTPpVbNfHy34QvGowkM+XfaR+25PjuuwCw4lIF2RluD3BPjN
	46k6Hfi3lzGCIAfr3vcHXXpETaxrZ12BwcuRRT5UOLrobjoR6k2vj4FTpBcYPyESHJ5U
	Fi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+RdH4H4rie5OY9XFs2lrotx8lmWu5wDra2RyODJqzuc=;
	b=EPCroLDpor39xB4f2Fuyyr0iEB5aHqAH0fhat59nLyL5w+g6QebzL5b7boXfJ0qXky
	dEsZ3NKvd4T1zA5F8uvRGhxgz6lYmOkoE1lSYZl8S2cJc/2dRsnkZMhsdNqhAT8IupF8
	Kb6e4NEsf8IOYEvaDl4lrQKskGt2k9dE8MFlFXEpk+NoC/0lHne07/oJaCPmXyUJXic0
	mlyhq9BWOu8XUldKQKXGlgSBPqYS0olr2XLNiJJ8MUE5xiF937U6M4GS0Xe3N9Lm7u3v
	EW0+n+uxktFFXMezheOID+l01dQ/Wn+UlcVg4bsXnfE9hHigg00j6vUT+aUgtvXBTmQb
	gRXg==
X-Gm-Message-State: APjAAAWNwrn3p/nPrSBrh3ZOpH4lRxT+bjmjZhS/dgf1I54J7uDJGyiF
	CGLUqu7Vp5xcGg7sMKGxMCv5W36m
X-Google-Smtp-Source: APXvYqyGA2K7f9S7OnC+8EcEu7FJocLoPpeQjpKfieFPJGWHG9AS1775igczfo1/C8nHlLgtroOh/A==
X-Received: by 2002:a63:8149:: with SMTP id t70mr19486049pgd.134.1556983686582;
	Sat, 04 May 2019 08:28:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:17 -0700
Message-Id: <580941d28223dc72547b516d042602b9a514fa5b.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 41/43] piglit: support build piglit without x11
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
X-List-Received-Date: Sat, 04 May 2019 15:28:05 -0000

From: Changqing Li <changqing.li@windriver.com>

*  test PIGLIT_BUILD_GL_TESTS depend on glx library, so depend
   on x11, so respect the DISTRO_FEATURES, only enable it when
   x11 is enabled.
*  mesa-demos depend on libGL.so which is provide by recipe
   mesa, but when x11 is disabled, libGL.so is not generated.
   so we can only rdepend on this when x11 is enabled
*  add x11 PACKAGECONFIG to add correct config/depend/rdepend

[YOCTO #6077]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 59d1348..b6542a1 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -17,11 +17,12 @@ PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native virtual/egl"
+X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
+X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
+
+DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
 
 inherit cmake pkgconfig python3native distro_features_check bash-completion
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
 
 # depends on virtual/libgl
 REQUIRED_DISTRO_FEATURES += "opengl"
@@ -32,8 +33,10 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 export TEMP = "${B}/temp/"
 do_compile[dirs] =+ "${B}/temp/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
+PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
+
 
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
@@ -48,7 +51,7 @@ RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 	python3-misc \
 	python3-unixadmin python3-xml python3-multiprocessing \
 	python3-six python3-shell python3-io \
-	python3-netserver mesa-demos bash \
+	python3-netserver bash \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
-- 
2.7.4


