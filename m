Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6574C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.151495.1703864711174988535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hJHUTuNM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d41bb4da91so20480035ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864710; x=1704469510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+uJBknzDmZkNjlX0pZNKihcgnVYJNvejS70nKCImUI=;
        b=hJHUTuNMTZ0F0HWTvkBoQLgj1wTSEP25HsAHxmXd7DeDMqXkYot8Sx+/tISuElaGnZ
         D3x3qzjSiC2/J5CAIJ90gcC8G9MkalNWF15KULI0Fh5Tp2+pH+PyCf3CqeVc78lFoxKk
         B3XfLKYfPDO74kORVzrDTovFPrSj16szQCUA35xuk6zwUs3MA3Ey1VxmJMdBEeQupCrE
         XcLw7RFX1btXPZpqKSW4iOYYxVjLUUqHk4sot8V2lySoWdBwLanf5lOR9lnv3zWNrwZ+
         /1dg5Bt8gnX86egIW9DnBmPkLibhy1QAjxOTH4k6WDDL7ZFbVIVWWkLv0AWTlLKZC4KC
         P67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864710; x=1704469510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+uJBknzDmZkNjlX0pZNKihcgnVYJNvejS70nKCImUI=;
        b=SrkoO6LDANBZVmRQWqLNMhUnWg/PoZyXqZTgYBRQhHBKN0HHZ3JtfTNzvcq3aUSaKv
         NOfuzl5MnQtrstSQsV9VbMG3cAR/SPcIt2bE9RF0dMcQ6A5pVpd/UznYhPTkC2w7a8sG
         udrstsJ7mneQLPpHzQ+e5rVQaiM8fcC5dRB9tp5t6Kt4V7bfYx97whl+xCbAjBK+vqzU
         yC1KK+fw2tIS4VbACu9SiiOUdZYGpaNEXUelC8De68grhwz4U/qBfIv/hZUciZtLlPnP
         u6GO77owwe1pOtbTAi/FccYBIA08ODYgvopw75TWKFZ2bfScWcRSX2AyPuLDHI2wmZ9+
         zAbA==
X-Gm-Message-State: AOJu0Yx2B4FLJoZvK/fqyOet8hsKTWaS0z2Egf9iukBCDHIjofKMy0b/
	JqIQh6W7lZ8ZX/6/aDnM5Sf6u5a/ksZ4DH2hypVtKkQMlVq5QA==
X-Google-Smtp-Source: AGHT+IHK6TmPxfbHNxcfW6+1ir+76J6Hd9EzG/vKTkZVuKJIl5bAVlMUdbjBw/UBN7DFD7jlEpan6A==
X-Received: by 2002:a17:903:2807:b0:1d3:f76b:e937 with SMTP id kp7-20020a170903280700b001d3f76be937mr4935598plb.23.1703864710284;
        Fri, 29 Dec 2023 07:45:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/41] cve-update-nvd2-native: increase the delay between subsequent request failures
Date: Fri, 29 Dec 2023 05:44:18 -1000
Message-Id: <d24b1ce8485615b9359c0d319c64eb7756492cf8.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193021

From: Dhairya Nagodra <dnagodra@cisco.com>

Sometimes NVD servers are unstable and return too many errors.
There is an option to have higher fetch attempts to increase the chances
of successfully fetching the CVE data.

Additionally, it also makes sense to progressively increase the delay
after a failed request to an already unstable or busy server.
The increase in delay is reset after every successful request and
the maximum delay is limited to 30 seconds.

Also, the logs are improved to give more clarity.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7101d654635b707e56b0dbae8c2146b312d211ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 941fca34c6..bfe48b27e7 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -114,7 +114,10 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
-def nvd_request_next(url, attempts, api_key, args):
+def nvd_request_wait(attempt, min_wait):
+    return min ( ( (2 * attempt) + min_wait ) , 30)
+
+def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
     Request next part of the NVD dabase
     """
@@ -143,8 +146,10 @@ def nvd_request_next(url, attempts, api_key, args):
             r.close()
 
         except Exception as e:
-            bb.note("CVE database: received error (%s), retrying" % (e))
-            time.sleep(6)
+            wait_time = nvd_request_wait(attempt, min_wait)
+            bb.note("CVE database: received error (%s)" % (e))
+            bb.note("CVE database: retrying download after %d seconds. attempted (%d/%d)" % (wait_time, attempt+1, attempts))
+            time.sleep(wait_time)
             pass
         else:
             return raw_data
@@ -195,7 +200,7 @@ def update_db_file(db_tmp_file, d, database_time):
 
         while True:
             req_args['startIndex'] = index
-            raw_data = nvd_request_next(url, attempts, api_key, req_args)
+            raw_data = nvd_request_next(url, attempts, api_key, req_args, wait_time)
             if raw_data is None:
                 # We haven't managed to download data
                 return False
-- 
2.34.1


