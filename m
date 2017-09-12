Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25C6A783FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:51:54 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q8so7280721qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=nulp3/NAkOdb8QkgDUPuzL53FQd3j2girbGYlBSInpY=;
	b=hwIm53eOO2Fz9J+IIAZf5/dNdejbLNLraESaafmZUocsBBEAk+Nq4qpeJGu3C7+Kuo
	6zjCFYR530xFBbkc2ctgzK8y8i/nmELp9PhDFHa/1fhgWOleHAmRf7ytOHowngkCuRQf
	wojZ1J9X4EL7yusdx37BrcFJYP2cvAZKoqhexUwTy8mq1c75EXE0Q3hZYHgpSkW3KDSt
	ydXkq3IN7Rp40PDoNFVaQYxy4AEcliTKh+BGGs2d72rsTT7AD3E+tQhdv//DdETArNae
	e37R1zjA0Qgdi40gXKj8oQoCEFtXwcfz/qhC+wEgDjSYwyB0ZY1exJtK8hqH6fyMdLk6
	ds6A==
X-Gm-Message-State: AHPjjUj7pa3mI2453hsvnwOko0fCCRNlhZ4KNxJH8Y842TKoOHo37YX4
	E9HOn7ukKR/ZaJaa
X-Google-Smtp-Source: AOwi7QAir078zqe5hUGNmXC+R4LLrNJju5SP/9RW5FF2IdgV2ieWLbnX7jCLN4gwXs22GFFfGHfT8A==
X-Received: by 10.200.36.19 with SMTP id c19mr9205208qtc.231.1505220715937;
	Tue, 12 Sep 2017 05:51:55 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t26sm7912569qkt.89.2017.09.12.05.51.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:51:55 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:51:48 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:25 -0300
Message-Id: <20170912125031.4009-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 07/13] go.bbclass: clean up CGO_xxx settings
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
X-List-Received-Date: Tue, 12 Sep 2017 12:51:55 -0000

From: Matt Madison <matt@madison.systems>

* use conditional assignment for  the CGO_xxx
  variables, so they can be overridden more easily
* remove the TOOLCHAIN_OPTIONS and TARGET_CC_ARCH
  references, since those are already present in
  CC and CXX
* remove the TARGET_ prefix so the values are
  appropriate for native, nativesdk, etc. builds
* move the GOROOT export away from the CGO settings
  and closer to its definition

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/classes/go.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index c0b117d155..8fb41e5c09 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -21,6 +21,7 @@ GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
+export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
 DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
@@ -35,12 +36,12 @@ export GO = "${HOST_PREFIX}go"
 GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
-export CGO_ENABLED = "1"
-export GOROOT
-export CGO_CFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CFLAGS}"
-export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
-export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
-export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
+
+export CGO_ENABLED ?= "1"
+export CGO_CFLAGS ?= "${CFLAGS}"
+export CGO_CPPFLAGS ?= "${CPPFLAGS}"
+export CGO_CXXFLAGS ?= "${CXXFLAGS}"
+export CGO_LDFLAGS ?= "${LDFLAGS}"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
 GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
-- 
2.14.1


