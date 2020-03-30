Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.45906.1585557246555022495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 01:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=O0H9HIeb;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3080; q=dns/txt; s=axis-central1;
  t=1585557246; x=1617093246;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JL60vwyzcc1Pyfgw/kaXXrneZNADv9BX+vR0/7N4SoQ=;
  b=O0H9HIebRyhBtmv+pFHnUY4Hyku3oBIM794dNCHRt4V6qZbjPH/pcVQs
   +56GR9YfmjCA13SfnfHPT121930k4jM48IomBjeIBt0OCGzRvh+b8C9A+
   Vf7FAHnMRm+iQo0r1NEuF002FVyx7MF55AGxTLm1LMOe1PeqTAWk536V9
   tGSaN2odBTJhRXbBrfjHng5P/inyYbWpJvBhCUAtOUrdDgt+bCXCUkPBF
   VLA1RuMYcnd7zRdjM63rdk+Xmfn5ahYjLR6NSQdInAMxmW9Pi0vRGFPVy
   lJY60jDY/kuVGuj8fpVa3K0l6XdypuU79J+3hojkbDOjNNEKWv3O7w1ww
   Q==;
IronPort-SDR: FYCGO3pdyHeOJfWWCuLn8mQUhEwnmwhHqD+2oPOWdtbbi9ms07pajvkHSOtjEDJtYG57MLJGZh
 M+QEwO2Lyt7KStlE/CCTQuWR9rQY3t86lf60wmmsUrxw4KklwWk9ulFKG/AjnlfZFFA2F1q7cH
 GWrmGT4WVLTsUsXKJjh2+Tezdo3H5NX4/IG7O6Q4x6GUhEpMd5h9RZ6LlJ7Cohr4T596KQ/pdH
 UFraVqk5XBOE54mNlRg5Fnx+vqVDqLyLI8YkXMsAsGeG4N6hTzvj2p43nyeVq7x35xf+8Ue47P
 9mc=
X-IronPort-AV: E=Sophos;i="5.72,323,1580770800"; 
   d="scan'208";a="6893070"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] prservice.py: Use "with" to control file handle lifetime
Date: Mon, 30 Mar 2020 10:33:51 +0200
Message-ID: <20200330083351.18212-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/prservice.py | 65 ++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index b1132ccb11..fcdbe66c19 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -79,41 +79,40 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     df = d.getVar('PRSERV_DUMPFILE')
     #write data
     lf = bb.utils.lockfile("%s.lock" % df)
-    f = open(df, "a")
-    if metainfo:
-        #dump column info 
-        f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver']);
-        f.write("#Table: %s\n" % metainfo['tbl_name'])
-        f.write("#Columns:\n")
-        f.write("#name      \t type    \t notn    \t dflt    \t pk\n")
-        f.write("#----------\t --------\t --------\t --------\t ----\n")
-        for i in range(len(metainfo['col_info'])):
-            f.write("#%10s\t %8s\t %8s\t %8s\t %4s\n" % 
-                    (metainfo['col_info'][i]['name'], 
-                     metainfo['col_info'][i]['type'], 
-                     metainfo['col_info'][i]['notnull'], 
-                     metainfo['col_info'][i]['dflt_value'], 
-                     metainfo['col_info'][i]['pk']))
-        f.write("\n")
+    with open(df, "a") as f:
+        if metainfo:
+            #dump column info
+            f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver']);
+            f.write("#Table: %s\n" % metainfo['tbl_name'])
+            f.write("#Columns:\n")
+            f.write("#name      \t type    \t notn    \t dflt    \t pk\n")
+            f.write("#----------\t --------\t --------\t --------\t ----\n")
+            for i in range(len(metainfo['col_info'])):
+                f.write("#%10s\t %8s\t %8s\t %8s\t %4s\n" %
+                        (metainfo['col_info'][i]['name'],
+                         metainfo['col_info'][i]['type'],
+                         metainfo['col_info'][i]['notnull'],
+                         metainfo['col_info'][i]['dflt_value'],
+                         metainfo['col_info'][i]['pk']))
+            f.write("\n")
 
-    if lockdown:
-        f.write("PRSERV_LOCKDOWN = \"1\"\n\n")
+        if lockdown:
+            f.write("PRSERV_LOCKDOWN = \"1\"\n\n")
 
-    if datainfo:
-        idx = {}
-        for i in range(len(datainfo)):
-            pkgarch = datainfo[i]['pkgarch']
-            value = datainfo[i]['value']
-            if pkgarch not in idx:
-                idx[pkgarch] = i
-            elif value > datainfo[idx[pkgarch]]['value']:
-                idx[pkgarch] = i
-            f.write("PRAUTO$%s$%s$%s = \"%s\"\n" % 
-                (str(datainfo[i]['version']), pkgarch, str(datainfo[i]['checksum']), str(value)))
-        if not nomax:
-            for i in idx:
-                f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
-    f.close()
+        if datainfo:
+            idx = {}
+            for i in range(len(datainfo)):
+                pkgarch = datainfo[i]['pkgarch']
+                value = datainfo[i]['value']
+                if pkgarch not in idx:
+                    idx[pkgarch] = i
+                elif value > datainfo[idx[pkgarch]]['value']:
+                    idx[pkgarch] = i
+                f.write("PRAUTO$%s$%s$%s = \"%s\"\n" %
+                    (str(datainfo[i]['version']), pkgarch, str(datainfo[i]['checksum']), str(value)))
+            if not nomax:
+                for i in idx:
+                    f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
     bb.utils.unlockfile(lf)
 
 def prserv_check_avail(d):
-- 
2.21.1

