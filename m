Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut3-0001ju-WF
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQik6026935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:44 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:44 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:15 -0500
Message-ID: <3a7cbde0116d961c444a80ecb7e2624e6cc61acd.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 30/30] shadow-utils-native: remove unnecessary alternatives
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
X-List-Received-Date: Tue, 22 May 2012 19:36:56 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../shadow/shadow-native_4.1.4.3.bb                |   21 --------------------
 1 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 38bb922..5d9907b 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -43,25 +43,4 @@ do_install_append() {
 	# Now we don't have a mail system. Disable mail creation for now.
 	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
 	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
-
-	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
-	for i in passwd chfn newgrp chsh ; do
-		mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
-	done
-
-	mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
-	update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
-	update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
-	update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
-	update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
-}
-
-pkg_prerm_${PN} () {
-	for i in passwd chpasswd chfn newgrp chsh ; do
-		update-alternatives --remove $i $i.${PN}
-	done
 }
-- 
1.7.3.4



