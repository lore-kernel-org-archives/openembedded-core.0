Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QyKE9-0004yD-UD
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 11:03:26 +0200
Received: by wwe32 with SMTP id 32so5263210wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 01:58:33 -0700 (PDT)
Received: by 10.216.194.70 with SMTP id l48mr497020wen.89.1314694712846;
	Tue, 30 Aug 2011 01:58:32 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r57sm131588weq.36.2011.08.30.01.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 01:58:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2011 10:58:23 +0200
Message-Id: <1314694703-22310-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC] package ipk bbclass: store build branch and revision in ipkg metadata
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
X-List-Received-Date: Tue, 30 Aug 2011 09:03:26 -0000

    The ipkg metadata will look like this now:

    koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
     new debian package, version 2.0.
     size 24112 bytes: control archive= 540 bytes.
         629 bytes,    13 lines      control
     Package: matrix-gui
     Version: 1.3-r19.0.6
     Description: Matrix GUI for Qt X11
     Section: multimedia
     Priority: optional
     Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
     License: BSD
     Architecture: am3517-evm
     OE: matrix-gui
     Homepage: https://gforge.ti.com/gf/project/matrix_gui/
     Build: org.openembedded.dev/f35ab2d
     Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6, libgcc1
     Source: svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd=''
    koen@dominion:/OE/angstrom-dev/deploy/glibc$

    Signed-off-by: Koen Kooi <koen@openembedded.org>
    Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
    Acked-by: Chase Maupin <chase.maupin@ti.com>

[Ported from .dev/6ae45bbf2b5ca9e4fd7e8b04e461f0bf120dd44d]
---
 meta/classes/package_ipk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e83aff8..63d7f18 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -303,6 +303,7 @@ python do_package_ipk () {
 		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
 		fields.append(["OE: %s\n", ['PN']])
 		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
+		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH', 'METADATA_REVISION']])
 
 		def pullData(l, d):
 			l2 = []
-- 
1.6.6.1



