Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLGSZ-0004oG-9b
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:45:39 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 38F8FD22BA;
	Mon,  8 Oct 2012 18:32:36 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 18:32:31 +0200
Message-Id: <1349713951-30766-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <5058505C.2040602@linaro.org>
References: <5058505C.2040602@linaro.org>
Subject: [PATCH 1/4] autotools.bbclass: update gnu-config files always
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
X-List-Received-Date: Mon, 08 Oct 2012 16:45:39 -0000

When recipe inherits autotools it gets do_configure defined. One of
things which are done is autoreconf so gnu-config files are updated to
latest OE version.

But some recipes use own do_configure due to hard edited configure
scripts or other reasons. We can edit those recipes one by one or can
trick them and provide update gnu-config files without using
autoreconf.

There are still some recipes left but that's usually due to other
directories than ${S} being used for configure scripts.

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



