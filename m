Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BD9B66072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:05:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 28 Jul 2016 07:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1004213942"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2016 07:05:23 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0FF2A6A4006;
	Thu, 28 Jul 2016 07:05:10 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:30 +0300
Message-Id: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [krogoth] [PATCH 00/12] fix checkuri failures for krogoth
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
X-List-Received-Date: Thu, 28 Jul 2016 14:05:23 -0000

Recipes that use DEBIAN_MIRROR in SRC_URI are setting themselves up for failure
as the Debian mirror network only stores active releases, so once a version we
use isn't in oldstable/stable/testing/unstable then it will be removed.

The solution here is to use the snapshot.debian.org service for the SRC_URI,
and set UPSTREAM_CHECK_URI to the relevant pool directory on DEBIAN_MIRRORS.
This way we get a stable SRC_URI but still have new upstream release checking.

Fixes:
 [YOCTO #10005]
 [YOCTO #10040]

The following changes since commit  e67395419dcb1142ae6dd4348736a2720d2ebe9d:

  nss: fix build for gcc-6 (2016-07-17 11:37:23 -0700)

are available in the git repository at:

    git://git.yoctoproject.org/poky-contrib maxin/krogoth-next
    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=maxin/krogoth-next

Maxin B. John (10):
  apmd: use snapshot.debian.org for SRC_URI
  ossp-uuid: use snapshot.debian.org for SRC_URI
  serf: use snapshot.debian.org for SRC_URI
  netbase: use snapshot.debian.org for SRC_URI
  docbook-xml-dtd4: use snapshot.debian.org for SRC_URI
  linuxdoc-tools: use snapshot.debian.org for SRC_URI
  blktool: use snapshot.debian.org for SRC_URI
  libaio: use snapshot.debian.org for SRC_URI
  mailx: use snapshot.debian.org for SRC_URI
  libproxy: use snapshot.debian.org for SRC_URI

Tim Orling (2):
  dpkg: use snapshot.debian.org for SRC_URI
  at: use snapshot.debian.org for SRC_URI

 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb                               | 3 ++-
 meta/recipes-core/netbase/netbase_5.3.bb                             | 3 ++-
 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb            | 4 +++-
 meta/recipes-devtools/dpkg/dpkg.inc                                  | 4 ++--
 meta/recipes-devtools/dpkg/dpkg_1.18.4.bb                            | 5 +++--
 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 3 ++-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb                   | 3 ++-
 meta/recipes-extended/at/at_3.1.18.bb                                | 4 +++-
 meta/recipes-extended/blktool/blktool_4-7.bb                         | 3 ++-
 meta/recipes-extended/libaio/libaio_0.3.110.bb                       | 4 +++-
 meta/recipes-extended/mailx/mailx_12.5-5.bb                          | 3 ++-
 meta/recipes-support/libproxy/libproxy_0.4.11.bb                     | 4 +++-
 meta/recipes-support/serf/serf_1.3.8.bb                              | 4 +++-
 13 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.4.0


