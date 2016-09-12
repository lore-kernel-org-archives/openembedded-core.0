Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AF4A860851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 11:48:08 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c131so53236032wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=waUMZ9K/jnFKSxLu8p/j7WpwN63odFYyL0zypMZ5ELs=;
	b=HpVp+EoAgwuzyF8+M9boRns7trUigz5+ThJ9dEg2cAkxbSzz7Yq1dczlCZDY0LJ3y5
	wDQq1se1sHX7syt3r6E+WmuweYvH4qc99LX/oY6YmYLHn45Z0+XXHluBp1ax0cyXILGS
	V5UaqMZmfdT8yhjF8ZCmGruynl23ELrGSvOfyQ/0F+DtH/mvGFZAOKYGE32HJRCVHJkg
	eu6y8w1YKBEZm5Ab0gSBu5huWnS5iBLiCFaUXPI0c5gWT9plnUbx5aArLRd5yerWNjGq
	fHxWTY59ycwAW+M86alP0TGj2QIRPJWvo3TKhFe/wi8g2TtVLLEsaFaS02mNcctMySxY
	xPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=waUMZ9K/jnFKSxLu8p/j7WpwN63odFYyL0zypMZ5ELs=;
	b=gonjkviyCL7levB8cGjkCEfd27gjXpEcYAHuzCY+lbrAyJzVq0RAlGl2J+SAMzAU6q
	BOX6j6f2hR5E8mZylTBhJvmZSgyJxn56Vi5LsNvXFbs6/6qHtNiCG+Mf7/YM+480LsQ7
	SNDLyIGnJN1njzxeBAi8P+LITBcYEQJEIGj1ezuFQ7Nh8AKBX5/RlSwUHJXOCAani+qz
	D+fR7c84sW0pG+Ka9HqXwNpjvLV4AA/PTFgHAHoREm3KOuHOx3TYpQ7VIWZ8KVCR1Vgk
	rOG8GIGQn8gZUE4d6eQZsPnwV20bOwTVbFYjZ7V21l6aLjayDLtN8pQ6nICHNT9yVqUo
	DWAA==
X-Gm-Message-State: AE9vXwMbl20SLzy+MrUTu+7YyD2mfDwjXbpwS8pNyIqjzJNSn/XJHOtaYJxbg+5ydtfhfJGd
X-Received: by 10.194.205.2 with SMTP id lc2mr16694184wjc.175.1473680888552;
	Mon, 12 Sep 2016 04:48:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm17478992wmk.13.2016.09.12.04.48.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 04:48:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 12:48:04 +0100
Message-Id: <1473680885-30513-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] classes/gtk-doc: lazy assign GTKDOC_ENABLED
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
X-List-Received-Date: Mon, 12 Sep 2016 11:48:11 -0000

By letting a recipe assign GTKDOC_ENABLED trivially there is a simple and clear
way to disable gtk-doc for specific build configurations.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index b2b6239..297eac6 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -7,7 +7,7 @@
 #
 # It should be used in recipes to determine whether gtk-doc based documentation should be built,
 # so that qemu use can be avoided when necessary.
-GTKDOC_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', \
+GTKDOC_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
 
 EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GTKDOC_ENABLED', 'True', '--enable-gtk-doc --enable-gtk-doc-html --disable-gtk-doc-pdf', \
-- 
2.8.1


