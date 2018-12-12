Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED2116C497
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 06:42:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBC6goAl012964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 22:42:51 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 22:42:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2018 14:59:57 +0800
Message-ID: <1243bc5ba3ff3acd1275d59a762f01c68f96a84e.1544597612.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544597612.git.liezhi.yang@windriver.com>
References: <cover.1544597612.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] apr/openssl10: Enable ccache for them
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
X-List-Received-Date: Wed, 12 Dec 2018 06:42:50 -0000
Content-Type: text/plain

They work well now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb | 3 ---
 meta/recipes-support/apr/apr_1.6.5.bb                 | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 6518dac..1986cf2 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -76,9 +76,6 @@ EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABL
 
 export OE_LDFLAGS = "${LDFLAGS}"
 
-# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
-CCACHE = ""
-
 TERMIO ?= "-DTERMIO"
 TERMIO_libc-musl = "-DTERMIOS"
 
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


