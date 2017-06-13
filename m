Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01DBC782E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:49:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5D9nrsA024615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 10:49:54 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dKiSP-0002YW-QE; Tue, 13 Jun 2017 10:49:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:49:49 +0100
Message-Id: <1497347392-9776-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 10:49:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/5] insane: Don't depend on OVERRIDES
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
X-List-Received-Date: Tue, 13 Jun 2017 09:49:56 -0000

In common with the other package handling functions, don't depend on the
value of OVERRIDES. This means when we change MACHINE, we don't have to
repackage everything.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fa932ef..f6fd7c7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -973,6 +973,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS_%s?" % \
                             (filerdepends[key].replace("_%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
                     package_qa_handle_error("file-rdeps", error_msg, d)
+package_qa_check_rdepends[vardepsexclude] = "OVERRIDES"
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
 
-- 
2.7.4


