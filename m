Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFj2-0002Rq-4v
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 10:54:33 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8E07DD22CD;
	Wed, 20 Mar 2013 10:37:41 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:37:21 +0100
Message-Id: <1363772243-370-5-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 4/6] quota: switch to libtirpc
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
X-List-Received-Date: Wed, 20 Mar 2013 09:54:40 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-extended/quota/quota_4.01.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index 80159a9..e171160 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -15,12 +15,17 @@ SRC_URI[sha256sum] = "a36300bbc126b79b745bf937245092808b4585aa3309ef3335d4ab9d87
 
 S = "${WORKDIR}/quota-tools"
 
-DEPENDS = "gettext-native e2fsprogs"
+DEPENDS = "gettext-native e2fsprogs libtirpc"
 
 inherit autotools gettext
 
 EXTRA_OEMAKE += 'STRIP=""'
 
+do_configure_prepend() {
+    export CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/tirpc"
+    export LDFLAGS="-ltirpc ${LDFLAGS} "
+}
+
 do_install() {
 	oe_runmake prefix=${D}${prefix} install
 }
-- 
1.8.1.2



