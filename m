Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB7D6FFEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 09:53:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBG9rqtO013506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:53:53 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Dec 2015 01:53:52 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Dec 2015 17:54:01 +0800
Message-ID: <1450259641-19389-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] staging.bbclass: make already-stripped can be skipped
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
X-List-Received-Date: Wed, 16 Dec 2015 09:53:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add a check like what we does in package.bbclass
so that the already-stripped QA test can be skipped.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/staging.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 967eddd..243bcdf 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -127,7 +127,10 @@ python sysroot_strip () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
+                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+                                bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
+                            else:
+                                bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
                             continue
 
                         if s.st_ino in inodes:
-- 
2.3.5


