Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDF1D1A61D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9654.1767964298586936782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FBA21684
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF7EF3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] gnutls: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:21 +0000
Message-ID: <20260109131130.3006446-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229107

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.11.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.11.bb
index 6c979430cd..5b44c66dfc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
@@ -71,7 +71,7 @@ do_compile_ptest() {
 do_install:append:class-target() {
         if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false'=
, d)}; then
           install -d ${D}${bindir}/bin
-          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
+          ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/lib/fipshma=
c ${D}/${bindir}/
         fi
 }
=20
--=20
2.43.0


