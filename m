Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mr-0001mQ-Tc
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DnKF020462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:49 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:49 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:06 -0500
Message-ID: <cover.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/12] Multilib, duplicate deps, and misc cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2012 00:26:46 -0000
Content-Type: text/plain

The patch set (01-03) implementes SDK multilib support.  This was tested by
building core-image-minimal and core-image-sato w/ the -c populate_sdk task.

The patch (04) removes unintentional duplicate entries from the various
dependency variables.  This works along side a related bitbake patch.  Even
if the bitbake patch is not accepted, this is still useful as it resolves
some potential failures with deps changing behavior.  This was tested with
buildhistory -- there were NO changes in the produced files.

The patch (05) fixes an issue with the deb and ipk implementation.  Use
of '<' and '>' is deprecated, with '<<' and '>>' replacing them -- meaning
greater then and less then.  ('<' and '>' mean greater then or equal and 
less then or equal -- which is counter intuitive.)

The patch (06) basic cleanup.  Remove duplicate dependencies, behavior
verified by using buildhistory.

The patch (07) cleans up the old usage for checking for target packages,
PN == BPN.  This unfortunately does not work with multilib packages.  New
CLASSOVERRIDE == class-target is used instead.  This resolves a number of
minor issues when building packages with multilibs enabled.  Verified by
using buildhistory -- only expected changes occured.  (lib32 on x86_64)

The patch (08) fixes a defect, when multilibs are enabled, with kernel and
kernel related packages.  The STAGING_DIR_KERNEL was set, using := before all
of the pieces had their final values -- move this to a bbclass to ensure that
the full configuration is loaded.

The patch set (09-12) implement a number of minor RPM fixes.  12 is a 
workaround for a BerkleyDB problem.  It is intentional that the workaround
still display errors to the end user to make it clear the workaround is being
used.

The following changes since commit d83e218dc480a09befddf8b934d774519cdbacb5:

  xserver-xorg: Remove RCONFLICTS against xserver-xorg (2012-09-28 15:16:52 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/dep_cleanup
  http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/dep_cleanup

Mark Hatle (12):
  multilib: Add support for cross-canadian multilib packages
  multilib - crosssdk: Stop building multilib for crosssdk packages
  populate_sdk_base: Update extraction script for multilibs
  bb.utils.explode_dep_versions: Update to ensure we avoid duplicate
    deps
  package_deb/ipk: Remap < and > to << and >>
  libxcb: Update DEPENDS to avoid duplicate entries
  Cleanup: fix PN == BPN cases
  multilib: Move redefinition of STAGING_DIR_KERNEL
  rpm-native: Fix 'uuid_rc_t' undeclared error when compiling
  rpm: Fix file contention issue
  rpm: Add rpm patch to fix git_strerror issues
  rpm: Implement workaround for DB_BUFFER_SMALL error

 meta/classes/base.bbclass                          |   43 ++++++++++-
 meta/classes/distutils-base.bbclass                |    2 +-
 meta/classes/insane.bbclass                        |   55 ++++++++++++++-
 meta/classes/kernel.bbclass                        |   20 +++--
 meta/classes/libc-common.bbclass                   |   13 +++-
 meta/classes/multilib.bbclass                      |   22 +++++--
 meta/classes/package.bbclass                       |   20 ++++-
 meta/classes/package_deb.bbclass                   |   18 +++++
 meta/classes/package_ipk.bbclass                   |   18 +++++
 meta/classes/package_rpm.bbclass                   |   61 +++++++++-------
 meta/classes/populate_sdk_base.bbclass             |    5 +-
 meta/conf/multilib.conf                            |    1 -
 meta/lib/oe/classextend.py                         |    4 +-
 meta/recipes-core/ncurses/ncurses.inc              |    6 +-
 .../rpm/rpm/makefile-am-exec-hook.patch            |   31 ++++++++
 .../rpm/rpm/rpm-db_buffer_small.patch              |   77 ++++++++++++++++++++
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        |   60 +++++++++++++++
 .../rpm/rpm/rpm-uuid-include.patch                 |   35 +++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    6 ++-
 meta/recipes-extended/pigz/pigz.inc                |    4 +-
 meta/recipes-graphics/xcb/libxcb.inc               |    2 +-
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb         |    2 -
 meta/recipes-graphics/xcb/libxcb_1.8.1.bb          |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb            |    2 -
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    4 +-
 25 files changed, 441 insertions(+), 72 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch

-- 
1.7.3.4



