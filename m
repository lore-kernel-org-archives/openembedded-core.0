Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFTSy-0003H6-QI
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:26:08 +0200
Received: by wibhq4 with SMTP id hq4so2805322wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 10:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0izE8xPg8QT17FjFfTFSvBdmd3YCSqwABg+d7jHlT+c=;
	b=LCC5nvUTj8o+lhOjYivWCOob8T4z0Bws1CyFaHfrNEcaxTg/HQ7Gl5vB1PX3Q1/HLu
	OO1HGXcoRgMiIjXoI3GnW+qlWpfqQxfJ2aIXZaayIadO0rGEU6ydknUa6Q59Do9gcd3E
	4I2DIN8sN2/5WiKeZz2/u40OG2q7skqloS2GJclRqyZuCqHCfo9VkZ4gr4BKBv4Ir466
	NyehyRCUbefm4ur5fVzdGJG1h/3NvV+kGdrF3bCsJoTV2g/mZvBlOuNejdwtu7so01N4
	zkbIgNHRZLRvh67XUqiXja1UPOEm6iAtf/r9WRwht5RCNjOPRXQLxqTAA2vrJYDUuy8a
	uy8w==
Received: by 10.180.84.104 with SMTP id x8mr3932649wiy.20.1348334003677;
	Sat, 22 Sep 2012 10:13:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm4590051wix.9.2012.09.22.10.13.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 10:13:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 19:13:14 +0200
Message-Id: <1348333994-18026-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120921112144.GE10268@jama.jama.net>
	<1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Sat, 22 Sep 2012 17:26:08 -0000

* it doesn't make much sense with PV, because xserver-xorg-module-exa
  was introduced in
  http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver?id=1a666ee1cda3c0b74daba5881fc5f62e13deec66
  so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<= 1.11.2-r4)
  and (< 1.11.2) is not good enough

* because we don't know how many PRINC are in BSP/DISTRO layers,
  then it's safer to RCONFLICTS with every older version then current
  EXTENDPKGV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

--

* I haven't really tested this with IPK, since it was changed from
  RREPLACES to RCONFLICTS (because of RPM) and all my installed devices
  are already upgraded
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 33f59fe..7513399 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-RCONFLICTS_${PN}-module-exa = "${PN} (< ${PV})"
+RCONFLICTS_${PN}-module-exa = "${PN} (< ${EXTENDPKGV})"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.12



