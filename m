Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA8DE7036A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:36:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FCZxrG011838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 05:35:59 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 05:35:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 20:35:44 +0800
Message-ID: <cover.1405427541.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V3 0/8] support xmlto
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
X-List-Received-Date: Tue, 15 Jul 2014 12:36:05 -0000
Content-Type: text/plain

Change in V3:
- The alsa-utils have a dependency on the docbook pieces it needs as
  well as xmlto-native.

Change in V2: 

- For alsa-utils/xorg-proto-common.inc/xorg-lib-common.inc/xserver-xorg.inc,
  add PACKAGECONFIG for xmlto and disable it by default rather than directly
  enable it. 

- EXTRA_OECONF has --without-catalog to instead of passing CFLAGS directly.

Test Steps:

1. vim local.conf
...
IMAGE_FEATURES += "ssh-server-dropbear"
PACKAGECONFIG_pn-alsa-utils = "xmlto"
IMAGE_INSTALL_append = " xmlto"
...

2. bitbake alsa-utils
If the build is ok, it means xmlto-native could work.

3. bitbake core-image-minimal

4. start qemu target and ssh the target

5. copy a manual source to target
   ssh tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml root@192.168.7.2:/home/root

6. on target
   root@qemux86:~# xmlto man alsactl_init.xml 
   Note: Writing alsactl_init.7

[YOCTO #2416]

//Hongxu

The following changes since commit 1dcdd877c7946be4c0b1203deb14e2f842f9d0c2:

  bitbake: toasterui: fix build - project identification (2014-07-14 14:10:03 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/support-xmlto
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/support-xmlto

Hongxu Jia (8):
  libxml2: enable catalog support
  docbook-xml: add docbook-xsl-stylesheets 1.78.1
  docbook-xml: add docbook-xml-dtd4
  xmlto: add version 0.0.25
  alsa-utils-native: add missing dep for xmlto
  xorg-proto-common.inc: add missing dep for xmlto
  xorg-lib-common.inc: add missing dep for xmlto
  xserver-xorg.inc: add missing dep for xmlto

 meta/conf/licenses.conf                            |   2 +-
 meta/files/common-licenses/XSL                     |  48 ++
 meta/recipes-core/libxml/libxml2.inc               |   8 +-
 .../docbook-xml/docbook-xml-dtd4/LICENSE-OASIS     |  16 +
 .../docbook-xml-update-catalog.xml.patch           | 515 +++++++++++++++++++++
 .../docbook-xml/docbook-xml-dtd4/docbook-xml.xml   |  68 +++
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |  64 +++
 .../docbook-xsl-stylesheets/docbook-xsl.xml        |   6 +
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |  67 +++
 meta/recipes-devtools/xmlto/files/catalog.xml      |  19 +
 ....in-drop-the-test-of-xmllint-and-xsltproc.patch |  30 ++
 .../xmlto-0.0.25/obsolete_automake_macros.patch    |  12 +
 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb        |  37 ++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |   2 +-
 .../xorg-proto/xorg-proto-common.inc               |   2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +-
 .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |   2 +-
 17 files changed, 891 insertions(+), 9 deletions(-)
 create mode 100644 meta/files/common-licenses/XSL
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
 create mode 100644 meta/recipes-devtools/xmlto/files/catalog.xml
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb

-- 
1.8.1.2


