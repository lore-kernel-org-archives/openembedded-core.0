Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D60B475D70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:01:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t66A1V0G023582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 03:01:31 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:01:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 03:01:30 -0700
Message-ID: <249919a0513534269d16dee1ecaf173d01b7e791.1436176865.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436176865.git.liezhi.yang@windriver.com>
References: <cover.1436176865.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: skip dev-deps QA checking for ptest package
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
X-List-Received-Date: Mon, 06 Jul 2015 10:01:32 -0000
Content-Type: text/plain

The ptest pkg such as perl-ptest may need .h, .so or other files in dev
package to run test cases, so skipping dev-deps checkin for ptest
package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4537eec..d0eaa6b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -792,7 +792,8 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 if "-dbg" in rdepend and "debug-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg,rdepend)
                     sane = package_qa_handle_error("debug-deps", error_msg, d)
-                if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
+                if (not pkg.endswith('-ptest') and not "-dev" in pkg and not "-staticdev" in pkg) \
+                        and rdepend.endswith("-dev") and "dev-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg, rdepend)
                     sane = package_qa_handle_error("dev-deps", error_msg, d)
                 if rdepend not in packages:
-- 
1.7.9.5


