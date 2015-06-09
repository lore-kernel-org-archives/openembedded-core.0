Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 972F57579D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 09:04:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5994kKQ004226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 02:04:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 02:04:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 02:04:45 -0700
Message-ID: <3dad7b58e258a4fb34e78dc8a3145efe2525f6e2.1433840650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433840650.git.liezhi.yang@windriver.com>
References: <cover.1433840650.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libpostproc: fix installed-vs-shipped
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
X-List-Received-Date: Tue, 09 Jun 2015 09:04:47 -0000
Content-Type: text/plain

When MACHINE=qemux86-64 and enable multilib:
ERROR: QA Issue: libpostproc: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libpostproc.so.52.3.0
  /usr/lib/libpostproc.so
  /usr/lib/libpostproc.so.52
  /usr/lib/.debug
  /usr/lib/.debug/libpostproc.so.52.3.0
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/libav/libpostproc_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
index 88891db..4aaa50f 100644
--- a/meta/recipes-multimedia/libav/libpostproc_git.bb
+++ b/meta/recipes-multimedia/libav/libpostproc_git.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF = " \
     --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
     --extra-ldflags="${TARGET_LDFLAGS}" \
     --sysroot="${STAGING_DIR_TARGET}" \
+    --shlibdir="${libdir}" \
     ${EXTRA_FFCONF} \
 "
 
-- 
1.7.9.5


