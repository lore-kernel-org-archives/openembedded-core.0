Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D010C72D74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:05 +0000 (UTC)
Received: by pdea3 with SMTP id a3so39366110pde.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=GX5RD9vg1XyChzGtNOBEsm2zBLBJ+ForO8i8q4YpHqE=;
	b=oIZlOKXBblbw3ybj93+Yky12Kerlilwu0DKOdL0h2XmlzcSjj9pH9RddSgPJH9YUMG
	MjqW+78msRabwTgGxACbA64Fda/sPlBSy0oOEe9+V7XCmUh7fXibgKBDHz+1Di/TxWMO
	0Xs+Qjhuq0OMtJmt4pTwYUPsbRBZQqjLeljrNOejy4Ekbf4gRfB0OzrkBziL0e7+wWFT
	Z/oKyUrYBiezdfQapAyE6H7UNWjwsmAyxfeWgbm3E5LLd3ZZ+UcVwWlr6r511if8JIqD
	ELClAODDyV5XgpVDPPK1jBqHxzDKhgW6WKeMOMlHxNeyQ0slWpfGA4/eLAEKqvOJDIkq
	ejCA==
X-Received: by 10.66.235.200 with SMTP id uo8mr7272195pac.18.1428715266997;
	Fri, 10 Apr 2015 18:21:06 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:44 -0700
Message-Id: <2f1431e35ccf21d9ea3f956bf14ced26980f8f3c.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 13/17] sudo: Disable hardening for musl
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:06 -0000

musl does not yet enable ssp

Change-Id: If40ab0a54b17d5528676b1268182b6c7e7ef5761
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 2d411f3..cdee6bb 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -22,6 +22,8 @@ CONFFILES_${PN} = "${sysconfdir}/sudoers"
 
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
 
+EXTRA_OECONF_append_libc-musl = " --disable-hardening "
+
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
 	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C lib/util mksigname mksiglist
-- 
2.1.4


