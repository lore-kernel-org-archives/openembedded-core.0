Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJQcH-00083E-I3
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:12:05 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9E4E3D22B7;
	Wed,  3 Oct 2012 16:59:08 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 16:58:59 +0200
Message-Id: <1349276339-21164-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH] autotools.bbclass: update gnu-config files always
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
X-List-Received-Date: Wed, 03 Oct 2012 15:12:05 -0000

For new architectures we need to update gnu-config for all recipes
which use autotools. Normally we do that with "autoreconf" but some
recipes (db, ncurses, slang, xinetd for example) have own do_configure
function so we need to patch them one by one.

This solution handles this once and for all. There are some recipes
which will need special treatment but that's because they have
config.* files in other directory than ${S}.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/classes/autotools.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e4e034b..7effd48 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -99,6 +99,10 @@ autotools_preconfigure() {
 			mkdir ${B}
 		fi
 	fi
+
+	# not all recipes which use autotools use it's do_configure
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
 }
 
 autotools_postconfigure(){
-- 
1.7.10.4



