Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBF2C001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 12:33:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40882.1687523577768777521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 05:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CA021595;
	Fri, 23 Jun 2023 05:33:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF3703F59C;
	Fri, 23 Jun 2023 05:32:56 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com
Subject: [PATCH 3/4] cve-update-nvd2-native: handle all configuration nodes, not just first
Date: Fri, 23 Jun 2023 13:32:49 +0100
Message-Id: <20230623123250.726731-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623123250.726731-1-ross.burton@arm.com>
References: <20230623123250.726731-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 12:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183328

From: Ross Burton <ross.burton@arm.com>

Some CVEs, such as CVE-2013-6629, list multiple configurations which are
vulnerable. The current JSON parser only considers the first
configuration.

Instead, consider every configuration. We don't yet handle the AND/OR
logical operators, but this is a step in the right direction.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
index 2b585983ac7..0c627ef2623 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -323,11 +323,12 @@ def update_db(conn, elt):
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).cl=
ose()
=20
     try:
-        configurations =3D elt['cve']['configurations'][0]['nodes']
-        for config in configurations:
-            parse_node_and_insert(conn, config, cveId)
+        for config in elt['cve']['configurations']:
+            # This is suboptimal as it doesn't handle AND/OR and negate,=
 but is better than nothing
+            for node in config["nodes"]:
+                parse_node_and_insert(conn, node, cveId)
     except KeyError:
-        bb.debug(2, "Entry without a configuration")
+        bb.debug(2, "CVE %s has no configurations" % cveId)
=20
 do_fetch[nostamp] =3D "1"
=20
--=20
2.34.1


