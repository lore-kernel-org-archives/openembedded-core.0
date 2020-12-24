Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.8935.1608804098570026359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 02:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=BJR3AkYO;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.171, mailfrom: mshah@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id n10so1289348pgl.10
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 02:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=ihtHBD48TRXv7RL2pIIthIdDimZdKSNiDdzo8V/KRwA=;
        b=BJR3AkYOFyEoYaSMHvEFcsCAXXPxsrdDWlsW0qzbtfWV6eEy8iq6P2pGy1xzJCV/w3
         mE/YToEQqk3XPSZ9YL/kNoHjlsgaz48UKx9gFVklRqXlZRowCOCjoNATAnWylsirF6MY
         /AxwzDtC1OIswbIQyFGjWVdT1hMD+hjGbDvdd0e2ebpXJtBPevA5b6NWR0Q4p6S4O/Lh
         wAs+66F7QnRZzuq1ZE5yZTyS9utAEe/K3veljfk0JDmWttp0enxYZpzHN+QyN4IvtG1b
         2PvKZKBavplUAOdrLTrGxqnlTbYjAvFoz/Icm4kuCmTlZLaixuT/l8lEeDaZqwrllcIF
         tKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ihtHBD48TRXv7RL2pIIthIdDimZdKSNiDdzo8V/KRwA=;
        b=TmAAUoefWhkDyswjR8VcCAKRV1dB6rITjfJ1Ip2RuGH2178ikOK0wMUhldZLp6pYVD
         zlT8Y642kjHdIG4fp80CY2DklupJ14/xxqwnsViu0g462vWBH9DDjx5nykXtQxWQj5SV
         hItKEZWCGxEWk2oF5tMzOoYH5owVruNCHzjXTPDG+SnfSD92YB/ZFpnndSUc6LB5sOVF
         OHKKRfXgd/J5r/vJC+MNx1YFhpa0zJcTTBVuONFHNHX2YDe2lf6Gi9SSEghSlS0l0p9m
         ZRY7Oxlv3Lf7h1l8niPgOPR7GjhdBInouyzo1CRyINAJansLOIcqcHC9L5PeIRgg1BXG
         dzWA==
X-Gm-Message-State: AOAM530n7spgFwuJmbXxyWM1DdwNUPzIdwMdh1FeM1mvz9YOijn0GD4E
	xIirMI5UF5vQEcfZ+4ruMtIPVElSr0DSkw==
X-Google-Smtp-Source: ABdhPJx65MzoEOI2YaU+CaxSFbReA//fUtGbgXw0Y/5MYBTB4L2jc9s8g0jMHjs+68NBKz1WeJvHUw==
X-Received: by 2002:a63:1456:: with SMTP id 22mr24725985pgu.386.1608804097648;
        Thu, 24 Dec 2020 02:01:37 -0800 (PST)
Return-Path: <mshah@mvista.com>
Received: from dell-latitude.mvista.com ([103.102.57.97])
        by smtp.gmail.com with ESMTPSA id e10sm22910736pgu.42.2020.12.24.02.01.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Dec 2020 02:01:37 -0800 (PST)
From: "Milan Shah" <mshah@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH v2] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
Date: Thu, 24 Dec 2020 15:31:27 +0530
Message-Id: <1608804087-15784-1-git-send-email-mshah@mvista.com>
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
index 833a180..94ee1f5 100644
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
+        currpos = result.output.find('usage: oe-pkgdata-util [-h] [-d] [-p PKGDATA_DIR] <subcommand>')
+        self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
-- 
2.7.4

