Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A310AC433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 02:30:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.5009.1642905031441589251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 18:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=LImoRbfI;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 788D0810EC;
	Sun, 23 Jan 2022 03:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642905028;
	bh=4W0TalHgw4tyvfPkm3AIDPliUth6EufKJFU9uD2Jfew=;
	h=From:To:Cc:Subject:Date:From;
	b=LImoRbfIy7ucLN5G9kjwC4tl/ocEzL/SBV+S/G3wmA8YAbekI4cJEsB4VxX+KNAol
	 oUsTBOt8JmHJFyj6xX0UyDJYZ6VYrl9MIPqj+3slxqW9NKDTT5UknzxODupRow8pP3
	 Kks5cVjyrnG9Brh0q9VjT3u5eX61330sco+SUGgGIDuw+v6qs/cl8vf7JtQomBQ1MF
	 MTD3ghQ8Pf1DLW5WBi3g81prxVIYzHOJxYkL+d7Mi74iYofPO0mtsk2L1zP6ODCpGS
	 PurN7hQz79RV4cRR6OS5kWWK9/4v6XtgFMf7zk/WdXtmH6OfWNgb8pYwDfJcE34do0
	 xH9f0B8iGz3/g==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] [dunfell] binutils: Backport Include members in the variable
 table used when resolving DW_AT_specification tags.
Date: Sun, 23 Jan 2022 03:30:05 +0100
Message-Id: <20220123023005.212994-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 02:30:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160861

Backport binutils upstream patch fixing sporadic link errors in c++ code.
This triggers at least on arm32 and aarch64 with qt5 based applications.

The ChangeLog part of the patch as well as space change is omitted.

Binutils bug report for this problem is here:
https://sourceware.org/bugzilla/show_bug.cgi?id=3D26520

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...in-the-variable-table-used-when-reso.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Include-=
members-in-the-variable-table-used-when-reso.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/reci=
pes-devtools/binutils/binutils-2.34.inc
index 6104bec591..903b9d7b01 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -42,6 +42,7 @@ SRC_URI =3D "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-binutils-drop-redundant-program_name-definition-fno-.pa=
tch \
+     file://0018-Include-members-in-the-variable-table-used-when-reso.pa=
tch \
      file://CVE-2020-0551.patch \
      file://0001-gas-improve-reproducibility-for-stabs-debugging-data.pa=
tch \
      file://CVE-2020-16592.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0018-Include-members=
-in-the-variable-table-used-when-reso.patch b/meta/recipes-devtools/binut=
ils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.pa=
tch
new file mode 100644
index 0000000000..dc1e09d46b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the=
-variable-table-used-when-reso.patch
@@ -0,0 +1,32 @@
+From bf2252dca8c76e4c1f1c2dbf98dab7ffc9f5e5af Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Sat, 29 Aug 2020 08:03:15 +0100
+Subject: [PATCH] Include members in the variable table used when resolvi=
ng
+ DW_AT_specification tags.
+
+	PR 26520
+	* dwarf2.c (scan_unit_for_symbols): Add member entries to the
+	variable table.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3De6f04d55f681149a69102a73937d0987719c3f16]
+---
+ bfd/dwarf2.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index dd3568a8532..ef2f6a3c63c 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -3248,7 +3248,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
+       else
+ 	{
+ 	  func =3D NULL;
+-	  if (abbrev->tag =3D=3D DW_TAG_variable)
++	  if (abbrev->tag =3D=3D DW_TAG_variable
++	      || abbrev->tag =3D=3D DW_TAG_member)
+ 	    {
+ 	      bfd_size_type amt =3D sizeof (struct varinfo);
+ 	      var =3D (struct varinfo *) bfd_zalloc (abfd, amt);
+--=20
+2.34.1
+
--=20
2.34.1


