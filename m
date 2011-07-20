Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qjd8u-000073-Df
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:13:17 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KK91Mg020211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:09:02 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:08:56 -0700
Message-Id: <d7f66e00e76fd7f2cc7c8080e9517adf2ad96332.1311192464.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
Subject: [PATCH 1/5] python-native: Mangle scripts to use /usr/bin/env python, bump PR
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
X-List-Received-Date: Wed, 20 Jul 2011 20:13:19 -0000

This is dd33ced4b8123600efa1f67f704aec13b0842ad1 in oe.dev and needed
for building in deep paths.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../recipes-devtools/python/python-native_2.6.6.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
index fa943f4..59ed61a 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
@@ -36,4 +36,9 @@ do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${bindir}/
 	install -m 0755 Parser/pgen ${D}${bindir}/
+
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+	done
 }
-- 
1.7.0.4



