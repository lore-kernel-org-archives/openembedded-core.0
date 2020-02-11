Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7915E60CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 15:08:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01BF81H4011263
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 07:08:11 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 11 Feb 2020 07:07:50 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2020 23:07:41 +0800
Message-ID: <20200211150741.2729-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] glibc-package.inc: fix multilib headers conflict
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
X-List-Received-Date: Tue, 11 Feb 2020 15:08:20 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Pass bits/endianness.h and bits/struct_rwlock.h to oe_multilib_header in
glibc-package.inc to fix files conflict:

| Error: Transaction check error:
|   file /usr/include/bits/endianness.h conflicts between attempted installs of lib32-libc6-dev-2.31-r0.armv7vet2hf_vfp and libc6-dev-2.31-r0.aarch64
|   file /usr/include/bits/struct_rwlock.h conflicts between attempted installs of lib32-libc6-dev-2.31-r0.armv7vet2hf_vfp and libc6-dev-2.31-r0.aarch64

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3aed7be4f8..285a9aa2f5 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -87,7 +87,7 @@ do_install() {
 		rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 	fi
 
-	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h
+	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h bits/endianness.h bits/struct_rwlock.h
 
 	if [ -f ${D}${bindir}/mtrace ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
-- 
2.17.1


