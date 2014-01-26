Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 730356E81B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 09:14:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q9EEtG017993
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 01:14:15 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 26 Jan 2014 01:14:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 17:14:54 +0800
Message-ID: <d544ed5c83c54473a856b38d6c62163412affe06.1390727631.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1390727631.git.liezhi.yang@windriver.com>
References: <cover.1390727631.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mdadm: fix build on qemumips64
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
X-List-Received-Date: Sun, 26 Jan 2014 09:14:14 -0000
Content-Type: text/plain

The mips64 uses long long for u64 in the kernel, but powerpc's asm/types.h
prevents 64-bit userland from seeing this definition, instead defaulting to u64
== long in userspace. Define __SANE_USERSPACE_TYPES__ to get int-ll64.h
included.

We had a similar fix on ppc64, use it for mips64 will fix the problem.

[YOCTO #5758]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_3.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
index cfb9ccd..596b04d 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -25,11 +25,12 @@ do_configure_prepend () {
 }
 
 EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
-# PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
+# PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
 # prevents 64-bit userland from seeing this definition, instead defaulting
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
 # int-ll64.h included
 EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
+EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
 	oe_runmake
-- 
1.8.3.1


