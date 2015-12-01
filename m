Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9536011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:50:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 09:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5628171"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 09:50:55 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:38:58 +0000
Message-Id: <cover.1448961756.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCHv2 0/6] wic: Allow to user defined files as config for bootloaders
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
X-List-Received-Date: Tue, 01 Dec 2015 17:50:56 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These patches add a new option for the bootloaders. This new option allows
to use a custom configuration file as the bootloader config with the
"configfile" variable in the bootloader line. This is very useful when there
is need to create a multiboot image or when there is need to use scripting in
the bootloader.

Changes in v2

- Previous version just allowed the have the complete path for the file. Now
  it will search for the file in the canned-wks folders for all the layers
  that are part of the project.
- Include an example wks file in canned-wks folder.
- Include an example configuration in canned-wks folder.
- Include the changes in the documentation.
- Include test in self-test.


The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8728
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8728

Mariano Lopez (6):
  wic: Prepare wicboot to allow custom bootloader config
  wic/utils/misc.py: Added function to search for files in canned-wks
  wic: Allow to use a custom config for bootloaders
  wic/help.py: Document the new option "configfile"
  directdisk-bootloader-config.wks: Add example for custom bootloader
    config
  selftest/wic.py: Add test for custom bootloader config

 meta/lib/oeqa/selftest/wic.py                      |  8 +++
 .../canned-wks/directdisk-bootloader-config.cfg    | 11 ++++
 .../canned-wks/directdisk-bootloader-config.wks    | 10 +++
 scripts/lib/wic/help.py                            |  6 ++
 scripts/lib/wic/kickstart/__init__.py              |  7 +++
 .../lib/wic/kickstart/custom_commands/wicboot.py   |  5 ++
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 67 ++++++++++++++------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   | 72 +++++++++++++---------
 scripts/lib/wic/utils/misc.py                      | 39 ++++++++++++
 9 files changed, 179 insertions(+), 46 deletions(-)
 create mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
 create mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks

-- 
1.8.4.5


