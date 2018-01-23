Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D28CC787CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:57:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o35so2981820qtj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UHac05HWU6+eehDoDcV29x9bdz1cpSTfbDNaXXM1A4Q=;
	b=Sv2rMRK0p4+jMGLqSZe60VSVqsKwl+5nVKicracfp8EHn6RW4HufIp6A0rf+86/1SG
	jP4A67rHhMlHTU/nZSWojhgdatobEYa5k0R1plnYYsxeHYzz1z3oIf7KoHYzwoNTi94K
	kKW+8rBY/PSPlua+i2DZuVqS8P6Fya/k9Ex0cdbo/kN4UEVE04cURtq8u+sormQd9APv
	KtND/cqbIDs9wUWDsosGz6dkm3jPfFkes15TgkRDy+0/PJfP7/41UcpBf2N19YIZW9EY
	AfXm4OVLzebm2kphh9IyOC6iQ5l73LWbENErS5SErsm4TltRgsYtbrmx5glhMRLXXctG
	5J9g==
X-Gm-Message-State: AKwxytda6EfIw2b36oHO1HBlS3YdO90wzD7+RGq+8P3gnFYn1kiUOeDl
	tZazZHa8ABts6uyzomQ2zwXGwQ==
X-Google-Smtp-Source: AH8x2254cJWvVMOmechuFCHHL8eEQZROvMk8FQW7NkNgfbWsA02ECM/klo27JUx8k/h0lam9yLh0Ew==
X-Received: by 10.55.120.66 with SMTP id t63mr4253735qkc.345.1516726642018;
	Tue, 23 Jan 2018 08:57:22 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id o5sm620051qtc.72.2018.01.23.08.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:57:21 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:57:16 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:25 -0200
Message-Id: <20180123165625.7352-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 8/8] grub: Move grub-editenv packaging to grub2.inc
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
X-List-Received-Date: Tue, 23 Jan 2018 16:57:21 -0000

The editenv utility must be available on grub and grub-efi so we
better have it inside the grub2.inc file to avoid the duplication of
metadata.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ebdd054ad85b19d47dd20eab0ba3f31ef5141140)

---

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
2.16.1


