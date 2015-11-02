Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63A0760034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 02:07:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA227ti3013024
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Nov 2015 18:07:56 -0800 (PST)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 1 Nov 2015 18:07:55 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Nov 2015 10:07:54 +0800
Message-ID: <1446430074-13927-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] insane.bbclass: Avoid libdir QA check if PACKAGE_DEBUG_SPLIT_STYLE='debug-file-directory'
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
X-List-Received-Date: Mon, 02 Nov 2015 02:07:56 -0000
Content-Type: text/plain

If PACKAGE_DEBUG_SPLIT_STYLE='debug-file-directory', debuglibdir will be
"/usr/lib/debug". Usually 64bit libs should be put under "/usr/lib64".
This often cause an warning, so skip the checking.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/classes/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a77438d..138e8f9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -307,6 +307,9 @@ def package_qa_check_libdir(d):
                 if 'libdir' in (d.getVar('INSANE_SKIP_' + package, True) or "").split():
                     bb.note("Package %s skipping libdir QA test" % (package))
                     skippackages.append(package)
+                elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-file-directory' and package.endswith("-dbg"):
+                    bb.note("Package %s skipping libdir QA test for PACKAGE_DEBUG_SPLIT_STYLE equals debug-file-directory" % (package))
+                    skippackages.append(package)
             for package in skippackages:
                 dirs.remove(package)
         for file in files:
-- 
1.9.1


