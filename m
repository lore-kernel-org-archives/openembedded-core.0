Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B17BE77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.25634.1733345146712655733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fy+C1EQG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cf3e36a76so1520885ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345146; x=1733949946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfzWDQuldLBRV/426rQRCXomSc0p8wOJ3mkhF9+GmKM=;
        b=fy+C1EQG6h8Pcn9HYK+1N8J0f444jhVuTlDHN4MqsQeTIBofetv97BWzfCdJRsgLwq
         /0qZ8KjgQV7gRQBlWDQWlVq1s+wexdaSBiEZtme5yHkxPd5zXo9pT4YliQP4wAZdpdBV
         Jzk/ef3Hxc3JhZs3EWNNgvzJ52cSg8nS5JDv5kO63l6hsH/xiQDbyPvfWFvCQwMuMxA/
         koWte2B1SpOhGWKQeqJA5UPR8AN2arySIS8VGSj/0taAvXRg6F3Ctf5aaxt0j08nW23+
         YEeWxFEYqw5yEfjFaIkVWmw93wMvMjeFOpja1PqyyDm+q4CVgt60AS5ukWd1/iFZrGFu
         1lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345146; x=1733949946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfzWDQuldLBRV/426rQRCXomSc0p8wOJ3mkhF9+GmKM=;
        b=YjAw5KdyQeuboWlitwkDd7lcDnY5IKEYTUv2CeyP1O832y1mtucYR9Xpxz/6GUBjZz
         0ZOy48sJPfaqaMgw64EXMUz72k9uvUQqtg+EYdoTk/6oNMkQU76EqcsWwdmDq/E/ZXjl
         mgqw8UgbGe2GkFF9lB8mHDynB8//p6qVw4gBJ1DH/N3XDnPxTZ+LIZXdjDKoWnXqC+jf
         QL7vOOtJreuorQjH7I7/TMMyrCa8wKPQ26CMFfRw4c0kFBi8fvA9haC33Le5aDWdJipn
         O9bGvheOeoHp4CMFotNv1M+mlBDV5esVAtiHDu/8OPFWc37WrbLMStHRwPs6Vxib5vsm
         Nq4g==
X-Gm-Message-State: AOJu0YxceIu2LnP2LADUGx2DEoRmixXIp0ilWPNPaRkVtneWl1L12w7W
	aj/EVaEDHQAZQzZAuX+ZvrlzuF8wjXWDK1gZmtm8HKWF5GdmVi20jUodtiUt5MGiZcmExYjIH0y
	b
X-Gm-Gg: ASbGncuZNcF4dZraTzcKcWeKZx/ce2tf6ERP9p/4WoRwZU6abKtb0qbEDFMVbMz7hou
	b6V7T6spkTGxnDcp9Seg9IKMmGHOnTcQ2lzphlbZFrnZ1fhoHaq1o4E3Xeahq0Shcdo8fm007t8
	BztolP7NK/6RvNmgiWG5HAtj1A4cHyfuZgB1WfOslpANAS70NXhbPamUVh4VceBfeGSZgUTzWhQ
	Q8dPsIbjIpg+SJHcGm3s4ryBqBCdItK6yWdKMQ=
X-Google-Smtp-Source: AGHT+IE0w63TX9AQbp2CFDdl8RW49sISJ0+87DoI0GHX2jpj6OwLm9LGQVflbau4bLIz8fCw5XK+zg==
X-Received: by 2002:a17:902:d2c7:b0:215:b18d:e1 with SMTP id d9443c01a7336-215bcfc2ab1mr136505385ad.24.1733345146036;
        Wed, 04 Dec 2024 12:45:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 13/14] resulttool: Trim the precision of duration information
Date: Wed,  4 Dec 2024 12:45:22 -0800
Message-Id: <7a95226404e41e878858afcc383d26fb534ccf16.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208357

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The duration values have pointless amounts of precision. Removing some of the
least significant digits reduces result size and makes the results easier to read.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a789a2e6d97bb8efd663226a17db8d1ca6c1e40f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 9cba8639a3..760e426de0 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -131,6 +131,22 @@ def strip_logs(results):
                     del newresults[res]['result']['ptestresult.sections'][i]['log']
     return newresults
 
+# For timing numbers, crazy amounts of precision don't make sense and just confuse
+# the logs. For numbers over 1, trim to 3 decimal places, for numbers less than 1,
+# trim to 4 significant digits
+def trim_durations(results):
+    for res in results:
+        if 'result' not in results[res]:
+            continue
+        for entry in results[res]['result']:
+            if 'duration' in results[res]['result'][entry]:
+                duration = results[res]['result'][entry]['duration']
+                if duration > 1:
+                    results[res]['result'][entry]['duration'] = float("%.3f" % duration)
+                elif duration < 1:
+                    results[res]['result'][entry]['duration'] = float("%.4g" % duration)
+    return results
+
 def handle_cleanups(results):
     # Remove pointless path duplication from old format reproducibility results
     for res2 in results:
@@ -194,6 +210,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         resultsout = results[res]
         if not ptestjson:
             resultsout = strip_logs(results[res])
+        trim_durations(resultsout)
         handle_cleanups(resultsout)
         with open(dst, 'w') as f:
             f.write(json.dumps(resultsout, sort_keys=True, indent=1))
-- 
2.34.1


