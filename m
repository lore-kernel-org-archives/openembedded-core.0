Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6132C433F5
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 10:53:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.23978.1653821602953207040
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 03:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cwr33Nen;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q21so48829wra.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybYeN1pxuz8gRuKuCpWPO+nkFnReHs57c3vNxLlON/4=;
        b=Cwr33NenXrFIpKwpe2IuYS7GGU8VSLmQsH/EbiBhte+z94P2YNvGmJyk/7rT5P3m1S
         Ge8l/fZOLwAq1cv4UAU0JR4ef9LgYaIknGUlQ9B30B0G1PUMjvbvKbNvIq7fQOP1fFlY
         lseYJ6XCkQ8hfXdk1iDfgZ3TH81FGzrqeJPMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybYeN1pxuz8gRuKuCpWPO+nkFnReHs57c3vNxLlON/4=;
        b=yN7Y/5mWCT48bnfaI43Thnv6EjQLbtNE+4QGQlFxFKoTIxFPhg4k5g2m0T1hHRaKFa
         gPgahS6auBXVhAsQxkqEjYtaKtjFAMBpZ+RrDEJS05vnOgV5r2fTPGy6NqSCVlmKEkOF
         J3uek1XAzany2CE+HaXz7Qm5c4x4ngTL+ASsXkem6lD3EShHTihlWc/Gbzo3dwz+fbqB
         Sc1RE6BKnkRa24FTTAYjHOF5xPimXf1z3R0h8LTJ2yFZdfPyFExIJpMoyz4UUGpntwAg
         tgxu4Y7Z+mYmt8XOfnBcLDW8bjnA+O8XErceNVWS5uobyHGFOJ80xGH1ePrRltQx4wOa
         iMWQ==
X-Gm-Message-State: AOAM531oRBhUGH8UvmA2nuQzyN26viEiTY9e7CWHeprLpJBN+09wxvoD
	//9nmdmLTn1jmvER/XwD7qSjw3S5KgcHlBKw
X-Google-Smtp-Source: 
 ABdhPJz9tjY72QKQswwCBWpj3zYOjOnY3P/aDOsMXsycDfcwqJMiENXReg6H/AzG3HKew1brJg1CWA==
X-Received: by 2002:a5d:5310:0:b0:20f:d075:a386 with SMTP id
 e16-20020a5d5310000000b0020fd075a386mr30691212wrv.619.1653821601040;
        Sun, 29 May 2022 03:53:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4777:d166:870b:18dd])
        by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003942a244f57sm7550599wms.48.2022.05.29.03.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:53:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: Allow warnings to be disabled
Date: Sun, 29 May 2022 11:53:19 +0100
Message-Id: <20220529105319.565971-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 10:53:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166233

When running CVE checks in CI we're usually not interested in warnings on the
console for any CVEs present. Add a configuration option CVE_CHECK_SHOW_WARNINGS
to allow this to be disabled (it is left enabled by default).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3bb924ba344..c80a3658195 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -48,6 +48,7 @@ CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
+CVE_CHECK_SHOW_WARNINGS ??= "1"
 
 # Provide text output
 CVE_CHECK_FORMAT_TEXT ??= "1"
@@ -436,7 +437,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
-    if unpatched_cves:
+    if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
     if write_string:
-- 
2.34.1


