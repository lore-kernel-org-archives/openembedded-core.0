Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1829.1601938657480510801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 15:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=F1+zy3V5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id a200so3060736pfa.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=293+J3KKiibvXLbsF3mfMelfM6xm80sDBDpaQBGslXw=;
        b=F1+zy3V5NoFkTEn16BvOKBHLHIAGQAtgS4YMjYAA1uJuBESngpO8GTJuiNmsKGFlc9
         K0MbfrbGWfQ+PsWcOzQGkezT3eRmL4p/NbFXPpghTscKemRl6Y4LMuHPCCrAkBs8KFGu
         hFHIFBL3gMe2NO0AV+3mbu8bF6FB77dmolmGENhlHPvIQ17tJ31oyvLHfJP09VQPIubV
         9ApaSxArE6XFCk0LrX0NJLaxuP1yg7Q4rTg2DMpMahBRaKeiW2pRan+V9bYgCZ5N5QG4
         t3yfq0mNwrGevPrnD4p7IjEQh5CwJGpLzo6cu86nRa6LBpLDZHiu2k4uWqaEStTXJipE
         yjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=293+J3KKiibvXLbsF3mfMelfM6xm80sDBDpaQBGslXw=;
        b=gOGnbeQRXprcZgXRs9OZ8N6BaIzacqtRHrJNz+2G+Kko7OfzEXTTOuoIN3alhQ8pm/
         4T5qX3fOKinAoIAVC8bf/FtL0RLL5lmNS+1snr4mfz9eDrPgiJWx0dtBn/bFxsWxPWRm
         ZfJifSIkRhXgtqKtEIuwUVv2ss7MhO54VSyte1X6p3hRw3rgVBsarvyVEqJ9mV0bBPCf
         yILHQeP99aXCLO9FyPf8eKZwBh8SMoH47NyJTX/Wr9r1wjcmT71xysiLoZoOAY4oZeFP
         yeT3EzRUc0XuGJRLLEHiOSF/LIKsrnBrQrPfoBuXGNuZH9TCss86PKrpt7XFokuvH6Dc
         boeA==
X-Gm-Message-State: AOAM533DfOHAxINp/7RXRU8IYw+NbJd8gXoGC5k2Q8ZLpLE2W5R0FqVW
	VKoQtaEs5YlDfzWxT9JXNRqbcWSeICtSQfK0V24=
X-Google-Smtp-Source: ABdhPJxB8nlBx8uWsOa+rBUNI5fyC0h82rA9dgYKm4aR6C44YaFPDyy0zaYMlMZY6v8CIfXzQIVUtg==
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr1548345pga.203.1601938656439;
        Mon, 05 Oct 2020 15:57:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s67sm1038881pfb.35.2020.10.05.15.57.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:57:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/2] perl: fix ptest test count
Date: Mon,  5 Oct 2020 12:57:19 -1000
Message-Id: <552739383321bd9b4780bd0026d6107ece530522.1601938491.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601938491.git.steve@sakoman.com>
References: <cover.1601938491.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

patche added in commit c2710903859a5545aa9dd56251f61667ee8d80bd
failed ptest perl.t/re/pat. The patch updates incorrect test cases
count causes the ptest to fail.
864 test cases before apply the patch while the patch added only 4
test cases so it should be 868 instead of 873.

ptest-runner log :-
  PASS: t/re/overload
  # Looks like you planned 873 tests but ran 868.
  FAIL: t/re/pat
  PASS: t/re/pat_advanced

[YOCTO #14071]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com<mailto:chee.yang.lee@intel.com>>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
index ad195cffab..d25f4d4a74 100644
--- a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
+++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
@@ -265,7 +265,7 @@ index 6a868f4..2869b58 100644
  skip_all_without_unicode_tables();
  
 -plan tests => 864;  # Update this when adding/deleting tests.
-+plan tests => 873;  # Update this when adding/deleting tests.
++plan tests => 868;  # Update this when adding/deleting tests.
  
  run_tests() unless caller;
  
-- 
2.17.1

