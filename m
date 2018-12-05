Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8D197458A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 13:01:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB5D1F4i002601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 05:01:26 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Dec 2018 05:01:05 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 08:00:53 -0500
Message-ID: <cover.1544014163.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/3] Fix issue when locale related distro features missing
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
X-List-Received-Date: Wed, 05 Dec 2018 13:01:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The original problem is when distro features libc-charsets libc-locale-code and
libc-locales are missing, it has installed-vs-shipped qa issue. Then fix for
image and other packages depends on glibc locale packages too.

Build image and sdk for qemux86 and qemuarm64 with and without in local.conf:

DISTRO_FEATURES_remove = "libc-charsets libc-locales libc-locale-code"


The following changes since commit 016e3dda2d6acc9b457079d11b5346a5352a431d:

  btrfs-tools: update to 4.19 (2018-12-03 12:20:01 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/glibc-locale
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/glibc-locale

Kai Kang (3):
  glibc-locale: fix installed-vs-shipped qa issue
  image.bbclass: respect PACKAGE_NO_GCONV
  packages: respect PACKAGE_NO_GCONV

 meta/classes/image.bbclass                    |  5 +++++
 meta/classes/libc-package.bbclass             |  4 +---
 meta/conf/distro/include/tclibc-glibc.inc     |  2 +-
 meta/recipes-core/glib-2.0/glib.inc           |  4 +++-
 meta/recipes-core/glibc/glibc-locale.inc      | 15 +++++++++------
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |  4 +++-
 meta/recipes-devtools/mtools/mtools_4.0.19.bb |  4 +++-
 7 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.19.0.rc2


