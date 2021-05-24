Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.18571.1621827908714109930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 20:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14O3j78a001030
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 20:45:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 23 May 2021 20:45:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Sun, 23 May 2021 20:45:06 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] unfs3: correct configure option
Date: Mon, 24 May 2021 11:43:41 +0800
Message-ID: <20210524034341.24184-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

On some new distro like ubuntu21.04, unfs3-native compile failed with
error: undefined reference to `xdr_uint32', since new distro has new
glibc.

From glibc 2.27 rpc support is dropped, so unfs3 need to link to
libtirpc.

Here is defination of ac_link:
ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'

Depended library should be added into LIBS, not LDFLAGS, otherwise,
gcc may not load the lib since it is before conftest.$ac_ext during
configure. Finally, it results in compile failed.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/unfs3/unfs3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index a21fb58397..f9bae720cc 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -37,7 +37,7 @@ BBCLASSEXTEND = "native nativesdk"
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
 CFLAGS_append = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append = " -ltirpc"
+EXTRA_OECONF_append = " LIBS=-ltirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.17.1

