Return-Path: <petter@technux.se>
Received: from vsp-authed-03-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with SMTP id BDE5061485
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:51:59 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-03-02.binero.net (Halon Mail Gateway) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 09:51:56 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (90-224-44-236-no67.tbcn.telia.com
	[90.224.44.236]) (Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id EFEF63A1E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 09:51:54 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 09:51:34 +0200
Message-Id: <62624fce3e37336563e6a83727a26e4c96e456aa.1374305690.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374305690.git.petter@technux.se>
References: <cover.1374305690.git.petter@technux.se>
In-Reply-To: <cover.1374305690.git.petter@technux.se>
References: <cover.1374305690.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/1] remake: fix insufficient gettext dependency
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
X-List-Received-Date: Sat, 20 Jul 2013 07:52:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By default when inheriting gettext, "gettext-minimal-native" is added as
a dependency for native. The bb-file for remake use 'autopoint' (not
included in gettext-minimal-native). When building remake-native it
will result in a failure in do_configure for all cases when gettext (or
gettext-native) is not build from some other recipes, before building
'remake-native'.

This is solved by adding a build-dependency to gettext-native in
remake-native.

Fixes [YOCTO #4385]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-devtools/remake/remake_git.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_git.bb
index 13d8ce9..405c69f 100644
--- a/meta/recipes-devtools/remake/remake_git.bb
+++ b/meta/recipes-devtools/remake/remake_git.bb
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
@@ -12,6 +12,10 @@ S = "${WORKDIR}/git"
 PV = "3.82+dbg-0.9+git${SRCPV}"
 
 DEPENDS += "readline"
+# Need to add "gettext-native" dependency to remake-native.
+# By default only "gettext-minimal-native" is added
+# when inherit gettext.
+DEPENDS_class-native += "gettext-native"
 PROVIDES += "make"
 
 do_configure_prepend() {
-- 
1.7.9.5


