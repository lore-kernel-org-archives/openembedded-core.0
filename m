Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3633744AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 69EB8184C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XPKK7qwdPc29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:50 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id EF2BA184AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC5F51E064
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C06951E057
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:49 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id B3D7C912;
	Mon, 25 Jun 2018 13:34:49 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id A64959C0AD; Mon, 25 Jun 2018 13:34:49 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 13:34:45 +0200
Message-Id: <20180625113446.11638-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 1/2] insane.bbclass: Make missing license file fatal
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
X-List-Received-Date: Mon, 25 Jun 2018 11:34:50 -0000

If a license file referenced from LIC_FILES_CHKSUM doesn't exist,
insane.bbclass would output an error message, but would continue the
build. This change makes this error fatal (as I suspect has been the
intention).

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bd7f51956a6..bdfdc315aae 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -612,7 +612,7 @@ python populate_lic_qa_checksum() {
             continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
+            sane = package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
 
         if (srclicfile == corebase_licensefile):
-- 
2.11.0


