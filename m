Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TldwR-0006jW-16
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 12:05:37 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2B9CCD22B4;
	Thu, 20 Dec 2012 11:50:47 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 11:50:38 +0100
Message-Id: <1356000638-29732-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <CAJTo0LZDZjg3fycmeUdgHpkxQJBd3BQXiaSEB1hwJDE7NRO-yw@mail.gmail.com>
References: <CAJTo0LZDZjg3fycmeUdgHpkxQJBd3BQXiaSEB1hwJDE7NRO-yw@mail.gmail.com>
Subject: [PATCH] slang: added gnu-configize for AArch64 support
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
X-List-Received-Date: Thu, 20 Dec 2012 11:05:39 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-extended/slang/slang_2.2.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 60aac66..b70e663 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -29,6 +29,14 @@ SRC_URI[sha256sum] = "9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a
 
 EXTRA_OECONF += " --without-z --without-png --without-onig --x-includes=${STAGING_DIR_HOST}/usr/include/X11 --x-libraries=${STAGING_DIR_HOST}/usr/lib"
 
+do_configure_prepend() {
+    # slang keeps configure.ac and rest of autoconf files in autoconf/ directory
+    # we have to go there to be able to run gnu-configize cause it expects configure.{in,ac}
+    # to be present. Resulting files land in autoconf/autoconf/ so we need to move them.
+    cd ${S}/autoconf && gnu-configize --force && mv autoconf/config.* .
+    cd ${B}
+}
+
 do_install() {
 	oe_runmake install DESTDIR=${D} -e 'INST_LIB_DIR=${STAGING_DIR_HOST}/usr/lib'
 }
-- 
1.8.0



