Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFTSq-0003Ff-Nv
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:26:00 +0200
Received: by weyt44 with SMTP id t44so1316272wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 10:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0EwrGruNqyqd6iD/cA88LPVtVQUqgnNQ1+SZV/X6+E4=;
	b=MgMDdeDHWotKEmH/VRlVgVmcFsSzUaH485SicPMjQYzIKg71DSe4i4jfGPYNyS7vZu
	blcwOeVyqgE4Hwdu6u3eJe5Dii03LgJSAQOK0TsN4CHa18CdEk6KjjwuTXux1ULsDIlp
	EHp/4cwOR3HSyG9aGzsf5O7481TudQnT1toL3Itttg52Bo2XOTUG3QpKItxkV6dAxcQn
	NZX2zm64X/4ozZgoOPwVH5NZNRmK9DkurkqRE7cBZp1jAwXJHHInLZvopHc0fMeY+5+v
	lkWxnExh4AaIBQ+SCEmLqdIGEUpt+nWfNpnEEvkkddMiPHcrM/fpTWnKCkkfFlTU39xm
	Ay2Q==
Received: by 10.180.83.66 with SMTP id o2mr3961742wiy.14.1348333995490;
	Sat, 22 Sep 2012 10:13:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm5234853wib.10.2012.09.22.10.13.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 10:13:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 19:13:13 +0200
Message-Id: <1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <20120921112144.GE10268@jama.jama.net>
References: <20120921112144.GE10268@jama.jama.net>
Subject: [PATCH] xserver-xorg: fix RCONFLICTS line
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 17:26:00 -0000

* there needs to be space between '<' and PV, see:
  >>> bb.utils.explode_dep_versions('xserver-xorg (<1.11.2)')
  {'xserver-xorg': None}
  >>> bb.utils.explode_dep_versions('xserver-xorg (< 1.11.2)')
  {'xserver-xorg': '< 1.11.2'}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 35cb33a..32bd9fd 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,4 +8,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r8"
+PR = "r9"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 643ca70..33f59fe 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-RCONFLICTS_${PN}-module-exa = "${PN} (<${PV})"
+RCONFLICTS_${PN}-module-exa = "${PN} (< ${PV})"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.12



