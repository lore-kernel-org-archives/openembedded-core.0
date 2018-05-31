Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3ACC746BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 07:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5374D18416
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Ch7dA8M8hoHI
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8B9A8182C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 732BF1E07B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 678C51E07A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 5BCBB226C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:39 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4V7gUXA031040
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:42:30 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4V7gUrf031039
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2018 09:42:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 09:42:26 +0200
Message-Id: <cover.1527752449.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 0/2] Restore performance to rpm in Docker containers
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
X-List-Received-Date: Thu, 31 May 2018 07:42:40 -0000

A couple of weeks ago I sent the first version of this patch series to
restore performance to rpm when building in a Docker container. That
solution was not accepted, but after discussions with Alexander
Kanavin and upstream, a proper solution has now been integrated to the
Git repository for rpm.

This is the backport of the patches that went into the rpm repository
to fix the performance problem.

//Peter

The following changes since commit 719d068bde55ef29a3468bc0779d4cb0c11e8c1d:

  bitbake: fetch2: fix import error for Python 3.6.5 (2018-05-29 21:07:46 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/rpm-performance

Peter Kjellerstedt (2):
  Revert "rpm: add a patch to help with Docker performance issues"
  rpm: Restore performance in Docker containers

 ...0001-Factor-out-and-unify-setting-CLOEXEC.patch | 148 +++++++++++++++++++++
 ...FD_CLOEXEC-on-opened-files-before-exec-fr.patch |  49 -------
 .../files/0002-Optimize-rpmSetCloseOnExec.patch    | 100 ++++++++++++++
 .../0003-rpmSetCloseOnExec-use-getrlimit.patch     |  53 ++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |   4 +-
 5 files changed, 304 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch

-- 
2.12.0


