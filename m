Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeff.polk@windriver.com>) id 1UMkLP-0000WA-Fy
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 21:24:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r31Fq570001582
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2013 08:52:05 -0700 (PDT)
Received: from delos.delos.com (172.25.35.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Apr 2013 08:52:05 -0700
From: Jeff Polk <jeff.polk@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2013 09:52:04 -0600
Message-ID: <1364831524-28363-1-git-send-email-jeff.polk@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] sstate: add -f to mv when moving sstate files into place
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
X-List-Received-Date: Mon, 01 Apr 2013 19:24:39 -0000
Content-Type: text/plain

Under some conditions (ACLs enabled, NFS) mv can interactively prompt
before overwriting files.  Avoid hanging builds in that case by using
-f which should be harmless in other cases.

Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ce9f243..c7d8d68 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -547,7 +547,7 @@ sstate_create_package () {
 		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
 	chmod 0664 $TFILE 
-	mv $TFILE ${SSTATE_PKG}
+	mv -f $TFILE ${SSTATE_PKG}
 
 	cd ${WORKDIR}
 	rm -rf ${SSTATE_BUILDDIR}
-- 
1.7.9.5



