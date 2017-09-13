Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1163078686
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:55:03 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r66so572493qke.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=uAdzi83fn5mODcOWwAAPLlFM2GFZAQf0arBCbzT/diM=;
	b=cfX+ar7NEWK+vFB/FbJ9BaiuVQK/5h1bioMXm0wq3X6pphCieiARbQbedoFelrcGLH
	/y78zgMUB70YKzjsvyi/90PVmA4b1sQd/WpxrMnrNhC9sn85OD5n0GNv2sbHHl3Xu2l+
	DiroDwtyARDWDR5Ps2vgzpggc+UoVFgjyzdVmNI63CZ1V5JqujiXl7IWYpWhbqlcqTx3
	+UpnyxQgUzYMYCogMtmPa9RfOCyKw3nL0nduDH3FY7/MaIyqbAHJiHN6FB+gdMyUu3MS
	jF1KekMPLQXYrdZ/+yK89dKeTXBRZ9n5Bir88M2DHg+67ZZsBl2I+gszb5RygpK+zbia
	nceg==
X-Gm-Message-State: AHPjjUjHUiDzSC8pa9liYbSLJRhmxf7VAI0gU/OsSYF72cgqLsYuFLTi
	ehEHkqWClXlwiUp2
X-Google-Smtp-Source: AOwi7QCOCZxXudz2ljZrQ9tMiWEQ7DKtNFFihf2/fjKRUrztoNVnUuYI39ozq1zuVn9hDOAsS1GcVg==
X-Received: by 10.55.188.134 with SMTP id m128mr24830267qkf.150.1505325304788; 
	Wed, 13 Sep 2017 10:55:04 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	v40sm10488260qta.9.2017.09.13.10.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:55:03 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:54:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:06 -0300
Message-Id: <20170913175410.23041-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 5/9] go.bbclass: add support linking against shared runtime
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
X-List-Received-Date: Wed, 13 Sep 2017 17:55:04 -0000

From: Matt Madison <matt@madison.systems>

For architectures that support it, use the -linkshared
build option to build packages against the shared Go
runtime.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/classes/go.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 8d363e86a2..d805dc2713 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -31,7 +31,14 @@ DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${
 
 DEPENDS_append = " ${DEPENDS_GOLANG}"
 
-export GOBUILDFLAGS ?= "-v"
+GO_LINKSHARED ?= "${@'-linkshared' if d.getVar('GO_DYNLINK') else ''}"
+GO_RPATH_LINK = "${@'-Wl,-rpath-link=${STAGING_DIR_TARGET}${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
+GO_RPATH = "${@'-r ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
+GO_RPATH_class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
+GO_RPATH_LINK_class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
+GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} -extldflags '${GO_EXTLDFLAGS}'"'
+export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
 export GO = "${HOST_PREFIX}go"
@@ -81,7 +88,7 @@ go_do_configure() {
 go_do_compile() {
 	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
-		${GO} install ${GOBUILDFLAGS} `go_list_packages`
+		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
-- 
2.14.1


