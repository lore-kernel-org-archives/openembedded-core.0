Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9775.1793273915010602350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.151 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [RFC PATCH 2/4] musl: wrap the bits headers for multilib
Date: Thu, 29 Oct 2026 20:38:27 +0900
Message-ID: <20261029113829.2806167-3-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029113829.2806167-1-mark.yang@lge.com>
References: <20261029113829.2806167-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248937
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Pass every installed bits/*.h through oe_multilib_header, as
glibc-package.inc does for the glibc ones.

Unlike glibc, musl keeps all of its arch headers in bits/. Which of
them differ depends on the arch pair and the musl release, so all of
them are wrapped instead of keeping a list.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-core/musl/musl_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index c81178c15a..b6ab5806b5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 require musl.inc
-inherit linuxloader
+inherit linuxloader multilib_header
 
 SRCREV = "c4e1bb3994c14ed5112c894d15a451bf00f0d501"
 
@@ -68,6 +68,13 @@ do_install() {
         echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	ln -rs ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	musl_multilib_bits
+}
+
+musl_multilib_bits () {
+	for h in ${D}${includedir}/bits/*.h; do
+		oe_multilib_header bits/${h##*/}
+	done
 }
 
 FILES:${PN} += "${nonarch_base_libdir}/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path"
