Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.9458.1605627377733567004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: w0FLLwcfDOQsQ5c2i/csl8bRTeOfrypo+AY9ZcvA4WaPU2MzuYye4xUHaS8QgItN/4EliG3cAc
 +9vDE7klxI+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719946"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719946"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:16 -0800
IronPort-SDR: 5rL3SRWjK5Phqs6GPNwHxNc/3APwzxlhB1EI3HTuAKZc862kKhbQw4zbWzfOgXyCzIhJj6rYwn
 s0KNL6PQuEsw==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802926"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:15 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/19] gatesgarth review request
Date: Tue, 17 Nov 2020 23:35:49 +0800
Message-Id: <cover.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Next set of changes for gatesgarth. Please review.

Passed a-full on autobuilder except for one failure. Ping test failed
while executing do_testimage for sato image. 

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1602

I think this failure is not related to the changes here as the test passed
in other configurations. Probably similar to:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14029

Thanks,

Anuj

The following changes since commit a1db1e71129c3e67ddd9dbef21e1c5eb31552e00:

  grub: clean up CVE patches (2020-11-12 11:54:28 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Alexander Kanavin (2):
  clutter-gst-3.0: do not call out to host gstreamer plugin scanner
  conf-notes.txt: mention more important images than just sato

Bruce Ashfield (1):
  kernel: provide module.lds for out of tree builds in v5.10+

Denys Zagorui (1):
  binutils: reproducibility: reuse debug-prefix-map for stabs

Diego Santa Cruz (1):
  freetype: fix CVE-2020-15999, backport from 2.10.4

Gratian Crisan (1):
  kernel-module-split.bbclass: identify kernel modconf files as
    configuration files

Jose Quaresma (1):
  gstreamer1.0: warn the user when something is wrong with GstBufferPool

Khem Raj (2):
  lrzsz: Use Cross AR during compile
  gawk: Avoid using host ar during cross compile

Konrad Weihmann (3):
  oeqa/core/context: expose results as variable
  oeqa/core/context: initialize _run_end_time
  testimage: print results for interrupted runs

Mark Jonas (1):
  libbsd: Remove BSD-4-Clause from main package

Matt Madison (1):
  layer.conf: fix syntax error in PATH setting

Nathan Rossi (1):
  diffstat: add nativesdk to BBCLASSEXTEND

Richard Purdie (3):
  ptest-runner: Fix license as it contains 'or later' clause
  libdnf: Fix license as it contains 'or later' clause
  alsa-utils: Fix license to GPLv2 only

Steve Sakoman (1):
  openssh: whitelist CVE-2014-9278

 meta/classes/kernel-module-split.bbclass      |  1 +
 meta/classes/kernel.bbclass                   |  1 +
 meta/classes/testimage.bbclass                | 19 ++++---
 meta/conf/conf-notes.txt                      |  2 +
 meta/conf/layer.conf                          |  2 +-
 meta/lib/oeqa/core/context.py                 |  4 ++
 ...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 .../openssh/openssh_8.3p1.bb                  |  4 ++
 .../binutils/binutils-2.35.inc                |  1 +
 ...oducibility-for-stabs-debugging-data.patch | 35 +++++++++++++
 .../diffstat/diffstat_1.63.bb                 |  2 +
 meta/recipes-devtools/libdnf/libdnf_0.48.0.bb |  2 +-
 .../0001-Use-cross-AR-during-compile.patch    | 35 +++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.0.bb      |  1 +
 .../clutter/clutter-gst-3.0.inc               |  2 +
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.2.bb               |  1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  6 +++
 meta/recipes-multimedia/alsa/alsa-utils.inc   |  3 +-
 ...size-in-reset-when-maxsize-is-larger.patch | 49 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 meta/recipes-support/libbsd/libbsd_0.10.0.bb  |  3 +-
 .../ptest-runner/ptest-runner_2.4.0.bb        |  2 +-
 24 files changed, 251 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch

-- 
2.28.0

