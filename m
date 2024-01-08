Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFE7C47258
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:14:58 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.869.1704730491260465463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iD266wHp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cd8667c59eso1436720a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704730490; x=1705335290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqXIqU+PRG4O6z9Gvq8AUakeAfM/VJmEo6BgkeV5+1I=;
        b=iD266wHpmNh2uMGOOftVkgBoa94cQM7lqUAVXcKjtqmHGBgA8rRH4ij3ZGXUMB+KnT
         JhPUZrSRFTTE+yZB2tdSCc7Ud0pyT98zovfKtq79eNJeYzhtTRTC+dJWh0IBxzgJaS95
         Zw6Ww+PrBfg0uJXlqWMGxwBznzKmSFwdj/34NL9F2dAVmZsfBE4lv1T73Ku1E3hXBs/r
         HbEyBgSAAQWdkdSfETnuDWk/A8Y0yG8QoL0NeyohwtlpggizRc9q9AH7UUZovjaD6FPL
         0elRdFSjrnkTpvOcEoMdqyMSirLaYv7ylMuYoibC5hcHKNiUy5MkPjcUYb1ldDJAZcR8
         V5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730490; x=1705335290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqXIqU+PRG4O6z9Gvq8AUakeAfM/VJmEo6BgkeV5+1I=;
        b=XUo+DWji/SjdM287VF/zztpFh6dF6W+pnMWdum5RnYQ7p+iflcIOPqArnuhXExvZ1X
         LeMJFzRcayoY7//E1M8/69jYp1iVGL5V5QU3a41uzcKLgkq5P+243YsmW22zBIJLaMgN
         qAv1fu/jg3Chqifmit9toMSsJ84CslwMy9+RLXpGwmjfNhX9KsyOd5pBDHI6q8Ru0FTC
         Le9jvpPQawYHeAFdHbj3Bz5iMJUe5IkdNue7UBUatPORyhiFBOAqNexYdAa+NlgfpJi0
         ADJG9iLsQLwqEczn6XuiDjRt/Y6V51pw5gqNv2N+GevBF3XD3Q5p4IxA8EJMt0SU+exS
         BYDA==
X-Gm-Message-State: AOJu0YwAdLKcbKhSNGEETdhjcV4SMNSN0PhlmGrNPaaKpiWLokrU8/xM
	zutHu6KM1zExUhJcpYuFEx0GwzduZWrAweCs8hmLaqmyAEgfVA==
X-Google-Smtp-Source: AGHT+IGXyZ2TSuL55kR/0d7fyLJVMpJfGUbLBO6CX6WJ3tLpx1kcllGz4HU+88mQJy9/rVgHUpJQ3Q==
X-Received: by 2002:a05:6a21:1a9:b0:199:a11d:921b with SMTP id le41-20020a056a2101a900b00199a11d921bmr2933614pzb.45.1704730490002;
        Mon, 08 Jan 2024 08:14:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a11-20020aa78e8b000000b006da14f68ac1sm45753pfr.198.2024.01.08.08.14.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:14:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] cve-update-nvd2-native: increase the delay between subsequent request failures
Date: Mon,  8 Jan 2024 06:14:31 -1000
Message-Id: <22e0d7db5886fba845f0d15b96aae99687bed944.1704730354.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704730354.git.steve@sakoman.com>
References: <cover.1704730354.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193420

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
index 0a8b6a8a0a..69ba20a6cb 100644
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


