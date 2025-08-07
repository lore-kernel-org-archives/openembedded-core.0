Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C58CA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:32:49 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.3046.1754590474014302880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U9nLb3HB;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4af21f1717eso777101cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754590473; x=1755195273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=U9nLb3HBGlrTg9KxfmMPoOHNHPDp3wuzdNnDh7oQ2aA7Xch4Q9ijYRsBeEPZXpbwj9
         tw0phcX8utjSmS9rFUP+I+NH8dyuBAWzSLvPPlIewTDF3jKGw7EIGOAJHkECgG88hWld
         Xjo8CLQmJLLhEYd+AhttztCvZ4hJYQaOLsmdCw+7xgWbZSXWKh5c5+ApAk0BwLwk1NXm
         LI3/w/xas5LfKaqIQI9//S5h1j+70tnHEyTWt3FtEq8YRybkzqXpjLqzsNqfBLnvL2sj
         3EJL5PENJrkniL8/GBYe3ithMOtf6XaRjmXOQhVuBacYpSXRhLn3uLWxAU/la1V7PHKl
         zo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754590473; x=1755195273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=mIMue9Z7Y9vVuXRGQZzvgriKXyq4pb42V8ucK/tIMK1zdhtXDDkiiZinzF9fAWE9t7
         fRD/1klHXmy06cDgjcSrPqmgpd7WKbfw+YPH3p75v2ci+XvpTxUBEfVnrBiRXz4Jd1uv
         I6MlgXeNtro884bdOZHgihM+NJg2MdIiGEpvicguNZRwjtFgLvIujq1yRmU+C6qJzf8Q
         8I5OAfaVUzfkhf/wcxfYzrWB3hZtEFrAgp4DA2S4V5tRXJlRzal0EUy5KBWfeKaGQUtp
         BlxdtfmdXUvgN2MionXMuwnukkcWEq/izmAKMLAohQRXag3oqSo+92lrQ0mCEF/JSjZ/
         RiqQ==
X-Gm-Message-State: AOJu0YywIagZnBlQYQptjAsxLCG59iCY9FTZJHetLO4sO6KlNPM+Z+Oy
	UB2/qhSdtL2Rf6c2Xtv5lpKeBPSVKgLofUJQGfABWO1MWrc1tEezQzm+Cwf8kPe2Y6N0Jg==
X-Gm-Gg: ASbGncsFzMcxjmqBCMnULf023CrshBqwGN5t1ZCZ3WIhUY3yagNZeFuYRYz+OTrRLoT
	JZ53VtuN72EFwILwzH/wNcfVdvSq0A500iobGrMcmycWAeEoMndtxzvUftTLM/Jyiux1b2fIVU5
	IwtjmaGP87AixZ/1DjdkLdv7Q7M6pCPowzQOvkHjf+E0cG3hYVtC7xxF947wmd6IWWk0YvJfnkJ
	XOddVspuGHDFpv/3jlo/SCQ2eRA7ff5XRlBNnn8Oz0tXSxvme7irutXu72stzaWpWzGW11tnvlm
	qh+Q+KbffqGO9uWTewFnNguhe6tPgwuY/f9aTa1qbLjsvs6GKRdEMR0h1iOINWi/++z2Sc7uoTa
	Nq+LrAw8i7JVeNmp2T3j/OZI197izet8captJbp1jmxG5DaReO/hO7pBfseAVgf6n1KEnldRdGn
	l7Tg==
X-Google-Smtp-Source: AGHT+IHsSMM+/n+JAnC1MuSp4GBqBq2q8JKaDmd6xUKfOhoNGOsaNy35zqfgKxYPVSSQozTfIWQpPg==
X-Received: by 2002:ac8:5ac1:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4b0aecfb84dmr1918061cf.2.1754590472706;
        Thu, 07 Aug 2025 11:14:32 -0700 (PDT)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0785d13a2sm45747281cf.39.2025.08.07.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:14:32 -0700 (PDT)
From: vboudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: vboudevin <valentin.boudevin@gmail.com>
Subject: [PATCH] Revert "cve-check: change the default feed"
Date: Thu,  7 Aug 2025 14:13:57 -0400
Message-ID: <20250807181357.695779-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221659

This reverts commit 8e11797a563066da97ffac639d3173281a8c1ca9.

