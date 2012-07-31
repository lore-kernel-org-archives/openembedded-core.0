Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sw6XT-0001Kh-Hi
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 09:06:43 +0200
Received: by ggnp4 with SMTP id p4so5129330ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AOAbLAOOP+eNFofQqRXevgfVh2Bx24E4OFX0/x7mOzc=;
	b=b/OynR+XGT6nhJb4Z2si/SQEs+O+33bvpHyVpldS/N1ze1PnUysNa+co8KY5HLNw2X
	r9lsQmC87T1fAQa/T6+r94bN3APu5pu71Mr3FhwcutWKzFOKLbgwYn41ChgnSXd0B02m
	2HLgQyXl5AkSVD8zTcHPqa6wY4kVQUedS9OpwE3icQt9X54Uh7rYkTGWipt8N6uRVodI
	Qtt1MIdN9mj/0iwOg4p+szmIkbQHAXgdmn1x9go0WYmJFzFDRNAjoUHpgHvlbaiGB/NW
	FupfQLstt3SMzqcjoSm0ejxk1th9TAskdgKzEi1TP1ot4UB8jBdHDmmSDLvpvFOfLS6l
	ZOgg==
Received: by 10.66.81.3 with SMTP id v3mr30014143pax.62.1343717706007;
	Mon, 30 Jul 2012 23:55:06 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id rz10sm9521072pbc.32.2012.07.30.23.55.04
	(version=SSLv3 cipher=OTHER); Mon, 30 Jul 2012 23:55:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 23:54:59 -0700
Message-Id: <1343717699-23305-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] glib-2.0-nativesdk: Fix build on ubuntu 11.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 07:06:43 -0000

When you have a distro which has older version of
glib-2.0 installed then it does not have compile_resources
installed which essentially glib-2.0 nativesdk is
looking for on build host. So like in a cross build
we disable the configure check which will force it
to build an internal copy and use it.

This problem may not be seen on newer distros like
ubuntu 12.04 since they have newer version of glib-2.0
installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 988494b..932c946 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b1
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
+CACHED_CONFIGUREVARS_virtclass-nativesdk = "ac_cv_path_GLIB_COMPILE_RESOURCES=/bin/true"
 do_configure_prepend() {
 	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
1.7.5.4



