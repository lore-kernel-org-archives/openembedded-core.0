Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D362B78684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 20:38:07 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f8so13330174qta.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=x9AoK0u2OuQJgvyqm5vJYpmGeYtil8coSU2+fRi3WHc=;
	b=abPrAxHdu0sP2WA8C648KydGlwWijh3PjmhB206GsXxdqYIHiYM/1swuv4bGj6JQmB
	+d2h7c5o+WKyTo05jTdOM8BsaR0/QG8bmdH8JKEg1/8VmdiYuT1MQtoFbl7QFUVm/FL+
	/Tb5sJ+pK2Fre7QUgSl/RJRhIOuhCMWVWXnJcSZ97ZwZN2MINtF31vX+cKzDNfgfd1dk
	/5dCd3L7wV6kHnymtFJj7dTi8i6Cp74HWo7Pg7TT25bgkNBDL8czQFbXJfFxDUmpPUVu
	xe99gVyJP4vukkSguWCKSMrLk8JRV9j48cX+JgWF6Lgl1doTHynCBaXUY0JvM+KcVoSe
	L1Rw==
X-Gm-Message-State: AJaThX7NqUzPq+oLJIFspxH64cs4JMMQ13xL0kZi+9iXaqqMcZKzsFlo
	u174PPXmUzTbuzWFA5Gq/aaBtA==
X-Google-Smtp-Source: AGs4zMbckcDaIchr2Q6oZ+HBZzKezbxuHogAJtBEASuLoVjDxMEC2Qktt4I8wolD+EhrTYDg94yQ9Q==
X-Received: by 10.200.24.171 with SMTP id s40mr2612702qtj.292.1510346288423;
	Fri, 10 Nov 2017 12:38:08 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k43sm7133149qtc.75.2017.11.10.12.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Nov 2017 12:38:07 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 10 Nov 2017 18:38:02 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 18:37:43 -0200
Message-Id: <20171110203743.25413-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171110203743.25413-1-otavio@ossystems.com.br>
References: <20171110203743.25413-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 10 Nov 2017 20:38:08 -0000

The editenv utility must be available on grub and grub-efi so we
better have it inside the grub2.inc file to avoid the duplication of
metadata.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.15.0


