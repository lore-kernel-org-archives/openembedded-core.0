Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.34129.1595234272325847004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 01:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@agner.ch header.s=dkim header.b=tzL/qfpP;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from trochilidae.toradex.int (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 1F55D5C0103;
	Mon, 20 Jul 2020 10:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1595234268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:in-reply-to:
	 references; bh=LeAL6Bru+AWZMEx6AkJy2GdZw0mu9tyNPUYUkuLvIDw=;
	b=tzL/qfpPQ1dAODLRalMq4LNJLtoTM3/l8w8DF6rGNd8SsKobk0qNDs1OY6QG9ipZ6WBlhu
	0JQKlZP4IMdaaYwxAAhBscojLvYjP46KJRPTI1teUL9l3/+GKjToq0ajSGjLO1YL/2BfV3
	Oglc74f9W6DR1aR5yoGuuxqsMmo1CUU=
From: "Stefan Agner" <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org,
	seebs@seebs.net
Cc: ross.burton@intel.com,
	stefan@agner.ch
Subject: [PATCH v2] Handle OFD lock flags
Date: Mon, 20 Jul 2020 10:37:43 +0200
Message-Id: <20200720083743.12097-1-stefan@agner.ch>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linux 3.15 and newer introduced new open file description locks.
Currently pseudo prints a warning if fcntl is used with OFD locks:
  unknown fcntl argument 37, assuming long argument.

However, calls to fcntl with a OFC lock set need a struct flock
pointer. Treat F_OFD_GETLK (and friends) like F_GETLK (and friends).

This issue has been observed with ostree. Comparing strace output
between two runs with/without this patch shows the same fcntl calls,
hence it seems not to matter in practice.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 ports/linux/guts/fcntl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
index 4dd9796..434c7f3 100644
--- a/ports/linux/guts/fcntl.c
+++ b/ports/linux/guts/fcntl.c
@@ -52,6 +52,11 @@
 	case F_GETLK:
 	case F_SETLK:
 	case F_SETLKW:
+#ifdef F_OFD_GETLK
+	case F_OFD_GETLK:
+	case F_OFD_SETLK:
+	case F_OFD_SETLKW:
+#endif
 		rc =3D real_fcntl(fd, cmd, lock);
 		break;
 #if defined(F_GETLK64) && (F_GETLK64 !=3D F_GETLK)
--=20
2.27.0

