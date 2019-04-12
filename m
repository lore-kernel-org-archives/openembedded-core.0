Return-Path: <daniel.thompson@linaro.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DBD6E7D720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 12:31:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w1so11719463wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X2iu+9y6/U89dym76q7HQ2EJ0/9NT7NVjCPPhrYFZNo=;
	b=Xd5g2hSDB2RTlI0GgZDhN82zFhuwxleWuZt3QIPP/MUbkrErCQQdDhmJ+Q58G8IOwl
	2EisTizI+K11PxtAwmlaXs+FJeHb/z8bpHTr15YaGCdDsrQkN4xSoH9jLUpdEneAdP54
	DNDyugR5+HeTJHIOqTcyWLS9/xmAUg093gK8RS65i51KMlbG8xwj2pPDSFW2nJ+yPe4o
	10fOESmyaFisSUQEjArp3S7nQD1IhXHhJnpq2xoFjUn0zLXBxWck4BtL+4k9WBIqcH6e
	4axr/q3MMaJX6JfL9tDZPqwjLOHDRY1ldVPhf8EX6Ad4ulDkJgBcOHbfl9vd3WWaJk43
	v4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X2iu+9y6/U89dym76q7HQ2EJ0/9NT7NVjCPPhrYFZNo=;
	b=e7WcWkyBnV895DhFxAhhrcXHLW8s8dM6Em9S6DOzorLdQmPsdnYugn20Dr6FqYowif
	kqryZUeP+6pX5DR9wSrGWV1vhI3LYnIkHBRH/CfSrSJq6Z1H1mg9eDejJUGXwBuxna0/
	uB/9xRznz9AuOi82AjMsyTrPq58cuXsqM1Zf7UDPVij/G+c3szpDW753jkk8jWv1m8hA
	UbP2mo0KMzNE09VWJCCL1hR6Iuxuyx85PjIc9n3+TmzP1pLP1aUhTZxLf0RVAB7AU7Ig
	Edv625zmY5o81INoIHb82spxTMPNNj8BbS3FPGH3vU4vcdyFm1aCzk27jwDolw3GXI9K
	otRw==
X-Gm-Message-State: APjAAAXUU+ebrK0oKL+gMoLQi3WmogSvom+pv1GUsqAdByYcPz1Mlwot
	RcM4OhIKR6lmEd/c8aOnKZRd8efLz2BBGA==
X-Google-Smtp-Source: APXvYqyJXQlbwDE+66q3Gjl6Yox/pUOsRj2WrgqN6lybW5jJ96PLlzE9FOGt+uzfHdbXItsPhW+kag==
X-Received: by 2002:a05:6000:14a:: with SMTP id
	r10mr15708797wrx.107.1555072262283; 
	Fri, 12 Apr 2019 05:31:02 -0700 (PDT)
Received: from oak.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
	[86.9.19.6]) by smtp.gmail.com with ESMTPSA id
	13sm10610126wmf.23.2019.04.12.05.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 05:31:01 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 13:30:46 +0100
Message-Id: <20190412123046.17510-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] go: Allow bootstrapping using host go compiler
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
X-List-Received-Date: Fri, 12 Apr 2019 12:31:02 -0000
Content-Transfer-Encoding: 8bit

Currently go-native bootstraps without any dependency on the host go
compiler by building go-1.4 (the last version written in C) and using
that to build a more recent version of go. This does not work on host
architectures, such as arm64, that are not supported by go-1.4. To
support these host architectures we must rely on an existing host go
compiler and use that to build go-native instead.

Rather than add arm64 specific code that forces the use of the host go
compiler, we use an architecture neutral approach based on adopting the
host go compiler if it is both recent enough and the output of `go env
GOROOT` passes basic sanity testing.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 meta/conf/bitbake.conf                 |  4 +++
 meta/recipes-devtools/go/go-native.inc | 38 ++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7f8b043cc4..61a3069579 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -514,6 +514,10 @@ HOSTTOOLS_NONFATAL += "bzr"
 # Used by ssh fetcher
 HOSTTOOLS_NONFATAL += "scp"
 
+# Used to bootstrap go more quickly (and to support host architectures not
+# supported by go-1.4)
+HOSTTOOLS_NONFATAL += "go"
+
 CCACHE ??= ""
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 207708745e..adf1666e29 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -10,14 +10,46 @@ CC = "${@d.getVar('BUILD_CC').strip()}"
 
 GOMAKEARGS ?= "--no-banner"
 
+check_host_go () {
+	local GOROOT="`go env GOROOT`"
+	if [ ! -x "$GOROOT/bin/go" ]
+	then
+		return 1
+	fi
+
+	local GOVERSION=`$GOROOT/bin/go version | tr ' ' '\n' | grep ^go[0-9] | cut -b3-`
+	local GOMAJOR=`echo $GOVERSION | cut -d. -f 1`
+	local GOMINOR=`echo $GOVERSION | cut -d. -f 2`
+	if [ "`echo $GOMAJOR.$GOMINOR | tr -d 0-9`" != "." ] || \
+	   [ "$GOMAJOR" -lt 1 ] || \
+	   [ "$GOMAJOR" -eq 1 -a "$GOMINOR" -lt 4 ]
+	then
+		return 1
+	fi
+
+	return 0
+}
+
 do_configure() {
-	cd ${WORKDIR}/go1.4/go/src
-	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
+	if check_host_go
+	then
+		bbplain "Bootstrap using host go compiler: `go env GOROOT`"
+	else
+		cd ${WORKDIR}/go1.4/go/src
+		CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
+	fi
 }
+do_configure[cleandirs] =+ "${GOTMPDIR}"
 
 do_compile() {
 	export GOROOT_FINAL="${libdir_native}/go"
-	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
+
+	if check_host_go
+	then
+		export GOROOT_BOOTSTRAP="`go env GOROOT`"
+	else
+		export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
+	fi
 
 	cd src
 	./make.bash ${GOMAKEARGS}
-- 
2.20.1


