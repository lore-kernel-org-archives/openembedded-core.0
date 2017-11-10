Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 877A071B2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAADMgR9012120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:42 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:00 +0800
Message-ID: <cover.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/23] Fixes for multilib and eSDK
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit f706448952c942d25ea96cda09a700d2c5c63520:

  maintainers.inc: add Otavio Salvador for go-dep (2017-11-09 12:33:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/multilib_sdk
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/multilib_sdk

Robert Yang (23):
  staging.bbclass: make subprocess.check_output() capture stderr
  testsdk.bbclass: add a newline after own-mirrors
  populate_sdk_ext.bbclass: don't rename layers when failed
  oe/copy_buildsystem.py: make sure layer exists
  staging.bbclass: fix for multilib
  populate_sdk_ext.bbclass: fix for multilib
  sstate.bbclass: sstate_hardcode_path(): fix for multilib
  staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
  staging.bbclass: print searched manifest when not found
  staging.bbclass: extend_recipe_sysroot(): search multilib manifest
  image.bbclass: remove depmodwrapper-cross from DEPENDS
  package_manager.py: print running dnf command
  package_manager.py: reverse archs correctly
  package_manager.py: remove obsolete MULTILIB_ARCHS
  multilib.bbclass: remove unneeded bb.data.inherits_class()
  multilib.bbclass: remove obsolete DEFAULTTUNE_ML_
  multilib.bbclass: remove invalid PACKAGE_INSTALL
  multilib_global.bbclass: fix indent
  volatile-binds: use PN to replace hardcode name
  multilib.bbclass: extend allarch recipes
  toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
    image
  populate_sdk_ext.bbclass: disable for multilib image
  populate_sdk_ext.bbclass: remove the try...finally

 meta/classes/allarch.bbclass                       |   3 -
 meta/classes/image.bbclass                         |   2 +-
 meta/classes/multilib.bbclass                      |   8 -
 meta/classes/multilib_global.bbclass               |   6 +-
 meta/classes/package.bbclass                       |   9 --
 meta/classes/populate_sdk_ext.bbclass              | 161 +++++++++++++--------
 meta/classes/sstate.bbclass                        |   6 +-
 meta/classes/staging.bbclass                       |  46 +++++-
 meta/classes/testsdk.bbclass                       |   5 +-
 meta/classes/toolchain-scripts.bbclass             |   6 +
 meta/lib/oe/copy_buildsystem.py                    |   2 +-
 meta/lib/oe/package_manager.py                     |  55 ++++++-
 meta/recipes-core/volatile-binds/volatile-binds.bb |   2 +-
 13 files changed, 207 insertions(+), 104 deletions(-)

-- 
2.7.4


