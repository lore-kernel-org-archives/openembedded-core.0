Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAFEC55162
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32606.1771565685734441813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Dl9mihY8;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3386; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vJTDVm6pO8cZOHBZfaU1cbhfOM6kh3pnZGcG+qIFdho=;
  b=Dl9mihY86fnY1pVV3p04bi8Xg2GRKMIzsNhCTpv3PBrTXZjzUcHHbNdt
   SVnWky6JA4PxN5PDm3U8Ar9b5AIdCbHfdi2ZohLpWualZBWGVMk6wueEN
   +UsFZVWvBu//ZPOk4fwd0507tQs1JL/R4uvO8O7ZIEr8h8x0AuI2KqY7N
   ykMjTKulvworbRuAfMVzhC//Ctf9Y72eRPl536LoR8KUIjMZsjysTYB9B
   tyQlQ8vh/TZKduFMkBwJhYYTL395T4mzU1gqwtDzTFjCoGeQSj7t7hbZ7
   NHqyJHrnQFQDCs0WxfK9hJ666EYX00OhSK/iE5SVVY9F3vgfNbCVGW2l3
   Q==;
X-CSE-ConnectionGUID: hpGojx7ARMKp7cKOtE8LjQ==
X-CSE-MsgGUID: GtzWlC9EQByEZ6kYY0cEyQ==
X-IPAS-Result: =?us-ascii?q?A0B1BwBB8Zdp/43/Ja1aHQEBKwsGAQUFAQIBCQGBZQKCR?=
 =?us-ascii?q?g9xX0JJA5ZIA54agX8PAQEBDxQCIRoEAQGFBwKNHwImNAkOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWwIBAzIBRhAgMSsrGYMCA?=
 =?us-ascii?q?YJzAgGnVoIsgQGEfNsmAQsUAYE4AYU7iBlrCYR6JxsbgXKCUIItiwcEgiKBD?=
 =?us-ascii?q?pNPSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFgkKFEQ+JBXhug?=
 =?us-ascii?q?SCBGwMLGA1IESw3FBsEPm4Hji8/gXFDgQ4BgSZwEpQYB5IEgTWfWQoog3SMH?=
 =?us-ascii?q?pU6GjOEBKZnmQaCWKIBhGiBaDxGgRNwFYMiCUkZD45fgh27fSI1EykCBwsBA?=
 =?us-ascii?q?QMJk2cBAQ?=
IronPort-Data: A9a23:dHQmeqx0Si3xjoZ/rZ96t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVTx
 zAXCmuAaK2PZWfzLd5/aovlo0hTv8PXzdVlQQJv+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4qaT/H3Ygf/hWYuaDpMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEEuEooa6rleO0Rt7
 aMTCxcRQ0CnhdvjldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOelmmH2bxVTqUmeouw85G27IAlZjue0YIuKJYDTLSlTtmmEt
 F3C1DXUOzsLGe7Bygu0qnmBl9aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9FRpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:vUn5qq+et2g18ZZi8b5uk+DfI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: 9a23:uhutQ23gBCvzYA0/0Tz17bxfGtgKdX/Nk17qBmygVm1Kb6G4GXuSwfYx
X-Talos-MUID: 9a23:sCoJkQQW4Vgeeus+RXTDmCNdMOw5zp2EGW0/z5Y3ipGPGD1JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897741"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id A0584180004BA;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 0751BCC8D0D; Thu, 19 Feb 2026 21:34:45 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 33/34] cve-update-nvd2-native: pycodestyle fixes
Date: Thu, 19 Feb 2026 21:34:42 -0800
Message-Id: <20260220053443.3006180-33-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231480

From: Niko Mauno <niko.mauno@vaisala.com>

Fixes following pycodestyle complaints:

  cve-update-nvd2-native.bb:95:54: E712 comparison to True should be 'if cond is True:' or 'if cond:'
  cve-update-nvd2-native.bb:127:15: E211 whitespace before '('
  cve-update-nvd2-native.bb:127:17: E201 whitespace after '('
  cve-update-nvd2-native.bb:127:19: E201 whitespace after '('
  cve-update-nvd2-native.bb:127:44: E202 whitespace before ')'
  cve-update-nvd2-native.bb:127:46: E203 whitespace before ','
  cve-update-nvd2-native.bb:174:20: E401 multiple imports on one line
  cve-update-nvd2-native.bb:183:29: E203 whitespace before ':'
  cve-update-nvd2-native.bb:236:16: E111 indentation is not a multiple of 4
  cve-update-nvd2-native.bb:241:16: E111 indentation is not a multiple of 4
  cve-update-nvd2-native.bb:336:39: E222 multiple spaces after operator

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 680428ab19860417e6bee6a57ccf2e25ddbaa4cb)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1411d16e20..abcbcffcc6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -92,7 +92,7 @@ python do_fetch() {
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
 
-    if update_db_file(db_tmp_file, d, database_time) == True:
+    if update_db_file(db_tmp_file, d, database_time):
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
     else:
@@ -124,7 +124,7 @@ def cleanup_db_download(db_tmp_file):
         os.remove(db_tmp_file)
 
 def nvd_request_wait(attempt, min_wait):
-    return min ( ( (2 * attempt) + min_wait ) , 30)
+    return min(((2 * attempt) + min_wait), 30)
 
 def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
@@ -171,7 +171,8 @@ def update_db_file(db_tmp_file, d, database_time):
     """
     Update the given database file
     """
-    import bb.utils, bb.progress
+    import bb.progress
+    import bb.utils
     import datetime
     import sqlite3
     import json
@@ -180,7 +181,7 @@ def update_db_file(db_tmp_file, d, database_time):
     conn = sqlite3.connect(db_tmp_file)
     initialize_db(conn)
 
-    req_args = {'startIndex' : 0}
+    req_args = {'startIndex': 0}
 
     incr_update_threshold = int(d.getVar("CVE_DB_INCR_UPDATE_AGE_THRES"))
     if database_time != 0:
@@ -233,12 +234,12 @@ def update_db_file(db_tmp_file, d, database_time):
             per_page = data["resultsPerPage"]
             bb.note("Got %d entries" % per_page)
             for cve in data["vulnerabilities"]:
-               update_db(conn, cve)
+                update_db(conn, cve)
 
             index += per_page
             ph.update((float(index) / (total+1)) * 100)
             if index >= total:
-               break
+                break
 
             # Recommended by NVD
             time.sleep(wait_time)
@@ -333,7 +334,7 @@ def update_db(conn, elt):
     accessVector = None
     vectorString = None
     cveId = elt['cve']['id']
-    if elt['cve'].get('vulnStatus') ==  "Rejected":
+    if elt['cve'].get('vulnStatus') == "Rejected":
         c = conn.cursor()
         c.execute("delete from PRODUCTS where ID = ?;", [cveId])
         c.execute("delete from NVD where ID = ?;", [cveId])

