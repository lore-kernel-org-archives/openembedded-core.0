Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4883871A15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 06:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 52433182E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id gpOQMYw8Nztw
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:35 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4E34C182DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:35 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3050A1E070
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:35 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 256181E06E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:35 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:35 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id 19FE5477
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:51:35 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 0443A7C066; Mon,  9 Jan 2017 07:51:34 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 07:51:26 +0100
Message-Id: <1483944688-7756-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH v2 0/2] Set STAMPCLEAN for externalsrc when S == B
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
X-List-Received-Date: Mon, 09 Jan 2017 06:51:43 -0000

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


