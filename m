Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B99CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 12:07:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18063.1758024428375809718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 05:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD1641595
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:06:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F3083F673
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:07:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] bzip2: improve symlink creation
Date: Tue, 16 Sep 2025 13:07:03 +0100
Message-ID: <20250916120703.622865-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916120703.622865-1-ross.burton@arm.com>
References: <20250916120703.622865-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 12:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223545

This recipe inherits relative_symlinks as otherwise ${bindir}/bunzip2 is
an absolute link to ${bindir}/bzip2.  However, we drop the Makfile.am
into the tree so instead of working around the problem, we can just fix
the Makefile rules directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/bzip2/bzip2/Makefile.am | 12 ++++++------
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes=
-extended/bzip2/bzip2/Makefile.am
index d12d3a45e47..c0aed80ce62 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -60,12 +60,12 @@ install-ptest:
 	ln -s $(bindir)/bzip2		$(DESTDIR)/bzip2
=20
 install-exec-hook:
-	ln -s $(bindir)/bzip2$(EXEEXT) $(DESTDIR)$(bindir)/bunzip2$(EXEEXT)
-	ln -s $(bindir)/bzip2$(EXEEXT) $(DESTDIR)$(bindir)/bzcat$(EXEEXT)
-	ln -s $(bindir)/bzgrep$(EXEEXT) $(DESTDIR)$(bindir)/bzegrep$(EXEEXT)
-	ln -s $(bindir)/bzgrep$(EXEEXT) $(DESTDIR)$(bindir)/bzfgrep$(EXEEXT)
-	ln -s $(bindir)/bzmore$(EXEEXT) $(DESTDIR)$(bindir)/bzless$(EXEEXT)
-	ln -s $(bindir)/bzdiff$(EXEEXT) $(DESTDIR)$(bindir)/bzcmp$(EXEEXT)
+	ln -s bzip2$(EXEEXT) $(DESTDIR)$(bindir)/bunzip2$(EXEEXT)
+	ln -s bzip2$(EXEEXT) $(DESTDIR)$(bindir)/bzcat$(EXEEXT)
+	ln -s bzgrep$(EXEEXT) $(DESTDIR)$(bindir)/bzegrep$(EXEEXT)
+	ln -s bzgrep$(EXEEXT) $(DESTDIR)$(bindir)/bzfgrep$(EXEEXT)
+	ln -s bzmore$(EXEEXT) $(DESTDIR)$(bindir)/bzless$(EXEEXT)
+	ln -s bzdiff$(EXEEXT) $(DESTDIR)$(bindir)/bzcmp$(EXEEXT)
=20
 install-data-hook:
 	echo ".so man1/bzgrep.1" > $(DESTDIR)$(mandir)/man1/bzegrep.1
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-ex=
tended/bzip2/bzip2_1.0.8.bb
index 5b10821ccb0..9cecf6a331b 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -38,7 +38,7 @@ PACKAGES =3D+ "libbz2"
=20
 CFLAGS +=3D "-fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BI=
TS=3D64"
=20
-inherit autotools update-alternatives ptest relative_symlinks
+inherit autotools update-alternatives ptest
=20
 ALTERNATIVE_PRIORITY =3D "100"
 ALTERNATIVE:${PN} =3D "bunzip2 bzcat bzip2"
--=20
2.43.0


