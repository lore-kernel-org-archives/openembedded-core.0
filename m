Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E01F87326D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 01:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id E32AB2E44E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id A1FSxQ-4sU12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 742AC2E476
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 562D11E074
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 474FF1E078
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 3B714325
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u8H1I9r5024635
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u8H1I9vr024634
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2016 03:18:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Sep 2016 03:18:07 +0200
Message-Id: <cover.1474075036.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/1] Fix problem with devtool and BBCLASSEXTENDed recipes
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
X-List-Received-Date: Sat, 17 Sep 2016 01:18:12 -0000

Is no one using devtool with BBCLASSEXTENDed recipes? Because when I
tried that today I noticed that after having done "devtool modify -x
foo-native" the recipe would not rebuild after having changed the
source code (the way it does for non-native recipes).

As far as I can tell the problem is that externalsrc.bbclass sets
BB_DONT_CACHE inside an anonymous Python function after having checked
if EXTERNALSRC is set. However, for BBCLASSEXTENDed recipes
BB_DONT_CACHE needs to be set for the base recipe rather than the
current variant. Why this is, I have no idea.

First I thought of unconditionally setting BB_DONT_CACHE in the
externalsrc bbclass, but then I realized that people may be used to,
e.g., inherit externalsrc in their local.conf and that would
effectively cause every recipe to be reparsed every time bitbake is
executed...

Eventually I managed to implement a solution that seems to work and
only sets BB_DONT_CACHE as necessary. It may not be kosher as it looks
at overridden variants of EXTERNALSRC, but it was the best I could
come up with.

I know too little of the recipe parsing internals to be able to tell
whether the current behavior is working as intended or if it is a bug
that BB_DONT_CACHE must be set for the base recipe. I leave that for
someone more knowledgeable in the parsing internals to investigate.

//Peter

The following changes since commit 5414b80e8df11188d8e67a37185305c34ea084bd:

  bitbake: cooker: check if target contains task (2016-09-16 15:24:03 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/externalsrc_dont_cache
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/externalsrc_dont_cache

Peter Kjellerstedt (1):
  externalsrc.bbclass: Make reparsing work for BBCLASSEXTENDed recipes

 meta/classes/externalsrc.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
2.9.0


