Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABA1D716CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 06:59:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3M6xETV011617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 23:59:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 23:59:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Apr 2015 23:59:13 -0700
Message-ID: <146b31370d8aa4a9b695ef0985001b127e252bb6.1429685908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429685908.git.liezhi.yang@windriver.com>
References: <cover.1429685908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libunwind: don't use gold for mips
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
X-List-Received-Date: Wed, 22 Apr 2015 06:59:14 -0000
Content-Type: text/plain

The gold doesn't work for mips or mips64:
configure:3867: checking whether the C compiler works
configure:3889: mips-poky-linux-gcc  -meb -mabi=32 -mhard-float -march=mips32r2 --sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemumips  -O2 -pipe -g -feliminate-unused-debug-types   -Wl,-O1  -Wl,--as-needed  -fuse-ld=gold conftest.c  >&5
collect2: fatal error: cannot find 'ld'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libunwind/libunwind.inc |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index c4a7b5e..406bbe4 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -23,7 +23,14 @@ LIBATOMICS_armv5 = "-latomic_ops"
 LIBATOMICS_armv4 = "-latomic_ops"
 LIBATOMICS ?= ""
 
-LDFLAGS_append = " -fuse-ld=gold"
+LDFLAGS_append_x86 = " -fuse-ld=gold"
+LDFLAGS_append_x86-64 = " -fuse-ld=gold"
+
+LDFLAGS_append_arm = " -fuse-ld=gold"
+LDFLAGS_append_aarch64 = " -fuse-ld=gold"
+
+LDFLAGS_append_powerpc = " -fuse-ld=gold"
+LDFLAGS_append_powerpc64 = " -fuse-ld=gold"
 
 DEPENDS += "${DEPLIBATOMICS}"
 DEPLIBATOMICS_armv5 = "libatomics-ops"
-- 
1.7.9.5


