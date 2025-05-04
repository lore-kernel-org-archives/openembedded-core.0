Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43B6C3ABB8
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:54:59 +0000 (UTC)
Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.web10.26610.1746355753818603006
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 03:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=M7cXJ9Fr;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: jeroen@myspectrum.nl)
Received: from submission8.mail.transip.nl (unknown [10.103.8.159])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4Zr1cR1xTjzHQTM;
	Sun,  4 May 2025 12:49:11 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission8.mail.transip.nl (Postfix) with ESMTPSA id 4Zr1cM4YXXz2npc92;
	Sun,  4 May 2025 12:49:07 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 5FCA720292;
	Sun,  4 May 2025 10:49:06 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sun, 04 May 2025 12:49:06 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [OE-core][scarthgap][PATCH 2/2] bluez5: backport a patch to fix btmgmt -i
Date: Sun,  4 May 2025 12:33:22 +0200
Message-ID: <20250504103322.2545460-2-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504103322.2545460-1-jeroen@myspectrum.nl>
References: <20250504103322.2545460-1-jeroen@myspectrum.nl>
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission8.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1746355747; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=pOBvYNUV9OFhu4D5d28eRKVZn79fnUZZJrLl1TcyUfI=;
 b=M7cXJ9FrCWW1iYiSUgiH0MkB2BY7PBW93/rCVp0VBZpIRW1G3/oCA+g5IU7Z8zINS90e+S
 XDjlgJ1bYXXYuWpk7eFCPzMvnPPWhm/Is4bjYrpmW8fkvozshlZpxL2GKtvxPtgxK2lJtN
 bnDxfPKr2Hfo4eWIgWrxb3LvRCcPEptSmvLMk+xMdom+3k1LH2GknBgPmLDZKikJt/NeAM
 5c3IsJYgS0a7OT+xb0GC83pZTTAndOnirQi5bF7gc0nJKB+ewhkKXpBl7EwYWH2dYwz0nF
 KDLwVAGiy2Mv2Jm840E6H88eAOLFoLqVYNMWQFSpRRDvVbbHTCJ7xk25cDVu0g==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215967

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Without this patch btmgmt will always use hci0 in
non interactive mode.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ndex-option-for-non-interactive-mode.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-f=
ix-index-option-for-non-interactive-mode.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index 731bfa0e40..53d8644159 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -57,6 +57,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-adapter-Fix-up-address-type-when-loading-keys.pat=
ch \
+           file://toolsbtmgmt-fix-index-option-for-non-interactive-mode.=
patch \
            "
 S =3D "${WORKDIR}/bluez-${PV}"
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-inde=
x-option-for-non-interactive-mode.patch b/meta/recipes-connectivity/bluez=
5/bluez5/toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch
new file mode 100644
index 0000000000..f4e14be146
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-index-optio=
n-for-non-interactive-mode.patch
@@ -0,0 +1,29 @@
+From f00d5546c9e989dd68ce0de0190cd0e043b0f1f5 Mon Sep 17 00:00:00 2001
+From: Arjan Opmeer <arjan.opmeer@gmail.com>
+Date: Tue, 9 Jul 2024 13:55:41 +0200
+Subject: [PATCH] tools/btmgmt: Fix --index option for non-interactive mo=
de
+
+In non-interactive mode the --index option does not work because the
+call to mgmt_set_index() is made after bt_shell_attach().
+
+Fixes: https://github.com/bluez/bluez/issues/893
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/f00d554=
6c9e989dd68ce0de0190cd0e043b0f1f5]
+---
+ tools/btmgmt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/btmgmt.c b/tools/btmgmt.c
+index 9b7f851bd8..436c2bb21f 100644
+--- a/tools/btmgmt.c
++++ b/tools/btmgmt.c
+@@ -51,8 +51,8 @@ int main(int argc, char *argv[])
+ 		return EXIT_FAILURE;
+ 	}
+=20
+-	bt_shell_attach(fileno(stdin));
+ 	mgmt_set_index(index_option);
++	bt_shell_attach(fileno(stdin));
+ 	status =3D bt_shell_run();
+=20
+ 	mgmt_remove_submenu();
--=20
2.43.0


