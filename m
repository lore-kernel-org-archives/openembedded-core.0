Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E37C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:32:49 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.2935.1754590113965180519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mrLEuZzv;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e805753075so17342985a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754590113; x=1755194913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=mrLEuZzvwtIuunfM4zIlKxatJ3DF/raoEhAX/xi0I6AWTxMQku8fyELOXVT/GfVSCA
         coWrbm0qrZG1mrHGF5sQ//8EfHRVb6lVvs1yPw/kxCrZG6i/7sGlP3R7lzU38wMDo3JO
         n0QxQHCVWtFaTfrfehUC/t0IRyxe5SPyOfW8ejZkksL5H9nK0CLXL+ilwE3GH2vO3/WX
         RLgpMZu6yrAUXf48pBCRpdaE9LA3GJvnKnaGc2YI7nBv6kBXlVMJs8QZOx5FVA3VvR6p
         x9SevfyXmDzD2O8HMt8adSWhqf5gAHITxMqD1cCTzou+aU0J7fnQFB1hnLgBp7h7OdOV
         O3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754590113; x=1755194913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=teGkmCo+AVAjr3ycIi0hvKzJYYut83xZ5/tuy5sZWUBiDsAqEjJB9Aym7x/O+ANtyB
         aSPTda71KkOkC10EmFs1f/SXL6xEMLNbuvJjwDrZykFChe+dGcv9ROdfPx8NwdzETGRe
         etXX2Tn5S1xUfMe66G73ysmlnyfkeRkRkAeJ68QMT0P62tsZVvBIBF1j9HqiJPgcsOnG
         zEkYdvK1PpPg2yXePruYvanbnY1d98tWMJqreD1TrEp+rkD0uj7kL8L7BSR0tPIYU0R0
         WD1VJtRlC/Uw0u5P0oKbh9uFaDM4E5cKB3Uz5m13Q34elKCkSPuTUwEeAhhYurjpvLZB
         x3Hg==
X-Gm-Message-State: AOJu0Yw7QM3xbt1WHPeuNVvsq2J3Fd1p60ZVnIpxEhmqoGt1xF9Unp0/
	7JqjnYmd6wqZUVnm6+5lOKHYNqLa98MWNOxfLYdBFmAAUGuLbdKtkVJaOYNcnBuowDqM6A==
X-Gm-Gg: ASbGncuzPAXCmEqBHLNGUUYUpikUy1hgGyV/AYQ2PVtx55RzdfbpPOm4rmP5olMX6Ix
	p5ybVhWOgGwdDHJUJtddEHVdlkQWmE8EeTdvO9ECWApXfFvth3e+fpmSQBTeoyfR0bNtOsZxdxw
	c/wmvyBXHufdDB7HPEr5xcKHnLTQu/k8c+PkDs74FE58Wl2VPFfHFFLziWwYwCqydjKknVXciRS
	y2rfoTkcDOpaKMRhOHowOQSGU5vsONDCrTd3cbuE1+sTnT63uVhtfTwh8ZiPMPX/RDxfjsIA5ft
	Pw0CHQft6ObEll6fNTQaUiS37m4K1gB0E1T443/Mz6m8Gh1lzDv+bBpLZkuKTmw9hXmw0D3Hpj0
	J/Kw/uvPLWN7h0Ouwsl9xPiOQSwQkkKSMa1JNmdY4ABN6+nx94Ztrmo8DykTIZPJNUBA=
X-Google-Smtp-Source: AGHT+IHYPzM5d+4tHlL/pIfLvqbFR7wqZlDnnI3nD/QcJvSpWZFlfe9TcF42sDeANDHB0ci8wYQwIw==
X-Received: by 2002:a05:620a:460f:b0:7e6:5474:c54e with SMTP id af79cd13be357-7e82c6a59d1mr7440585a.7.1754590112606;
        Thu, 07 Aug 2025 11:08:32 -0700 (PDT)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e69e5c4be0sm670377285a.45.2025.08.07.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:08:32 -0700 (PDT)
From: vboudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: vboudevin <valentin.boudevin@gmail.com>
Subject: [PATCH] Revert "cve-check: change the default feed"
Date: Thu,  7 Aug 2025 14:08:25 -0400
Message-ID: <20250807180825.695076-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221657

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


