Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09822C54F9B
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32339.1771565686650014442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dfyBZjoy;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7348; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AX7kXvadqDLRhFf5yZdubNq47Rl/Du14En8hVLayhqE=;
  b=dfyBZjoyuoN1ilUT9Sv7APx1NuUfuCsjAuJuoKwTDtiYVc4Xdq+Xu1fg
   Yiy0OjeugydBEEWMMKTgKzzZXcg4O9Myy5cvY6KNc6klnfhtTBUFXdx8V
   l8w51Tu1wmK9Z927cc6IPHH8XghlwrGC6UcBGO+AuBuY2tCWlhojrgEiu
   GCatRHph/sx/V3dvM0rAUGgPTIMX/MJXtFLKw9km/m2m1J4Ms6yHS9+/z
   D9r30ppcaxduLBmcNiU2SVtDivYeScwPTVf5fLQ3RbxBF7RWQQCigPJ8/
   ebWRnxz4lTMfuFikOMTQjFQ8tbT7I3ftv58gRw87rl77gDX8AK+z+yTTJ
   Q==;
X-CSE-ConnectionGUID: jiQxOEnxSqefmM+Cy3m17A==
X-CSE-MsgGUID: kQXBsv8UTH2/RogNfJ+hlA==
X-IPAS-Result: =?us-ascii?q?A0AFBgBB8Zdp/5H/Ja1aglmCSA9xX0JJA5ZIA4tklDUPA?=
 =?us-ascii?q?QEBD0QNBAEBhEFGAo0fAiY3Bg4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgFGECAxIAsrGYMCAYI6AzYCAREGpm4aN4Isg?=
 =?us-ascii?q?QGEfNhHDYJSAQsUAYE4hTyCeYUgawmEeicbG4FygRWDaIIfQgKIJASCIoEOg?=
 =?us-ascii?q?wuFVgaEW4YNSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFgkKFE?=
 =?us-ascii?q?Q+JBXhugSCBGwMLGA1IESw3FBsEPm4Hji8/gjQtThMsgX0SLgI7kmAHHRcHC?=
 =?us-ascii?q?QORZhKBNZ5ocQoog3SMHo8+hXwaM4QEgVeSPpJSmQaCWIheglOECZF3GTeEa?=
 =?us-ascii?q?IF+JkaBE3AVgyIJSRkPjl+CHYElgX+4WSI1AgEQKQIHCwEBAwmTB2ABAQ?=
IronPort-Data: A9a23:zX+n4KM4z3sQ0GjvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUolhTdTz
 GQZC2vQaa2MN2uhLdoiO96wpEpSsJHUytJhQHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZgf/gWYsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/dvNVEREIsIwf96D2Rrt
 tcJczVUMTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMXwsYDUXUrsTIJIzgP+hmlH0ciZTrxSeoq9fD237klMogOmyb4aNEjCMbcZsrmyDu
 DL7w0SjRSsdO/qR63mF9lv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:FuDwx6mhgUGwrn05CL/SIvk7GlLpDfIr3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYsS4/izPIaurJB7K8gcaVuds=
X-Talos-CUID: 9a23:YVsGgG3B480/bZQHzNO0oLxfGMEcYlrwymfrOkK2DEMqY6zOTAbP0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3ApqTstg/2yOcotdaZIDP9GlqQf8RR0461FhAwrbV?=
 =?us-ascii?q?c/PODOgp+GXSdiB3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897740"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 863C1180001C1;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id B04DACC8D04; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 19/34] cve-update-db-native: add the fkie source
Date: Thu, 19 Feb 2026 21:34:28 -0800
Message-Id: <20260220053443.3006180-19-hetpat@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231475

From: Marta Rybczynska <rybczynska@gmail.com>

Add support for FKIE-CAD reconstruction of NVD feed from
https://github.com/fkie-cad/nvd-json-data-feeds

We download this feed directly from github releases.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6253ac8189db09fbe87141aca1733cb37a4d78f)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 126 ++++++++++++++++--
 1 file changed, 113 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 3a9d43943c..792252f510 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -12,6 +12,8 @@ deltask do_install
 deltask do_populate_sysroot
 
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+FKIE_URL ?= "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download/CVE-"
+
 # CVE database update interval, in seconds. By default: once a day (24*60*60).
 # Use 0 to force the update
 # Use a negative value to skip the update
