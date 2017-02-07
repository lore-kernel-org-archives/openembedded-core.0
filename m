Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB36E71A6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 04:24:14 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 19so8321598pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 20:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fCQs+gmAvkUEHGuzdvurI3TnvF1rJIcY7wdIf64ZKgk=;
	b=r9ooqMaCPR2xXxgGcb9AKp4JsNU+YWo+bp6o+EDNftAZeCDr71M0/vlJryjBbyfoiY
	2G3GBzdL1n3oCYR8b97kLwvnwU64Dt5dW1n4l7ZnQleud6U15jNLgF+r6ngHonuFm/kl
	ZCv5qKPQjIP5xBCPdkxPu974AHhUN3Jowdeo/KKCfhk4hYgr3qvJhk0XZ8m9e/HDL/7n
	j+dIfRTBO3v9Xd5WNgzc+22Z9stNS4KLmaiuNGxIg0L/BNJm16qVuBEHiD212dWqTBTu
	X3U2VLIWDMWikZgkCKxk7u8A3AJ1BEWPBVSgN+/LDlIZgvDedmcz+FojkKiFRQmfl/AM
	myTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fCQs+gmAvkUEHGuzdvurI3TnvF1rJIcY7wdIf64ZKgk=;
	b=n9gx3nMZ4fauHd1+KDtRTnch+1t0hNmtgVMkwI+4LQkwtiVHFTd4c2ED6nkm4r8GDB
	plfBr+9j8XtKGBY8ofTu417IFUMFiqhkAqR7+S58NTK0jz1mbatTEmKQxW3DqKGNUnBd
	ldnF6wMj6ZwgMByAkCbRNPrmixbqD1I6j00stncuI/FO22s2n41gM3PPzXQC7PFpidt0
	IyVWNrWVrt87Mj51eSuPc+sL3vh8EIc3m+autxAjXkMncMW2WC/HvErwFzydlSQV9phe
	MoHkmikRDgm35U3qgPddFIb2muT37q3rux4sAandcanTFNx1RdrXV51/W2k3HbqbY6Ba
	mh/g==
X-Gm-Message-State: AIkVDXLhD3WTVHksgaGunB9aRtAWQa2FMiRGwJ4dKMP03SHLtg0dGYew7uL62MldcCpUSg==
X-Received: by 10.99.64.69 with SMTP id n66mr17749239pga.1.1486441455274;
	Mon, 06 Feb 2017 20:24:15 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm6397067pfl.17.2017.02.06.20.24.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 20:24:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 20:24:05 -0800
Message-Id: <20170207042405.22707-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170207042405.22707-1-raj.khem@gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] go: Fix go cross build with rss
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
X-List-Received-Date: Tue, 07 Feb 2017 04:24:14 -0000

recipe specific sysroot demanded changes how cross go compiler was built
rename PN to include ARCH_NAME for cross recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass                  |  2 +-
 meta/recipes-devtools/go/go-cross.inc    | 10 ++++++++++
 meta/recipes-devtools/go/go-cross_1.7.bb |  5 +++++
 meta/recipes-devtools/go/go_1.7.bb       |  2 --
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-cross.inc
 create mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e10864d99b..293194d39a 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -21,7 +21,7 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
 export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
 
-DEPENDS += "go-cross"
+DEPENDS += "go-cross-${TARGET_ARCH}"
 DEPENDS_class-native += "go-native"
 
 INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
new file mode 100644
index 0000000000..fa9c339b93
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -0,0 +1,10 @@
+inherit cross
+
+DEPENDS += "gcc-cross-${TARGET_ARCH}"
+
+PN = "go-cross-${TARGET_ARCH}"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
+
+GOROOT_FINAL ="${libdir}/go"
+export GOROOT_FINAL
diff --git a/meta/recipes-devtools/go/go-cross_1.7.bb b/meta/recipes-devtools/go/go-cross_1.7.bb
new file mode 100644
index 0000000000..56ee084b10
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross_1.7.bb
@@ -0,0 +1,5 @@
+require go-cross.inc
+require go_${PV}.bb
+
+# Go binaries are not understood by the strip tool.
+INHIBIT_SYSROOT_STRIP = "1"
diff --git a/meta/recipes-devtools/go/go_1.7.bb b/meta/recipes-devtools/go/go_1.7.bb
index 8186427933..e7a6ab277e 100644
--- a/meta/recipes-devtools/go/go_1.7.bb
+++ b/meta/recipes-devtools/go/go_1.7.bb
@@ -1,4 +1,2 @@
 require go-${PV}.inc
 require go.inc
-
-BBCLASSEXTEND = "cross"
-- 
2.11.1


