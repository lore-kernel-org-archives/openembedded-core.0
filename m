Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7376B8AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:11:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1QHAmgU021273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:10:58 -0800
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 26 Feb 2019 09:10:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2019 12:10:35 -0500
Message-ID: <1551201035-1504-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] cpio: avoid conflict with tar-doc and rmt.8
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
X-List-Received-Date: Tue, 26 Feb 2019 17:11:08 -0000
Content-Type: text/plain

This fixes:
    Error: Transaction check error:
      file /usr/share/man/man8/rmt.8 conflicts between attempted installs of
      cpio-doc-2.12-r0.core2_64 and tar-doc-1.31-r0.core2_64

Prior to commit 348a96a5b401 [tar: upgrade to 1.31] the copies of
rmt.8 found in the tar(-doc) and cpio(-doc) packages were the same and
thus no conflict was seen. After the upgrade there were small changes
in the manpage header which results in the conflict quoted above. The
applications themselves make use of the 'update-alternatives'
mechanism to allow a user to select which version of 'rmt' to use but
since the man pages are essentially the same we disambiguate the
source of the man pages and make them both available should both
cpio-doc and tar-doc are both installed. And as such we avoid the
conflict.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-extended/cpio/cpio_2.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index 6ba8337..cb845c3 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -27,6 +27,9 @@ do_install () {
         mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
         rmdir ${D}${bindir}/
     fi
+
+    # Avoid conflicts with the version from tar
+    mv "${D}${mandir}/man8/rmt.8" "${D}${mandir}/man8/rmt-cpio.8"
 }
 
 PACKAGES =+ "${PN}-rmt"
-- 
2.7.4


