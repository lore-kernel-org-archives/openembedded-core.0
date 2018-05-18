Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4B18745ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 16:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 42BD8184DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sOZKLYk_TXwU
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7ECD7184CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 697381E080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D1501E07E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:44 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:44 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 508F4304B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:44 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4IGtaPD026990
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 18:55:36 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4IGtaho026989
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2018 18:55:36 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 18:55:32 +0200
Message-Id: <cover.1526662447.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3 0/1] Do not use command in profile
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
X-List-Received-Date: Fri, 18 May 2018 16:55:45 -0000

Since we apparently cannot rely on the command utility to always
exist, it is better to avoid using it in the profile script. Rather
than using command to detect if tty and resize exist (which obviously
will not work if command itself does not exist), just call them
directly while piping any output for stderr to /dev/null. This should
actually be a little bit more efficient in the case that they do
exist, and the same in the case that they do not exist.

I leave to you to decide whether you want to revert commit e41c90b852
that enabled the command utility in busybox or not.

PATCHv2: Correct a typo in the commit message

PATCHv3: Run resize twice, once to determine if it exists, and once to
actually do the resize.

//Peter

The following changes since commit 13cc30cd7de4841990b600e83e1249c81a5171dd:

  local.conf.sample.extended: Drop obsolete rpc and libnsl (2018-05-15 11:07:50 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/profile_without_command

Peter Kjellerstedt (1):
  base-files: profile: Avoid using "command" to determine if programs
    exist

 meta/recipes-core/base-files/base-files/profile | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.12.0


