Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScJ3K-0001F8-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 18:25:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q56GFHIC009968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 09:15:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 09:15:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 11:21:09 -0500
Message-ID: <6de2c92102c5ac20d742808cf592bf2ed93da5f0.1338999576.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338999576.git.mark.hatle@windriver.com>
References: <cover.1338999576.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6 v2] insane.bbclass: Make ldd exec_prefix error reporting easier to read
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
X-List-Received-Date: Wed, 06 Jun 2012 16:25:46 -0000
Content-Type: text/plain

Remove the long obtuse sysroot path from the ldd output.

Make the error message significantly easier to read and understand.

Old Style:
WARNING: QA Issue: keyutils: /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/work/i586-oe-linux/keyutils-1.5.5-r1/packages-split/keyutils/sbin/request-key links to something under exec_prefix
WARNING: QA Issue: ldd reports:         libkeyutils.so.1 => /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/sysroots/qemux86/usr/lib/libkeyutils.so.1 (0xdead1000)
        libc.so.6 => /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/sysroots/qemux86/lib/libc.so.6 (0xdead2000)
        /lib/ld-linux.so.2 => /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/sysroots/qemux86/lib/ld-linux.so.2 (0xdead3000)

New style:
WARNING: QA Issue: keyutils: /sbin/request-key, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libkeyutils.so.1 => /usr/lib/libkeyutils.so.1 (0xdead1000)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/insane.bbclass |   20 ++++++++++++++++----
 1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4d139e8..556a176 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -251,10 +251,22 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
 			return False
 
 		if sysroot_path_usr in ldd_output:
-			error_msg = pn + ": %s links to something under exec_prefix" % path
-			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-			error_msg = "ldd reports: %s" % ldd_output
-			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+			ldd_output = ldd_output.replace(sysroot_path, "")
+
+			pkgdest = d.getVar('PKGDEST', True)
+			packages = d.getVar('PACKAGES', True)
+
+			for package in packages.split():
+				short_path = path.replace('%s/%s' % (pkgdest, package), "", 1)
+				if (short_path != path):
+					break
+
+			base_err = pn + ": %s, installed in the base_prefix, requires a shared library under exec_prefix (%s)" % (short_path, exec_prefix)
+			for line in ldd_output.split('\n'):
+				if exec_prefix in line:
+					error_msg = "%s: %s" % (base_err, line.strip())
+					package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+
 			return False
 
 QAPATHTEST[unsafe-references-in-scripts] = "package_qa_check_unsafe_references_in_scripts"
-- 
1.7.3.4



