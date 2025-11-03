Return-Path: <gordon.lack@dsl.pipex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D20FCCFA00
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 02:29:46 +0000 (UTC)
Received: from vsmx006.tt.xion.oxcs.net (vsmx006.tt.xion.oxcs.net [153.92.124.224])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12119.1762136983778916429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 18:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dsl.pipex.com header.s=mail1 header.b=qialOoU9;
 spf=pass (domain: dsl.pipex.com, ip: 153.92.124.224, mailfrom: gordon.lack@dsl.pipex.com)
Received: from vsmx004.tt.xion.oxcs.net (unknown [185.27.183.176])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTP id 8A416A80883
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 02:29:41 +0000 (UTC)
Received: from proxy-2.proxy.shared.ham.xion.oxcs.net (proxy-2.proxy.shared.ham.xion.oxcs.net [89.168.156.2])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTPA id 6363DA80201
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dsl.pipex.com;
	s=mail1; t=1762136981;
	bh=LhM+ndDxCBM5IfUm9C32i4r/mB23grqjtHoIlGBL80I=;
	h=From:To:Cc:Subject:Date:From;
	b=qialOoU94M+FEYOYZX40yzktb34qG7j8yX0YGYwb/YemNn50EQ17XAwNjH18QGEvv
	 iwzom1jUGE4KKZvA6obBQw45VVzfbPAiDJmwdPFGq9ErrkU8+Iu/hsIlrUp7KuewZ8
	 b9bxxADgBlNRr+1L7TH0F5JMZPxEbmSA5dDrWegobOeguzQD7+DUHQdkwfVoByQGRH
	 /aOPFCAmsCvAAeenBLbsZmeUdPdEXOyOPaOS47RtgiAuSo9rtQJ911oo3HZ8r+Eoe9
	 DOCeq8CHtxm/tDbGobfPHSeIYEdN+eLJ99dXRyealpAYkhEAgPAC68GGDpNk2skKmk
	 LjCz/l68BXVsg==
Received: from parent.lacknet (parent.lacknet [192.168.1.101])
	by benuc.lacknet (Postfix) with ESMTP id 971F45F29C;
	Mon, 03 Nov 2025 02:29:39 +0000 (GMT)
Received: from parent.lacknet (localhost [127.0.0.1])
	by parent.lacknet (Postfix) with ESMTP id 887FF15F550;
	Mon, 03 Nov 2025 02:29:39 +0000 (GMT)
From: Gordon Lack <gordon.lack@dsl.pipex.com>
To: openembedded-core@lists.openembedded.org
Cc: Gordon Lack <gordon.lack@dsl.pipex.com>
Subject: [PATCH] Avoid running whilst in a deleted directory.
Date: Mon,  3 Nov 2025 02:29:36 +0000
Message-ID: <20251103022936.10673-1-gordon.lack@dsl.pipex.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 02:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225586

This caused a problem when building on Kubuntu 25.10.

Whilst the real problem is the cp in Rust coreutils, it makes sense not
to be in the directory you are about to delete.

This is a resubmission to use "cd ${WORKDIR}" rather than "cd /".
---
 meta/recipes-devtools/perl/perl_5.40.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-dev=
tools/perl/perl_5.40.2.bb
index a78d2ed0be..19de35fdc7 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -57,7 +57,13 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-aliasi=
ng"
 # Needed with -march=3Dx86-64-v3
 CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-builtin-memcp=
y -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
=20
+# ${B} will have been set as our current directory immediately before
+# do_configure is called. So let's avoid any problems associated
+# with it being deleted from underneath us by moving to somewhere else.
+# We're being put back there (the new version) at the end of this code
+#
 do_configure:prepend() {
+    cd ${WORKDIR}
     rm -rf ${B}
     cp -rfp ${S} ${B}
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${B}
--=20
2.51.0


