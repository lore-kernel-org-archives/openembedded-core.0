Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A86BF7860C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:22:49 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id c69so192082qke.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=CLd/JWW1+sIl5V+tp1KLH+7Rd4UbchXeo6tWqzssZfA=;
	b=p9FCRkV5O2QM+3u1wFeWF5m3FODM9tLbCYeETuGT3ScczKPE3BZyIqNNEeQfPi+F2c
	v0IGJZ+yQYP7TNty3R1RaD9A7hjg5NOIyq0RiqoOyEY6Xw5BZ4Huhx7oTHNpdoyVt9VA
	C0R+QhzZLguvF/CjqNkAB9LsB6+GUim65JTkoOQb3dIBkii2K+nBQZZoQbTz5C0gLRNI
	JGC0uZgb3AoXF0icBw0kXT1hgtbDbbDALBjxtjzLgFliHpO/aJy42WQ3qVC9sNSbUNq7
	uo2WFLH2JzDkqkZYfl9fdxLQ/eIdujtH7rmHQV0BbNOAQu1cdPS4SHWvQihbJHqnTgQw
	zojg==
X-Gm-Message-State: AHPjjUgufNoEGclebkvffsar6IKfR9hEm6InECmVKGu1YJdwKn9qOWrN
	sriotBREbj3//NX2
X-Google-Smtp-Source: AOwi7QBFY8T98qvKMafWIoK9/ev9DFq7JSlFF0eR8JSnxtX8fIc8bMRdEX0fmmp5SvKo1ZYtXqu5yA==
X-Received: by 10.55.102.13 with SMTP id a13mr4251952qkc.320.1505416970178;
	Thu, 14 Sep 2017 12:22:50 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e39sm11895896qtb.67.2017.09.14.12.22.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 12:22:49 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 14 Sep 2017 16:22:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 16:22:27 -0300
Message-Id: <20170914192231.15002-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170914192231.15002-1-otavio@ossystems.com.br>
References: <20170914192231.15002-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v10 1/5] go-crosssdk: fix host/target references and cleanup
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
X-List-Received-Date: Thu, 14 Sep 2017 19:22:49 -0000

From: Matt Madison <matt@madison.systems>

* The _FOR_TARGET variables need to include SDKNATIVEPATH
* Install tools (cmd) only, and for the build host
* Remove unnecessary FILES setting

Corrects some errors when the build host architecture
is different from the SDKMACHINE's.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v10:
- new patch

 meta/recipes-devtools/go/go-crosssdk.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index e9bc677131..471c75b3d5 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -11,8 +11,9 @@ export GOARCH = "${TARGET_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
+export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
+export GO_INSTALL = "cmd"
 CC = "${@d.getVar('BUILD_CC', True).strip()}"
 
 do_configure[noexec] = "1"
@@ -43,13 +44,11 @@ do_install() {
 	install -d ${D}${libdir}/go/bin
 	install -d ${D}${libdir}/go/pkg/tool
 	install -d ${D}${bindir}
-	cp --preserve=mode,timestamps -R ${S}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
-	for f in ${B}/${GO_BUILD_BINDIR}/*
+	cp --preserve=mode,timestamps -R ${S}/pkg/tool/${BUILD_GOTUPLE} ${D}${libdir}/go/pkg/tool/
+	for f in ${B}/bin/*
 	do
 		base=`basename $f`
 		install -m755 $f ${D}${libdir}/go/bin
 		make_wrapper $base ${TARGET_PREFIX}$base
 	done
 }
-
-FILES_${PN}-staticdev = "${libdir}/go/pkg"
-- 
2.14.1


