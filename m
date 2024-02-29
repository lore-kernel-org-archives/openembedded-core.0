Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B7AC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 12:05:22 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.23112.1709208319632061342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 04:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=l3ir1Hkx;
 spf=pass (domain: baylibre.com, ip: 209.85.214.172, mailfrom: pidge@baylibre.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc13fb0133so6659985ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 04:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709208319; x=1709813119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Id4mYUrwpkH/pJFQGYcI3wNMcGT5ybC7OchY5iyahN4=;
        b=l3ir1HkxwX2YjWVb3MKoHKWbNzQl8FC8+mOZYt6ciHDglpz027SPJDht1pmRozHv/X
         FsWCiU4SLPjAy3hsG0wPoodIsIufc38C2zse12fiWLHpxSmVx8wkjPldo3YON09R5UMA
         BFZ28NpKLyT28m0xyWVTDwiln4Eeh1iKf2jgqJffNgYmTMFXb4VPaDpOk91TRzOOF/W6
         BV6dw2PuScF6n+kr+4UVH6snt3VhbYxObB37vvuNwNbEBTUs+2QdDkcBHI71SERcCmNM
         v3RHLNYfltt/k5K4ITKQI/b+5bWwgLMEzP5Z37Cks/R8jUM9btcucylwcxiErYJVFeG6
         VWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208319; x=1709813119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id4mYUrwpkH/pJFQGYcI3wNMcGT5ybC7OchY5iyahN4=;
        b=bAV+OYNR7Szj24ESt3ITb6CpB3UQRjGesTJY7Lv7HBeeKBYO1w0r1oT2Rli+mzqzV3
         pmJIt+xKmhCIX4RdxMvtZP5B+6NqbLMqFm8ajpTonkX6OnC08mtCgAWc29oQhJRvloAg
         jt/jUX+uxK605EdWv+eQI166hjQk62pWtRoc1ErsQlJkYMPxZA0nGP20Qh38AVAEswhR
         MmsnANUmJl1qUWBQQRnz7FLtersTd69/HunQ9QMnZqFiaAq8bfQ4q7iaZLbYmu6KJlAz
         /jE7ia8VqG+29d481bn6WRmKSNudRLWCYjGDpXvm3ShDEzhPA4v0JB9eokkh7lv0ryof
         Zyvg==
X-Gm-Message-State: AOJu0Yy4nGygrpi+ZvH4gp0Nc0QXEutuDtNrSe1RbxYc6wvyGosE2ijo
	j/j4c0CbqG4q6RDHtFRGw4mEtt66yCK28ijY9h6bdm0rNgZfGEaxFGoKy4URkumCO21Dyhj7Iuk
	chYo=
X-Google-Smtp-Source: AGHT+IF/ZPrjie6SxdTt2vExcu2EVMcZwve0PNaB/28ECXAVT+U49oR1aPcoQSFHgOB3JeHtNj6bFA==
X-Received: by 2002:a17:903:2351:b0:1dc:42da:bad with SMTP id c17-20020a170903235100b001dc42da0badmr1877916plh.62.1709208319118;
        Thu, 29 Feb 2024 04:05:19 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b001db608107ecsm1289675plh.167.2024.02.29.04.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:05:18 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 1/4] sstatetests.py: Add testing for correct sstate permissions
Date: Thu, 29 Feb 2024 12:05:04 +0000
Message-Id: <eadff6d1cd38767818f84141ad009492353d3ad6.1709207755.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709207755.git.pidge@baylibre.com>
References: <cover.1709207755.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 12:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196431

This patch adds to run_test_sstate_creation so that it also tests
that sstate directories don't accidentally pickup umask permissions
from the user upon creation.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 28 ++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 56dfcdb0f39..c5581d52628 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -79,7 +79,7 @@ class SStateBase(OESelftestTestCase):
                         result.append(f)
         return result
 
-    # Test sstate files creation and their location
+    # Test sstate files creation and their location and directory perms
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
@@ -88,6 +88,19 @@ class SStateBase(OESelftestTestCase):
         else:
             bitbake(['-ccleansstate'] + targets)
 
+        # We need to test that the env umask have does not effect sstate directory creation
+        # So, first, we'll get the current umask and set it to something we know incorrect
+        # See: sstate_task_postfunc for correct umask of os.umask(0o002)
+        import os
+        def current_umask():
+            current_umask = os.umask(0)
+            os.umask(current_umask)
+            return current_umask 
+
+        orig_umask = current_umask()
+        # Set it to a umask we know will be 'wrong'
+        os.umask(0o022)
+
         bitbake(targets)
         file_tracker = []
         results = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
@@ -104,6 +117,19 @@ class SStateBase(OESelftestTestCase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
+        # Now we'll walk the tree to check the mode and see if things are incorrect.
+        badperms = []
+        for root, dirs, files in os.walk(self.sstate_path):
+            for directory in dirs:
+                if str(oct(os.stat(os.path.join(root, directory)).st_mode & 0o777)) != "0o775":
+                    badperms.append(os.path.join(root, directory))
+
+        # Return to original umask
+        os.umask(orig_umask)
+
+        if should_pass:
+            self.assertTrue(badperms , msg="Found sstate directories with the wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), str(badperms)))
+
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
-- 
2.34.1


