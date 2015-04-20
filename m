Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33C0771EC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:05:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K85ZwM029226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:05:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:05:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:05:34 -0700
Message-ID: <2014020bb14ab84e8d6d50a83c1de4e0d559dac9.1429517108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517108.git.liezhi.yang@windriver.com>
References: <cover.1429517108.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libunwind: use gold for all archs
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
X-List-Received-Date: Mon, 20 Apr 2015 08:05:35 -0000
Content-Type: text/plain

At least the following boards have build errors without using gold:
qemux86, qemux86-64, qemuarm, qemuaarch64, qemuppc.

The error is:
ld: copy reloc against protected `_Uaarch64_local_addr_space' is invalid
ld: failed to set dynamic section sizes: Bad value
ld: copy reloc against protected `_Uaarch64_local_addr_space' is invalid
ld: failed to set dynamic section sizes: Bad value
| collect2: error: ld returned 1 exit status

So use gold for all archs to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libunwind/libunwind.inc |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 56905c2..c4a7b5e 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -23,10 +23,7 @@ LIBATOMICS_armv5 = "-latomic_ops"
 LIBATOMICS_armv4 = "-latomic_ops"
 LIBATOMICS ?= ""
 
-LDFLAGS_append_x86 = " -fuse-ld=gold"
-LDFLAGS_append_x86-64 = " -fuse-ld=gold"
-
-LDFLAGS_append_aarch64 = " -fuse-ld=gold"
+LDFLAGS_append = " -fuse-ld=gold"
 
 DEPENDS += "${DEPLIBATOMICS}"
 DEPLIBATOMICS_armv5 = "libatomics-ops"
-- 
1.7.9.5


