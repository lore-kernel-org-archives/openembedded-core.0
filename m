Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28D1E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:25 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.21475.1733334918760765046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iOgX5V4A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724f383c5bfso80678b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334918; x=1733939718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfzWDQuldLBRV/426rQRCXomSc0p8wOJ3mkhF9+GmKM=;
        b=iOgX5V4AL3Geo6mfbqGWRV3TF+kODrtAUbeC/JyxGv0A1UmWdIue9z6egXkmf+sQt8
         mfJ28JTPhuEQ+vosCwUHusBJLzs6YLBtRWAyO8M2NnYq3w0+rY+13kGurJAwQVlIDvWl
         eLZq4TyYVeiKazCleeBCx6uOTiUgodLLnhbALfqmMQox2q4eBu2kbS+adSb0qXWYbBBV
         6rddq6QGKc9WasPc8jaunxK1YUm4S2IqkRfYpd1Jc2ERTyvyDaL3U623BcJ3BrhcnKaQ
         TU0Jzj+pIDxzxwxq/yxCzqoR7NbqDv4MiULToeEd0vJS6HiERYvbCnf8iMXj6nioABsO
         lOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334918; x=1733939718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfzWDQuldLBRV/426rQRCXomSc0p8wOJ3mkhF9+GmKM=;
        b=RFVBDT7DEQTjoC+O38cMwmeW6lCUxTV73YkE6W/jd/XFXIGx1ASSSzuLlhiE+nVa9+
         lNcl/rFwg1ztEvG/ZFrg9WrLnPUH663N+LUma9AN5HazuM89Oyd8LzSiN1tbp2JDNrj7
         Dgp4uafCdAjMrCIPoWqjsgobwlp+SP0lVJl9KK7ekH6MfDzJitGygPl2zr/pn5lj3Y0o
         mDdpO5eqdn4oTU/L5gAcmBUSPkI89an7n3nfTD8ZOoJRzi2AlfeCnQhl8GXs7CXT1a28
         ADvESTMF7TG1d2XFZj5jjL/U9rboiT4EX62LFuT527Rv3loplQec2Xv1QIQmfSu9hb1t
         UjAg==
X-Gm-Message-State: AOJu0Yx+sg429gWRtdBmkO6B5HqbuUd4i/OaM52VNLpC7nv/BG9zUn98
	pyt6Z1cVNFySNaN8bmcxiLCJK71EkSSRqFOyp2WL20j42M7t6OP5eHtNwOyqYoC0cRKM2rxYy0u
	W
X-Gm-Gg: ASbGncvmwQCvODWK9MRgVk+t2zooNFC0x+WCqanlFEd5YcLWo/+NcMGDgC6F6ujFEUe
	MrywGuej/AvZzRkPodEda9pTWmQzZOadM+k/0TQwxGlW9ezHsXbqPF9XaJ97ZZOb9VNOqF2UXoo
	oxZQ499qWdZgXNvfDWTiLjKM0H0jq2mTowgZg0EVNNIUQawVL4hvLwZGXDyuaI4yIASPzSjx+PG
	BfVpE+jjVZCMMWk/ii/YpTv95y2KyLw4Cm359M=
X-Google-Smtp-Source: AGHT+IGp9xgQEfei7mmE3eXuE6eIeK/Hh7sYVCb0v/l51O7xfVY7IUFgGe6G2+LeeMImkhSv8k8Avw==
X-Received: by 2002:a05:6a00:ad2:b0:724:e582:19fd with SMTP id d2e1a72fcca58-72587ee6238mr8464865b3a.3.1733334918049;
        Wed, 04 Dec 2024 09:55:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 37/38] resulttool: Trim the precision of duration information
Date: Wed,  4 Dec 2024 09:54:04 -0800
Message-Id: <4ec9bb7e1a02de8223fb7485fc47cb43ad19093c.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208320

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


