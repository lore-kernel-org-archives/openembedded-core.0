Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.10211.1609739659529445381
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jan 2021 21:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=bHaiO+8h;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.214.175, mailfrom: mshah@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id s15so13933966plr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Jan 2021 21:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=fM1Guv49X24aihFy7BUO7yCoPKEwagKGLakfRnoTYcc=;
        b=bHaiO+8hIVPhrURYqaCCdkANYJjl0pR6OgWkJUQf5v/SlWB9CFq9onUYmGUnjEUIzu
         yeqMX/jR12PS6dM19DK8TDOFniuMKCSb/Ed/Pmkdvx9/Vwkq33U4DMDTzMhMlY6tur6L
         E/FTL/G5ajy4QEQZ0Mr2C11u+tsxz1Eh9CrvP09+mPec+daeX+pxEDn5qScxe8hY2+rd
         wRq8Wsr33wUjBdarnkPF1m3JpfkZC5ORtAJDXmAtqZwggu7+VtN+RnW/gGitc9Veu9dY
         tq4RC4vIvvbjxUnOqJvPTMvNJyFkjPl8D8/5TYlsasVlJ5iPLrc9em1U2+m1BXZ15Z/F
         II5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=fM1Guv49X24aihFy7BUO7yCoPKEwagKGLakfRnoTYcc=;
        b=Am0CsSCjFeZXO4C7JxTlWOkQl/OK5pwfH5t8XTIxk+QG83SGs160nkHGCL+hwdwUUw
         b4wbcSV0hpH3ymLMEj59W+KDZj+9st/2avmHMNMcWrQAqlI5+wTLFwEPIERz5GXhK7x9
         DmMgfMslyiimUqRFTMnIMSqbfppGcxMgdbgHrjQp+GaKp9iFdiFZQLmj5e7MzXF2ucx4
         PJjWKQ3DTVm0ejTZIQA2an6frUWItm7kP30dmOZ+o8lXzkpB3D01RyN76xZje3kFRn8R
         YeK6F28yg5DqL8PUwQeclTcsWYy4VUA/1JNa7zgsc2Fy+pVVLe2tTVxu0buTAhCwymGw
         b20Q==
X-Gm-Message-State: AOAM532AZHofa3GLpmgof2ZjEf/Xuk+yzZYsaBwLggOz0975B3BBzS39
	CFh8iqsTU+HN/xvBQ1DUEY7uil/C7lcJQg==
X-Google-Smtp-Source: ABdhPJw97f6yAMW7YuSWg/zJzqF0SYjjTN1XFQ0u/YPyCRzZqCEdmSKYQCz/9L9xzjEqT17khrIgkw==
X-Received: by 2002:a17:90a:be06:: with SMTP id a6mr28759863pjs.47.1609739658585;
        Sun, 03 Jan 2021 21:54:18 -0800 (PST)
Return-Path: <mshah@mvista.com>
Received: from dell-latitude.mvista.com ([103.102.57.109])
        by smtp.gmail.com with ESMTPSA id 21sm54257910pfx.84.2021.01.03.21.54.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jan 2021 21:54:17 -0800 (PST)
From: "Milan Shah" <mshah@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH v3] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
Date: Mon,  4 Jan 2021 11:24:02 +0530
Message-Id: <1609739642-25372-1-git-send-email-mshah@mvista.com>
X-Mailer: git-send-email 2.7.4

A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
the scenario when oe-pkgdata-util is executed without parameters and
help is displayed.

See [YOCTO #10726] for detailed bug information.

Signed-off-by: Milan Shah <mshah@mvista.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 833a180..254abc4 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libz1')
+
+    def test_no_param(self):
+        result = runCmd('oe-pkgdata-util', ignore_status=True)
+        self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
+        currpos = result.output.find('usage: oe-pkgdata-util')
+        self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
-- 
2.7.4

