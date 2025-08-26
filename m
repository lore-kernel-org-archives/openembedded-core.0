Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54743CA0FEB
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.64597.1756215676323479618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m2g6eDaW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e434a0118so6547556b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215675; x=1756820475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKy9OwhqI6luNyfONpiuHj/56jQUnBT30vJJ99hHBfU=;
        b=m2g6eDaWEq5wGx39FTDmd9FTPgR+uPqWROB0qC1g9unDCM7N9BhR3+z5Vr8YccprwX
         MzHlSFRU+q56G2Kd47mx/qeikderC5QRs9j/HVrG+sxxTNUwzPdK+H0D37ZQqLpLFAf3
         er2L0qCUX6JRouk8yTlBNTCS6vRoFQ29NZ2jNVbtD3tCIqmxUuSlaCq8bm1FhKD/p0KX
         PCfGzh4LI2oCrnE8pnY3fAsqRJvmor379z4bL7w38sX5iN8iAkZHQaE0NpwfmEXI73eo
         kibwb/CdA2TZvZuda3YLIEiBfzg+C9vvOCAosBGBJGLh1u6p/nkvfaaaHX//gFH3rcK1
         z5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215675; x=1756820475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKy9OwhqI6luNyfONpiuHj/56jQUnBT30vJJ99hHBfU=;
        b=WZGkmFLbQACmkJ8JfQE4GD3tvZXAkiySwZvs2VqW/WWyiwPto8hClXrVLhaTxNlLEa
         IuiRXS6NwVh4+naYAvlYBGr/UNooAntONiiGoW1PwJe9T3toRBqyfm6oU+LhzmtM9BWn
         xkkyaVWdVP+XAa10FPuBKBJtsk+uVgpMC+TePIau7d9caJkPFrnc+39CmBGLcabaCJmJ
         lAbqKqqUlR+4Ge2HhzoWhKNTF/kcxHYBNVTVY/o9IUcq+ab1or/SgIa6n9Ke6RrPjnxc
         quODo0fSJ6dWZXMI1KXM1ALHf+5ocxtaZEPvtieBvy3pXRmH9HakqVH9YvKg2sYI85H/
         netA==
X-Gm-Message-State: AOJu0YwHFCMULcV8WWDXQEebipYq0PYIbFqkSpzduRzP9FcGfc1ihKjx
	OHRxI1/JdQWvm3EvRfKfuh7bZfMx8JRGkkIOWtekYIQJvnHYi8TfYye00OonPT0u/NtazsKcb0T
	tGax+
X-Gm-Gg: ASbGncvXMwlt5kru1QnpAauD/uP3HqB1pj+v4tXF4KbzEJnjX2691AfbJlgij5IMXnC
	TpJcpaktSJ/qdfUSNQTBbLX1a4pWNuu7HSYl0IQE6piIDpGAyjxmvrjeseKpb34rb5swjd2eJ20
	iZSxJRv01RJeZdHRKxECDsx7wC7uY9X6SEUHdLk6DSWdifC2cL8LjRloDQy/pLUK3TneBPSoxvh
	7uTOSa2dEtIIexDXz7ut+DsMRTdAwaLdL8npUNc5zxDtqxkbvsn4LrRxqY4Bq5738Tf6JdbJeu9
	f2j873Q21ErPloiQjmGOCDHCZsBpOSK5UgQMX1fS5iJ5DoWUCRWSU8fyauU3TKv4HrHhbDoNaIN
	KDSQPkSpk/CsUF0V0OdVoC6d5
X-Google-Smtp-Source: AGHT+IGbvCmsYzWfcFFp8U3t3vDZ1TcWKMti5ekKVehnMSaJigFo1FzSuxXbSdIcYubQecRfdFgwFg==
X-Received: by 2002:a05:6a21:33a2:b0:231:acae:1983 with SMTP id adf61e73a8af0-24340c2263fmr23127391637.3.1756215675430;
        Tue, 26 Aug 2025 06:41:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/19] cve-update-db-native: fix fetcher for CVEs missing nodes
Date: Tue, 26 Aug 2025 06:40:40 -0700
Message-ID: <5bc27449381d2a53588dc7ad1fe2b78783d5c240.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222446

From: Peter Marko <peter.marko@siemens.com>

As of now, update of CVE DB from FKIE source (which is the defailt)
fails with following error:

File: '<build>/poky/meta/recipes-core/meta/cve-update-db-native.bb', lineno: 393, function: update_db_fkie
     0389:                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
     0390:
     0391:        for config in elt['configurations']:
     0392:            # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
 *** 0393:            for node in config["nodes"]:
     0394:                parse_node_and_insert(conn, node, cveId, False)
     0395:
     0396:def update_db(d, conn, jsondata):
     0397:    if (d.getVar("NVD_DB_VERSION") == "FKIE"):
Exception: KeyError: 'nodes'

Entry for new CVE-2025-32915 is broken.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 792252f510..320bd452f1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -390,7 +390,7 @@ def update_db_fkie(conn, jsondata):
 
         for config in elt['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
-            for node in config["nodes"]:
+            for node in config.get("nodes") or []:
                 parse_node_and_insert(conn, node, cveId, False)
 
 
-- 
2.43.0


