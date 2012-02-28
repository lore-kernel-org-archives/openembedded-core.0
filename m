Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2I5Y-0004gI-LU
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:07:12 +0100
Received: by wera1 with SMTP id a1so1182850wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 23:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.84.137 as permitted sender)
	client-ip=10.180.84.137; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.84.137 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.84.137])
	by 10.180.84.137 with SMTP id z9mr5551411wiy.22.1330415925832 (num_hops
	= 1); Mon, 27 Feb 2012 23:58:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.84.137 with SMTP id z9mr4350012wiy.22.1330415925738;
	Mon, 27 Feb 2012 23:58:45 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id by4sm21178230wib.3.2012.02.27.23.58.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 23:58:45 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 08:58:37 +0100
Message-Id: <1330415917-3451-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlM67hzgoDBZ+QHM5FYd/FU7aaZUC06nElRktGmVX+0SGYlB/Xs0rB3xMJNf0S5oLt4WZ0Q
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] tcl 8.5.11: fix packaging
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
X-List-Received-Date: Tue, 28 Feb 2012 08:07:12 -0000

Include /usr/lib/tcl8 for the msgcat and test module, force dependency on tcl-lib since shlibs isn't picking it up.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index 146021a..a9a41fb 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r2"
+PR = "r3"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
@@ -59,7 +59,10 @@ do_install() {
 
 PACKAGES =+ "${PN}-lib"
 FILES_${PN}-lib = "${libdir}/libtcl8.5.so*"
-FILES_${PN} += "${prefix}/lib/tcl8.5"
+FILES_${PN} += "${prefix}/lib/tcl8.5 ${prefix}/lib/tcl8"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
+# isn't getting picked up by shlibs code
+RDEPENDS_${PN} += "${PN}-lib"
+
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



