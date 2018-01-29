Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27C37783FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:01:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 04:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,429,1511856000"; d="scan'208";a="13895494"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2018 04:01:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:01:27 +0200
Message-Id: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH 0/7] Fix first boot deferral and postinst error reporting
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
X-List-Received-Date: Mon, 29 Jan 2018 12:01:36 -0000

This patchset is aiming to fix long-standing problems with package post-installation
scriptlets:

1) The way to defer them to first boot is to issue 'exit 1'. On the other hand,
'exit 1' is also the way to indicate an error in the script. The patches decouple
these two things.

2) Scriptlets should be executed using '-e', otherwise failing commands in
the middle of the scriptlet will not be reported as such.

3) The patchset also adds a convenient shortcut for deferring scriptlets to
first boot execution:

pkg_postinst_ontarget_PACKAGENAME() {
      # Actions to carry out on the device go here
      ....
}

The following changes since commit 0c537554fc2cf58a9cbfeaf39ed918c607483dce:

  testimage: enable gi test suite (2018-01-29 10:31:58 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/dnf-rpm4-postinst-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4-postinst-fix

Alexander Kanavin (7):
  postinst_intercepts: add a delay_to_first_boot hook
  meta/lib/oe/rootfs.py: separate first boot deferral logic into a
    separate function
  meta/lib/oe/rootfs.py: do not execute defer_to_first_boot when
    processing postinst_intercept hooks
  package.bbclass: add support for pkg_postinst_ontarget()
  meta/lib/oe/package_manager.py: deprecate 'exit 1' as a way to defer
    to first boot
  package_rpm.bbclass: run pre/post installation scriptlets using sh -e
  rootfs.py: change the notice about deferring scripts to first boot
    from warning to a note

 .../recipes-test/postinst/postinst_1.0.bb          | 14 ++------
 meta/classes/package.bbclass                       | 20 +++++++++++
 meta/classes/package_rpm.bbclass                   |  8 ++---
 meta/lib/oe/package_manager.py                     |  3 ++
 meta/lib/oe/rootfs.py                              | 39 +++++++++++++---------
 scripts/postinst-intercepts/delay_to_first_boot    |  2 ++
 6 files changed, 54 insertions(+), 32 deletions(-)
 create mode 100644 scripts/postinst-intercepts/delay_to_first_boot

-- 
2.15.1