@@ -109,6 +111,30 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
+def db_file_names(d, year, is_nvd):
+    if is_nvd:
+        year_url = d.getVar('NVDCVE_URL') + str(year)
+        meta_url = year_url + ".meta"
+        json_url = year_url + ".json.gz"
+        return json_url, meta_url
+    year_url = d.getVar('FKIE_URL') + str(year)
+    meta_url = year_url + ".meta"
+    json_url = year_url + ".json.xz"
+    return json_url, meta_url
+
+def host_db_name(d, is_nvd):
+    if is_nvd:
+        return "nvd.nist.gov"
+    return "github.com"
+
+def db_decompress(d, data, is_nvd):
+    import gzip, lzma
+
+    if is_nvd:
+        return gzip.decompress(data).decode('utf-8')
+    # otherwise
+    return lzma.decompress(data)
+
 def update_db_file(db_tmp_file, d):
     """
     Update the given database file
@@ -119,6 +145,7 @@ def update_db_file(db_tmp_file, d):
 
     YEAR_START = 2002
     cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
+    is_nvd = d.getVar("NVD_DB_VERSION") == "NVD1"
 
     # Connect to database
     conn = sqlite3.connect(db_tmp_file)
@@ -129,9 +156,7 @@ def update_db_file(db_tmp_file, d):
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
             bb.debug(2, "Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
-            year_url = (d.getVar('NVDCVE_URL')) + str(year)
-            meta_url = year_url + ".meta"
-            json_url = year_url + ".json.gz"
+            json_url, meta_url = db_file_names(d, year, is_nvd)
 
             # Retrieve meta last modified date
             try:
@@ -140,7 +165,7 @@ def update_db_file(db_tmp_file, d):
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e)
                 import socket
-                result = socket.getaddrinfo("nvd.nist.gov", 443, proto=socket.IPPROTO_TCP)
+                result = socket.getaddrinfo(host_db_name(d, is_nvd), 443, proto=socket.IPPROTO_TCP)
                 bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in result)))
                 return False
 
@@ -168,7 +193,7 @@ def update_db_file(db_tmp_file, d):
                 try:
                     response = urllib.request.urlopen(json_url, timeout=cve_socket_timeout)
                     if response:
-                        update_db(conn, gzip.decompress(response.read()).decode('utf-8'))
+                        update_db(d, conn, db_decompress(d, response.read(), is_nvd))
                     conn.execute("insert or replace into META values (?, ?)", [year, last_modified]).close()
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
@@ -200,16 +225,22 @@ def initialize_db(conn):
 
         c.close()
 
-def parse_node_and_insert(conn, node, cveId):
+def parse_node_and_insert(conn, node, cveId, is_nvd):
     # Parse children node if needed
     for child in node.get('children', ()):
-        parse_node_and_insert(conn, child, cveId)
+        parse_node_and_insert(conn, child, cveId, is_nvd)
+
+    def cpe_generator(is_nvd):
+        match_string = "cpeMatch"
+        cpe_string = 'criteria'
+        if is_nvd:
+            match_string = "cpe_match"
+            cpe_string = 'cpe23Uri'
 
-    def cpe_generator():
-        for cpe in node.get('cpe_match', ()):
+        for cpe in node.get(match_string, ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 = cpe.get('cpe23Uri')
+            cpe23 = cpe.get(cpe_string)
             if not cpe23:
                 return
             cpe23 = cpe23.split(':')
@@ -260,9 +291,9 @@ def parse_node_and_insert(conn, node, cveId):
                     # Save processing by representing as -.
                     yield [cveId, vendor, product, '-', '', '', '']
 
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator()).close()
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator(is_nvd)).close()
 
-def update_db(conn, jsondata):
+def update_db_nvdjson(conn, jsondata):
     import json
     root = json.loads(jsondata)
 
@@ -297,8 +328,77 @@ def update_db(conn, jsondata):
 
         configurations = elt['configurations']['nodes']
         for config in configurations:
-            parse_node_and_insert(conn, config, cveId)
+            parse_node_and_insert(conn, config, cveId, True)
+
+def update_db_fkie(conn, jsondata):
+    import json
+    root = json.loads(jsondata)
+
+    for elt in root['cve_items']:
+        if not 'vulnStatus' in elt or elt['vulnStatus'] == 'Rejected':
+            continue
+
+        if not 'configurations' in elt:
+            continue
+
+        accessVector = None
+        vectorString = None
+        cvssv2 = 0.0
+        cvssv3 = 0.0
+        cvssv4 = 0.0
+        cveId = elt['id']
+        cveDesc = elt['descriptions'][0]['value']
+        date = elt['lastModified']
+        try:
+            for m in elt['metrics']['cvssMetricV2']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv2 = m['cvssData']['baseScore']
+        except KeyError:
+            cvssv2 = 0.0
+        try:
+            for m in elt['metrics']['cvssMetricV30']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv3 = m['cvssData']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv3 = 0.0
+        try:
+            for m in elt['metrics']['cvssMetricV31']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv3 = m['cvssData']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv3 = 0.0
+        try:
+            for m in elt['metrics']['cvssMetricV40']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv4 = m['cvssData']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv4 = 0.0
 
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
+
+        for config in elt['configurations']:
+            # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
+            for node in config["nodes"]:
+                parse_node_and_insert(conn, node, cveId, False)
+
+
+def update_db(d, conn, jsondata):
+    if (d.getVar("NVD_DB_VERSION") == "FKIE"):
+        return update_db_fkie(conn, jsondata)
+    else:
+        return update_db_nvdjson(conn, jsondata)
 
 do_fetch[nostamp] = "1"
 

