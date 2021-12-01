Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18768C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 09:56:30 +0000 (UTC)
Received: from forward107j.mail.yandex.net (forward107j.mail.yandex.net
 [5.45.198.252])
 by mx.groups.io with SMTP id smtpd.web08.89794.1638352588062960394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 01:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=vcrL7ZW+;
 spf=pass (domain: zhukoff.net, ip: 5.45.198.252, mailfrom: pavel@zhukoff.net)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
	by forward107j.mail.yandex.net (Yandex) with ESMTP id 15B10884B3C;
	Wed,  1 Dec 2021 12:56:24 +0300 (MSK)
Received: from vla5-55f9a0bd6174.qloud-c.yandex.net
 (vla5-55f9a0bd6174.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:341a:0:640:55f9:a0bd])
	by forward102q.mail.yandex.net (Yandex) with ESMTP id 10F2ABF00012;
	Wed,  1 Dec 2021 12:56:24 +0300 (MSK)
Received: from vla5-47b3f4751bc4.qloud-c.yandex.net
 (vla5-47b3f4751bc4.qloud-c.yandex.net [2a02:6b8:c18:3508:0:640:47b3:f475])
	by vla5-55f9a0bd6174.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 7syHFWDCtq-uNeWXxOX;
	Wed, 01 Dec 2021 12:56:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1638352584;
	bh=RejFa27SInyGJqUIo6yNvUugr2Aeu0q35VbbOgEAQ2A=;
	h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
	b=vcrL7ZW+yw4pcTwTAGWLAEXmdMApgbb3TNvFdGNM+b0eHt1oHZtdqHQB854+LwAex
	 EMyt9yOAnQB/eX0YhgoQuURQ5BC7DQPT9csqRg9HpTiUUZgeZ/baS04KT21xmx8t3Y
	 7kZ4XB78nePRhjZNpXwNTLBpd8bufzcalbRlWocY=
Authentication-Results: vla5-55f9a0bd6174.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by vla5-47b3f4751bc4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id D5sML5Cobq-uNR85u4j;
	Wed, 01 Dec 2021 12:56:23 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [dunfell][PATCH 2/2] busybox: Fix for CVE-2021-42376
Date: Wed,  1 Dec 2021 10:54:37 +0100
Message-Id: <20211201095437.15012-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201095437.15012-1-pavel@zhukoff.net>
References: <20211201095437.15012-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 09:56:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159022

From: Pavel Zhukov <pavel.zhukov@huawei.com>

A NULL pointer dereference in Busybox's hush applet leads to denial of se=
rvice
when processing a crafted shell command, due to missing validation after
a \x03 delimiter character.
This may be used for DoS under very rare conditions of filtered command i=
nput.

