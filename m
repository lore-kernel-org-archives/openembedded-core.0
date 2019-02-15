Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C75377C64E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:06:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F26he7001011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 18:06:43 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 18:06:42 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Feb 2019 21:06:34 -0500
Message-ID: <cover.1550195817.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/4] Update default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Fri, 15 Feb 2019 02:06:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* add -fmacro-prefix-map rather than -ffile-prefix-map that the latter one
  could not be recognized by assembly compiler which causes buildpatchs issue for glibc
* other fix for openssl and libidn2

Build core-image-sato for qemux86, qemux86-64 and (qemuarm + musl).
oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_build PASS.

$ oe-selftest --skip-tests distrodata.Distrodata.test_checkpkg buildoptions.SourceMirroring.test_yocto_source_mirror -j 15
2 selftest cases failed but seems not realated with my patches.
2019-02-14 05:05:28,054 - oe-selftest - INFO - RESULTS - containerimage.ContainerImageTests.test_expected_files - Testcase 1619: FAILED (483.52s)
2019-02-14 05:05:28,054 - oe-selftest - INFO - RESULTS - distrodata.Distrodata.test_checkpkg - Testcase 1902: FAILED (177.51s)

The following changes since commit 5fa3b5b15229babc9f96606c79436ab83651bf83:

  bitbake: bitbake: cookerdata: Check duplicated BBFILE_COLLECTIONS (2019-02-14 11:21:58 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/prefix-map
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/prefix-map

Kai Kang (4):
  bitbake.conf: update DEBUG_PREFIX_MAP with -fmacro-prefix-map
  go-cross-canadian: set default value of DEBUG_PREFIX_MAP
  libidn2: fix buildpaths qa warning
  openssl: update patch to fix buildpaths qa issue for
    -fmacro-prefix-map

 meta/conf/bitbake.conf                                    | 3 ++-
 ...dinfo-strip-sysroot-and-debug-prefix-map-from-co.patch | 8 +++++++-
 meta/recipes-devtools/go/go-cross-canadian.inc            | 8 ++++++++
 meta/recipes-extended/libidn/libidn2_2.0.5.bb             | 4 ++++
 4 files changed, 21 insertions(+), 2 deletions(-)

--
2.20.0


