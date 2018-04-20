Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB6DD746D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:06:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3K96DvY016660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 02:06:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 20 Apr 2018 02:06:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 17:07:34 +0800
Message-ID: <6a9bfc198b802e4c0e72ee73b7aa5ff491b4e1cc.1524215181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1524215181.git.Qi.Chen@windriver.com>
References: <cover.1524215181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: use oe_multilib_header on bits/floatn.h
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
X-List-Received-Date: Fri, 20 Apr 2018 09:06:13 -0000
Content-Type: text/plain

When building SDK via populate_sdk for qemuarm64 with multilib
enabled, we would have conflict about bits/floatn.h at populate_sdk
time.

  file /usr/include/bits/floatn.h conflicts between attempted ins
talls of libc6-dev-2.27-r0.aarch64 and lib32-libc6-dev-2.27-r0.armv7vehf_vfp

Apply oe_multilib_header on this header file to fix the problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ff45dfe..728bc53 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -66,7 +66,7 @@ do_install_append () {
 		rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 	fi
 
-	oe_multilib_header bits/syscall.h bits/long-double.h
+	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h
 
 	if [ -f ${D}${bindir}/mtrace ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
-- 
1.9.1