Reference: https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-42=
376

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../busybox/busybox/CVE-2021-42376.patch      | 138 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42376.patc=
h

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch b/met=
a/recipes-core/busybox/busybox/CVE-2021-42376.patch
new file mode 100644
index 0000000000..c913eaee9c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
@@ -0,0 +1,138 @@
+From 56a335378ac100d51c30b21eee499a2effa37fba Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 15 Jun 2021 16:05:57 +0200
+Subject: hush: fix handling of \^C and "^C"
+
+function                                             old     new   delta
+parse_stream                                        2238    2252     +14
+encode_string                                        243     256     +13
+------------------------------------------------------------------------=
------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 27/0)               Total: 27=
 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 1b7a9b68d0e9aa19147d7fda16eb9a6b54156985)
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+CVE: CVE-2021-42376
+Upstream-Status: Backport [https://git.busybox.net/busybox/patch/?id=3D5=
6a335378ac100d51c30b21eee499a2effa37fba]
+Comment: No changes in any hunk
+---
+ shell/ash_test/ash-misc/control_char3.right   |  1 +
+ shell/ash_test/ash-misc/control_char3.tests   |  2 ++
+ shell/ash_test/ash-misc/control_char4.right   |  1 +
+ shell/ash_test/ash-misc/control_char4.tests   |  2 ++
+ shell/hush.c                                  | 11 +++++++++++
+ shell/hush_test/hush-misc/control_char3.right |  1 +
+ shell/hush_test/hush-misc/control_char3.tests |  2 ++
+ shell/hush_test/hush-misc/control_char4.right |  1 +
+ shell/hush_test/hush-misc/control_char4.tests |  2 ++
+ 9 files changed, 23 insertions(+)
+ create mode 100644 shell/ash_test/ash-misc/control_char3.right
+ create mode 100755 shell/ash_test/ash-misc/control_char3.tests
+ create mode 100644 shell/ash_test/ash-misc/control_char4.right
+ create mode 100755 shell/ash_test/ash-misc/control_char4.tests
+ create mode 100644 shell/hush_test/hush-misc/control_char3.right
+ create mode 100755 shell/hush_test/hush-misc/control_char3.tests
+ create mode 100644 shell/hush_test/hush-misc/control_char4.right
+ create mode 100755 shell/hush_test/hush-misc/control_char4.tests
+
+diff --git a/shell/ash_test/ash-misc/control_char3.right b/shell/ash_tes=
t/ash-misc/control_char3.right
+new file mode 100644
+index 000000000..283e02cbb
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char3.right
+@@ -0,0 +1 @@
++SHELL: line 1: =03: not found
+diff --git a/shell/ash_test/ash-misc/control_char3.tests b/shell/ash_tes=
t/ash-misc/control_char3.tests
+new file mode 100755
+index 000000000..4359db3f3
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char3.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messag=
es)
++$THIS_SH -c '\=03' SHELL
+diff --git a/shell/ash_test/ash-misc/control_char4.right b/shell/ash_tes=
t/ash-misc/control_char4.right
+new file mode 100644
+index 000000000..2bf18e684
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char4.right
+@@ -0,0 +1 @@
++SHELL: line 1: =03=03=03=02-=03: not found
+diff --git a/shell/ash_test/ash-misc/control_char4.tests b/shell/ash_tes=
t/ash-misc/control_char4.tests
+new file mode 100755
+index 000000000..48010f154
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char4.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messag=
es)
++$THIS_SH -c '"=03=03=03=02-=03"' SHELL
+diff --git a/shell/hush.c b/shell/hush.c
+index 9fead37da..249728b9d 100644
+--- a/shell/hush.c
++++ b/shell/hush.c
+@@ -5235,6 +5235,11 @@ static int encode_string(o_string *as_string,
+ 	}
+ #endif
+ 	o_addQchr(dest, ch);
++	if (ch =3D=3D SPECIAL_VAR_SYMBOL) {
++		/* Convert "^C" to corresponding special variable reference */
++		o_addchr(dest, SPECIAL_VAR_QUOTED_SVS);
++		o_addchr(dest, SPECIAL_VAR_SYMBOL);
++	}
+ 	goto again;
+ #undef as_string
+ }
+@@ -5346,6 +5351,11 @@ static struct pipe *parse_stream(char **pstring,
+ 			if (ch =3D=3D '\n')
+ 				continue; /* drop \<newline>, get next char */
+ 			nommu_addchr(&ctx.as_string, '\\');
++			if (ch =3D=3D SPECIAL_VAR_SYMBOL) {
++				nommu_addchr(&ctx.as_string, ch);
++				/* Convert \^C to corresponding special variable reference */
++				goto case_SPECIAL_VAR_SYMBOL;
++			}
+ 			o_addchr(&ctx.word, '\\');
+ 			if (ch =3D=3D EOF) {
+ 				/* Testcase: eval 'echo Ok\' */
+@@ -5670,6 +5680,7 @@ static struct pipe *parse_stream(char **pstring,
+ 		/* Note: nommu_addchr(&ctx.as_string, ch) is already done */
+=20
+ 		switch (ch) {
++		case_SPECIAL_VAR_SYMBOL:
+ 		case SPECIAL_VAR_SYMBOL:
+ 			/* Convert raw ^C to corresponding special variable reference */
+ 			o_addchr(&ctx.word, SPECIAL_VAR_SYMBOL);
+diff --git a/shell/hush_test/hush-misc/control_char3.right b/shell/hush_=
test/hush-misc/control_char3.right
+new file mode 100644
+index 000000000..94b4f8699
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char3.right
+@@ -0,0 +1 @@
++hush: can't execute '=03': No such file or directory
+diff --git a/shell/hush_test/hush-misc/control_char3.tests b/shell/hush_=
test/hush-misc/control_char3.tests
+new file mode 100755
+index 000000000..4359db3f3
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char3.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messag=
es)
++$THIS_SH -c '\=03' SHELL
+diff --git a/shell/hush_test/hush-misc/control_char4.right b/shell/hush_=
test/hush-misc/control_char4.right
+new file mode 100644
+index 000000000..698e21427
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char4.right
+@@ -0,0 +1 @@
++hush: can't execute '=03=03=03=02-=03': No such file or directory
+diff --git a/shell/hush_test/hush-misc/control_char4.tests b/shell/hush_=
test/hush-misc/control_char4.tests
+new file mode 100755
+index 000000000..48010f154
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char4.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messag=
es)
++$THIS_SH -c '"=03=03=03=02-=03"' SHELL
+--=20
+cgit v1.2.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.31.1.bb
index 55c00eb483..14ac710f3b 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -53,6 +53,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patc=
h \
            file://0001-mktemp-add-tmpdir-option.patch \
            file://CVE-2021-42374.patch \
+           file://CVE-2021-42376.patch \
            "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "
=20
--=20
2.34.0


