Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0FD96D145
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 07:14:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA47E4L9018275
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 23:14:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 23:14:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 15:13:53 +0800
Message-ID: <a30574d20eb4326e399f5ee7a7ee51bc9bee0d42.1383549031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383549031.git.hongxu.jia@windriver.com>
References: <cover.1383549031.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/4] insane.bbclass: support to skip unsafe references in binaries qa check.
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
X-List-Received-Date: Mon, 04 Nov 2013 07:14:03 -0000
Content-Type: text/plain

Add a variable to support skipping the unsafe references in binaries qa check.

[YOCTO #5142]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index eb440c2..20bbab0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -318,6 +318,10 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
 	if elf:
 		import subprocess as sub
 		pn = d.getVar('PN', True)
+		# Skip for any packages with unsafe-ref-bin in INSANE_SKIP
+		if 'unsafe-ref-bin' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+			bb.note("Package %s skipping unsafe references in binaries QA test" % (pn))
+			return
 
 		exec_prefix = d.getVar('exec_prefix', True)
 		sysroot_path = d.getVar('STAGING_DIR_TARGET', True)
-- 
1.8.1.2


