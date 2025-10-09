Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AE0CCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9255.1760038305547234121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I1XZ2RCA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1348084b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038305; x=1760643105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awG4LqcCp9hsuKGSfNu53UGlqOk2senOrbuqTut9yME=;
        b=I1XZ2RCADLJNs0e3fcE9Z5US5HBLoqABv0CGiCkK8Z9K7e0MIcgUkcdZiWPF4iTQRb
         BMGx5LgilSEVTXHPo7eLSsEMVeEGsNwN/eh4edEfIQoUUOqgPMbJPOHsSv4fMZ9szzSg
         CXTwN1I5AdfoNtYrUYqtHnkXjVwDsdyUcBfY9EdeqdyY+nbAllv341+Pw5OI4tFNuMjQ
         xr4vkrmJ++tlYuhFwDVA8B55q9OfFDHCAubEBhgBE1IQbzovl6cXMShdLelhfPSlW6Q8
         RFkYq7WKkoqT1rjroF6d9xOjYqIJGJK+J0Q0CgT0YNiKw8j03DfKcQl6Y/A/twylshtM
         kG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038305; x=1760643105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awG4LqcCp9hsuKGSfNu53UGlqOk2senOrbuqTut9yME=;
        b=A/WRhGo2E6+qS125+GdT/5xcFY4gOkxur3PW+55pqljnCjwscm1V3+7gv+I05F9KAD
         rJpSEyyrT6X3h0NSmyU+JrwUEx2dl/Tm3W6qWnafR6iaShzaqtZGb2SpwDJsoOyMfz54
         n+20stLiRCGsWvIdGR9M2HXfWGM8dBPyAgdEOblqOXLuLS2vh98xrrer4XMiw5itO/Zt
         PKAcRJNR3I3AyGdoEYYm9o7/W9W9sLrnGYeRyfkPghUh3u0crTUXrkDJJU8YxO+gZF5q
         xs7A9b0qfY0er70pmN3LFCrm7oyOb/21SGgxx0tTr6dwZYDczJOKgf9fz5GhuxHSRHAn
         cW2A==
X-Gm-Message-State: AOJu0YyJnABPkJsjccms60aGiXftp9FBC7D3CxcbRxRASQb9ynieXOCw
	N6nerox8Wcu7GIwFks36jLr19nh+ORvHddbFhOaxoDWr5oP4SMwjzv1F25tNTTHfh/ihREYvdHP
	M9LdC
X-Gm-Gg: ASbGnctiK4oSQzTJCAG1Ewln3+J7e+C6KBpzDTGYpjl0D4dP3JN1kXs1Qep0sWec70Z
	9eNuGY59BQyexTbFuQBPwGwtLQ763qJSQAC5OTsaFuQ59lvuIhztusn7R1lofZDVmQLiFmg1TRi
	N4zaB03zDDWfrzoHU7YPrS+Pjtkgr7ZDuRO/VJ07GEzlMe6UQmA1OGP9wpx5wYaOau+ohG+kDJh
	gEYppb734ECIbHSdtzvM3AhS2vL37nbmAISW/yfg1UVPRyERdaSGpanvsITtwXtDi4Du62FCkfs
	LMYJL0Jrahk/vM3a9u93qIHWfdAupE6SdnH8DpwGeb4cB102f/7H6POX48Gt7Fq8dWkOzlh8yTC
	xQvaTkkOnScD/wgha1xwZI2Zg42BdKLmZq4FNJQ==
X-Google-Smtp-Source: AGHT+IHiLEO+Cz9Te6gg8HZXNQBbj7tbylWPsdfpNhXQ0zdj6QIGFT+eYrlw98mzqAZ68pDVP90ETQ==
X-Received: by 2002:a05:6a00:17a5:b0:781:1562:1f9e with SMTP id d2e1a72fcca58-793880f0678mr11947449b3a.32.1760038304607;
        Thu, 09 Oct 2025 12:31:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/24] openssl: upgrade 3.0.17 -> 3.0.18
Date: Thu,  9 Oct 2025 12:31:02 -0700
Message-ID: <0a0d640436258269ffaaf23116d41f9a79db5ab7.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224637

From: Archana Polampalli <archana.polampalli@windriver.com>

This release incorporates the following bug fixes and mitigations:
Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232)

Changelog:
https://github.com/openssl/openssl/blob/openssl-3.0.18/NEWS.md#openssl-30

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.17.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.18.bb
index a50bd2edbf..a8dd338327 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
+SRC_URI[sha256sum] = "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.43.0


