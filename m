Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 032AB60796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 03:19:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8L3JZj1019568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 20 Sep 2017 20:19:35 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 20 Sep 2017 20:19:34 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anibal.limon@linux.intel.com>
Date: Thu, 21 Sep 2017 11:18:31 +0800
Message-ID: <1505963911-5187-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] ptest-runner: fix segfault with -t option
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
X-List-Received-Date: Thu, 21 Sep 2017 03:19:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The ptest-runner would segfault with -t option:
root@qemux86-64:~# ptest-runner -d /usr/lib test_pkg -t 5
[  237.234112] ptest-runner[810]: segfault at 0 ip 000000382e638060 sp
00007fff9130f400 error 4 in libc-2.26.so[382e600000+1a7000]

It is safe to bump SRCREV to latest upstream commit to fix this issue
because there is only one commit since the last update:

  commit 8a93832dad621535e90aa8e1fb74ae5ba743fc3e
  Author: Anders Wallin <wallinux@gmail.com>
  Date:   Sun May 28 11:47:00 2017 +0200

      timeout option missing the argument option ":" to getopt

      ptest-runner -t xx gives segfault

      Signed-off-by: Anders Wallin <wallinux@gmail.com>
      Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
index 89d709a..71c1dab 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "78afe246fb8cb864656c16dd5d1cfa5721ccc8b7"
+SRCREV = "8a93832dad621535e90aa8e1fb74ae5ba743fc3e"
 PV = "2.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
-- 
2.7.4


