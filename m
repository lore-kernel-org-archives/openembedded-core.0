Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 378E76E27B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:11:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2R8BSt3016877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 01:11:28 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 01:11:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 04:11:21 -0400
Message-ID: <3014f530e9325ab02716c011ac135da25fbd0846.1395906475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395906475.git.liezhi.yang@windriver.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] gnu-efi: fix the LIBDIR
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
X-List-Received-Date: Thu, 27 Mar 2014 08:11:28 -0000
Content-Type: text/plain

Its LIBDIR in Makefile is:

LIBDIR = $(PREFIX)/lib

This is incorrect for 64 bit bsp, thus will cause build failures on gummiboot:

ld: cannot open linker script file /path/to/usr/lib64/elf_x86_64_efi.lds: No such file or directory

[YOCTO #6053]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
index 0dbdba2..dbf2a07 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
@@ -23,7 +23,7 @@ def gnu_efi_arch(d):
     return tarch
 
 EXTRA_OEMAKE = "'ARCH=${@gnu_efi_arch(d)}' 'CC=${CC}' 'AS=${AS}' 'LD=${LD}' 'AR=${AR}' \
-                'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}'\
+                'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}' 'LIBDIR=${libdir}' \
                 "
 
 do_install() {
-- 
1.7.10.4


