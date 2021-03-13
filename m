Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.2585.1615661566774318081
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tmSPPuoq;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id u6so23073864oic.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1JQtYNRCWsQOPQzwJNsAPSs8CKzwCbAOyE/dWxRzYME=;
        b=tmSPPuoqXoH72WGhQrpkDlr1DcsvzHSCl1cZ+1nj2X9yAsm3Pl0pmWMxM2W8UVzWcE
         WesC1zFY76bzQ6e8mBJ25OUKmOiVZfrbE1ar0mEMx1x6/J0wRgJuwYRKDoJ2axX1qvKB
         Fa8lQZM9ZQsQh1QjdC2rt68uxojuEzdz6BEHjVekhRFvHXlD/hEb+C055JGV/cjkVtNJ
         lqEDttcPaNNWK5XHtRBP/3w0DfEqAFqW694JYmzbTsF9O9N8/uqD2Vw0mzay5cRn683R
         woB54uyLSodrl6Dx7BGyKy63yPsjnviildmFAshsMLsrYuwXuOE6OITuzBGQ9AD+ZO3A
         b4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JQtYNRCWsQOPQzwJNsAPSs8CKzwCbAOyE/dWxRzYME=;
        b=aAtIAc5qnsxF+TNfPioR/UPZz9xCJqdK0DuXE653BRfg/RR/2mqd1knGaNsNVycHYZ
         A/U+VCqqam1vXfYhOD1Bk6aT7uQWjgi3UfulnRuqOAJh86MaTVfL/EKRJYarsgGXEkKi
         o4jHtDK7wmFonVftm8UWqtvI9R4Ac1xP/dYmQyHWd9SOGoq8Yht4u8ep1IdB/bYRI0vG
         lLVjYT3xtsoKpniJZic0qmTgeclTNfYEddwo67Dp5mzjpgR/RwyTPl3d0c5fDGKuosLj
         a6dRZS+aAh4t7/6Rsn/iMooT7F0UhdSPUMsJlivP5lNNSJW9OcY5mjeXjIOHeW194Qvf
         NPJA==
X-Gm-Message-State: AOAM531NrxUwV29z1NfYCn9uppdYkOEArfQ53wXRrRqHWO8xMYE96Qpi
	lH7UqHdmLFm/Q6UfFBYmh+tZITfvIC1yC1ke
X-Google-Smtp-Source: ABdhPJxCroEGiJ/apNTuU3FkwFvVGJE0V2KU7yxXAgs9sedq4zENhFBTI9z+SAH2LuH8SlYjA3o+qQ==
X-Received: by 2002:aca:4c0f:: with SMTP id z15mr13913887oia.44.1615661565624;
        Sat, 13 Mar 2021 10:52:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/38] ptest-packagelists: remove libinput-ptest
Date: Sat, 13 Mar 2021 08:49:24 -1000
Message-Id: <d4df6cfe5b8d81c53bf5fc2a3b97886739f36a71.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

The libinput ptests are very sensitive to system load, and will fail
if events from the kernel don't arrive sufficiently fast (from 20ms to
200ms depending on the test).

This is by design as input processing is inherently time-sensitive and
to avoid code bugs the test suite considers timing problems fatal.

As this is causing a large proportion of ptest runs to fail in libinput,
disable the execution of these tests for now.

[ YOCTO #14164 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54e2eb809bdfedb64219f37b82589372bbc96905)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c13ff724b1..badfd69325 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -60,6 +60,7 @@ PTESTS_FAST = "\
 #    bash-ptest \ # Test outcomes are non-deterministic by design
 #    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
 #    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
+#    libinput-ptest \ # Tests need an unloaded system to be reliable
 #"
 
 PTESTS_SLOW = "\
-- 
2.25.1

