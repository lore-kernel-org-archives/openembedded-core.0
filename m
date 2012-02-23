Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0a6D-0002KW-8E
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:56:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NF2CHg004025 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:02:12 GMT
X-Quarantine-ID: <9O+XdDr7Qk1Z>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9O+XdDr7Qk1Z
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:02:12 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NF2AWr004018
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:02:11 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Zy4-00029X-JF
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 14:48:24 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 14:48:12 +0000
Message-Id: <a272fb96eb48c2e1ae2756f98f9432d831a21057.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5e4de9be889558b18c52bc0af42d19fafabfce37.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5e4de9be889558b18c52bc0af42d19fafabfce37.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/16] insane.bbclass: Only depend on desktop-file-utils-native when we need it
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
X-List-Received-Date: Thu, 23 Feb 2012 14:56:49 -0000

There is no point in depending on desktop-file-utils if we're not going to
use it. This patch makes the dependency conditional upon the desktop tests
being enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ead6ec1..7a84465 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -23,7 +23,7 @@
 # The package.bbclass can help us here.
 #
 inherit package
-PACKAGE_DEPENDS += "pax-utils-native desktop-file-utils-native ${QADEPENDS}"
+PACKAGE_DEPENDS += "pax-utils-native ${QADEPENDS}"
 PACKAGEFUNCS += " do_package_qa "
 
 # unsafe-references-in-binaries requires prelink-rtld from
@@ -722,3 +722,9 @@ do_populate_sysroot[postfuncs] += "do_qa_staging "
 # have it in DEPENDS and for correct LIC_FILES_CHKSUM
 #addtask qa_configure after do_configure before do_compile
 do_configure[postfuncs] += "do_qa_configure "
+
+python () {
+    tests = d.getVar('WARN_QA', True) + " " + d.getVar('ERROR_QA', True)
+    if tests.find("desktop") != -1:
+        d.appendVar("PACKAGE_DEPENDS", "desktop-file-utils-native")
+}
-- 
1.7.5.4



