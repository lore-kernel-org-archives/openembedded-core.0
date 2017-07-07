Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E763477D21
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 05:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A28B21851F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id h77v4a5r9HYJ
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:51 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B2B1D184D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A2B11E083
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F3ED1E080
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:51 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 833632854
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 07:32:51 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 7 Jul 2017 07:32:51 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jul 2017 07:32:21 +0200
Message-ID: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Fri, 07 Jul 2017 05:32:53 -0000
Content-Type: text/plain

UPDATE v2:
- Rebased on latest Poky
- Fixed issue with bad paths
- Dirname based on $PN

In our organization, there is a demand to be able download source code for searching.
With the use of sstate-cache this has been challenge. Also, the source is not gathered
but rather spread in a larger directory structure together with build output.
There are probably others that also want to be able to do the same.

This addition does:
* Force download of all source via the srctree_all task
* Symlink the source together in a separate directory structure for easier search without
  the risk of matching with build output.

This is achived with a new class srctree.bbclass that implements the needed tasks and
a devtool command srctree which offers a convenience command to set up source for 
a recipe and it's dependencies.

There is also a way of organising the package source code in your own way.
This is done by implementing a custom dir generation function and assign to SRCTREE_PN_PATH
in a custom class and set SRCTREE_EXTENSION in a configuration file.


Tobias Hagelborn (2):
  srctree.bbclass: Download sourcecode and make it searchable
  devtool: srctree: New command for setting up browsable source-code

 meta/classes/srctree.bbclass   | 90 ++++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/srctree.py | 87 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 meta/classes/srctree.bbclass
 create mode 100644 scripts/lib/devtool/srctree.py

-- 
2.1.4


