Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TykjC-0001PM-0I
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:58:08 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5A77BD22B4;
	Fri, 25 Jan 2013 15:42:29 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 15:42:26 +0100
Message-Id: <1359124946-3952-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1359124417.13917.3.camel@ted>
References: <1359124417.13917.3.camel@ted>
Subject: [PATCH] eglibc: fix evacuate_scripts for external toolchains
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
X-List-Received-Date: Fri, 25 Jan 2013 14:58:12 -0000

Not every external toolchain has mtrace/sotruss/xtrace scripts so check
their existance first.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/eglibc/eglibc-package.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 79c43f1..4a4e54a 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -113,7 +113,9 @@ do_evacuate_scripts () {
 	target=${D}${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}
 	mkdir -p $target
 	for i in ${bashscripts}; do
-		cp ${D}${bindir}/$i $target/
+	    if [ -f ${D}${bindir}/$i ]; then
+		    cp ${D}${bindir}/$i $target/
+		fi
 	done
 }
 
-- 
1.8.0



