Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 1455A6D197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:53:24 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2C3EC220479;
	Wed, 28 Nov 2018 17:53:24 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:53:08 +1300
Message-Id: <20181128045316.24102-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/8] ptest: Strip build host paths from any installed Makefile
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
X-List-Received-Date: Wed, 28 Nov 2018 04:53:25 -0000

PTEST_BUILD_HOST_FILES

A common pattern for ptest is to install a Makefile that provides a make check
target. These generated Makefiles are normally full of build host paths, to
hosttools, and to files and scripts within the source or build tree. They also
commonly include the CFLAGS and CPPFLAGS. None of these build host paths
can possibly work on-target, so stripping them has no effect on the success of
the resulting ptests.

PTEST_BUILD_HOST_FILES is a whitespace-separated list of filenames within the
PTEST_PATH that should have build host paths stripped from them at
do_install_ptest_base time. It defaults to "Makefile".

PTEST_BUILD_HOST_PATTERN

Several packages install Makefiles or other build host
configuration files for ptest so that they can run `make check`, for instance.
These build host files commonly include paths and versions of build host tools,
(eg. rpm or perl) whose presence and version depends on the build host distro.

PTEST_BUILD_HOST_PATTERN is an extended regex pattern used to 
optionally strip lines from installed PTEST_BUILD_HOST_FILES.

Douglas Royds (8):
  ptest: Reproducibility: Strip build host paths from any installed Makefile
  ptest: Optionally strip build host tool info from installed files
  openssl ptest: Strip build host paths from configdata.pm
  openssl: Strip perl version from installed ptest configdata.pm file
  acl: Use install instead of cp
  acl: Strip build host tool details from installed ptest file
  attr: Strip build host paths and tool versions from ptest files
  strace: Strip build host tool details from installed ptest Makefile

 meta/classes/ptest.bbclass                    | 18 ++++++++++++++++
 .../openssl/openssl_1.1.1a.bb                 |  2 ++
 meta/recipes-devtools/strace/strace_4.25.bb   | 11 +---------
 meta/recipes-support/attr/acl_2.2.52.bb       | 21 ++++++++-----------
 meta/recipes-support/attr/attr.inc            |  9 +++-----
 5 files changed, 33 insertions(+), 28 deletions(-)

-- 
2.17.1


