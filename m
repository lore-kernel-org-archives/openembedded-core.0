Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 79E7171A15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 06:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B9A972E465
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2Y0T5VmlJs3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:54 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 0BF3E2E444
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:54 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE7D61E070
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:53 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3BF71E06E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:53 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:53 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id D8532477
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:53 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id C8D2D7C066; Mon,  9 Jan 2017 07:51:53 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 07:51:28 +0100
Message-Id: <1483944688-7756-3-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483944688-7756-1-git-send-email-ola.x.nilsson@axis.com>
References: <1483944688-7756-1-git-send-email-ola.x.nilsson@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH v2 2/2] externalsrc: Set STAMPCLEAN to match STAMP
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
X-List-Received-Date: Mon, 09 Jan 2017 06:51:54 -0000

Only the last stamp file should be kept, but unless STAMPCLEAN matches
files generated using STAMP old stamp files may linger.  This may
cause false positives for skipping tasks.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index e115a47..eec5e61 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -116,6 +116,7 @@ python () {
             configstamp = '${TMPDIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}/configure.sstate'
             d.setVar('CONFIGURESTAMPFILE', configstamp)
             d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
+            d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')
 }
 
 python externalsrc_configure_prefunc() {
-- 
2.1.4


