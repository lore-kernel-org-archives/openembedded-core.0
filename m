Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8E877723
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 5A2E12E1E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xebwGTLAhFBq
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 4A0192E08D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 357FF1A05F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A7F91A05D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 0CF752E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v23Ld4CC028139
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 22:39:04 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v23Ld4e6028114
	for openembedded-core@lists.openembedded.org;
	Fri, 3 Mar 2017 22:39:04 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 22:38:57 +0100
Message-Id: <cover.1488577082.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCHv4 0/6] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Fri, 03 Mar 2017 21:39:09 -0000

After the introduction of RSS, I still found it hard to get
dependencies on some common tools that are typically installed on the
build host correct. Using the wrong version of tools like pkg-config,
gdbus-codegen and dbus-binding-tool can cause build failures.

To circumvent this, I created dummy versions of the tools that always
fail and placed them in the scripts directory. Thus, if the real tool
has not been installed in the RSS, the dummy version is used and the
build fails. For good measures I even output a message that says what
needs to be corrected in the recipe.

Included is also an update to linux-libc-headers as it apparently
needs to inherit pkgconfig, which the introduction of the dummy
version of pkg-config showed.

PATCHv2: Also inherit pkgconfig in module.bbclass since pkg-config
is needed for the make_scripts task.

PATCHv3: Add a missing Signed-off-by footer.

PATCHv4: Move the dummy scripts to scripts/blacklisted and add it to
PATH in bitbake.conf.

//Peter

The following changes since commit 2e5181e510f3fffee53cfeab0380e8ad9b5ae60c:

  testsdk: Fix lockfile patch (2017-03-03 12:21:09 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/dummy_tools
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/dummy_tools

Peter Kjellerstedt (6):
  module.bbclass: Add inherit of pkgconfig
  linux-libc-headers: Add inherit of pkgconfig
  blacklisted/dbus-binding-tool: Add a dummy version that always fails
  blacklisted/gdbus-codegen: Add a dummy version that always fails
  blacklisted/pkg-config: Add a dummy version that always fails
  bitbake.conf: Add ${COREBASE}/scripts/blacklisted to ${PATH}

 meta/classes/module.bbclass                              |  2 +-
 meta/conf/bitbake.conf                                   |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc            |  2 +-
 scripts/blacklisted/dbus-binding-tool                    | 11 +++++++++++
 scripts/blacklisted/gdbus-codegen                        | 11 +++++++++++
 scripts/blacklisted/pkg-config                           | 16 ++++++++++++++++
 6 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100755 scripts/blacklisted/dbus-binding-tool
 create mode 100755 scripts/blacklisted/gdbus-codegen
 create mode 100755 scripts/blacklisted/pkg-config

-- 
2.9.0


