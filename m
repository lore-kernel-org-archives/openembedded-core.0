Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3010CD1A61E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9661.1767964304816451787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5D7FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DA473F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] gdbm: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:30 +0000
Message-ID: <20260109131130.3006446-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229116

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gdbm/files/ptest.patch | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-s=
upport/gdbm/files/ptest.patch
index 5f4078101b..96196f63b6 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -28,7 +28,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index eb071ac..9d14fe8 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -150,3 +150,15 @@
+@@ -150,3 +150,11 @@
  t_wordwrap_LDADD =3D ../tools/libgdbmapp.a @LTLIBINTL@
 =20
  SUBDIRS =3D dejagnu
@@ -38,9 +38,5 @@ index eb071ac..9d14fe8 100644
 +install-ptest: $(check_PROGRAMS) $(TESTSUITE)
 +	@$(INSTALL) -d $(DESTDIR)
 +	@for file in $^; do \
-+		if [ -x .libs/$$file ]; then \
-+			$(INSTALL_PROGRAM) .libs/$$file $(DESTDIR)/$$file; \
-+		else \
-+			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
-+ 		fi \
++			$(LIBTOOL) --mode=3Dinstall $(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +	done
--=20
2.43.0


