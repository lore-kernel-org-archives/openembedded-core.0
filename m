Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF2B73D38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E995TQ009794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:09:03 -0700
Message-ID: <bce94b28fccf3695bb222d39e1e8c93bacafd572.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] libunwind: fix build with aarch64
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:05 -0000
Content-Type: text/plain

Referred to RP's fix for x86 and x86-64:
34d517a5626ce2465f776367349bd9e66bf8ed1f
libunwind: Build with gold to avoid build failures

Fixed:
aarch64-poky-linux/4.9.2/ld: copy reloc against protected `_Uaarch64_local_addr_space' is invalid
aarch64-poky-linux/4.9.2/ld: failed to set dynamic section sizes: Bad value
aarch64-poky-linux/4.9.2/ld: copy reloc against protected `_Uaarch64_local_addr_space' is invalid
aarch64-poky-linux/4.9.2/ld: failed to set dynamic section sizes: Bad value
| collect2: error: ld returned 1 exit status

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libunwind/libunwind.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 74afba1..56905c2 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -26,6 +26,8 @@ LIBATOMICS ?= ""
 LDFLAGS_append_x86 = " -fuse-ld=gold"
 LDFLAGS_append_x86-64 = " -fuse-ld=gold"
 
+LDFLAGS_append_aarch64 = " -fuse-ld=gold"
+
 DEPENDS += "${DEPLIBATOMICS}"
 DEPLIBATOMICS_armv5 = "libatomics-ops"
 DEPLIBATOMICS_armv4 = "libatomics-ops"
-- 
1.7.9.5


