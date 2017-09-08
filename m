Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id F011078219
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:39 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so2207571qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=kU6CXK3y91mXKq2qGWUUE73AHwQpCFU1aEbSVteWXig=;
	b=uf04h89uvSRD+K+9PuCQQCzzIESVcLDQB/pggnKZ6LM2yDNBOh+cPzHJhFqIbKGiPR
	ftuGe/KNUIADKl0OkWFJyzQ4WGexJuQ8QkBdbId8RiSbh2JvqtdB77H4px7ChLabK1i3
	ZgXIMHr0nQ+GX5V1rNeiT0M96oSgohL+63YvMywawvb708wjtwHrM4/w67ipbiGJNra+
	MH9btli/V0XCjLQpmJv0BvIlNgfJa08zPtyf5co6TNylTm6uhU7v6TZCjTVsXor+C6kV
	zfsSv8uKRUexlt5Vu7CjF7xVExuzVI/bhS289AlYSjIhxHR6qYqXsNz4xNXLp/UCX0QD
	owJg==
X-Gm-Message-State: AHPjjUjENAUtPSBBvbJsqHRRAkJVr9IIbId6/s0CUCHwQCL+Y7zTz6cC
	ckAaS+JKftq4R7of
X-Google-Smtp-Source: AOwi7QA5vQTA+BdnCBLNHTnOd34mJO3Dvhfw1baVJXG5oNO/oYJm/U832zCwAjWAE4dGA7lQtuBKkQ==
X-Received: by 10.55.77.86 with SMTP id a83mr5440375qkb.172.1504904800855;
	Fri, 08 Sep 2017 14:06:40 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d58sm1860851qte.92.2017.09.08.14.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:39 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:33 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:42 -0300
Message-Id: <20170908210444.25763-13-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 12/14] go.bbclass: add GO_INSTALL_FILTEROUT variable
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:40 -0000

From: Matt Madison <matt@madison.systems>

When using the Go 'vendor' mechanism to bring in
dependencies for a Go package, the default GO_INSTALL
setting, which uses the '...' wildcard, will include
the vendored packages in the build, which produces
incorrect results.

There are also some Go packages that are structured
poorly, so that the '...' wildcard results in building
example or test code that should not be included in
the build, or fail to build.

This patch adds a mechanism for filtering out a
subset of the sources.  It defaults to filtering
out everything under the 'vendor' subdirectory
under package's main directory, which is the
normal location for vendored packages, but can
be overridden by a recipe to filter out other
subdirectories, if needed.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index c1ef01fafe..cb1e96d88b 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -52,6 +52,7 @@ FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
 FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
+GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 
@@ -73,6 +74,11 @@ python go_do_unpack() {
         raise bb.build.FuncFailed(e)
 }
 
+go_list_packages() {
+	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go list -f '{{.ImportPath}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
+		egrep -v '${GO_INSTALL_FILTEROUT}'
+}
+
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
@@ -80,7 +86,7 @@ go_do_configure() {
 go_do_compile() {
 	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
-		GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
+		GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
-- 
2.14.1


