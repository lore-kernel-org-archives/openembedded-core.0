Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.401.1592848872893295589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=raF5QqR3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id v13so13809930otp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aoso6/AnmPzZm8uCUlPU3DukQ2blk9uchUiPZ4vFzig=;
        b=raF5QqR3DuGnVMUgabpQKdN4qu/ov6CatIw9adlegVogkBxDWlcUs6N2mrQ1G850oE
         u7GwqyWvr9M7FBjoiIQDc2iym/GkYvybK/o96yEVcmmsp1F6vulwgvLOodPmkTfukEeo
         E6XQmZoz68u7lModmayCHiCMPFFISE3VfYWz68ZEW/j/mBNWKl83L62B9MoyWzPjOA0F
         HpCH4iDVXmem9n3SnpDWb+Qy6NE8wFNqbcThW6xQETdvd5FQh3IRNBqZp7AgiraPr3/J
         F923qAZISzoDRN1GDBEAwZHntPYw75tVVk1OA/TwPBiS1isZGrKvnQE2iFWm7qpAwu3P
         hxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aoso6/AnmPzZm8uCUlPU3DukQ2blk9uchUiPZ4vFzig=;
        b=PoRtB4TdY/ce8cQ5Jxl02hWoDfic3zS2QeS8AN8/N/Loms51oS+65sFWNgd8mQHmyj
         C+JL3/1yJPLtP/LH4rtePKSDnaC3Igi3H40v74jbm4cw9qiwRdqf6U2Px+qrFeI0K8o0
         vHrsofiJH01VfX8tN6S+CZwjwlD7/JVYc9vWG4JurJ5YremLj+gdvSEEB6ZJwocUq1R3
         tpmSltgkXVjtGm46tyTJH5DDJa0A/RunjXZ28P8LqO7O/eJk0uVil0h8gmhCWhjFzGUX
         Qf3r4wAxubgSSyF2SgLbPgNzp9eCikmQQsA3KwXRKfrfoPpj/Y+6wvwlLWm0MJOeJSKQ
         NyMQ==
X-Gm-Message-State: AOAM530ymp7lbbXM9T+R2ZQ1V7hooIkNLXJYBmLt+xB1UCubiK/1ortD
	j2Hf+HRCl842p3fBVhwrzvyIVCipRk6CAQ==
X-Google-Smtp-Source: ABdhPJzFu2gGgy2+sGrMJ/OCAaNpjIGRZ24Zpl0FztDw/P39iRog6Wp3ThskaOjgBFWq/18lwMDLfg==
X-Received: by 2002:a05:6830:1657:: with SMTP id h23mr15617899otr.339.1592848871760;
        Mon, 22 Jun 2020 11:01:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/33] oeqa/runtime: Add OERequirePackage decorator
Date: Mon, 22 Jun 2020 07:58:16 -1000
Message-Id: <2c54047118e813311581f9dc567bd12f9f211aa6.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Add new decorator which behaves like OEHasPackage, but
fails the testcase if a dependency isn't met.

This helps to identify missing packages in the image
under test when using static test suite lists, otherwise
a missing package won't fail the overall test suite and
errors might slip through unnoticed

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5be39df1494f33e2cae116e4930f2a0f3dd2000)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index 4c5ca198b0..57178655cc 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -46,11 +46,41 @@ class OEHasPackage(OETestDecorator):
             self.logger.debug(msg)
             if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
                 msg = "Test can't run with %s installed" % ', or'.join(unneed_pkgs)
-                self.case.skipTest(msg)
+                self._decorator_fail(msg)
 
         if need_pkgs:
             msg = 'Checking if at least one of %s is installed' % ', '.join(need_pkgs)
             self.logger.debug(msg)
             if self.case.tc.image_packages.isdisjoint(need_pkgs):
                 msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
-                self.case.skipTest(msg)
+                self._decorator_fail(msg)
+
+    def _decorator_fail(self, msg):
+        self.case.skipTest(msg)
+
+@registerDecorator
+class OERequirePackage(OEHasPackage):
+    """
+        Checks if image has packages (un)installed.
+        It is almost the same as OEHasPackage, but if dependencies are missing
+        the test case fails.
+
+        The argument must be a string, set, or list of packages that must be
+        installed or not present in the image.
+
+        The way to tell a package must not be in an image is using an
+        exclamation point ('!') before the name of the package.
+
+        If test depends on pkg1 or pkg2 you need to use:
+        @OERequirePackage({'pkg1', 'pkg2'})
+
+        If test depends on pkg1 and pkg2 you need to use:
+        @OERequirePackage('pkg1')
+        @OERequirePackage('pkg2')
+
+        If test depends on pkg1 but pkg2 must not be present use:
+        @OERequirePackage({'pkg1', '!pkg2'})
+    """
+
+    def _decorator_fail(self, msg):
+        self.case.fail(msg)
-- 
2.17.1

