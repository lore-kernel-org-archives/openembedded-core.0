Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1A474D51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:45:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5D6jLuw026225
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:45:36 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 12 Jun 2018 23:45:10 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 14:12:52 +0800
Message-ID: <20180613061252.18271-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] goarch.bbclass: set SECURITY_CFLAGS for mips64
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
X-List-Received-Date: Wed, 13 Jun 2018 06:45:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When include conf/distro/include/security_flags.inc, NOPIE flags are
still required for MIPS64 target builds. Otherwise it fails to build
packages such as glide which inherit go.bbclass:

| .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/recipe-sysroot-native/usr/bin/mips64-wrs-linux/../../libexec/mips64-wrs-linux/
| gcc/mips64-wrs-linux/7.3.0/ld: .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/go-tmp/go-link-518447869/go.o:
| relocation R_MIPS_26 against `a local symbol' can not be used when making a shared object; recompile with -fPIC`

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/goarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index f54c5169e3e..5fd9f294a8a 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -36,6 +36,7 @@ COMPATIBLE_HOST_mipsarchn32 = "null"
 ARM_INSTRUCTION_SET = "arm"
 TUNE_CCARGS_remove = "-march=mips32r2"
 SECURITY_CFLAGS_mips = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_CFLAGS_mips64 = "${SECURITY_NOPIE_CFLAGS}"
 SECURITY_NOPIE_CFLAGS ??= ""
 
 def go_map_arch(a, d):
-- 
2.17.1


