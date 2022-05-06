Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66208C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11226.1651852568734243714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4993113E;
	Fri,  6 May 2022 08:56:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B3C23F885;
	Fri,  6 May 2022 08:56:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] base: Avoid circular references to our own scripts
Date: Fri,  6 May 2022 16:56:01 +0100
Message-Id: <20220506155604.2401829-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506155604.2401829-1-ross.burton@arm.com>
References: <20220506155604.2401829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165345

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We'd like to intercept git calls but we don't want circular references
and HOSTTOOLS currently sets them up. Tweak to avoid them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3515720bf9..16b7c69995 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -115,6 +115,9 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTr=
ue):
     tools =3D d.getVar(toolsvar).split()
     origbbenv =3D d.getVar("BB_ORIGENV", False)
     path =3D origbbenv.getVar("PATH")
+    # Need to ignore our own scripts directory to avoid circular links
+    ourscripts =3D d.expand("${COREBASE}/scripts")
+    path =3D path.replace(ourscripts, "/ignoreme")
     bb.utils.mkdirhier(dest)
     notfound =3D []
     for tool in tools:
--=20
2.25.1


