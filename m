Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE0F070738
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:24:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6O86f000963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:24:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:24:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:24:01 -0700
Message-ID: <cover.1408342506.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7] fix rdepends for main pkgs
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
X-List-Received-Date: Mon, 18 Aug 2014 06:24:09 -0000
Content-Type: text/plain

These patches fix the rdepends for the main (which means not -dev or
-misc) pkgs, it may affect the size of the image when you use ipk or
deb, but has no impact on rpm, for example, if you install xmlto to
image, bash will also be installed for package_ipk and package_deb now
(package_rpm will always install it).

I think that we do need these fixes to make the ipk/deb work well, feel
free to let me know if we need split any of the files in to a package,
for example, split perl scripts into  pn-misc package, and let pn-misc
rdepend on perl to avoid affecting the main package.

// Robert

The following changes since commit d0be4b37743492fc9c178fd6f9ef73a5eb2fd9c3:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/main
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/main

Robert Yang (7):
  bitbake.conf: add bash-native to ASSUME_PROVIDED
  libtool: add bash to RDEPENDS_libtool
  pax-utils: add bash to RDEPENDS_pax-utils
  kconfig-frontends: add bash to RDEPENDS_kconfig-frontends
  xmlto: add bash to RDEPENDS_xmlto
  apt: add bash to RDEPENDS_apt
  pm-utils: add bash to RDEPENDS_pm-utils

 meta/conf/bitbake.conf                             |    3 ++-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    2 +-
 meta/recipes-devtools/apt/apt_0.9.9.4.bb           |    2 +-
 .../kconfig-frontends_3.12.0.0.bb                  |    2 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    2 ++
 .../libtool/libtool-cross_2.4.2.bb                 |    2 --
 .../libtool/libtool-native_2.4.2.bb                |    2 --
 meta/recipes-devtools/libtool/libtool_2.4.2.bb     |    2 ++
 .../libtool/nativesdk-libtool_2.4.2.bb             |    2 --
 meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb |    2 ++
 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb        |    3 ++-
 11 files changed, 13 insertions(+), 11 deletions(-)

-- 
1.7.9.5


