Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B409077ED2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 15:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DEF95181DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DFIn0PpMP21q
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1823118114
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F28751E09B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:04 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E687E1E099
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:04 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:04 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id DAF9A2222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:04 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3SF14ER012819
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:04 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3SF14Gs012818
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Apr 2017 17:01:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 17:01:00 +0200
Message-Id: <cover.1493391620.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/2] Handle the hossttools directory when restoring from the sstate cache
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
X-List-Received-Date: Fri, 28 Apr 2017 15:01:08 -0000

After the introduction of copying host tools to the build directory
and cleaning out $PATH, we got a problem with one of our tools. It
turned out that its configure.ac uses AC_PATH_PROG(PERL, perl) to
locate the perl interpreter, and uses that on the shebang line of the
installed tool. Previously it found /usr/bin/perl and used that, but
now it will find ${TMPDIR}/hosttools/perl and use that instead, which
means that if the tool is restored from the sstate cache in another
build directory than where it originated from, the path will be wrong.

These two patches adds a new variable (HOSTTOOLS_DIR) for the
${TMPDIR}/hosttools directory, and then makes sure it is handled by
the staging code so that any references to its value are properly
corrected when restoring from the sstate cache.

//Peter

The following changes since commit 7a0e795373653886452a7a2992ced10080711c26:

  build-appliance-image: Update to master head revision (2017-04-21 08:22:18 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/hosttools_dir
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/hosttools_dir

Peter Kjellerstedt (2):
  bitbake.conf: Add HOSTTOOLS_DIR for ${TMPDIR}/hosttools
  sstate.bbclass, staging.bbclass: Handle HOSTTOOLS_DIR when restoring
    state

 meta/classes/base.bbclass                           | 4 ++--
 meta/classes/sstate.bbclass                         | 2 +-
 meta/classes/staging.bbclass                        | 2 +-
 meta/conf/bitbake.conf                              | 3 +++
 meta/conf/layer.conf                                | 2 +-
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 2 +-
 6 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.12.0


