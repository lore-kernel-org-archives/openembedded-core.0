Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGuNX-00074j-2d
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 18:22:27 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 09:09:33 -0700
Received: by wiwc10 with SMTP id c10so3732727wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=DvBP8OqOnHDDCWAMDEhN0RJGUIqSvYAuZWJSxXZd6m0=;
	b=ErZYPgNUxeE2sIJYIloLWO2/r6u4ZQn3UH5sm87N4EmURoFWr71vjvcjp+uRc6gUJU
	37s7uZ71kG4wkgl1/90e+JR/wp+noFRzcwyOcwF0yoVlHSXStETAV8xXhHu7kLkUWE3p
	fo0aYT7LjGSvo5PnUIXgdWPpaQTvYa6J1i7zNoqLZiExGZhC9yRwHLPpeole53qPVMzB
	LRaiNDVrsiNdmSItA8Q+ZqUAvf279yCbUJ6SJReitt1Hd78Woxy0uOaH1PUTXipPOTVA
	+klnZCHpjRmLhhmFQUomm4pl28nQlXJSHjLPOjYPSq1iIArH5mEgcAgU6jxADo05SrT4
	y1Gg==
Received: by 10.216.197.41 with SMTP id s41mr47832wen.205.1348675765940;
	Wed, 26 Sep 2012 09:09:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l10sm899010wiy.3.2012.09.26.09.09.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 09:09:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 17:08:27 +0100
Message-Id: <1348675707-24182-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlpE0734iZW8h09uIFlCx3ou3gD68w11Eu9AC41hBVRn2+GVzSRKhpzfZknpZ0DvhnoX6qI
Subject: [PATCH] xserver-xorg: fix -exa conflicts
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
X-List-Received-Date: Wed, 26 Sep 2012 16:22:27 -0000

Hopefully for good this time!

The previous conflict of < ${PV} declares a conflict with all versions older
than the version being built, which isn't right.

This conflict was being declared in a .inc file which is being included by
multiple recipes (xserver-psb in meta-intel, for example) so knowledge of the
exact version in which this change occured is only known by the .bb file itself.
Recognise this and put the conflict in the .bb file itself.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    4 ++++
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc        |    1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 35cb33a..a2d1bec 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -9,3 +9,7 @@ SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
 PR = "r8"
+
+# This conflict needs to be here and not in the .inc so we know the exact
+# version where the break was
+RCONFLICTS_${PN}-module-exa = "${PN} (< 1.11.2-r5)"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 643ca70..3ec38b7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -66,7 +66,6 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-RCONFLICTS_${PN}-module-exa = "${PN} (<${PV})"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.10



