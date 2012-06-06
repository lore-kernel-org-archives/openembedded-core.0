Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHgL-0002GP-TG
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:59:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q56ElTQ0018026
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:47:30 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 07:47:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 09:53:17 -0500
Message-ID: <8d70e60114dace932ce1f205758593c931f59ed2.1338994308.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6] insane.bbclass: Make ldd exec_prefix error reporting easier to read
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
X-List-Received-Date: Wed, 06 Jun 2012 14:59:10 -0000
Content-Type: text/plain

Remove the long obtuse sysroot path from the ldd output, making the error
message significantly easier to read and understand.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/insane.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4d139e8..e845250 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -251,7 +251,14 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
 			return False
 
 		if sysroot_path_usr in ldd_output:
-			error_msg = pn + ": %s links to something under exec_prefix" % path
+			ldd_output = ldd_output.replace(sysroot_path, "")
+
+			pkgdest = d.getVar('PKGDEST', True)
+			packages = d.getVar('PACKAGES', True)
+
+			short_path = path.replace('%s/%s' % (pkgdest, packages), "", 1)
+
+			error_msg = pn + ": %s links to something under exec_prefix (%s)" % (short_path, exec_prefix)
 			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
 			error_msg = "ldd reports: %s" % ldd_output
 			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-- 
1.7.3.4



