Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 490447FCB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:03:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302860"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:03:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 826F04CE2E6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:48 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:03:01 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:03:06 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:52 -0800
Message-ID: <1579523214-47426-10-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 826F04CE2E6B.A29BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libtirpc: upgrade 1.1.4 -> 1.2.5
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
X-List-Received-Date: Mon, 20 Jan 2020 09:03:02 -0000
Content-Type: text/plain

Refresh the following patch:
musl.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/libtirpc/libtirpc/musl.patch    | 11 -----------
 .../libtirpc/{libtirpc_1.1.4.bb => libtirpc_1.2.5.bb} |  4 ++--
 2 files changed, 2 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.1.4.bb => libtirpc_1.2.5.bb} (86%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/musl.patch b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
index 21cd9f9588..f9ad35a852 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/musl.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
@@ -6,17 +6,6 @@ bits/endian.h is not supposed to be included directly
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- a/tirpc/rpc/types.h
-+++ b/tirpc/rpc/types.h
-@@ -66,7 +66,7 @@ typedef   int32_t rpc_inline_t;
- #define mem_free(ptr, bsize)	free(ptr)
- 
- 
--#if defined __APPLE_CC__ || defined __FreeBSD__
-+#if defined __APPLE_CC__ || defined __FreeBSD__ || !defined(__GLIBC__)
- # define __u_char_defined
- # define __daddr_t_defined
- #endif
 --- a/src/xdr_float.c
 +++ b/src/xdr_float.c
 @@ -83,7 +83,7 @@ static struct sgl_limits {
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
similarity index 86%
rename from meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
index 53ed5e81f7..035787c3f8 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[md5sum] = "f5d2a623e9dfbd818d2f3f3a4a878e3a"
-SRC_URI[sha256sum] = "2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d"
+SRC_URI[md5sum] = "688787ddff7c6a92ef15ae3f5dc4dfa1"
+SRC_URI[sha256sum] = "f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca"
 
 inherit autotools pkgconfig
 
-- 
2.17.1




