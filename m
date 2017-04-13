Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id DE97477DFF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 49A422E5C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kh2DCdduOQE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 82A012E5B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A7E31E089
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F9851E083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 539FB32BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3DCU5vA016060
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:05 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3DCU51H016059
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Apr 2017 14:30:05 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 14:30:03 +0200
Message-Id: <cover.1492086566.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 0/1] Do not use command in profile
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
X-List-Received-Date: Thu, 13 Apr 2017 12:30:07 -0000

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

//Peter

The following changes since commit fe47bff64b17562593c620d2daf748735bb5c3d6:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10 (2017-04-13 10:54:37 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/profile_without_command
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/profile_without_command

Peter Kjellerstedt (1):
  base-files: profile: Avoid using "command" to determine if programs
    exist

 meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

-- 
2.12.0


