Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ED5C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:17:52 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3106.1754590671277601935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O137+teP;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e80fb45dfbso21317685a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754590670; x=1755195470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=O137+teP5POnsCaGgoYLEEHiIgjM3AVWhLN8qOjsmvcJp5aoeDAjWAiGgLPMFIh6w2
         ccRrKcN1g1ugj3QyAMUIsCGubIKGZbK0VP5DNTMYmVPNJAVVzQLfeC62OlGqzlylv2IE
         v6pPuY9w+kDo7KPeQZ4bCZkvrXQQWZLH0gAUvggJs7+KNa/dZEGHTD0RzZkzzwBS6zAJ
         +j5WH66sBVR6sJ4DHeEjuiaOsD9goe5JYUS2+9Grm16J1Yndv2yZv8vMj6WskIFkYXfU
         oUzDmto5u+YxyrrbwcLcXucvVPcMDkVcCUkAKv5eJVyBL6fKSH0LE9C+PfDrm0tyXO2e
         WGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754590670; x=1755195470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4rog03dlbgcoHkZPny/lYLJUUVPeU+E126XZgtuGjY=;
        b=OTPRLdhOebUCjNuMz+Er3sMzLR5rMngC4FQTK7V00jpoXmjsDkxYpeQpAMNHHDKJXr
         Xeec3ZDPctNwjW70x8UgmZ+CZ0wxXMXO6fmR0isd2gQdcg2W0hvIQfvbyO0MuIEAN1VK
         wQDqGmfqpmy384wzWdnwNQGxwMviP5ljq/hiUlIm3HmMW1u4oyVkcuaJ0ne/VXYXJfgO
         AKqqJ2lK/7CuaiFm5dklabwfUqfUq3yVnipLkSs1msKlNJgm/dqCXBXxeAVzb46WkXDi
         NGtYLltCVdxBDA6r74BMzOD65y+c4P++CnJJQKIL7TB2fWRRethziyHfuDlQB94rRaxu
         w5Ug==
X-Gm-Message-State: AOJu0Yxuh0Mf505pDn/4nrPpDdcrweCje0jYDyfZzC4xB4wOuxVs56BH
	w6I6geIt50AvW7cIXYm780UgVAWMd9lGvR+nbX4PfxgSwkkfGTeA6j3WMpKfRFUa3vFOkQ==
X-Gm-Gg: ASbGnctU8bveb2IYxEsCL3/3/0nhL7L9P33j3Ei1aXt4Ofk2t3unDY0zx9g8mHM6j6A
	BSOrB77FMPTFzwfXFAz7yTyZXR5N7Bo933AKVDxX90sV3XpD3o8rdvgqpO1ipXM4+HJRkRIGd3c
	IGYY7Ccoorq/It4nrTU7v5JN/SN3k7YRyxOkzpseqUaSCowLdf5yXowe/7eBs9T2N2Mhy5YBAve
	pC70zXNSVK0yM2haqgBTaV0nLeQRPIWNgCVg3/6OiYxI3IFmrTYadLZlTm0Cktjdom9PIo0AR53
	dzTWv3sP/+G1L0IRHHkrBC32I8PaewjClKEwVGg/XE4qhGPWeIhUIJBViCX1B1yTWbHlBbncjuT
	HsO+zEJJTxfyTatuOYSlzXczdRBEFtvqtDPrczYme60S9ERPQw483DOexprEq4jti66o=
X-Google-Smtp-Source: AGHT+IH2FBQLV2V4iVvorXLvZ0xOq1PdcAqqr2S6+hW254dYHUTNcEOdiKCMfV3INyDXyFSZG/UrNg==
X-Received: by 2002:ad4:5ce1:0:b0:707:4d59:cc85 with SMTP id 6a1803df08f44-7099a4641c0mr1697346d6.3.1754590669624;
        Thu, 07 Aug 2025 11:17:49 -0700 (PDT)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca1dc91sm102206706d6.27.2025.08.07.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:17:49 -0700 (PDT)
From: vboudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: vboudevin <valentin.boudevin@gmail.com>
Subject: [PATCH] Revert "cve-check: change the default feed"
Date: Thu,  7 Aug 2025 14:17:42 -0400
Message-ID: <20250807181742.696120-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221576

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


