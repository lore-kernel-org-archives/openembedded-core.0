Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7F11571CB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 21:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 3E3BA2E288
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zyQRb0oNl1Jh
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 7A10C2E285
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67C701A07D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CFB01A07C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5171F27E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v43LDfax021758
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 May 2017 23:13:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v43LDfbP021757
	for openembedded-core@lists.openembedded.org;
	Wed, 3 May 2017 23:13:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 23:13:37 +0200
Message-Id: <cover.1493845632.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/2] Handle the sysroots-components dir when restoring from the sstate cache
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
X-List-Received-Date: Wed, 03 May 2017 21:13:41 -0000

Similar to the problem with the hosttools directory and the state
cache that was recently fixed, there is another problem with the
sysroots-components directory. This only affects postinst-useradd
scripts, so in this case the fix can be activated from useradd.bbclass
rather than sstate.bbclass and thus affects a lot less recipes.

//Peter

The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/components_dir
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/components_dir

Peter Kjellerstedt (2):
  bitbake.conf: Add COMPONENTS_DIR for ${STAGING_DIR}-components
  useradd.bbclass: Handle COMPONENTS_DIR when restoring state

 meta/classes/native.bbclass                     | 2 +-
 meta/classes/staging.bbclass                    | 8 ++++----
 meta/classes/useradd.bbclass                    | 5 +++++
 meta/conf/bitbake.conf                          | 3 ++-
 meta/lib/oeqa/selftest/devtool.py               | 2 +-
 meta/recipes-core/glibc/glibc-locale.inc        | 2 +-
 meta/recipes-core/glibc/glibc-mtrace.inc        | 2 +-
 meta/recipes-core/glibc/glibc-package.inc       | 4 ++--
 meta/recipes-core/glibc/glibc-scripts.inc       | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc        | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc         | 4 ++--
 meta/recipes-devtools/guile/guile_2.0.14.bb     | 4 ++--
 13 files changed, 24 insertions(+), 18 deletions(-)

-- 
2.12.0


