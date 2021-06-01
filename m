Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.58344.1622557158422045373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aaU+L1CB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id u18so1304462pfk.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=goaAK/ujl2C7ixFJ3EIhlaiHxKAZzjADL5jUKqD/7Xc=;
        b=aaU+L1CBVyN7nLCqa5MxqRxcZ4BKR5rihmhgasgkMnyP85v/VdC0oCE/hZpcvoShzg
         6QFxfADAlDiq15rSdaqXi3bVnfXTA2q7tPo5bztkfLjjwt4ZvXCdx30YJm/qIf13Cc12
         PfCsD5lIUsaUty6fBJyrG/gdufnMstEdiJpHzOE3BQpoyvLdevPDnUPXnzjZSvebXhgX
         2xF3lAvXgEB2fFTyxIMwbOUTMA0+KYZ4qseMnKb11AKc4B495BIbNl2QD9Sww4uM9cdF
         peKjJHXksuLIhETJ5AbHprUQxZwiFWT5ihrHaqwgaYdQ2rDX/DeBA/j4UYPYJiS9xQ9h
         v4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goaAK/ujl2C7ixFJ3EIhlaiHxKAZzjADL5jUKqD/7Xc=;
        b=grZ+WLhsi9Fngk5/53q9n6526NYirXlTAyrkL5NNq9INR7bcXyLzucl2wUQIWb8jQ5
         EzA+PVVQOEMz79oN7c6Cef0w50f17rtORvhDHoBKdxuZ8G/6ZOrlUqVc53DQ4uGjk8uE
         SlC5TscR3FkeoHDIhZWPEhoQEALpNzAZnnVEwG98pgZHrmjO+Dpn8E49MeaahYitTytL
         7QiJoHKtH1AfSBmNBt1i9AZKGHLk5Ieei2HhVLvtSc2yItU4NY253Sb43r2uAvdGZxoO
         +cShjWB5zEla1m9/itAljbYRWfFaCxnW1tudZSrYdB9tLOhA3cTSbUx1HrJ/H4UQ8Eey
         KHVg==
X-Gm-Message-State: AOAM533U8LzigfaRASuBXIMEt9142i2IMVJyw0VmRdsJ5JMPnM1PbZQV
	TAbdLJB2nS7R6AaMhRJVfQ3HrR3TQ5XO/66b9ZM=
X-Google-Smtp-Source: ABdhPJyHrxYrrofv5eTIU0XoY6LRY9kzetDW0VCDh30RXSxAs8lNT/c1nS42EZGGV1icat+L8zxc7Q==
X-Received: by 2002:a63:d312:: with SMTP id b18mr28567046pgg.89.1622557157484;
        Tue, 01 Jun 2021 07:19:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/26] package_rpm: pass XZ_THREADS to rpm
Date: Tue,  1 Jun 2021 04:18:10 -1000
Message-Id: <b1e9fe67a85be516a0b32e0c91448df87a756e02.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

By default RPM uses the number of cores as the number of threads to use,
which can result in quite antisocial memory usage.

As we control the macros for compression anyway, we can pass XZ_THREADS
to limit the number of threads if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9c983eb22a9b0771a0454216d1d7cbb5f3f8a16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 7de409197e..fc9007922a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -678,8 +678,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
-    cmd = cmd + " --define '_binary_payload w6T.xzdio'"
-    cmd = cmd + " --define '_source_payload w6T.xzdio'"
+    cmd = cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
+    cmd = cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
-- 
2.25.1

