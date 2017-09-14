Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E71B3785DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:23:22 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c69so192865qke.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=4XAfL0k6f1dYZA6PGo/OofGDCWcVUAFVyjSUMmASZ3c=;
	b=JvZ/sSAQ+DACjZNyP1KnltB1GcBNPK+kXBlBZEG31U3zsMs2T881Rv2RO1NYyCxOz/
	pkNyqkR1/HXtd/QjlcbvA6yEAOd/pIa6akaxGWDt8dSFU2aCmRHP8Rhk4q6S2q5PIgmf
	pWZCyt+gWJ2JqpDegTG38EfEmXBNtyh7ODtna+n1ngwwbdfUot7Q63592m30mowI5Z4w
	sbBQv22LvK1bZn4waDOQQ5qvrWXfLkSxHg03TiEtT3pdFbMUfNwpw8uBdVAmRahuxzJg
	H91lka37MLoCGQIYy6R//WBV/WYE7R0cq6CCfzISRmpJaHj/niBrZUU/cNSkRdmL0sIj
	tmmg==
X-Gm-Message-State: AHPjjUje+qUwaXsIg6k6B5dh7MAHnEz6LDozay3aTGpTa++9JGKcTjjs
	edtvwCPGR7n0qO2g
X-Google-Smtp-Source: AOwi7QCYq5osSjD1szLCDoHFA6Y78wRxl1uIT3PVor6iYjt8oMuSfh3pNQgLRmVYuRMoRlN9Xx7E8w==
X-Received: by 10.55.116.134 with SMTP id p128mr4352454qkc.50.1505417003624;
	Thu, 14 Sep 2017 12:23:23 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y11sm11553606qkb.20.2017.09.14.12.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 12:23:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 14 Sep 2017 16:23:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 16:22:31 -0300
Message-Id: <20170914192231.15002-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170914192231.15002-1-otavio@ossystems.com.br>
References: <20170914192231.15002-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v10 5/5] Add Go toolchain support
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
X-List-Received-Date: Thu, 14 Sep 2017 19:23:23 -0000

This adds the meta-go-toolchain. It enables the generation of a Go
toolchain allowing for cross compiling for target architecture.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v10:
- new patch

 meta/recipes-core/meta/meta-go-toolchain.bb                  | 12 ++++++++++++
 .../packagegroups/packagegroup-go-cross-canadian.bb          | 12 ++++++++++++
 .../recipes-core/packagegroups/packagegroup-go-sdk-target.bb |  8 ++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-go-toolchain.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb

diff --git a/meta/recipes-core/meta/meta-go-toolchain.bb b/meta/recipes-core/meta/meta-go-toolchain.bb
new file mode 100644
index 0000000000..dde385c1b1
--- /dev/null
+++ b/meta/recipes-core/meta/meta-go-toolchain.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Meta package for building a installable Go toolchain"
+LICENSE = "MIT"
+
+inherit populate_sdk
+
+TOOLCHAIN_HOST_TASK_append = " \
+    packagegroup-go-cross-canadian-${MACHINE} \
+"
+
+TOOLCHAIN_TARGET_TASK_append = " \
+    ${@multilib_pkg_extend(d, 'packagegroup-go-sdk-target')} \
+"
diff --git a/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
new file mode 100644
index 0000000000..3daace1a40
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Host SDK package for Go cross canadian toolchain"
+PN = "packagegroup-go-cross-canadian-${MACHINE}"
+
+inherit cross-canadian packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
+
+GO = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+RDEPENDS_${PN} = " \
+    ${@all_multilib_tune_values(d, 'GO')} \
+"
diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
new file mode 100644
index 0000000000..c6c14f1249
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Target packages for the Go SDK"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = " \
+    go-runtime \
+    go-runtime-dev \
+"
-- 
2.14.1


