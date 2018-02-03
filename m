Return-Path: <takondra@cisco.com>
X-Greylist: delayed 564 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 03 Feb 2018 02:20:07 UTC
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	by mail.openembedded.org (Postfix) with ESMTP id 63D436FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=889; q=dns/txt; s=iport;
	t=1517624409; x=1518834009;
	h=from:to:cc:subject:date:message-id;
	bh=fgezdYe4Bax5ePyn/UemZTi8xqcX3VYCvm2KnzqUAWI=;
	b=SXLzsLtj/BBZNJ7rpU8y6mMp1LADCOaoVQfD6XEIiMyz9MMnfEpb6B/W
	z4uvSuYz+4WgRU7Zblw7WtlPh7j84aL2cJXo3yZMonYTvAV/DSwx1O8Vf
	87R41QDztf3cPBDygqhY/SSZI8+44/NwLdauckZxKcSOKBu6DhYm9D38a U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CtAQAwGXVa/49dJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNRgVYonDebYgqFO4I6WBQBAQEBAQEBAQJrKIYjgVGKKA24KYU?=
	=?us-ascii?q?Ag3qCBgEBCAImFIRVghWBV4Rgg2UEgjuFMAWTWpBKlXAClDACl0QCERkBgTw2I?=
	=?us-ascii?q?oFQcBWDA4UYIDeMLQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.46,452,1511827200"; d="scan'208";a="349527979"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
	by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2018 02:10:44 +0000
Received: from takondra-t460s.cisco.com ([10.156.154.6]) (authenticated bits=0)
	by rcdn-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id w132AhT6029143
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Sat, 3 Feb 2018 02:10:43 GMT
From: Taras Kondratiuk <takondra@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Feb 2018 18:10:43 -0800
Message-Id: <1517623843-1787-1-git-send-email-takondra@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] gcc: enable build-id in gcc-cross-initial
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
X-List-Received-Date: Sat, 03 Feb 2018 02:20:07 -0000

Normal gcc-cross has build-id feature enabled by default, so most of
target binaries has build-id. But libc (glibc, musl) doesn't have
build-id, because it is built with gcc-cross-initial.

Build-id is a useful feature, so enable it for gcc-cross-initial too.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index 724f9c32a06e..3a840a919cb0 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -116,6 +116,7 @@ EXTRA_OECONF_INITIAL = "\
     --with-system-zlib \
     --disable-lto \
     --disable-plugin \
+    --enable-linker-build-id \
     --enable-decimal-float=no \
     --without-isl \
     gcc_cv_libc_provides_ssp=yes \
-- 
2.7.4


