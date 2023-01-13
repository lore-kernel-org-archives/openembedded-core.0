Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33F6C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:14:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93859.1673630088707918905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ED55FEC;
	Fri, 13 Jan 2023 09:15:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5AE3F67D;
	Fri, 13 Jan 2023 09:14:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cve-update-db-native: show IP on failure
Date: Fri, 13 Jan 2023 17:14:31 +0000
Message-Id: <20230113171431.1315869-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 17:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175844

We get random SSL failures when fetching the CVE database, and it's
notable that the NVD server is behind a DNS round-robin or geographically
diverse servers.

On a hunch that there is one misconfigured server, dump the IP that we
connected to.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 079f062f79b..e042e67b09a 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -130,7 +130,10 @@ def update_db_file(db_tmp_file, d):
                 response =3D urllib.request.urlopen(meta_url, timeout=3D=
cve_socket_timeout)
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fet=
ch CVE data.\n\n')
-                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
+                bb.warn("Failed to fetch CVE data (%s)" % e)
+                import socket
+                result =3D socket.getaddrinfo("nvd.nist.gov", 443, proto=
=3Dsocket.IPPROTO_TCP)
+                bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in =
result)))
                 return False
=20
             if response:
--=20
2.34.1


