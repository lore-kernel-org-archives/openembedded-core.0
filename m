Return-Path: <gordon.lack@dsl.pipex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56E6CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 20:07:04 +0000 (UTC)
Received: from vsmx006.tt.xion.oxcs.net (vsmx006.tt.xion.oxcs.net [153.92.124.224])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5182.1762114020252020220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 12:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dsl.pipex.com header.s=mail1 header.b=Ep7DMHm+;
 spf=pass (domain: dsl.pipex.com, ip: 153.92.124.224, mailfrom: gordon.lack@dsl.pipex.com)
Received: from vsmx004.tt.xion.oxcs.net (unknown [185.27.183.176])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTP id 992EDA80955
	for <openembedded-core@lists.openembedded.org>; Sun,  2 Nov 2025 20:06:58 +0000 (UTC)
Received: from proxy-18.proxy.shared.ham.xion.oxcs.net (proxy-18.proxy.shared.ham.xion.oxcs.net [89.168.156.2])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTPA id 70F65A801F0
	for <openembedded-core@lists.openembedded.org>; Sun,  2 Nov 2025 20:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dsl.pipex.com;
	s=mail1; t=1762114018;
	bh=oVLt/hmXhJ38xMTLku3L2ohD9K1GQglOXCzRFL50o3k=;
	h=From:To:Cc:Subject:Date:From;
	b=Ep7DMHm+edYgD2RvPizMMAWuNJ09EGjrDrAQD+uQyQBkb/sQCa7gOvYTcK8vNG32+
	 QYX5oLtwn9gmeZIXjpF1e+4q6mm2WVAzMDKIXWh7lic/8Cfgn78Cxh7BfFQHjR2xOj
	 /HgW1gwD2kgePN4taYXrltGViX/dn2wfPSdv0bpieJwOeMK2eahkhNA7zyT2dSPNLz
	 GzutBK6vBQ4P/5VhG+kJB+kFsdk0atjSK86CURJ65kpjKgsz1tGSLWvquv0t2hCy1m
	 pnba/40zWHfWBuezFCUh4dgtyezB3gC8r/YVo+ka6m0eZygNjj3ibSHAgvla7aTl75
	 rls9BQDM9UT4Q==
Received: from gmllaptop.lacknet (gmllaptop.lacknet [192.168.1.10])
	by benuc.lacknet (Postfix) with ESMTPSA id EF5195F292;
	Sun, 02 Nov 2025 20:06:56 +0000 (GMT)
Received: from gmllaptop.lacknet (localhost [127.0.0.1])
	by gmllaptop.lacknet (Postfix) with ESMTP id BB33540143;
	Sun, 02 Nov 2025 20:06:56 +0000 (GMT)
From: Gordon Lack <gordon.lack@dsl.pipex.com>
To: openembedded-core@lists.openembedded.org
Cc: Gordon Lack <gordon.lack@dsl.pipex.com>
Subject: [PATCH 1/1] Avoid running whilst in a deleted directory.
Date: Sun,  2 Nov 2025 20:06:53 +0000
Message-ID: <20251102200653.3438957-1-gordon.lack@dsl.pipex.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 20:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225583


This caused a problem when building on Kubuntu 25.10.

Whilst the real problem is the cp in Rust coreutils, it makes sense not
to be in the directory you are about to delete.

---
 meta/recipes-devtools/perl/perl_5.40.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-dev=
tools/perl/perl_5.40.2.bb
index a78d2ed0be..ee6896b479 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -58,6 +58,12 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-aliasi=
ng"
 CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-builtin-memcp=
y -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
=20
 do_configure:prepend() {
+# ${B} will have been set as our current directory before immediately
+# before do_configure is called. So let's avoid any problems associated
+# with it being deleted from underneath us.
+# We're being put back there (the new version) at the end of this code
+#
+    cd /
     rm -rf ${B}
     cp -rfp ${S} ${B}
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${B}
--=20
2.51.0


