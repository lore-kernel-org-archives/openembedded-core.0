Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B80DC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 21:09:08 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.6195.1708722538464167390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 13:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=g8yiD48s;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 931C0240027
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 22:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708722536; bh=dLKb/OUJXH2uMarmH7roJohozqVlToomsioAuGCjhc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=g8yiD48s1BFBpw+5Z330k3zbZCDnXJlTO1ywA8g7maDO4PvUQ8m3CuoFlHeo0/PRj
	 9R5WeO6Q3Aek0xBWKdsQ7d/ABI1G5z9/RZFMMHbMxbn6uFtJlMnsXPE5+tlJLdoiJK
	 Opq5dGp53szGK5u4LXuB6qBC5qMUFUgNt8SoNSs2OQ9Rp7jUy0jaH8nY2NHDlxKmXC
	 kBAtUbNiWkuMJqK7wThfWOkPRvVseuiquaCVW1lEMo2t0YjMohq1zCCoTaNjte5eep
	 AKwtMGfEs6JzKcGtYGZZ5anyvMRfu2ZUCkBgUsLfDQQuWNMy/O1YekBdQaE4vqg1Ut
	 KqZeG1MlPNURg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThN0l57Yqz9rxP;
	Fri, 23 Feb 2024 22:08:55 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] cve-check: Log if CVE_STATUS set but not reported for component
Date: Fri, 23 Feb 2024 21:08:48 +0000
Message-Id: <20240223210848.21731-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196113

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Log if the CVE_STATUS is set for a CVE, but the cve is not reported for a
component. This should hopefully help to clean up not needed CVE_STATUS
settings.=20

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/classes/cve-check.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 5191d04303..b82a9e89ec 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -418,6 +418,9 @@ def check_cves(d, patched_cves):
             cves_status.append([product, False])
=20
     conn.close()
+    diff_ignore =3D list(set(cve_ignore) - set(cves_ignored))
+    if diff_ignore:
+        bb.warn("Found CVE (%s) with CVE_STATUS set that is not found in=
 database for this component" % " ".join(diff_ignore))
=20
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
--=20
2.39.2


