Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F526C54E41
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 08:18:51 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.15747.1708762728745001551
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 00:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=L4Tp5IM8;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 29B50240101
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 09:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708762726; bh=sfPslSZ72ujKGkbRHcUS4MIsIsQq0rDTJVMh6L4og3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=L4Tp5IM8BaBcOo/zmBGlWpMsbgP4iLiIZuRRV4bw9O6u+9Oy/EBmk77ty8XIbjYco
	 oq7WKnq0EnQDVST7UZqwwoQcrrzGvI9L2n2diRIW10zlGk4wv5N5kCIg0/+UEMU8LE
	 JPM+qzX3m31ZJRSDmxd2+jWtfhVIwSrhThcnCjH8L53cgVeruZ94/YVwKfOSYOArsF
	 CNc617gU7HFJZIGDpQTsky1gARYnCZLzJoEsxLwz3ocwWkXZQAhfRaFFOLGLq2EUWb
	 rElsAfOJSC3mh44mZs99t8SzQOfEGWO/1dJr0tWigmo0j9hO7VIVxamNGzlAgYH1Qx
	 YIfnQ/UhbP1Kw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Thfsd3bg5z6ty1;
	Sat, 24 Feb 2024 09:18:45 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] cve-check: Log if CVE_STATUS set but not reported for component
Date: Sat, 24 Feb 2024 08:18:38 +0000
Message-Id: <20240224081838.60542-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 08:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196122

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Log if the CVE_STATUS is set for a CVE, but the cve is not reported for a
component. This should hopefully help to clean up not needed CVE_STATUS
settings.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
v2: Add this to oe.qa mechanism instead of using bb.warn. This way it wil=
l only
be executed if one adds it to WARN_QA. Not added there by default, so it =
should
not be bothering unless a explicit check is wanted.

 meta/classes/cve-check.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 5191d04303..56ba8bceef 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -418,6 +418,9 @@ def check_cves(d, patched_cves):
             cves_status.append([product, False])
=20
     conn.close()
+    diff_ignore =3D list(set(cve_ignore) - set(cves_ignored))
+    if diff_ignore:
+        oe.qa.handle_error("cve_status_not_in_db", "Found CVE (%s) with =
CVE_STATUS set that are not found in database for this component" % " ".j=
oin(diff_ignore), d)
=20
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
--=20
2.39.2


