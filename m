Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFAB74E1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:52:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2qxYG022985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:52:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:52:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:54:46 +0800
Message-ID: <31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527214769.git.Qi.Chen@windriver.com>
References: <cover.1527214769.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildtools-tarball: add nativesdk-libnss-nis
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
X-List-Received-Date: Fri, 25 May 2018 02:52:58 -0000
Content-Type: text/plain

Recent glibc change removed libnss-nis module from glibc and a new
recipe libnss-nis.bb was added.

After this change, we need to make sure nativesdk-libnss-nis is also
included in buildtools-tarball, otherwise, we may encounter the following
error when using 'tar' command from buildtools-tarball.

  tar: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2: \
       symbol _nsl_default_nss version GLIBC_PRIVATE not defined \
       in file libnsl.so.1 with link time reference

This error occured on my ubuntu16.04 host with 'nis' configured in
/etc/nssswitch.conf.

So add nativesdk-libnss-nis to buildtools-tarball to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index d98a9c9..377733f 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-wget \
     nativesdk-ca-certificates \
     nativesdk-texinfo \
+    nativesdk-libnss-nis \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
1.9.1


