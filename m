Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 835846011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 14:47:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0SElmY5027807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jan 2016 06:47:48 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 06:47:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 28 Jan 2016 09:47:42 -0500
Message-ID: <cover.1453991989.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 0/3]use target path to replace build ones in debugging info
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
X-List-Received-Date: Thu, 28 Jan 2016 14:47:52 -0000
Content-Type: text/plain

The fix on gcc is quick and simple, almost has no side effect.
Another ides is add new option to do path substitutions on
gcc switches(just refer what '-fdebug-prefix-map=OLD=NEW' did),
but it needs more modification and more risks introduced.

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

It fixed buidpath QA warning of 142 recipes (before 236, after 94) 
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

Hongxu Jia (3):
  base/bbclass: use target path as compile dir in debugging info
  gcc-5.3.inc/base.bbclass: add gcc option to not record
    -fdebug-prefix-map to debugging info
  mkelfimage: fix target cflags leaks to host

 meta/classes/base.bbclass                          | 19 +++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
 ...48-add-option-gno-record-debug-prefix-map.patch | 65 ++++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  4 +-
 4 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record-debug-prefix-map.patch

-- 
1.9.1


