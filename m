Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1F17878617
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:23:14 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id u73so299722qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=k5qzY3xwg3lZxY3pdXG2HgRHPawlqMSbortDcH+72W4=;
	b=W5Xtw/+VL0nUrQVqsLJxokiA3zULZ0e55iKcoAc9dQJeLTHQnFD9CotGQVAp3pzkNq
	0+edAkHiNg10cw+XXNslN1c5bVdIpGk7nnhcbEzlejI3gSN+VnMbr9SvYbF5wJXjeiD0
	VnUiMaHkIUrVTOJodGgK5BzjPeSxWLbrpOLLaa0gIx7bEo2aFtyo+aNSernaavMOGVXF
	HqIQQ9P4DJCK/tf4F3VRul2GGDQ3BSzQRGqC8137TNHgQt7YLrX45IXXEcF6jiUa4sp+
	7fzzCdfJYrLZtwSoNZYS44aq4/rIqgVwyMm1a+4KDXbRvzVFYAKUhFRZ2gPMIsDVvmOW
	f6jQ==
X-Gm-Message-State: AHPjjUjkR1Qila1bkNmE4V9zFPXviTkcypCj3Xa1oGoioQZAVXsglj6c
	C/d0umIuAzsOJSq9
X-Google-Smtp-Source: AOwi7QA9QKRnyDpN/EuD/6/9LSfjyVWSxQwSlQXzkEGv2ojD9JZhAGtfJ4+yqMUQVtxb1CGngweLkA==
X-Received: by 10.55.200.210 with SMTP id t79mr4206551qkl.299.1505416995680;
	Thu, 14 Sep 2017 12:23:15 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j206sm11428352qke.7.2017.09.14.12.23.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 12:23:15 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 14 Sep 2017 16:23:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 16:22:30 -0300
Message-Id: <20170914192231.15002-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170914192231.15002-1-otavio@ossystems.com.br>
References: <20170914192231.15002-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v10 4/5] go.bbclass: set TMPDIR during compilation
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
X-List-Received-Date: Thu, 14 Sep 2017 19:23:15 -0000

From: Matt Madison <matt@madison.systems>

The go build tool creates working directories under
$TMPDIR for all of its processing.  Create a directory
under ${WORKDIR} for this and point TMPDIR at it during
compilation, so that systems that have a relatively
small /tmp filesystems can still compile larger Go
packages.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v10:
- new patch

 meta/classes/go.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 863b578e5c..e167c949ec 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -61,6 +61,8 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
+GO_TMPDIR ?= "${WORKDIR}/go-tmp"
+GO_TMPDIR[vardepvalue] = ""
 
 python go_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
@@ -97,14 +99,17 @@ go_do_configure() {
 }
 
 go_do_compile() {
+	export TMPDIR="${GO_TMPDIR}"
 	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
+do_compile[dirs] =+ "${GO_TMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
 do_compile_ptest() {
+    export TMPDIR="${GO_TMPDIR}"
     rm -f ${B}/.go_compiled_tests.list
 	go_list_package_tests | while read pkg; do
 		cd ${B}/src/$pkg
@@ -113,6 +118,7 @@ do_compile_ptest() {
 			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
 	done
 }
+do_compile_ptest_base[dirs] =+ "${GO_TMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-- 
2.14.1


