Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CDCC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:32:49 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3002.1754590275311799579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iAdCbUDL;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76bf3e02db4so86798b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754590275; x=1755195075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=iAdCbUDL7Pb9rwouHebYfGp2XlMXNHMrnI58mImnKsUdHJFVivL0mTBB48BwDwtLpp
         pAP0L2/snxIHpnHB8OzX1wz/npo8bHx6ayNwbDXIgS6juCyKjD4raiIDTTLMEQ00Uuh1
         SEeEAIDFsy04O90X6DRN85QPL75Lc3t315BigOmD68cIX7p6MDq0ufLu6ltyIGLqreh/
         deRXLHPsclgLFDAe3aE+/ysJvU04dW0rRsm+NRl+yjQJ4bLwjRsslqnrWDgBwlnozEhl
         JZSNGSug0yYtUgoIY3EpHZfV3nNOuR+FX2yobUjQrH8TwZ2xWGR8A+4AweTBSTTq+Sji
         6CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754590275; x=1755195075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=JHY9E/YRp0Hi9AXB+8LODV5UtJpiPqmc7WFt/EDvMRKifxw4JWiiYU/OLo1fBehBPE
         JV6QV5DfS/omK1lOP3OJ51LdDEFRIAqteBRFlv8jYAw9x9/v4K4DKo9PtsxqQbr0QX0r
         JTwyhmsyl6OFsvDbag53CHiaLPzWnjGwUH8d+GiKSTL7VwmYWLkKwqj0u16hsAk/Tayr
         fn7/XZXbQftmp1hzUpfVyZdlePNz9i9jJ/3pDSdfXsg4CjZLlRLkNZu6NXfYngzjkMvk
         2H6j6z2OaSS2Mi4jrcUPZjA14cY57dLPlfbv8e9iTOJyVtdqF7FBM8raR4rEj4idvgEl
         m9wA==
X-Gm-Message-State: AOJu0YwvH6T1Eevy3xrBu9dKceQcC+DZhzxmoSMSaKSSlNKot0FTt82u
	JL0Tj8ipp2APo0rhHT0ne7Ohc+fgkV0W+YM3KfE/kFKZU0x492Q91sRY1jAKNBM4yEfJhQ==
X-Gm-Gg: ASbGncutkJiHvWJB5S8W/ILQrZrS/aHFUyxKSSrCdlkjDb0xfJ+c4JRLxwakmVq/8Xv
	7lFlxLwCumFBL7v9jLcluj09opuAe9kKhvmmZk9AXvZ4y+ZfhObWGsWlQ3ABC+EMBEBVaT18Yul
	UfJ3xXuX3VQe4Q66bxBuQ2GFuMOO+h9OoogCTjtheeM6tQTvAC8247WoRIpY/uNSSJlAY05n4vI
	i5NTbqeiLJEU75ezA1q/nidjANx5oIwX8MFOLMkI4UFy5xhsgcwgZZdoLlgCCkY/SxJ+qh+BBvh
	XREOIeiPgOEWiPT0fgy6PtEwK3DSiSDq4GpN6s/X9fN3zTqjeuNiwacwQlysAMbmRpP+0C+jLbG
	k8DGMtGljIR7misTWlUUFOTD7ibyXQtcyZ2J6iFBfMEjwQ0azDtwB18wPnYc/Ys8nmen1tbgatr
	7kKQ==
X-Google-Smtp-Source: AGHT+IEm1X1zbi+BRi7X88ZbT0zlwGVs1mN2QcC/WFsAE+pzwefckrSdm093hIkAEYTpFIWh4F7Q1A==
X-Received: by 2002:ac8:7fcd:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0aed0b28fmr1762241cf.2.1754589811288;
        Thu, 07 Aug 2025 11:03:31 -0700 (PDT)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af7b43e8bdsm61132481cf.45.2025.08.07.11.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:03:31 -0700 (PDT)
From: vboudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: vboudevin <valentin.boudevin@gmail.com>
Subject: [PATCH] Revert "cve-check: change the default feed"
Date: Thu,  7 Aug 2025 14:03:24 -0400
Message-ID: <20250807180324.694389-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221658

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


