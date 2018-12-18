Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2307A7BFF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:02:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI71uOk014100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:02:06 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:01:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:10 +0800
Message-ID: <169e1a6600cd3d00b4691e6bc76532ed207ba009.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 10/11] apr/openssl10: Enable ccache for them
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
X-List-Received-Date: Tue, 18 Dec 2018 07:02:15 -0000
Content-Type: text/plain

They work well now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb | 3 ---
 meta/recipes-support/apr/apr_1.6.5.bb                 | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 9d67053..809634f 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -76,9 +76,6 @@ EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABL
 
 export OE_LDFLAGS = "${LDFLAGS}"
 
-# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
-CCACHE = ""
-
 TERMIO ?= "-DTERMIO"
 TERMIO_libc-musl = "-DTERMIOS"
 EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-support/apr/apr_1.6.5.bb
index c2f5900..432e4ed 100644
--- a/meta/recipes-support/apr/apr_1.6.5.bb
+++ b/meta/recipes-support/apr/apr_1.6.5.bb
@@ -37,11 +37,6 @@ CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sct
 CACHED_CONFIGUREVARS += "ac_cv_sizeof_struct_iovec=yes"
 CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
 
-# Otherwise libtool fails to compile apr-utils
-# x86_64-linux-libtool: compile: unable to infer tagged configuration
-# x86_64-linux-libtool:   error: specify a tag with '--tag'
-CCACHE = ""
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-- 
2.7.4


