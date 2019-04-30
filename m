Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7776D666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 09:59:36 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x3U9xbt2015291
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:59:37 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x3U9xbkb030211;
	Tue, 30 Apr 2019 11:59:37 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D26C99508F2;
	Tue, 30 Apr 2019 11:59:33 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 11:59:16 +0200
Message-Id: <20190430095917.3680-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/1] insane.bbclass: Add QA package check for mixed bins and libs
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
X-List-Received-Date: Tue, 30 Apr 2019 09:59:37 -0000

In multi-lib cases some packages with mixed binaries and libraries
could have a problem. Explanations with GDB and bmap-tools.

GDB requires python binary (RDEPENDS) and bmap-tools too.
GDB is installed as 32bit variant and bmap-tools as 64bit.
In the current state both type (32+64) of required libraries
will be installed on the target. (I think' this is the right case.)

At the end a 32bit variant of binaries wins and overrides the 64bit.
Finally GDB is working without any problems and bmap-tools not.
Bacuse 64-bit python binary was overriden with 32-bit.

All-arch variant has been disabled for multilib. Is there any special
reson why?

How we can proceed with this kind of problem? There are many others
tools like python, perl, ... . 


Just for info, I have run this check locally with current
`bitbake world`, >100 packages have this problem.


Andrej Valek (1):
  insane.bbclass: Add QA package check for mixed bins and libs

 meta/classes/insane.bbclass | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.11.0


