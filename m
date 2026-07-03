Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C837FC44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:07:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89120.1783073236261703699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 03:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NbLANrjl;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685D52696
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 03:07:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 620AD3F905
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783073235; bh=93cwS9NiqmnrOQcK7YmFmXgk9+cTiBN0FmMqW+P4Puk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NbLANrjlwrzvqoOrbLoopegKt8vZ24Aa8gOnrEinhSnrgWWmlhXU5LsnNtD80Y9yF
	 sK68HOks+fAnDqXKDp6OvhM66BHYOaOBGZfPyAriz3tpOZQhroS35zVG+RrLaDWCkI
	 Is4WUldJ/5oT4nxfeQ5u93K6pa8xNvD04Bj3cG6o=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] classes/insane: clean up do_qa_sysroot
Date: Fri,  3 Jul 2026 11:07:09 +0100
Message-ID: <20260703100710.2901608-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703100710.2901608-1-ross.burton@arm.com>
References: <20260703100710.2901608-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 10:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240104

do_populate_sysroot copies SYSROOT_DIRS into SYSROOT_DESTDIR, so there's
no need to loop over SYSROOT_DIRS when checking files: qa_check_staged
can just recurse down the entire tree.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 942b6e500d5..1818ce2168d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1225,9 +1225,7 @@ addtask do_package_qa_setscene
=20
 python do_qa_sysroot() {
     bb.note("QA checking do_populate_sysroot")
-    sysroot_destdir =3D d.expand('${SYSROOT_DESTDIR}')
-    for sysroot_dir in d.expand('${SYSROOT_DIRS}').split():
-        qa_check_staged(sysroot_destdir + sysroot_dir, d)
+    qa_check_staged(d.getVar("SYSROOT_DESTDIR"), d)
     oe.qa.exit_with_message_if_errors("do_populate_sysroot for this reci=
pe installed files with QA issues", d)
 }
 do_populate_sysroot[postfuncs] +=3D "do_qa_sysroot"
--=20
2.43.0


