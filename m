Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880FEC369B4
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:33:53 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.36732.1744403631889852750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KXT1j/q7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7369ce5d323so2150733b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403631; x=1745008431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdDjzkGwECAFAs5DMFiRPzMyGQClDhMXtipjV03Ew68=;
        b=KXT1j/q7laN9aY4RwMekvtm+l7fKgEGBhnmQKuGqz1Z4JUQs49uvGS8XMOeXH1Xwhx
         h0aOBT22tKsWIgERUcTxKDZ+mcULz2i0THrS5O/wH42y1Kt4l2RQ3wymmJ/b7xITLe2s
         fUkdFmwIaBda/oc7mb3dj2PNy7gR4JBaQAVaLDkne94Bly1rSqin1J1Nb20j81P084GV
         z6ofa60xwZdidyElqJ++1vAPUFD4CAWAxRZeffhKjKc4KBhu66W3jLx2/3AXDbgrmGzy
         ue7n5b/zbbZWfk9MzdwOuOTPnkxYXgJlrH8l6PI+WYEnRQd/xJvrbE6Fo2ttjH9DbxXt
         sHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403631; x=1745008431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdDjzkGwECAFAs5DMFiRPzMyGQClDhMXtipjV03Ew68=;
        b=IXqy0e4YMzBobtmKusdyY6HeMy36DWGgoLkFTCKTaIyB9yNvEvIAzXaXSPA5TBDGX3
         oYxJ/PDOga0k35F24cHU1P/Vn2LZD/bTLR+TvodRPrBc1y1ksczQlSHU6vtm90ItitFJ
         QCvSOo+EDM67wNh/A0L4yJQGVP+jsZ7qJQC4O0TPiLdvlJpyNhW/UhS39IiIX9pQJbxz
         +sNIgb69CTEedtM3TH5gss3pRcA0/TY+IdN5aY4y2NnlYk2vyFNz3oKpPumuGAb7EgGP
         pCsS3K9wyxnpZCRQuRBn+RPVNdcl9KKcnOXRXh3nOwMXTK5slm9sJQqU8JoqDHrJHBJO
         tbHg==
X-Gm-Message-State: AOJu0Yyw43NTlfCG3t7xUxKpG7JKHeBzU/3eHT4pe4uas8ClLrDnr1/Y
	g5QXtbiCdsmZ6QJxzNAlegHtmRE+9sFjo8tQ5UfeRhJ47dpoJsZDf884tgIot/11LGDqOiqHmVb
	J
X-Gm-Gg: ASbGncspDZ7Blsa2HgMzlB0w3+ipX3I138cL9AGFTNRwUmwEXHVCX91tQv4YRsM2mGu
	zaibyGI2GCwzsC2yFyUMATo/mbeq20MYYW5+kSsKoZDemIzreo0aDXpFnarXN70PlNUocJ9R56w
	7owC2P4hf54PFvK4O6OoBnM0XJPnn+ukDmMJNOYkZIqPKSzZJGZnBs/3dWb1l8jq5/0N+atTl7r
	En8oT54NXE2FvsXbkBwbtRSh6+HotQZYCGH5aqv4tJO+CRQq4EBHEEbE/341O2g2nTAIFnul1vN
	wXRnqxVpllCtSPyOdaqt69GjudajxV6ipacodYh6tpQ=
X-Google-Smtp-Source: AGHT+IGVUHEh5ZrjCY2bikbvk1yugBYdKfdoFsUTOiYyzS8kN+UM2MvN+EpLrbPLrvkYubZddhrqYw==
X-Received: by 2002:a05:6a00:390a:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-73bd12a82dbmr5435192b3a.23.1744403630871;
        Fri, 11 Apr 2025 13:33:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.33.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:33:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] cve-update-nvd2-native: add workaround for json5 style list
Date: Fri, 11 Apr 2025 13:33:29 -0700
Message-ID: <4358fdfdd7a8908df98f7c4def2c8c1a6efb7256.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214756

From: Peter Marko <peter.marko@siemens.com>

NVD responses changed to an invalid json between:
* April 5, 2025 at 3:03:44 AM GMT+2
* April 5, 2025 at 4:19:48 AM GMT+2

The last response is since then in format
{
  "resultsPerPage": 625,
  "startIndex": 288000,
  "totalResults": 288625,
  "format": "NVD_CVE",
  "version": "2.0",
  "timestamp": "2025-04-07T07:17:17.534",
  "vulnerabilities": [
    {...},
    ...
    {...},
  ]
}

Json does not allow trailing , in responses, that is json5 format.
So cve-update-nvd2-native do_Fetch task fails with log backtrace ending:

...
File: '/builds/ccp/meta-siemens/projects/ccp/../../poky/meta/recipes-core/meta/cve-update-nvd2-native.bb', lineno: 234, function: update_db_file
     0230:            if raw_data is None:
     0231:                # We haven't managed to download data
     0232:                return False
     0233:
 *** 0234:            data = json.loads(raw_data)
     0235:
     0236:            index = data["startIndex"]
     0237:            total = data["totalResults"]
     0238:            per_page = data["resultsPerPage"]
...
File: '/usr/lib/python3.11/json/decoder.py', lineno: 355, function: raw_decode
     0351:        """
     0352:        try:
     0353:            obj, end = self.scan_once(s, idx)
     0354:        except StopIteration as err:
 *** 0355:            raise JSONDecodeError("Expecting value", s, err.value) from None
     0356:        return obj, end
Exception: json.decoder.JSONDecodeError: Expecting value: line 1 column 1442633 (char 1442632)
...

There was no announcement about json format of API v2.0 by nvd.
Also this happens only if whole database is queried (database update is
fine, even when multiple pages as queried).
And lastly it's only the cve list, all other lists inside are fine.
So this looks like a bug in NVD 2.0 introduced with some update.

Patch this with simple character deletion for now and let's monitor the
situation and possibly switch to json5 in the future.
Note that there is no native json5 support in python, we'd have to use
one of external libraries for it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e526327f5c9e739ac7981e4a43a4ce53a908945)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 99acead18d..74c780493d 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -231,6 +231,11 @@ def update_db_file(db_tmp_file, d, database_time):
                 # We haven't managed to download data
                 return False
 
+            # hack for json5 style responses
+            if raw_data[-3:] == ',]}':
+                bb.note("Removing trailing ',' from nvd response")
+                raw_data = raw_data[:-3] + ']}'
+
             data = json.loads(raw_data)
 
             index = data["startIndex"]
-- 
2.43.0


