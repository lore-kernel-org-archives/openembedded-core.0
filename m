Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E66C57C14B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:27:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9F6215C0DDF;
	Tue, 15 Jan 2019 23:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547591255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=DCOCF7Mz+dRKTz3hLI7JB3uFZCW4xqdUnfoW97xna8E=;
	b=LnVEeoQFD7ym5ZxJFDtIRXXST5AZ7/hx3IUZavfYgiYy2ndrxOZ/KXOFWgBg0GizcRxiGn
	JW5YUyVEy85aqI0CGNlRxhRNwtwikUEhwgLRyCJrTQCXMYipfY64eVJPHMwUXFtdwk33ul
	NIFF9MM8Eh51M49/pGPLcIsM0CThlwo=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 23:27:28 +0100
Message-Id: <20190115222730.54560-4-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190115222730.54560-1-stefan@agner.ch>
References: <20190115222730.54560-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 3/5] gconf: enable polkit if polkit distro feature is set
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
X-List-Received-Date: Tue, 15 Jan 2019 22:27:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Enable polkit depending on whether polkit distro feature is set.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 1e8ca2e5d2..e6742f37d8 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -22,8 +22,7 @@ S = "${WORKDIR}/GConf-${PV}"
 EXTRA_OECONF = "--enable-shared --disable-static \
                 --disable-orbit --with-openldap=no --disable-gtk"
 
-# Disable Polkit by default
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
 # We really don't want Polkit for native
 PACKAGECONFIG_class-native = ""
 
-- 
2.13.6


