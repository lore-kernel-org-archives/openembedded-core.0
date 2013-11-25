Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id F30776D2A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 15:20:31 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vkxxf-0002bs-B0; Mon, 25 Nov 2013 15:20:31 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vkxxf-0007nC-9v; Mon, 25 Nov 2013 15:20:31 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:20:15 +0000
Message-Id: <1385392815-29916-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385392815-29916-1-git-send-email-mac@mcrowe.com>
References: <1385392815-29916-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] sanity: Don't hard code value of ENAMETOOLONG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2013 15:20:32 -0000

Although ENAMETOOLONG is 36 on Linux x86 and x86_64 it does isn't on other
architectures so the value shouldn't be hard coded.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/sanity.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 0d40792..8531df1 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -184,8 +184,9 @@ def check_create_long_filename(filepath, pathname):
         f.close()
         os.remove(testfile)
     except IOError as e:
-        errno, strerror = e.args
-        if errno == 36: # ENAMETOOLONG
+        import errno
+        err, strerror = e.args
+        if err == errno.ENAMETOOLONG:
             return "Failed to create a file with a long name in %s. Please use a filesystem that does not unreasonably limit filename length.\n" % pathname
         else:
             return "Failed to create a file in %s: %s.\n" % (pathname, strerror)
-- 
1.7.10.4


