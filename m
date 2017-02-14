Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75CC971E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 07:02:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1E72T0T028285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 23:02:29 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 23:02:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 14 Feb 2017 02:02:20 -0500
Message-ID: <247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1487055395.git.hongxu.jia@windriver.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ncurses: fix beaglebone do_configure failure
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
X-List-Received-Date: Tue, 14 Feb 2017 07:02:29 -0000
Content-Type: text/plain

In configure, the option ${HOST_CC_ARCH} was removed from ${CC}:
---------------
|configure:2188: WARNING: your environment misuses the CC variable
to hold CFLAGS/CPPFLAGS options
|configure:2284: testing resulting CC: 'arm-poky-linux-gnueabi-gcc
--sysroot=tmp/work/cortexa8hf-neon-poky-linux-gnueabi/ncurses/
6.0+20161126-r0/recipe-sysroot'
---------------

While arm compiling, option "-mfloat-abi=hard" in ${HOST_CC_ARCH}
lost that caused the failure:
---------------
|tmp/work/cortexa8hf-neon-poky-linux-gnueabi/ncurses/6.0+20161126-r0/
recipe-sysroot/usr/include/gnu/stubs.h:7:29: fatal error:
gnu/stubs-soft.h: No such file or directory
| # include <gnu/stubs-soft.h>
---------------

Append ${HOST_CC_ARCH} to ${CFLAGS} could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/ncurses/ncurses_6.0+20161126.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
index 7328e78..af75044 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
@@ -8,3 +8,5 @@ SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+
+CFLAGS += "${HOST_CC_ARCH}"
-- 
2.8.1


