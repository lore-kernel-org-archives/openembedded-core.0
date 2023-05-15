Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AB8C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 17:21:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.95469.1684171286961096494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 10:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=VUh9QYdd;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3C3AD846AF;
	Mon, 15 May 2023 19:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1684171285;
	bh=1zMJ0lVoOoqOmo+2wPi8ddd1YyUXd1zwpgqaGd1wyZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=VUh9QYddIOJa6A60dBPtPXfCcM+pIDkhGvDAPG781PquxIwM43P7u7E7V6Bb6QT84
	 pB/V4K9RSiKsvlPCIL93JUoh4QSHHS0I98Zhz9uy3/ehDSrmh7EelyftcBRnBIBCHJ
	 CpXcEW+4AiwJoFO4qCAURNqsDs7lU69EewJeajrNR95V1cysEpXNRSduW8b0DllVaV
	 mr0GR9VFLvJO/4O26Sijp8XHV/AJOKrJFybO7IfaAenWZmADtolTNjXv9raEWk9+Fx
	 FvDVeTZq/4aheuQyu0Hrl0P56jWhBw+J6N4+2z10KwVJPJ46dM4/2SV1cYIXLsSF/d
	 kkO3nZ1ndUaUA==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] cpio: Fix wrong CRC with ASCII CRC for large files
Date: Mon, 15 May 2023 19:21:21 +0200
Message-Id: <20230515172121.178629-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 17:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181267

Due to signedness, the checksum is not computed when filesize is bigger
a 2GB. Pick a fix for this problem from CPIO ML, where the fix has been
posted for 5 years. Since CPIO upstream is effectively unresponsive and
any and all attempts to communicate with the maintainer and get the fix
applied upstream failed, add the fix here instead.

(From OE-Core rev: bfff138af4bdd356ac66571e6ad91c1a5599b935)

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...g-CRC-with-ASCII-CRC-for-large-files.patch | 39 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-w=
ith-ASCII-CRC-for-large-files.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASC=
II-CRC-for-large-files.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-=
Wrong-CRC-with-ASCII-CRC-for-large-files.patch
new file mode 100644
index 0000000000..4b96e4316c
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-=
for-large-files.patch
@@ -0,0 +1,39 @@
+From 77ff5f1be394eb2c786df561ff37dde7f982ec76 Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Fri, 28 Jul 2017 13:20:52 +0200
+Subject: [PATCH] Wrong CRC with ASCII CRC for large files
+
+Due to signedness, the checksum is not computed when filesize is bigger
+a 2GB.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-cpio/=
2017-07/msg00004.html]
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+---
+ src/copyout.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/copyout.c b/src/copyout.c
+index 1f0987a..727aeca 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -34,13 +34,13 @@
+    compute and return a checksum for them.  */
+=20
+ static uint32_t
+-read_for_checksum (int in_file_des, int file_size, char *file_name)
++read_for_checksum (int in_file_des, unsigned int file_size, char *file_=
name)
+ {
+   uint32_t crc;
+   char buf[BUFSIZ];
+-  int bytes_left;
+-  int bytes_read;
+-  int i;
++  unsigned int bytes_left;
++  unsigned int bytes_read;
++  unsigned int i;
+=20
+   crc =3D 0;
+=20
+--=20
+2.7.4
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-exten=
ded/cpio/cpio_2.13.bb
index 7c8a465cd0..86527da744 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.p=
atch \
            file://0002-src-global.c-Remove-superfluous-declaration-of-pr=
ogr.patch \
            file://CVE-2021-38185.patch \
+           file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
            "
=20
 SRC_URI[md5sum] =3D "389c5452d667c23b5eceb206f5000810"
--=20
2.39.2


