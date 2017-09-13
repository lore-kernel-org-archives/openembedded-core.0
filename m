Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 49EE67867F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:54:55 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i14so576950qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=OG1hGm4eQmE/BjXZYo1uzjpkaYTlXlVS5r5g3EgV/kY=;
	b=jPXFBcUXlgnh2MyPA8Pki/Pf4dKUXkZk8SdxtpAdZq/ek+W3DyV3r+YiYG6yME5we9
	1E8iOY761epf9ITBUnRAUiO5+R5A+CltHD8O0QURR1Qa5/v0qrgrR1eAwwNoG+j9xDaF
	1fbuoG9ZhsvyFVF2ZUww9BlJLh/xESlp6Zo7155AIbeAwAB3jH5SidJ5Ej5Twc41gkM6
	H/ShAg8rFE1Vmip/5QyogCoh5N7plXJDLxY+CVRi+MIIv3+273s6E+sMAFTAa9ILNQCr
	j1iPklR4dROnn790zNydvqjdKIicqxyG/oFaVxuPX85E8YifzmMe6MwSyKTx/uRrYOQN
	hvlA==
X-Gm-Message-State: AHPjjUjVuyyROTTm5Ip90jHgkAsXFUjo2JcHMcjHg4vCLW1+W8o4Apd1
	ISttWhyeInh95Ys7
X-Google-Smtp-Source: AOwi7QAK+cs92viSn+yDfyQ2EwrgZB7OpJFDKv0tBdPYXRhZMHZ63eWFTjmJCgg/IUvxSOBhWCY2bQ==
X-Received: by 10.55.163.195 with SMTP id m186mr27103056qke.304.1505325296820; 
	Wed, 13 Sep 2017 10:54:56 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t10sm10015639qtt.36.2017.09.13.10.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:54:56 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:54:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:05 -0300
Message-Id: <20170913175410.23041-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 4/9] go-runtime: build the Go runtime as a shared library
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
X-List-Received-Date: Wed, 13 Sep 2017 17:54:56 -0000

From: Matt Madison <matt@madison.systems>

If the target architecture supports, it build the Go
runtime as a shared library in addition to building
the static libraries.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/recipes-devtools/go/go-runtime.inc | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 3775e86b06..a074238e47 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -24,6 +24,9 @@ do_compile() {
 	mkdir ${GOBIN}
 	cd src
 	GO_FLAGS="" ./make.bash
+	if [ -n "${GO_DYNLINK}" ]; then
+		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash
+	fi
 	cd ${B}
 }
 
@@ -49,8 +52,25 @@ sysroot_stage_all_append() {
 }
 
 ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include"
-FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} ${libdir}/go/pkg/${TARGET_GOTUPLE}"
+FILES_${PN} = "${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"
+FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.shlibname \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.shlibname \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.shlibname \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*.shlibname \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.shlibname \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.shlibname \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.shlibname \
+"
+FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*.a \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.a \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.a \
+                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.a \
+"
 # The testdata directories in the source tree include some binaries for various
 # architectures, scripts, and .a files
 INSANE_SKIP_${PN}-dev = "staticdev ldflags file-rdeps arch"
-- 
2.14.1


