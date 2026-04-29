Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE9FFF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.933.1777481313466043838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XaMjj+YP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85DD71BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91B0F3F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481313; bh=Hoc9Bjh23L35XlRja9sSxQ1jxg4eKWFyhMUrckaHWYA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XaMjj+YPJPn2BdF2qYBuulGhXS+vrJknCi8UBratxTIRwqsS4yq/y1sjxlstXd++1
	 GwM02X0hRy+dpqWvdOKM3ZhGWccQp1vphztUKsSj8t1cDWhFeXerreeD30BLg/XF4D
	 4yLZAMPF173V8OCuG5/9KxTQfXkXUwr7auFolA7I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] classes/kernel-module-split: skip .debug files early
Date: Wed, 29 Apr 2026 17:48:20 +0100
Message-ID: <20260429164821.3425757-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236121

There's no need to try and extract modinfo from .debug files as there is
none, so don't even try.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
index 75ed696b72c..b30b3edd39d 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -185,6 +185,9 @@ python split_kernel_module_packages () {
=20
=20
     def frob_metadata(file, pkg, pattern, format, basename):
+        if "/.debug/" in file:
+            return
+
         vals =3D extract_modinfo(file)
         dvar =3D d.getVar('PKGD')
=20
--=20
2.43.0


