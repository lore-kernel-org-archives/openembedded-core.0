Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 490CD6FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6DA361834B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id z4s80YN2QKgD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C8CF318305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1C7B1E140
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6C541E13E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9B06420E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1SDZKHV019106
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1SDZK4A019105
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 14:35:20 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 14:35:15 +0100
Message-Id: <cover.1488288835.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/4] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Tue, 28 Feb 2017 13:35:21 -0000

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

//Peter

The following changes since commit 3c83b56309ab419f8cda72c0711479f60f61439a:

  bitbake: fetch2/svn: change 'rsh' parameter to 'ssh' (2017-02-23 12:50:17 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/dummy_tools
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/dummy_tools

Peter Kjellerstedt (4):
  linux-libc-headers: Add inherit of pkgconfig
  scripts/dbus-binding-tool: Add a dummy version that always fails
  scripts/gdbus-codegen: Add a dummy version that always fails
  scripts/pkg-config: Add a dummy version that always fails

 .../linux-libc-headers/linux-libc-headers.inc            |  2 +-
 scripts/dbus-binding-tool                                | 11 +++++++++++
 scripts/gdbus-codegen                                    | 11 +++++++++++
 scripts/pkg-config                                       | 16 ++++++++++++++++
 4 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100755 scripts/dbus-binding-tool
 create mode 100755 scripts/gdbus-codegen
 create mode 100755 scripts/pkg-config

-- 
2.9.0


