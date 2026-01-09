Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A00FD1A628
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9659.1767964303464390883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4454FFEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3ACE3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] parted: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:28 +0000
Message-ID: <20260109131130.3006446-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229114

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/parted/parted_3.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-ex=
tended/parted/parted_3.6.bb
index 6fc2cb3b3a..8f703d162f 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -45,8 +45,8 @@ do_install_ptest() {
 	    -e "s|^Makefile:.*|Makefile:|g" \
 	    -e "/^BUILDINFO.*$/d" \
 	    -i $t/tests/Makefile
-	for i in print-align print-max print-flags dup-clobber duplicate fs-res=
ize; \
-	  do cp ${B}/tests/.libs/$i $t/tests/; \
+	for i in print-align print-max print-flags dup-clobber duplicate fs-res=
ize; do
+		${B}/libtool --mode=3Dinstall install ${B}/tests/$i $t/tests/
 	done
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
--=20
2.43.0


