Return-Path: <juro.bystricky@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 698DD74854
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 19:57:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 12:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,416,1517904000"; d="scan'208";a="32203431"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga006.jf.intel.com with ESMTP; 06 Apr 2018 12:57:09 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 12:57:20 -0700
Message-Id: <1523044641-56994-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] python-xcbgen: improve reproducibility
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
X-List-Received-Date: Fri, 06 Apr 2018 19:57:09 -0000

This patch addresses the last remaining non-reproducible package for
core-image-minimal (with current "sumo").

A short explanation:
When building core-image-minimal in two different folders with current "sumo"
(http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=sumo ) :

$ source oe-build-env build_1
local.conf:
PACKAGE_CLASSES="package_deb package_rpm package_ipk"
MACHINE="qemux86-64"
$ bitbake core-image-minimal

and

$ source oe-build-env build_2

local.conf:
PACKAGE_CLASSES="package_deb package_rpm package_ipk"
MACHINE="qemux86-64"

$ bitbake core-image-minimal

After binary comparing all packages in build_1/tmp/deploy/[ipk,rpm.deb] to
build_2/tmp/deploy/[ipk,rpm,deb], we get these results:

           IPK   DEB  RPM
Same:         0    0    0
Different: 3952 3952 3952
Total:     3952 3952 3952

Repeating the same with (same host):

$ source oe-build-env build_repro_1
local.conf:
PACKAGE_CLASSES="package_deb package_rpm package_ipk"
MACHINE="qemux86-64"
INHERIT+="reproducible_build"
$ bitbake core-image-minimal

and

$ source oe-build-env build_repro_2

local.conf:
PACKAGE_CLASSES="package_deb package_rpm package_ipk"
MACHINE="qemux86-64"
INHERIT+="reproducible_build"

$ bitbake core-image-minimal

After binary comparing all packages in build_repro_1/tmp/deploy/[ipk,rpm.deb] to
build_repro_2/tmp/deploy/[ipk,rpm,deb], we get these results:

           IPK   DEB  RPM
Same:      3951 3951 3951
Different:    1    1    1
Total:     3952 3952 3952

The remaining package that does not build reproducibly is python-xcbgen.
This is because the package contains .pyc files which contain build-time timestamps.
The python files are compiled with host Python3, which may or may not support
SOURCE_DATE_EPOCH. However, both oe-core python-native and python3-native do support
SOURCE_DATE_EPOCH, so to build the package reproducibly all we need to do is
compile the python files with python3-native. Ideally, we would use python3-native
unconditionally, but building python3-native itself can be computationally quite expensive.
So, as a compromise, we use python3-native only when BUILD_REPRODUCIBLE_BINARIES = '1'
host Python3 otherwise.


Juro Bystricky (1):
  python-xcbgen_1.12: improve reproducibility

 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.7.4


