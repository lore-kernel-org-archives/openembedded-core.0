Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 38AA878216
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:05:50 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 7so2241839qtz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=glxL7dWgv9ie+PqyaP0WCu6Ifb+3s2jR1jSXGPesYlA=;
	b=hHnoZ9lei88swBSJeczVnFN6KDT7cnMR5ft5ns+149r2DIX6Zm05X8RoY8lTYj1BNg
	hsO5wbFDbxQBvbctEHbc5wKFtUjPZYpV/+8LNINjuFsZtmhXItWhztHbVea4j6zpDOpp
	Txr3gtALKPonET9+fWYJRNfQaa+m3brMaPmmifSdAR+hhJ15s6NGE8tRAMkmUJ9aRVjg
	g/qgA05Tw86KD5dMBjQg9AaSgy3N0AaaYoFX4u4pKQqznas/TR7be21QzVJQqeLC0F3G
	NIVJp1EGZJoV4Nu1i2HKIddSXaxTiudiR2sJv8wDt9TAFfn/NA88CJKFKV9BMb/YpZNC
	wSUw==
X-Gm-Message-State: AHPjjUhF8jw8dvwd8BlGQ93+yYbBLwYBjdvGP1UBNnbFDKT46XSpSAtX
	9KItVFaitEI5ZGIB
X-Google-Smtp-Source: AOwi7QBxwbAk++v3pj/tEEUc856PUh4kmO5T3DR4u5tTi6Ij9r0IjDLYUcWnfRyAmfwBU/SeUeaN1A==
X-Received: by 10.200.54.136 with SMTP id a8mr5749346qtc.307.1504904751309;
	Fri, 08 Sep 2017 14:05:51 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	b27sm1887654qtc.78.2017.09.08.14.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:05:50 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:05:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:36 -0300
Message-Id: <20170908210444.25763-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 06/14] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Fri, 08 Sep 2017 21:05:50 -0000

We now use a GOBUILDFLAGS to provide a global variable to control the
build flags to be given to Go.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove -x flag (madisongh)
- Remove GO_EXTLDFLAGS for now (madisongh)

 meta/classes/go.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e073cb91b5..720a504cd8 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -5,6 +5,8 @@ GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
+export GOBUILDFLAGS ?= "-v"
+
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
@@ -32,7 +34,7 @@ GO_INSTALL ?= "${GO_IMPORT}/..."
 do_go_compile() {
 	GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
-		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install -v ${GO_INSTALL}
+		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
 	fi
 }
 
-- 
2.14.1


