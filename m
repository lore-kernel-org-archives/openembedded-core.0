Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLgCR-0004jh-4a
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 22:14:43 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9DDC1D22BA;
	Tue,  9 Oct 2012 22:01:39 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 22:01:26 +0200
Message-Id: <1349812886-16922-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <CABcZANm_-4qSUXByfvn2dejfDq1EsZ-QKYpWDN_S-fK=qh19Ww@mail.gmail.com>
References: <CABcZANm_-4qSUXByfvn2dejfDq1EsZ-QKYpWDN_S-fK=qh19Ww@mail.gmail.com>
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
X-List-Received-Date: Tue, 09 Oct 2012 20:14:43 -0000

When recipe inherits autotools it gets do_configure defined. One of
things which are done is autoreconf so gnu-config files are updated to
latest OE version.

But some recipes use own do_configure due to hard edited configure
scripts or other reasons. We can edit those recipes one by one or can
trick them and provide update gnu-config files without using
autoreconf.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/classes/autotools.bbclass |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e4e034b..d0aad0d 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -99,6 +99,12 @@ autotools_preconfigure() {
 			mkdir ${B}
 		fi
 	fi
+
+	# not all recipes which use autotools use it's do_configure
+	( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
+		install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess `dirname $ac`
+		install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub   `dirname $ac`
+		done )
 }
 
 autotools_postconfigure(){
-- 
1.7.10.4



