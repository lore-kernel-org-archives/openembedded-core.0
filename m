Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E088CC369C1
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 20:52:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4855.1744750354777655443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 13:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bOUWjEGm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227b650504fso60105865ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744750354; x=1745355154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfbBE02/GYbGAop480tyacnnE52Ddmv7AQnbQ8fg4qg=;
        b=bOUWjEGmlYxiGIkzMDllNQwtyb1yineS+wbkw+qOANZxjLtyNKO0EGCszI2T4S/5Ds
         riA6NP4fRpwXLsdvXDuD4vR2R6yORqGnfagsRjJKJ5fp4pdo1grDSfuXw5gBRfVXt72N
         38CTgL7iJT/NWfGWBxm8XufqCPVZKhcclGqLGM9S50IUaCxZ1tzoZM9w1bduq6FifFYw
         X3V4kiXMXcyQrXVotiT5xVxBPqMXK8lIGhQuR2wJxBNKf6tMSuGkJ1fwFQrWHkG57y9n
         3CmOyTA0B/zI2bKhsTnguEVo0hGMCiJLxQYyK8ntk/ObjVcQ/DWqfgsE2qXdNPHmRF0H
         GocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750354; x=1745355154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfbBE02/GYbGAop480tyacnnE52Ddmv7AQnbQ8fg4qg=;
        b=ZsrqsMZg73oXlbvg7z5pjyzoET3DkkH8iN+PTWkmAl4yOgGzd78kMktSOZKXQKqSCJ
         6ydn2wtaUzBtjgWGNa1fdUnjBlzPmWGDj254mhDw2WqTAgkl+7YXXpoGkg05fSc80srk
         7lQdr/ilqdDLRkWVbSAcd02b7dZpJ1vQog4F0Vs4/5TQzlWNzEx2aJcAKqlC4Ff08dmX
         A0AhXvYuY+ZBb7uJdozU77IYX5FiLB0LsfCQgOccTvlbGLhW67nXjIkJRzKtTbPfhl5G
         ryAdncJzVBed2h7757PxvHFUm7k4/5C5IzNhh++xRnnEinOT30bKlbFZxEpaXF83bogH
         DMmA==
X-Gm-Message-State: AOJu0YzByFiHwgaGpy2ZspDXb6hqhbK3xfbQri7T2JFziGqmZqDdB2W5
	ZtPgfSKBJKFw6yu5L7aKZqmy3RfBqyiwKv3E9pkmMeFhihGvXMzDp9/kPrdQVXeeZQ4RJA7BKQU
	w
X-Gm-Gg: ASbGncsmuXfnG0YCxJMVr5vqnLGjajYgV/Y95rMAQDDrWsJw1i3gAHu8sLBdpmVau7Q
	IOL1NjWlDyYY0GTHHBazb1xPRW2lH1ELgXBNox5ZPWQU8d/Iip1vOaeIe5vEcR/MAqx+Gle8PRq
	/Olel3CY0lhM2lNapdrL44dNnytEG3LshAyDE0Df6GeeIgiffh2ny51KnqFUjoJkS2eG4dYjVto
	duw9q8Vr4Da+Z5YjDZItyXp4GtQh/+RC0p437rzQ0pE9LHT1PIJ4UHgwLA4PTYtp6sInurB9Lxe
	4h9LfhvS2RDF7GGt+tHg56Elk2qjlzdq
X-Google-Smtp-Source: AGHT+IEQLarWazTTN4D+ovpl9/sWvs+PbBfKUFEXda0ZmJVc2sUUCpVun3INbhxMZKdYinTjpXHAZg==
X-Received: by 2002:a17:903:1c5:b0:220:ca08:8986 with SMTP id d9443c01a7336-22c31a33701mr9537095ad.22.1744750354058;
        Tue, 15 Apr 2025 13:52:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6144:9704:3eb2:ee31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332a3sm8978307b3a.161.2025.04.15.13.52.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:52:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] cve-update-nvd2-native: add workaround for json5 style list
Date: Tue, 15 Apr 2025 13:52:22 -0700
Message-ID: <cee817c0c3653cc96833815bfe2c87d2d85cc19e.1744750227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744750227.git.steve@sakoman.com>
References: <cover.1744750227.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 20:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214968

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
index b8faee68d6..9808120cab 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -226,6 +226,11 @@ def update_db_file(db_tmp_file, d, database_time):
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


