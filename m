Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web10.2097.1626168246802060718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 02:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=hFIve4tA;
 spf=temperror, err=temporary DNS error (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1626168245; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c5+tT9w6Ixy5M4qQt7uNxo+6NgB9TnYkuNlNKUWZAGMoinpTpOAS6/ithObYCJmjpDI5wzaVHt1dN9Tajk4w04Fgx+Tk4CjKbJXCaTARcfA/1Fn4glrCwY4EIwt5SVr6mtPKpQNZobpKGNTNO8NuVsOTyuSPP+SwULd2eH8xzm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626168245; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=WEiGqZI3elYpoUAgUHADHiarUDkukVd21Jl/AR/sEdo=; 
	b=QUg6kMqj3P/mFJLc4LG9GJYrStH6x/1G48ixicSlabOC7PsBJ04lPBH+J4w++EmdnzLEQP/OLVSZs5Wsh2ATiz2zWsanv5VdzIAZklpYp+nkeJTBV8b3z9hTO/ES3QfTAb6xcbXO+a59mJJ5hajDsK8gCR28GHlG+PiSTAeEDgE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626168245;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=WEiGqZI3elYpoUAgUHADHiarUDkukVd21Jl/AR/sEdo=;
	b=hFIve4tA5WkzCGbk9sxhWPVGpLovqr26AELtw5BVo7gDX2BnjcQTMbP2XfwnazYM
	9uhY8W93uNKROS07VSGVeuZLBBEF833llS1joHcIvoW0ZAdpqF/TlegnWlpn9wPxdTP
	n32q5nvti8JjK/0ogb3hxDpHog7EGz4OZPew5rsc=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 162616824249230.94701268532924; Tue, 13 Jul 2021 02:24:02 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Cc: Adam Romanek <romanek.adam@gmail.com>
Subject: [PATCH] report-error: Mask AWS credentials to avoid leaking them
Date: Tue, 13 Jul 2021 11:22:42 +0200
Message-Id: <20210713092242.754717-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

From: Adam Romanek <romanek.adam@gmail.com>

Removes potentially presonal information from error reports.

Signed-off-by: Adam Romanek <romanek.adam@gmail.com>
Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 meta/classes/report-error.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index de48e4ff0f..c17e7e2851 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -38,6 +38,15 @@ def get_conf_data(e, filename):
                     jsonstring=jsonstring + line
     return jsonstring
 
+def errorreport_maskvars(e, logdata):
+    origenv = e.data.getVar("BB_ORIGENV", False)
+    vars_to_mask = ("TOPDIR", "TMPDIR", "AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY")
+    for var_name in vars_to_mask:
+        var_value = e.data.getVar(var_name, True) or (origenv and origenv.getVar(var_name, True))
+        if var_value:
+            logdata = logdata.replace(var_value, var_name)
+    return logdata
+
 python errorreport_handler () {
         import json
         import codecs
@@ -82,11 +91,7 @@ python errorreport_handler () {
                 try:
                     with codecs.open(log, encoding='utf-8') as logFile:
                         logdata = logFile.read()
-                    # Replace host-specific paths so the logs are cleaner
-                    for d in ("TOPDIR", "TMPDIR"):
-                        s = e.data.getVar(d)
-                        if s:
-                            logdata = logdata.replace(s, d)
+                    logdata = errorreport_maskvars(e, logdata)
                 except:
                     logdata = "Unable to read log file"
             else:
-- 
2.31.1

