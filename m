Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Slniw-0004rE-Kw
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:59:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q62Kmp7t023802
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 13:48:52 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 2 Jul 2012 13:48:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 15:58:26 -0500
Message-ID: <e86e3f66a6cb13e9b03c6da4e01c448ff18fcb5e.1341262598.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341262598.git.mark.hatle@windriver.com>
References: <cover.1341262598.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2 v2] libc-common: Allow -dbg package to append, and not just set package variables
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
X-List-Received-Date: Mon, 02 Jul 2012 20:59:59 -0000
Content-Type: text/plain

The libc-common attempts to rewrite the package information in a way similar
to debian.bbclass.  When it does this, it should be appending to the
dependency variables (RPROVIDES, RREPLACES, and RCONFLICTS), instead
of simply setting a hard coded value.  Otherwise the lib package can not
tailor the dependency variables to suite it's needs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/libc-common.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 9b91f0a..8145d64 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -29,7 +29,7 @@ python populate_packages_prepend () {
 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
 		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
 		# For backward compatibility with old -dbg package
-		d.setVar('RPROVIDES_' + bpn + '-dbg', 'libc-dbg')
-		d.setVar('RCONFLICTS_' + bpn + '-dbg', 'libc-dbg')
-		d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg')
+		d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
+		d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
+		d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
 }
-- 
1.7.3.4



