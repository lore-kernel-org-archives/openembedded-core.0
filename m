Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.37994.1591020707782025595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DScUNMED;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id g12so667250pll.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=A0csPRu0iPcAHjLTBI2ezs/l7Z+/SuQDvr8k0mRZ+Fk=;
        b=DScUNMEDA/py3OYmlLzLJyQ+DgLcSLJr7+eUc30AZUsSgXZXqPhakabqJVsKtLJFUZ
         tJgp9iEPghWaoAIjss1asFUK2/FJ03mrQ2m7Xow3ap0Ez1irR1m0+bFLm1rH2sK8Ladx
         Z7BsOgSJVwgSXQZ7TxDxNhgrGzRKIX0G5rNKpfdaVi0N7GgKY4ZC3hBI9AFIZgnSdOiJ
         K4GN57GenaTrvarnJ0g1B8xrglifBE8p0mXh41Vi4EUrjSCqDVTqJz7WIKh9msZMlg07
         aFOlWLZK8onVm30GbmjahyTq6no4SCrZsELaoyEOdIhSsmjPn+1ytxGLSoPRhwf4Q+g8
         sftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=A0csPRu0iPcAHjLTBI2ezs/l7Z+/SuQDvr8k0mRZ+Fk=;
        b=fovaTjiJvFytiNbzqS2b0+lMpuNqXE1uUakVLcWc/CDczQp1Aj9N5nRtRUPNiVHHtJ
         dINMwkYDprvSyWY0cTdMKB1xFagcGcE7SrbjA6PNJ1G4ISpuU27u9W/SArtIsNKTYK7H
         zJRq/EwR8VZIj2jKyg4CWOBqp8nBMqPPpm+YueJ4oXNtiknbeXrD/BN8EQ7Crkf7H/sb
         KleH5iybcycs5OkHr1OBX7UDis3zwgJ3Ihl2W4G23+rIHX4Yq1Hkxv160XcCKyTEAneL
         zMtTi6KEhBB3E4kOHdQl8OprYIlSYFcK89hWosGH85aSNUz/TugXI/1NoMu0nlUnGNjK
         BnQQ==
X-Gm-Message-State: AOAM5334TS3IfLcw+7i/fHhaT1Co0Kfv9xsP2uGtyEJGfQrCGqxz2qwy
	Qc36qNxfAPcDrE8nj9TfN9L7fhP90Ik=
X-Google-Smtp-Source: ABdhPJyHjSGMRMVdauby+L5ztqvSXFb1LyPGF+lTuqKyT8+hON8oaQGNt3Fl+lgjqCoYIWk5zwhdEw==
X-Received: by 2002:a17:90a:cb13:: with SMTP id z19mr12222451pjt.169.1591020706633;
        Mon, 01 Jun 2020 07:11:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:11:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/16] cve-check: Run it after do_fetch
Date: Mon,  1 Jun 2020 04:11:09 -1000
Message-Id: <dbf143d79476e54e8da93101fc16eaedeec88362.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Certain recipes e.g. bash readline ( from meta-gplv2 ) download patches instead of having them in
metadata, this could fail cve_check

ERROR: readline-5.2-r9 do_cve_check: File Not found: qemuarm/build/../downloads/readline52-001

This patch ensures that download is done before running CVE scan, even
though these will be external patches and may not contain CVE tags as it
expects, but it will fix the run failures as seen above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e406fcb6c609a0d2456d7da0d2406d2d9fa52dd2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a530a0489..556ac6e67f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -65,7 +65,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build
+addtask cve_check before do_build after do_fetch
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
-- 
2.17.1

