Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2063C75391
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 731A41852B;
	Fri, 11 May 2018 00:21:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PNLjto1ruuyH; Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D7C2318378;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B39D61E077;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6C4F1E06E;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 993362DB2;
	Fri, 11 May 2018 00:21:46 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4AMLdf6026287;
	Fri, 11 May 2018 00:21:39 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4AMLddq026286;
	Fri, 11 May 2018 00:21:39 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 00:20:40 +0200
Message-Id: <cover.1525990692.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 0/2] Restore performance of rpm in Docker containers
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
X-List-Received-Date: Thu, 10 May 2018 22:21:49 -0000

As recently discussed on the Yocto list in the "ROOTFS_RPM_DEBUG 
undocumented" thread, there are performance issues with dnf/rpm 
when building in a Docker container. The problem is due to the 
Docker container reporting the maximum number of open files as 
unlimited and there is code in rpm that loops over all potentially 
open file descriptors. Alexander Kanavin supplied a patch for rpm 
(see commit 6f1822e5 in meta) that was supposed to correct this, but 
unfortunately it only solved a part of the problem.

To really solve the problem, I reverted Alexander's patch, and 
applied a new one that solves both the problematic code identified 
by Alexander, and an identical code path in another function.

It is possible to reproduce the problem without Docker by increasing 
the maximum number of open files. This can be done by editing 
/etc/security/limits.conf and adding:

* - nofile  100000000

where 100000000 is the maximum number of open files. It is also 
very likely that you need to increase the global limit by running:

sudo sysctl -w fs.nr_open=100000000

After that, ssh to localhost to get a new session where the new 
settings are active. Then you can use `ulimit -n <number>` to set 
the max you want to try.

I also did som measurements when building core-image-minimal. Here 
are the times I got for the do_rootfs task with different maximums:

Max files  Time 
---------  -----
1024       30 seconds
1048576    50 seconds
10000000   3 minutes 40 seconds
100000000  31 minutes

//Peter

The following changes since commit f4c938c47424424b89cde2269bd92cebc9a6ac1a:

  packagegroup: Do not add libssp to SDK (2018-05-09 10:47:51 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/rpm-performance

Peter Kjellerstedt (2):
  Revert "rpm: add a patch to help with Docker performance issues"
  rpm: Assume a max limit of 1024 open files

 ...001-Assume-a-max-limit-of-1024-open-files.patch | 61 ++++++++++++++++++++++
 ...FD_CLOEXEC-on-opened-files-before-exec-fr.patch | 49 -----------------
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  3 +-
 3 files changed, 63 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Assume-a-max-limit-of-1024-open-files.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch

-- 
2.12.0


