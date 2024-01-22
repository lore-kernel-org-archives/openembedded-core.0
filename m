Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A988CC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:04:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.74420.1705932248390038529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D38681FB
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 711093F73F
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:07 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] cve_check: handle CVE_STATUS being set to the empty string
Date: Mon, 22 Jan 2024 14:04:02 +0000
Message-Id: <20240122140406.3837333-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194160

From: Ross Burton <ross.burton@arm.com>

Handle CVE_STATUS[...] being set to an empty string just as if it was
not set at all.

This is needed for evaluated CVE_STATUS values to work, i.e. when
setting not-applicable-config if a PACKAGECONFIG is disabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/cve_check.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 3fa77bf9a71..b5fc5364dc8 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -231,7 +231,7 @@ def decode_cve_status(d, cve):
     Convert CVE_STATUS into status, detail and description.
     """
     status =3D d.getVarFlag("CVE_STATUS", cve)
-    if status is None:
+    if not status:
         return ("", "", "")
=20
     status_split =3D status.split(':', 1)
@@ -240,7 +240,7 @@ def decode_cve_status(d, cve):
=20
     status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
     if status_mapping is None:
-        bb.warn('Invalid detail %s for CVE_STATUS[%s] =3D "%s", fallback=
 to Unpatched' % (detail, cve, status))
+        bb.warn('Invalid detail "%s" for CVE_STATUS[%s] =3D "%s", fallba=
ck to Unpatched' % (detail, cve, status))
         status_mapping =3D "Unpatched"
=20
     return (status_mapping, detail, description)
--=20
2.34.1