Reverted the value from FKIE to NVD2, because the FKIE CVE database is 
not read properly by the cve-check script.

A lot of CVE entries are incomplete and incorrect. From what I can see, the majority of the CVEs are not correct with FKIE.

I can provide a simple example with CVE-2024-6119 (https://nvd.nist.gov/vuln/detail/CVE-2024-6119).

On the official database the severity for this CVE, with CVSS Version 3.x, is: 7.5 (HIGH) 

On a build with the FKIE database we have the following result: sqlite3 nvdfkie_1-1.db .dump | grep CVE-2024-6119

INSERT INTO NVD VALUES('CVE-2024-6119',replace('Issue summary: Applications performing certificate name checks 
(e.g., TLS\nclients checking server certificates) may attempt to read an invalid memory\naddress resulting in abnormal termination of t
he application process.\n\nImpact summary: Abnormal termination of an application can a cause a denial of\nservice.
\n\nApplications performing certificate name checks (e.g., TLS clients checking\nserver certificates) 
may attempt to read an invalid memory address when\ncomparing the expected name with an `otherName` subject alternative name of an\nX.509 certificate. 
This may result in an exception that terminates the\napplication program.\n\nNote that basic certificate chain validation (signatures, dates, ...) 
is not\naffected, the denial of service can occur only when the application also\nspecifies an expected DNS name, Email address or IP address.\n\n
TLS servers rarely solicit client certificates, and even when they do, they\ngenerally don''t perform a name check against a reference identifier 
(expected\nidentity), but rather extract the presented identity after checking the\ncertificate chain.  So TLS servers are generally not affected 
and the severity\nof the issue is Moderate.\n\nThe FIPS modules in 3.3, 3.2, 3.1 and 3.0 are not affected by this issue.','\n',char(10))
,'0.0','0.0','0.0','2025-06-03T10:51:54.117','UNKNOWN',NULL);

You can see that the rode severity for CVSS Version 2.0, 3.0 and 4.0 are all set to '0.0', which is incorrect.

Now, with the NVD2 database: sqlite3 nvdcve_2-2.db .dump | grep CVE-2024-6119

INSERT INTO NVD VALUES('CVE-2024-6119',replace('Issue summary: Applications performing certificate name checks 
(e.g., TLS\nclients checking server certificates) may attempt to read an invalid memory\naddress resulting in abnormal 
termination of the application process.\n\nImpact summary: Abnormal termination of an application can a cause a denial of\nservice.
\n\nApplications performing certificate name checks (e.g., TLS clients checking\nserver certificates) 
may attempt to read an invalid memory address when\ncomparing the expected name with an `otherName` 
subject alternative name of an\nX.509 certificate. This may result in an exception that terminates 
the\napplication program.\n\nNote that basic certificate chain validation (signatures, dates, ...) is not\naffected, 
the denial of service can occur only when the application also\nspecifies an expected DNS name, Email address or IP address.
\n\nTLS servers rarely solicit client certificates, and even when they do, they\ngenerally don''t perform a name check against a reference identifier 
(expected\nidentity), but rather extract the presented identity after checking the\ncertificate chain.  
So TLS servers are generally not affected and the severity\nof the issue is Moderate.\n\nThe FIPS modules in 3.3, 3.2, 3.1 and 3.0 are not affected 
by this issue.','\n',char(10))
,'0.0','7.5','0.0','2025-06-03T10:51:54.117','NETWORK','CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H');

This is the correct severity for CVE-2024-6119.

The base issue does NOT come from the FKIE databse : https://github.com/fkie-cad/nvd-json-data-feeds/blob/main/CVE-2024/CVE-2024-61xx/CVE-2024-6119.json

We can see for this CVE a "baseScore": 7.5.

It seems like poky is not reading the FKIE database correctly, so we revert the change to NVD2 with a working and complete database.

Note: I only gave the example of CVE-2024-6119 with CVSS example, but as you can see other fields are not correct either with "UNKNOWN" status.
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c63ebd56e1..2125eb5dd7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 # Possible database sources: NVD1, NVD2, FKIE
-NVD_DB_VERSION ?= "FKIE"
+NVD_DB_VERSION ?= "NVD2"
 
 # Use different file names for each database source, as they synchronize at different moments, so may be slightly different
 CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') == 'NVD1' else 'nvdfkie_1-1.db'}"
-- 
2.43.0


