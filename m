Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 171BE771F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 15:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 218072E3D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id pzExtwTzd4VR
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 6378E2E13A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43A7E1A0AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38ACB1A0AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2CD91341
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u8FFinCV014678
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u8FFinLv014677
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2016 17:44:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 17:44:46 +0200
Message-Id: <cover.1473954220.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/1] Avoid race in perform_groupmems()
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
X-List-Received-Date: Thu, 15 Sep 2016 15:50:18 -0000

We have seen sporadic failures in our CI builds due to useradd,
groupadd or groupmems failing. I have now tracked it down to
perform_groupmems() in useradd_base.bbclass, where I found code to
temporarily create the /etc/gshadow file in the sysroot if it did not
exist. Purportedly this was due to groupmems requiring the gshadow
file to exist. There are, however, no real evidence of that
requirement, and actually creating and removing the file the way it is
currently done WILL cause failures when one task removes it while
another task expects it to already exist.

//Peter

The following changes since commit 53b1fa2d3e1244c46a705d9a40ca0dbee92eab98:

  bitbake: build: Allow dirs/cleandirs to work for empty functions (2016-09-15 12:15:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/groupmems
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/groupmems

Peter Kjellerstedt (1):
  useradd_base.bbclass: Do not mess with the gshadow file in the sysroot

 meta/classes/useradd_base.bbclass | 12 ------------
 1 file changed, 12 deletions(-)

-- 
2.9.0


