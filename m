Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093F7CD6104
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:26:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.67730.1696868793640265579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=rUvyucsy;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 13337864D4;
	Mon,  9 Oct 2023 18:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696868792;
	bh=9SA6y4Ub8uYd2AKsmIYSilI4Lk2gIz9lO/nIz2XQT/E=;
	h=From:To:Cc:Subject:Date:From;
	b=rUvyucsywuDVKF4ZIPg9U49/xIwAChiZhFWsmCbBopUo+5hqQdSrBAvDYYlQaXF6r
	 n4UnApBjGR/qQLdozunN7Nb8S6+k0GuotKdixAv2DgiMro9h+TmFYrymQFYrhZL2Gx
	 6uTK5Ec1tCVzfBPkyvoI1XRZep+rPbhxKSUMbzPP7rfC7J6bgzKkn6sQRskC5OGF/i
	 HFvO2ge1tfclon7Yuo5hcy4RE9cjrGf3YTi5uSdG4LDxwFVkJG1iF/ud6b0VHn8hPS
	 zWktqgHomNgIUpX9WJui80n731mtLDnnf4PNfYp8Qj0NSNSNxCCZ5L/EeVmcpb1PyN
	 YXnEoTEh7nNMg==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] busybox: Backport CVE-2022-48174 fix
Date: Mon,  9 Oct 2023 18:26:22 +0200
Message-Id: <20231009162622.94169-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188844

There is a stack overflow vulnerability in ash.c:6030 in busybox before
1.35. In the environment of Internet of Vehicles, this vulnerability can
be executed from command to arbitrary code execution.

https://nvd.nist.gov/vuln/detail/CVE-2022-48174

CVE: CVE-2022-48174
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2022-48174.patch      | 82 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patc=
h

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch b/met=
a/recipes-core/busybox/busybox/CVE-2022-48174.patch
new file mode 100644
index 0000000000..dfba2a7e0f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
@@ -0,0 +1,82 @@
+From c18ebf861528ef24958dd99a146482d2a40014c7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 12 Jun 2023 17:48:47 +0200
+Subject: [PATCH] shell: avoid segfault on ${0::0/0~09J}. Closes 15216
+
+function                                             old     new   delta
+evaluate_string                                     1011    1053     +42
+
+CVE: CVE-2022-48174
+Upstream-Status: Backport [d417193cf37ca1005830d7e16f5fa7e1d8a44209]
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/shell/math.c b/shell/math.c
+index af1ab55c0..79824e81f 100644
+--- a/shell/math.c
++++ b/shell/math.c
+@@ -578,6 +578,28 @@ static arith_t strto_arith_t(const char *nptr, char=
 **endptr)
+ # endif
+ #endif
+=20
++//TODO: much better estimation than expr_len/2? Such as:
++//static unsigned estimate_nums_and_names(const char *expr)
++//{
++//	unsigned count =3D 0;
++//	while (*(expr =3D skip_whitespace(expr)) !=3D '\0') {
++//		const char *p;
++//		if (isdigit(*expr)) {
++//			while (isdigit(*++expr))
++//				continue;
++//			count++;
++//			continue;
++//		}
++//		p =3D endofname(expr);
++//		if (p !=3D expr) {
++//			expr =3D p;
++//			count++;
++//			continue;
++//		}
++//	}
++//	return count;
++//}
++
+ static arith_t FAST_FUNC
+ evaluate_string(arith_state_t *math_state, const char *expr)
+ {
+@@ -585,10 +607,12 @@ evaluate_string(arith_state_t *math_state, const c=
har *expr)
+ 	const char *errmsg;
+ 	const char *start_expr =3D expr =3D skip_whitespace(expr);
+ 	unsigned expr_len =3D strlen(expr) + 2;
+-	/* Stack of integers */
+-	/* The proof that there can be no more than strlen(startbuf)/2+1
+-	 * integers in any given correct or incorrect expression
+-	 * is left as an exercise to the reader. */
++	/* Stack of integers/names */
++	/* There can be no more than strlen(startbuf)/2+1
++	 * integers/names in any given correct or incorrect expression.
++	 * (modulo "09v09v09v09v09v" case,
++	 * but we have code to detect that early)
++	 */
+ 	var_or_num_t *const numstack =3D alloca((expr_len / 2) * sizeof(numsta=
ck[0]));
+ 	var_or_num_t *numstackptr =3D numstack;
+ 	/* Stack of operator tokens */
+@@ -657,6 +681,13 @@ evaluate_string(arith_state_t *math_state, const ch=
ar *expr)
+ 			numstackptr->var =3D NULL;
+ 			errno =3D 0;
+ 			numstackptr->val =3D strto_arith_t(expr, (char**) &expr);
++			/* A number can't be followed by another number, or a variable name.
++			 * We'd catch this later anyway, but this would require numstack[]
++			 * to be twice as deep to handle strings where _every_ char is
++			 * a new number or name. Example: 09v09v09v09v09v09v09v09v09v
++			 */
++			if (isalnum(*expr) || *expr =3D=3D '_')
++				goto err;
+ 			if (errno)
+ 				numstackptr->val =3D 0; /* bash compat */
+ 			goto num;
+--=20
+2.40.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.31.1.bb
index d062f0f7dd..94aa1467df 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -55,6 +55,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://CVE-2021-42374.patch \
            file://CVE-2021-42376.patch \
            file://CVE-2021-423xx-awk.patch \
+           file://CVE-2022-48174.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characte=
rs-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printa=
ble.patch \
            "
--=20
2.40.1


