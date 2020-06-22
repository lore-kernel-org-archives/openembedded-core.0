Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.393.1592848846774793485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l7t5pw6v;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id a21so16427268oic.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pz/Qn7d3jaJdjFpbZDITdzml3JMLiwh562+yS6r0t9g=;
        b=l7t5pw6vjPS7nEGCunUAMLdfOMQLIq4LCeQekY9JLWOGma4reJQ28yiR3cB105D/Kq
         p7GMLp9QCi33AXthz+PSXQoQV3LX8FHqBJ200NMZoxR1J5clDRN1YvtGJPMntSmWnaGw
         q0lYb3a3KE7A+47/or7hSuI6TjxvFivmP7/QO3KP+ipa0Bq5BIDoUtXkRBXHjyRdnjWz
         wQPUHY/Gi1+yUve0fAUNHSd8pFlSn2+ppmrBguXyz3i8Ohg7BmduR+gnTcsYb9xdyamo
         PbrEqGFwv/kqmOPZz/ImbU+fvnoHSvaqa1xzY5FFvQK/t1DpU6MSdssCoKrBk7hCeFvb
         PyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pz/Qn7d3jaJdjFpbZDITdzml3JMLiwh562+yS6r0t9g=;
        b=bAz2HQ7JywcctS1yYmGrRou/h43EsBnts2bedJBEH3U9B5o2y0Md1yxBMxPnFELDLd
         hGHkEHyxze3HbBYa8xBmd78s59VbJ0g5YRuvfJ6AsyQ4gk/OaPtgEtQ/XL/Af40rEA+1
         Dkk5qMXYsjwaioteDq+Pv1UlCKLYeKru36GCG61od7HcNJteLkGsyHygye6okF1Xyui6
         DlFkXc3ZI8inrDCm6Vu83+5WitIdIY0FPLHNROkwqwPGYsqkJhtXnMLVS052W5Tn3Kg1
         bbDRFiKbQ+JaESuXX6FI7GCYyJNCWDuLgFK9Kl1Jabb6O9Vn54sWJy+H6yGzCQFebqEU
         WMUg==
X-Gm-Message-State: AOAM533S8nlsQ/JNqaFhsARt/U9UEPDLbP/E34ZmQTM0z3vmNHtB/FEt
	nYmG7ED9x6/QC6+/W/vMt00GYr3QeaHJtQ==
X-Google-Smtp-Source: ABdhPJwRjgVB+OfUNz4WfMY6VDcjgo3K0LWxlYNJ3gJpw+3qMUv7+1tSq1zC0upUt3omLgjAbAX56g==
X-Received: by 2002:aca:da44:: with SMTP id r65mr12984948oig.124.1592848845666;
        Mon, 22 Jun 2020 11:00:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/33] libpam: Remove option 'obscure' from common-password
Date: Mon, 22 Jun 2020 07:58:11 -1000
Message-Id: <76a63a5e1d572703c7e5e1360e24c05b87186e8b.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: haiqing <haiqing.bai@windriver.com>

libpam does not support 'obscure' checks to password,
there are the same checks in pam_cracklib module.
And this fix can remove the below error message while
updating password with 'passwd':
pam_unix(passwd:chauthtok):unrecognized option[obscure]

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea761dbac90be77797308666fe1586b05e3df824)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/pam/libpam/pam.d/common-password | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-password b/meta/recipes-extended/pam/libpam/pam.d/common-password
index 3896057328..52478dae77 100644
--- a/meta/recipes-extended/pam/libpam/pam.d/common-password
+++ b/meta/recipes-extended/pam/libpam/pam.d/common-password
@@ -10,13 +10,10 @@
 # The "sha512" option enables salted SHA512 passwords.  Without this option,
 # the default is Unix crypt.  Prior releases used the option "md5".
 #
-# The "obscure" option replaces the old `OBSCURE_CHECKS_ENAB' option in
-# login.defs.
-#
 # See the pam_unix manpage for other options.
 
 # here are the per-package modules (the "Primary" block)
-password	[success=1 default=ignore]	pam_unix.so obscure sha512
+password	[success=1 default=ignore]	pam_unix.so sha512
 # here's the fallback if no module succeeds
 password	requisite			pam_deny.so
 # prime the stack with a positive return value if there isn't one already;
-- 
2.17.1

