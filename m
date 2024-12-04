Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AF8E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:56 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.25434.1733344610385514888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nPC+5Yh4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7251abe0e69so263908b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344610; x=1733949410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfzWDQuldLBRV/426rQRCXomSc0p8wOJ3mkhF9+GmKM=;
        b=nPC+5Yh4xIKEPHMTW3LakiznniC33TxQ4N8N/1WDmIIAwR+LJrpf+nA6WVaxlryVHR
         w3QVHiX9sCeRcPzJclVxuFOFAZsczHbt/EAtg/Vuak0dnjgPHQEu5xAKuO3t561T9tDM
         vbG5HtRu+sf/Ux8zc0nzWmvxodTDqQBqrlKGTlg6ElaisGJIpBn11ee02xWOQRGvLYa/
         dUk64Xqg28zteHlBMyoPHRyWsRTNCeSaBcwC1tXpB1CuJepsZrzggH6rbd1Ihu6kdT2T
         J6m4TXOE+hRInz3hPSXOpdG6HYrlWVhotPbNnb0QzWcUSxzhLJU/bYS9MHvgvFcBqBQ+
         P/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344610; x=1733949410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfzWDQuldLBRV/426rQRCXomSc0p8wOJ3mkhF9+GmKM=;
        b=HanbJfPwOXDaAE35VsjGAmEZwwCLMW0GDZYYZxwthvGdWVLof48sop6qGsiO78hrGT
         wsmspgJgHeLQKsktQG9aHsjuAMUosNR3pMndVHdrOyzvgjCB6KrUxJ+l7FI3eLdlIOFP
         7I1pncc4ZubmiAhQ8L3YGVmsglgOzxOwQOgqQvLgu0NWs2/ujx3a7g+iH2OFlMVL/mzK
         Ijh7faq3KxlhnmZ4NpV2OGoJ6WvGHK++Sxl5xa9NcEAz7Giqx97PbsZmA7i3/PN18zLK
         tUCJnn/0oKeWuDTa7Q76ZxNdaiWTbU0qoYC31L/JMBIXzMsX7nc8E/jHWiRZPgzkqYIG
         ZM1w==
X-Gm-Message-State: AOJu0YxP4IHtCIEnKvroYyoyilfov+8A+PY2Vpbqd9mx1hS0x1mGh2iU
	LKTPmo4UjvE5XWNF0JwEsp+qOCw+SPVNYS2loIFQTBXTQEPtn15yiOjUSrmhX5+jSmAHgmtzF9h
	O
X-Gm-Gg: ASbGncsIwbP9gHDTPKHJHnTu8QLe/SC7Xoms8qRY5uL1R0vfRbZsN8KZc/+ogvzTa1u
	bKz7FEAbdqYCTSlD9oedth9EYryIJMwPmqFFnN2+6xkCZBXlu4smQmzFqpDStSLuToENRUIWY5V
	HKmx5WwXglbPhfK7iG7/N6cny5Rodj/qCbqbFc8JBQzWjWXQV3zx6tZeQjI7mX3YiICrKtrW+95
	mesC6BppVRgMsq1ngIbuBZ8YQIzCR3ixos+e7s=
X-Google-Smtp-Source: AGHT+IHB5TcOJQlfFu0LoGAYq/k7bTBrXDjVYKeIs8qgNtnbdZ155HijQoyRbaZEvCjtdqqw8mi47Q==
X-Received: by 2002:a05:6a00:1895:b0:725:a65:d194 with SMTP id d2e1a72fcca58-7257fa74964mr9757073b3a.14.1733344609678;
        Wed, 04 Dec 2024 12:36:49 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/15] resulttool: Trim the precision of duration information
Date: Wed,  4 Dec 2024 12:36:21 -0800
Message-Id: <7460a4bb50c696c39add79c2b299b5e636532b8c.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208342

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


