Received: from ford.bithub.de (ford.bithub.de [159.69.22.172])
 by mx.groups.io with SMTP id smtpd.web09.1413.1621279500357358590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 12:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@bithub.de header.s=ford header.b=jrZg1TTq;
 spf=pass (domain: bithub.de, ip: 159.69.22.172, mailfrom: philip@bithub.de)
Received: from t420.fritz.box (x4db3605d.dyn.telefonica.de [77.179.96.93])
	by ford.bithub.de (Postfix) with ESMTPSA id BDE241FC83;
	Mon, 17 May 2021 21:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bithub.de; s=ford;
	t=1621279498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sQZn2TImjgGF9fWjezj2zXBTRXstAqHID0mARFv4pEI=;
	b=jrZg1TTqfvPhYVuD61c3Q3UPVd24A7ZDE59C/vfnvECptnXOCDmcwnL3cC/8yl/xI8skOO
	qTttYwoGCUkNlEXoCdKk9VPxkfyXwie78GdiMiQqCQAhzPZMVwlLFuihJ7e/HTy/9L+pKm
	5kkGUY06BY47EzjRzdNVx1Whih5UiuS8RTv6qV/ogx1Mn0WcEuRcsiPJPfCs8N/s8vCWeF
	4caukN+MDVTYdgR19jLrJHNDXBpS5C6N/YCwKI7IrKxTefKXet23JWG5Shy+am0aRtflwQ
	n+8yJ7YijZaHQiRlsu+r16lqTXsAm8h4FRzGRADIp6Einp1HC+PPQPmTAMlgZg==
From: "Philip Lorenz" <philip@bithub.de>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip@bithub.de>
Subject: [pseudo][PATCH] client: Fix some compiler warnings
Date: Mon, 17 May 2021 21:24:36 +0200
Message-Id: <20210517192436.48024-1-philip@bithub.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fix some warnings reported by GCC 10.2.0:

* NULL pointer passed to '%s' format string parameter:

  pseudo_client.c: In function =E2=80=98pseudo_root_path=E2=80=99:
  pseudo_client.c:848:3: warning: =E2=80=98%s=E2=80=99 directive argument=
 is null
  [-Wformat-overflow=3D]
    848 |   pseudo_diag("couldn't allocate absolute path for '%s'.\n",
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    849 |    path);

* Return of variable with local storage duration:

  pseudo_client.c: In function =E2=80=98pseudo_client_op=E2=80=99:
  cc1: warning: function may return address of local variable
  [-Wreturn-local-addr]
  pseudo_client.c:1592:15: note: declared here
   1592 |  pseudo_msg_t msg =3D { .type =3D PSEUDO_MSG_OP };

Signed-off-by: Philip Lorenz <philip@bithub.de>
---
 pseudo_client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pseudo_client.c b/pseudo_client.c
index 579db33..6edd2ee 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -846,7 +846,7 @@ pseudo_root_path(const char *func, int line, int dirf=
d, const char *path, int le
 	pseudo_magic();
 	if (!rc) {
 		pseudo_diag("couldn't allocate absolute path for '%s'.\n",
-			path);
+			path ? path : "null");
 	}
 	pseudo_debug(PDBGF_CHROOT, "root_path [%s, %d]: '%s' from '%s'\n",
 		func, line,
@@ -1589,7 +1589,7 @@ int pseudo_client_ignore_path(const char *path) {
 pseudo_msg_t *
 pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const ch=
ar *path, const PSEUDO_STATBUF *buf, ...) {
 	pseudo_msg_t *result =3D 0;
-	pseudo_msg_t msg =3D { .type =3D PSEUDO_MSG_OP };
+	static pseudo_msg_t msg =3D { .type =3D PSEUDO_MSG_OP };
 	size_t pathlen =3D -1;
 	int do_request =3D 0;
 	char *path_extra_1 =3D 0;
--=20
2.31.1

