Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C94C54FD0
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32611.1771565686811283342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BuOT99Fg;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2564; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qu+b42oHrWztYLY/OeB/dA7Y18bWZ0TCpMMzEUeNer8=;
  b=BuOT99Fgp6XMXwzLQJwTjHVWL15GnNFADoUr7kKLIwVjlVKlUFgMkfJa
   AORch7VAQL+DbHegS0fSkKOHWAelLfta/oE4mr3hPzFmr0YCnTpmzKG/W
   69uLZYrTnRol32PJUTejYkPFKLyHof7zBPSjZULXUmWZTJ4m4gwPqkR8b
   y9RCve5pc8n4LA3YTwo8J/hqTZyjn+K/Fg2eRVPM7ZS9AryWnUx+mTVgz
   gmdxuAgIXq/f91GW93t0sxsmF1esYaDWOR/049Y3dTWeRzdQ7G+3SR0Rk
   De/+qt5b92D4kfF15aJmhETQgI4nNG/26CmY82EAyTf0KfevqZA86Y2LM
   A==;
X-CSE-ConnectionGUID: rZ0nUQUwRG21DiAy4DptCA==
X-CSE-MsgGUID: uWEqn3G1QByI60LsgRnd0w==
X-IPAS-Result: =?us-ascii?q?A0BDBABB8Zdp/5H/Ja1aglmCSA9xX0JJA5ZIA54agX8PA?=
 =?us-ascii?q?QEBD0QNBAEBhEFGAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgFGECAxKysZgwIBgnMCAREGpm4aN4IsgQHgI?=
 =?us-ascii?q?gELFAGBOIU8iBlrCYR6JxsbgXKEfYJhAoIthXcEgiKBDos0gg6GDUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYJChREPiQV4boEggRsDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB44vP4I0gQ8nBII3k0eSEBKhDgoog3SMHpU6GjOEBKZnmQaCW?=
 =?us-ascii?q?IsxllCEaIFoPEaBE3AVgyIJSRkPWI4Hgh2BJYF/uFkiNQIBECkCBwsBAQMJk?=
 =?us-ascii?q?2cBAQ?=
IronPort-Data: A9a23:goFMyK5ztytb8hyHCCaPdQxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mcfX22POanba2Gneth+b4uz9R9XuZ+By9dqSQBrrS1kZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+qUzBHf/g2QqajhOs/rYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJ79A/NtOPH502
 qZBBDEkf0yvn/6d6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAhnTjazREgFmUvqEwpWPUyWSd1ZCzb4SJI43WFJ49ckCwu
 13r5mKiLUgjHs2+l2Kh6X2WgOOXgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:L+ZQYq1opMd/RJ9oaEMB+QqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:05UOfG2HCJDXuJ1PbgLB37xfAPJ9dEDk8WjqDBXhJWdAWeG5UUO70fYx
X-Talos-MUID: =?us-ascii?q?9a23=3Ae3vbPQyhlHLI6a0jIHYgaziqPy+aqLmRJVkLyrp?=
 =?us-ascii?q?fguOVFHIoHyyStjK7GpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="676419493"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 91DCB18000472;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id D672CCC8CF5; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 27/34] cve-update: decrease update interval to 23 hours
Date: Thu, 19 Feb 2026 21:34:36 -0800
Message-Id: <20260220053443.3006180-27-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231477

From: Peter Marko <peter.marko@siemens.com>

If the job runs every day at the same time, it usually updates only
every second day, because it takes non-0 time for DB update and set the
timestamp. So it does not take full 24-hours from time when the DB was
updated until the next job starts.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a82ae1315b034b6386a82127e1ec8d6f504ec89)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 4 ++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index d9fc331f1b..5a5eb20e41 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -14,10 +14,10 @@ deltask do_populate_sysroot
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 FKIE_URL ?= "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download/CVE-"
 
-# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# CVE database update interval, in seconds. By default: once a day (23*60*60).
 # Use 0 to force the update
 # Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?= "86400"
+CVE_DB_UPDATE_INTERVAL ?= "82800"
 
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 32a14a932b..83876c7467 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -20,10 +20,10 @@ NVDCVE_URL ?= "https://services.nvd.nist.gov/rest/json/cves/2.0"
 # then setting this to get higher rate limits.
 NVDCVE_API_KEY ?= ""
 
-# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# CVE database update interval, in seconds. By default: once a day (23*60*60).
 # Use 0 to force the update
 # Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?= "86400"
+CVE_DB_UPDATE_INTERVAL ?= "82800"
 
 # CVE database incremental update age threshold, in seconds. If the database is
 # older than this threshold, do a full re-download, else, do an incremental

