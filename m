Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C5EC636C9
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.28148.1650885888845393686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76C631FB
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:24:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D173F73B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:24:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: ignore CVE-2015-20107
Date: Mon, 25 Apr 2022 12:24:44 +0100
Message-Id: <20220425112444.3890059-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164820

CVE-2015-20107 describes an arbitrary command execution in the mailcap
module, but this is by design in mailcap and needs to be worked around
by the calling application.

Upstream Python will be documenting this flaw in the library reference,
and it is likely that the mailcap module will be deprecated and removed
in the future.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.10.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipe=
s-devtools/python/python3_3.10.4.bb
index 7eaafe34ad..d678d55083 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -55,6 +55,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2007-4559"
 CVE_CHECK_IGNORE +=3D "CVE-2019-18348"
 # These are specific to Microsoft Windows
 CVE_CHECK_IGNORE +=3D "CVE-2020-15523 CVE-2022-26488"
+# The mailcap module is insecure by design, so this can't be fixed in a =
meaningful way.
+# The module will be removed in the future and flaws documented.
+CVE_CHECK_IGNORE +=3D "CVE-2015-20107"
=20
 PYTHON_MAJMIN =3D "3.10"
=20
--=20
2.25.1


