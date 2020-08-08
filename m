Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.3056.1596883269709700051
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 03:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kkDj+pm1;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id c16so4589234ejx.12
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OahkfIA/RZiJyqqL7KCzE93F69w8IWSmq5T+E8MzWMk=;
        b=kkDj+pm1S52PNgmhm7MfPArZwz+dOEWS83XK/Ymvm02kuq9LTTZbeWALhyT6vCO1Kr
         Mys9PPMNHzd8zH9qKl994XzcpkqDFCgx0nSNRNhfzoLTRdFfpMHZQXBfEiJ/Ggkl0boG
         QbV1WHhT5E6JcWcaMCBHYyH9GX8TURgbBTtaNo2v2HO6tr0F+HbaeI43DldZpLzriZ2L
         aTdT3l/CBFfqyo4pGMa2HuI7KIOwIep+973iPnOu9UAbzYcJSG1CU3Z2hiuzO3fSng56
         BIdPC3QRenKwmaYPqoMQkUaGxt0s77sj+6A9XKjcFvaeaeT/uvdQZvU7a8AURwoVRs1U
         RZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OahkfIA/RZiJyqqL7KCzE93F69w8IWSmq5T+E8MzWMk=;
        b=OND0lhBoHhvyVvlQDdVFvEO3vXtVxWPqJjU+7xjpetyTfkRH1sRYUTtINNcW5GM0YG
         1ox+Z3rfh1/yziv4MWNHLz+A7b3JF1ldTD6KaHI/EmhFTRjPpxUJiE5weKYN+5oty2Ie
         GTgp6JTHI4MasMGKrLtpIwrv0R5rM9iHN1n/te1E8cN410qDrMIynE2bH2Lu4T9FcrRE
         Ww3NVRPNVPWYvMvByeIBqN1KcW29eqQYgdrJNJYHr2qkJXjBoe59odbn+Y8ocGJjkks6
         QzzdZZsMDiOYgqyd1OyfbnEbU/E+rbnZfpB3Ct1yv6sHH+OQkEL/NOh38RswxNkoU3a3
         aFRw==
X-Gm-Message-State: AOAM532nTezpfrmBOb28auU4ybDmoCZ5fL07HroECwMq+qqAreHtdguj
	TLVwv8t7bTIgjOpKYQU4KIKCKBGK
X-Google-Smtp-Source: ABdhPJwAqqOgvbGTYMQCz8D2+VXogCgwjVQIrgXEYkkFWKMBF805rXSchQL8kXiTQn3ShT8NPTDHCA==
X-Received: by 2002:a17:906:1f08:: with SMTP id w8mr14143787ejj.535.1596883268112;
        Sat, 08 Aug 2020 03:41:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id c7sm7528049edf.1.2020.08.08.03.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 03:41:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [dunfell][PATCH 2/2] oeqa: write @OETestTag content into json test reports for each case
Date: Sat,  8 Aug 2020 12:40:54 +0200
Message-Id: <20200808104054.28306-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808104054.28306-1-alex.kanavin@gmail.com>
References: <20200808104054.28306-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows using these tags for classification and filtering of test results
according to various organization-specific criteria, such as teams
responsible for the test, internal test ids, feature domains and so on.

Test name itself meanwhile can stay short and human-readable.

(From OE-Core rev: 3801b126eb52cd46efe417111afcd27f05d8f72b)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 00b7d0bb12..d50690ab37 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -195,6 +195,20 @@ class OETestResult(_TestResult):
                 report['log'] = log
             if duration:
                 report['duration'] = duration
+
+            alltags = []
+            # pull tags from the case class
+            if hasattr(case, "__oeqa_testtags"):
+                alltags.extend(getattr(case, "__oeqa_testtags"))
+            # pull tags from the method itself
+            test_name = case._testMethodName
+            if hasattr(case, test_name):
+                method = getattr(case, test_name)
+                if hasattr(method, "__oeqa_testtags"):
+                    alltags.extend(getattr(method, "__oeqa_testtags"))
+            if alltags:
+                report['oetags'] = alltags
+
             if dump_streams and case.id() in self.logged_output:
                 (stdout, stderr) = self.logged_output[case.id()]
                 report['stdout'] = stdout
-- 
2.28.0

