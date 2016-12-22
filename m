Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 60DFC77626
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 13:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 359202E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:16:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id L+4CjJth9WKT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:16:46 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id A05D22E0BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:16:46 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A69E1A075
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:16:46 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F7591A072
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:16:46 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:16:46 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 72F90734;
	Thu, 22 Dec 2016 14:16:46 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 26CB07C066; Thu, 22 Dec 2016 14:16:45 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 14:16:32 +0100
Message-Id: <1482412594-22508-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Cc: Ola x Nilsson <olani@axis.com>
Subject: [PATCH 0/2] Set STAMPCLEAN for externalsrc when S == B
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
X-List-Received-Date: Thu, 22 Dec 2016 13:16:47 -0000

When using devtool modify and changing code back and forth bitbake
sometimes does not realize that a rebuild is required.  This is
because STAMP and STAMPCLEAN doesn't match.  Old stamps confuse
bitbake and when the files in ${S} happen to match something we've
seen before bitbake decides to do nothing.

Fix by setting STAMPCLEAN.
Add tests.

Ola x Nilsson (2):
  oe-selftest: devtool: Reverting a change should trigger rebuild
  externalsrc: Set STAMPCLEAN to match STAMP

 meta/classes/externalsrc.bbclass  |  1 +
 meta/lib/oeqa/selftest/devtool.py | 54 +++++++++++++++++++++++++++------------
 2 files changed, 39 insertions(+), 16 deletions(-)

-- 
2.1.4


