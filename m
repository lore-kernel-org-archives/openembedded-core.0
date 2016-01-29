Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36A567680B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:36:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0THa14s023695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 29 Jan 2016 09:36:02 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 09:36:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jan 2016 12:35:53 -0500
Message-ID: <cover.1454088695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3 0/5]use target path to replace build ones in debugging info
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
X-List-Received-Date: Fri, 29 Jan 2016 17:36:06 -0000
Content-Type: text/plain

Changed in V3:
- Move entry from base.bbclass to bitbake.conf
- Do not immediate expand SELECTED_OPTIMIZATION

Changed in V2:
- Do not use '-gno-record-gcc-switches' to leave gcc switches in;

- Add gcc option '-gno-record-debug-prefix-map' to not record
  '-fdebug-prefix-map' to gcc command line switches in DWARF
  DW_AT_producer;

Test Steps:

vim local.conf
...
MACHINE ?= "qemux86-64"
WARN_QA += "buildpaths"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
...

bitbake -k world

It fixed buildpath QA warning of 169 recipes (previously 236, currently 67) 
These newly added options does not work on native.(Which TARGET_CFLAGS
have been overrided in native.bbclass)

When do the world build, mkelfimage compile failed which
triggered by the newly added gcc option.

//Hongxu

The following changes since commit 3d2c0f5902cacf9d8544bf263b51ef0dd1a7218c:

  cmake: update to 3.4.2 (2016-01-26 22:49:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (5):
  base/bbclass: use target path as compile dir in debugging info
  gcc-5.3.inc/base.bbclass: add gcc option to not record
    -fdebug-prefix-map to debugging info
  mkelfimage: fix target cflags leaks to host
  glibc.inc: do not immediate expand SELECTED_OPTIMIZATION
  systemtap_git.inc: do not immediate expand SELECTED_OPTIMIZATION

 meta/conf/bitbake.conf                             | 10 +++-
 meta/recipes-core/glibc/glibc.inc                  | 22 +++-----
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
 ...48-add-option-gno-record-debug-prefix-map.patch | 65 ++++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  4 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    | 12 ++--
 6 files changed, 91 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record-debug-prefix-map.patch

-- 
1.9.1


