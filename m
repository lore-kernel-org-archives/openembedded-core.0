Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A95766D98E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 08:17:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAP8HDRA019002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 00:17:13 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Mon, 25 Nov 2013 00:17:14 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2013 16:17:07 +0800
Message-ID: <8d9e0c1697a9e56ca71e45d00df863ae0f63bcf5.1385367202.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385367202.git.kai.kang@windriver.com>
References: <cover.1385367202.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/1] x264: install libraries to right directory when enable multilib
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
X-List-Received-Date: Mon, 25 Nov 2013 08:17:14 -0000
Content-Type: text/plain

x264 use [EPREFIX/lib] as default libdir. When multlib is enabled that
is not right. Packages depends on x264 such as libav configure fails
that can't find library x264.

Pass the right libdir to configure script to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 295818a..406df30 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -25,6 +25,7 @@ X264_DISABLE_ASM_armv5 = "--disable-asm"
 
 EXTRA_OECONF = '--prefix=${prefix} \
                 --host=${HOST_SYS} \
+                --libdir=${libdir} \
                 --cross-prefix=${TARGET_PREFIX} \
                 --sysroot=${STAGING_DIR_TARGET} \
                 --enable-shared \
-- 
1.8.1.2


