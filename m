Return-Path: <matt@madison.systems>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D17778A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q13so4483702pff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pCRd0jdDNokk6IKK8oEwhHDpAgWP9AjjX+8D+gN1vBE=;
	b=y1k/1Mlr2bcffjiTenuBP/zvG3mjxrwSmlTnAWeZoZsVbhK836X/OsLy3ui466I7DJ
	S/ORRpK1tHChGc9W/+3cuq0hBzjB4JI2QygYKm/8lB+8k+sZwzPzaMHFuqWuWLdSVbEG
	SydPTvgG7a1O0NmNl8s+XJ5YWrXmqrfOiC5seH790F+2uyIheVWdEnHq4/N2FW+VK9vY
	sD/W4ZoEL8s+Rh44VRrU+PZ8nHFz4Gbz4ga4egWnAZTeKknq0nK+z8/qSo50TxJg4ro2
	Zcv8zOqY0JGJTiCpUfXMDQkAadB4a0+dd1/+uS2yEmU4icokg98E7gSCGonN0SZEBzRT
	FIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pCRd0jdDNokk6IKK8oEwhHDpAgWP9AjjX+8D+gN1vBE=;
	b=HpAj9zWJtQzfkpL1dBPGkV3I/E1OTEe3OGs4qpFDhGAUNYEwav5DmU5SDGRaMeyzFJ
	YBeVNtZSo0/lAo6Mh53Gdr/jErpDCqWw0PfuGrys4SOR+G767QoNBv8fkb1vSdn0i/Ka
	H3dk9zGXrm9z17/hFu38EhW7U7AWbPgS2ho8mT6gOyOYaG2G3DY+PdjZ7CfGghMCKCI0
	rgfK5XnJ7qspQ/Bu64GgeNInNpZwYYMirECh0/opN/+zCxYP2TjgQ5NqbEWEcHBmmOEP
	QJOFdnh928vKYZPMXfTKJem6TJx9RWwuZUpHJ0zpFEc9HFSMNIL3WSOrjZR5w27c5fB7
	KPQQ==
X-Gm-Message-State: APf1xPATPq0rWsLQIlPo/bi91N/scTwh2jv8XXCwZKKphe04bHZmjlxD
	BQDe5iz3HXgZvVRVJPXUZGaC81QB
X-Google-Smtp-Source: AG47ELsoeKgWVk1gymFgqM/NTpnBQ63rsAy/DqXWLvqdjbQ9cp5fVr3jzqBFkYKpe1VB8AMvzmBtvw==
X-Received: by 10.98.59.11 with SMTP id i11mr6867827pfa.57.1520022827895;
	Fri, 02 Mar 2018 12:33:47 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:46 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:11 -0800
Message-Id: <20180302203314.32737-11-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 10/13] go: disable PIE CFLAGS for nativesdk and cross-canadian builds
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:46 -0000

The statically-linked Go code in the toolchain is not compatible
with PIE, so disable its use in the C compiler during the
toolchain build.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 6 +++---
 meta/recipes-devtools/go/go-target.inc         | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 7a39e4509b..1d6453712e 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -12,13 +12,13 @@ export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/$
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
-	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 3bc32f3bec..29a1344675 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -14,8 +14,7 @@ GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
 
-SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
-SECURITY_LDFLAGS = ""
+CC_append_class-nativesdk = " ${SECURITY_NOPIE_CFLAGS}"
 
 do_configure[noexec] = "1"
 
-- 
2.14.1


