Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web08.9872.1614349673204550596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wOxhof21;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.169, mailfrom: steve@sakoman.com)
Received: by mail-il1-f169.google.com with SMTP id v8so4510498ilh.12
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LP70i4ovxkzVLrsSSgCOW5NKyA6dOdtCBqCW7a5ZePc=;
        b=wOxhof218J5WZcWywwoY0oFU7h8sIEY7sh7IPS7mErxIMvPkA3NTFMcT7hmwXX4TDz
         uLOXJWwVmCmxl1Q9KYX2amCNqvDEJgG42Q6lnqkp1qzNO58xQJUopIcrTCmU0h+e0bhH
         H2cJmvnAn5GBJ5aAzUIKhE8i9F9ELSvq1dFBAbqjYxKhCNZ76MxpNFEK60jz7tNRFLnP
         SGKWiyw1oX/7g+9uOGOR7cvB6QLnzlbiY87E4ae2KrJBMMAOvHHj2PNexoECQpyAvJhZ
         POaqJC1gSX3kCoqER1GqsEKehNzIgNXnfE05QrI/TDyzrVd7CNANkIqhDZdzxSHhkl3i
         5ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LP70i4ovxkzVLrsSSgCOW5NKyA6dOdtCBqCW7a5ZePc=;
        b=ZNcBGulmPG9EFHfO0is7/fDRKcjg/WUSMH8jCHr18DEP07wUE2mDvIMcGBqyGgCI9P
         +eTx62UUu4EeW5aw5OOHIcYc4MK/6athBxy/NEc4MxPh2NLQ/USjg8hjuf1f9XTJjt9R
         OlFvLEoTOeSadr+UP6UNmwsxfra2E2e5qFpbWirCpfmSVXEI7/PuqX6LIIQNX+B9usZY
         6Q+OM//GoxcXw+P8gKoKoJMJAL1fIkpxIAy75KRR0uf14dh4Lxz7JiYa+t7TEEKHYO+A
         iQc+G3tG75pgLVbds0Pi62v8ghA3xB6LO7B4Z0yvjdwXg9YF1Sj1Qs23SQUPh/FPrBzC
         GrqQ==
X-Gm-Message-State: AOAM532mZCIFsdxbrnHiYG561wKUPTJBDSMjOEWzwesl4o8Fqy4PUOIZ
	aOwsJ8QlKsRPDV+QW1hTNYp6hRp4LJPdwGrE
X-Google-Smtp-Source: ABdhPJygeHQkVrgyu92VA8yy3V7veFTPJZOkyjV+qXAHgODCJMtYCnnuhPgbrFCTllBorgwinzcseA==
X-Received: by 2002:a92:c269:: with SMTP id h9mr2544544ild.239.1614349672157;
        Fri, 26 Feb 2021 06:27:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/40] df.py: Add feature check for read-only-rootfs
Date: Fri, 26 Feb 2021 04:24:17 -1000
Message-Id: <4aff95b12879ca33fadc963fe4ab6d1172dbc971.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wes Lindauer <wesley.lindauer@gmail.com>

If the target is using a read-only rootfs, the available space on '/'
will be zero. This will cause the test to incorrectly fail and skipping
seems appropriate in this case.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af1dbea3c9b9b42a3e6803b231e425423d70e210)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/df.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index 89fd0fb901..bb155c9cf9 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -4,12 +4,14 @@
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DfTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
+    @skipIfInDataVar('IMAGE_FEATURES', 'read-only-rootfs', 'Test case df requires a writable rootfs')
     def test_df(self):
         cmd = "df -P / | sed -n '2p' | awk '{print $4}'"
         (status,output) = self.target.run(cmd)
-- 
2.25.1

