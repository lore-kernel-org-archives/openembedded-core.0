Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CE2E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.21230.1733334917409318544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z0D6plU0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7f4325168c8so41947a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334917; x=1733939717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnaZhybdWFaTCIToIn958yGf4orHlQ2sE8z/gLz75zU=;
        b=z0D6plU0PR3S/m8tk1YRqc4XE77AjgG6pfiXR7/lvATpVzAQuTIRib0vK314Ge5E+g
         VLwQ4xUK23FEgiPxc6RuANkT8Ct+is0Sk+ORKBBNDtB2ZkqXMgla69HxQ08HSVDwi+uP
         Xt5lvWAZmICvOlny0FTbn7lKYQNxeQKDtRqpHrnbpPYDvidq9GdeDGpvHdi9vBR9WnSN
         UWvXKaqfVBOxajFgWzy2AG/wjAfQRCmld3kgSiqX/BDs9SJ92Y9aggX5KYdkCMT6r5CL
         S1CGLHxeJWoUvszCvy+lxuh+zMOy3ckTF7Khno+W3bcjf8R0Id2+YEr3jTvRITEcC/p+
         nKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334917; x=1733939717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnaZhybdWFaTCIToIn958yGf4orHlQ2sE8z/gLz75zU=;
        b=Wf/gygOMI2vmtqXAUoUC9YtChKM4uSf8ANQ4oRpBWXEIqffAd/L1LNvReyib/HQX1y
         hlpJZYTicFHbO/frIhk5WobKKwg0Iceqnce+f0vKYOhm56I2/3ymDr7GMjTCpuuEogP7
         ocZh614JBt2QoTSNIcq11chk7XzPnqRbBSg/NkMWAgM7IdVm2G5UJ1D8EDXBu4iv0JUW
         DloSqnCAjmR5/UwF05Ysomnj57/JR4fIMaMr0fkMCjHe99608kDt/DoQMaxJqMd0ZlKS
         /Q8hW9dkmEkZ9h4Fm2fl2FEwgck7F8Gc1Eg4Doq89+hdWvCP14gdW/UfdtiBJZO3GeeS
         d0Yw==
X-Gm-Message-State: AOJu0YzGp4d2TRRUcVbsVg2fUZccto/sfW1a0nLt6WGejqSiN1V8EPSJ
	iS6d0yAN1BQc0f9OlPeimnGABUbu8X0m2htE+bchJNXpDsVPm/zkbMj5qjJl+6NNjFSGVj1RbsU
	d
X-Gm-Gg: ASbGncvfJJE1Xs+GwovZIxvI+d3gVwizhhG22oicRpc8YRIHgWqlmcHo5bO6vAi7n6a
	uhmDxUgWijCtdHL4sTBIQJw2QUstNJQVYBPFgFtPmiIZNiNYsHcABh9Zekt46DHIByucCOb0yuA
	3IQJ2ZU7SfPlcGeM7W+CuLdKwKoufbhT9uKcw69wIBzrA/3VZ4RCDUheRLUMmdcA3F88oufz73I
	NZ+mrVQRG+k7v5I+dpU3w6CGoFLCqe/KTUZ0ZU=
X-Google-Smtp-Source: AGHT+IHZlV++2VEuJsS+psZmCbnvhHKIo4XHtM8No75usczVDM23yiQRXSfr19HXcW7dPDKi3wys3Q==
X-Received: by 2002:a05:6a20:a110:b0:1dc:154a:81fa with SMTP id adf61e73a8af0-1e1653c598cmr12710119637.26.1733334916706;
        Wed, 04 Dec 2024 09:55:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 36/38] resulttool: Clean up repoducible build logs
Date: Wed,  4 Dec 2024 09:54:03 -0800
Message-Id: <cf1b4eb85ca3cb62c9746c6dc8f6dc9c4802c142.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208319

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've improved the data stored for reproduicible builds. Teach resulttool how
to apply those cleanups when reprocessing data so we can reduce results file
sizes and make the data easier to process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b799c57ae6d61c1b1c7035c8a2c4ba6ee08d1a81)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index b9b93afaa6..9cba8639a3 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -131,6 +131,27 @@ def strip_logs(results):
                     del newresults[res]['result']['ptestresult.sections'][i]['log']
     return newresults
 
+def handle_cleanups(results):
+    # Remove pointless path duplication from old format reproducibility results
+    for res2 in results:
+        try:
+            section = results[res2]['result']['reproducible']['files']
+            for pkgtype in section:
+                for filelist in section[pkgtype].copy():
+                    if section[pkgtype][filelist] and type(section[pkgtype][filelist][0]) == dict:
+                        newlist = []
+                        for entry in section[pkgtype][filelist]:
+                            newlist.append(entry["reference"].split("/./")[1])
+                        section[pkgtype][filelist] = newlist
+
+        except KeyError:
+            pass
+    # Remove pointless duplicate rawlogs data
+    try:
+        del results[res2]['result']['reproducible.rawlogs']
+    except KeyError:
+        pass
+
 def decode_log(logdata):
     if isinstance(logdata, str):
         return logdata
@@ -173,6 +194,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         resultsout = results[res]
         if not ptestjson:
             resultsout = strip_logs(results[res])
+        handle_cleanups(resultsout)
         with open(dst, 'w') as f:
             f.write(json.dumps(resultsout, sort_keys=True, indent=1))
         for res2 in results[res]:
-- 
2.34.1


