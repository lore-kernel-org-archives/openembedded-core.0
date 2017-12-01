Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA347786C1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 13:03:19 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d66so13032734qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 05:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=IqfTcZkEAPvAoD1wKAgUwpRxMe0hpky57s6yF4iMtEg=;
	b=Of1YMj8zcpCy3WhPyWLX1KhK0W3J47K/JeFgso7ryiSu7SKOhlp9VLxrA+M3/r6o9w
	Y1RoedvCuVOCGaIwffcvvoaqLUOyETqUpzvbcUmd8xyFRv4Sil++eEtixv6luqLqK+m1
	gt07+vNvPeckDD0z/HBlkHmFAiHFXyGWiRlQSYkJBwRo37dco5W/5M1d8v5H9623yybd
	a75Lm9v8WUe7mvBd0u+G2R/mFDWv3NTy7VvlVEFUBOBR5j5iEg6EpV2rHHaBP1Tn6I/o
	RBl20hNRgrmgcGoP2BlEVjvAHbAau+SoyslKRIk3+tn+oszn6D5GXWWh6+WaSZUukO2J
	1UMg==
X-Gm-Message-State: AKGB3mIKBdDuI5Dafi0kCbx2gKAvhpq9OvuJlNkVBno1SuNHBuPxT2/s
	OpTSvF45wXtzFKCGRbyK7+xDxA==
X-Google-Smtp-Source: AGs4zMYrFKxl9oVhLV47GDJ1R/ehCjQLfREOo2Np+N6NHERk5F7mXO//JbPxEqxnAeLPGUocZ+fTsw==
X-Received: by 10.55.19.93 with SMTP id d90mr7149058qkh.271.1512133400740;
	Fri, 01 Dec 2017 05:03:20 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e204sm4531081qkb.25.2017.12.01.05.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 05:03:19 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 11:03:12 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Dec 2017 11:02:54 -0200
Message-Id: <20171201130254.21305-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171201130254.21305-1-otavio@ossystems.com.br>
References: <20171201130254.21305-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] grub: Move grub-editenv packaging to grub2.inc
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
X-List-Received-Date: Fri, 01 Dec 2017 13:03:20 -0000

The editenv utility must be available on grub and grub-efi so we
better have it inside the grub2.inc file to avoid the duplication of
metadata.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-bsp/grub/grub2.inc    | 6 ++++++
 meta/recipes-bsp/grub/grub_2.02.bb | 6 +-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a56fbe7bf8..28f96bb162 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -70,3 +70,9 @@ do_configure_prepend() {
 # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
 # conflicted, remove it since no one uses it.
 SYSROOT_DIRS_BLACKLIST += "${datadir}/grub/grub-mkconfig_lib"
+
+PACKAGES =+ "${PN}-editenv"
+
+FILES_${PN}-editenv = "${bindir}/grub-editenv"
+RDEPENDS_${PN} += "${PN}-editenv"
+RDEPENDS_${PN}_class-native = ""
diff --git a/meta/recipes-bsp/grub/grub_2.02.bb b/meta/recipes-bsp/grub/grub_2.02.bb
index b8055e7537..3e61f6a16d 100644
--- a/meta/recipes-bsp/grub/grub_2.02.bb
+++ b/meta/recipes-bsp/grub/grub_2.02.bb
@@ -1,10 +1,6 @@
 require grub2.inc
 
-RDEPENDS_${PN} = "diffutils freetype grub-editenv"
-
-PACKAGES =+ "grub-editenv"
-
-FILES_grub-editenv = "${bindir}/grub-editenv"
+RDEPENDS_${PN} += "diffutils freetype"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
-- 
2.15.0


