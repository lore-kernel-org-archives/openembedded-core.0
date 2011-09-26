Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R8CW7-0007Ju-V7
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 16:50:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEphPw027430 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:43 +0100
X-Quarantine-ID: <EBkL3evZYbOJ>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EBkL3evZYbOJ
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:43 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpdUV027406
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:41 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R8CQl-0007vq-V6
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 15:45:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 15:45:06 +0100
Message-Id: <4e48a37e2381528a2a565fb09299187e02af84e7.1317048110.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
References: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
References: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/03] mc: Ensure perl scripts reference the correct perl
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
X-List-Received-Date: Mon, 26 Sep 2011 14:50:48 -0000

Without this change the perl path from the build system is used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mc/mc_4.7.5.2.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index 6b03be7..59f32ad 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
@@ -18,3 +18,8 @@ inherit autotools gettext
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
 
 FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
+
+do_install_append () {
+       sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
+       
+}
-- 
1.7.5.4



