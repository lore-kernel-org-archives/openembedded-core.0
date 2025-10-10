Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A21CCD18C
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2335.1760064672760305320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hhuX3Lhd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781997d195aso1158210b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064672; x=1760669472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uK+ETqNyh6W/dRg5YGs+c3GAjxJq+DLi8mAqhFXr47s=;
        b=hhuX3LhdLBtEteB6mwVoxgvVEs7MYWxmd1X428m5Wo7E0VNjlVUO0liLxcOPZ8sw5n
         86s5PxCvuuFKqd1RbWw/i93VkbHog2hPeoWTMKPbUNDGsFHlbGwNKAdBO0/gJeSPNRhO
         MGfGbOWVU+cO6S7mxDcQ1I96a7/3QbGTeYhsGX8bVKFFWPbVsnAMXX1GVOBuYPIwVe/f
         /jo424Q2TINHnuOubK47h0/TpoLVdtDl/T3h7QSgd5NWBiZjOei4WRpegQy36LUa6iL0
         LbZ/Uh2udbA2ItEVFfIyOCxtNMcnfqvPMST4CLp3v3BW6MZGj7n0q3XUQ48p1pR18zI7
         1w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064672; x=1760669472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uK+ETqNyh6W/dRg5YGs+c3GAjxJq+DLi8mAqhFXr47s=;
        b=dHpkvU4OY4H+8+NGAzTaeWoEzcLUMCFrv9E5H9JCPDBjMY+HCaGYKisvNGOewSGbiD
         45VGZzjcjmyktcg6kC5Yq3tQGcvuAOoDM+mVyFXhTpwdP4v06L4WuSOPxrOvm+Mb9U4o
         okXX4gtlXMGZn02ONPZIPK5JcAAKrI8Jap+Tu61KJ46q2Oi6XQiLFnoe3MfLL687++qY
         2QChosy+RggDFs7VYXwqg6vR95R5RFMgd7hS9eG1R+yLAJmOWlmYI3jknxoUAl9Dv/pJ
         8VJ9MP2I38YGbYjfhSnom/SSDJV3/IOnoqs3KNQFNlv5n8Bmfm84BG6vMx5ahBRAgsv0
         Ix7A==
X-Gm-Message-State: AOJu0YwtehXr2YCyWp1TWy9/hWlY0ETJj2qIomIHsXfzT7Gfo1rT8NXu
	gz4jU+MgDahRJeewEV95rwvfN5l/Yweu/08euPuKcOrBk18aEo2NpeTJSrxN3v9O533NYPVnDeU
	89E+G
X-Gm-Gg: ASbGnct/wghYfJFp475l3S8NL4w4oWFHmCAgxKT0Zpd+X4YGL07kyOBLKzbnc1PEY4F
	I+5Pd7HXXSIKSwTbq7xH2EilKg987ruJJ5TZpWT8d33tCU8+/y7w4o5eeF9GM3VYjNjIdeklc1K
	6l9YwO8MRf0TT6xhKhGFGiK0nGDkLqyWM1yJpTE4qRTt6ILhrj5iKf9wIqoCSOpo27Rlxy7bC/m
	qbpwmDhSE1NtPY9CD9okEt5c32sXjBCeo+9gy1zLVkGv0z+FnM3Rwa5u9CZHix93AzWYZrG7QUS
	X6IxzKuOQXwCnz0XnmePL8oaCm+T6rONMz2zjnVO01tvVYNdMNIodgHkkcxPG89P0rcNgqAwGjo
	IXtwYNA+p2gHyHFyzM/4F1TWJdV+6VcNt
X-Google-Smtp-Source: AGHT+IEPFDxJch+dhBQL0BB4cML4l+5nsGCGw0+oShb304lGo0wO+M3jyHsFz5Nn77/5w/ddR6hf/g==
X-Received: by 2002:a05:6a00:2444:b0:781:1cc0:d0ce with SMTP id d2e1a72fcca58-7938705204dmr11374119b3a.16.1760064671964;
        Thu, 09 Oct 2025 19:51:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/18] selftest/cases/meta_ide.py: use use gnu mirror instead of main server
Date: Thu,  9 Oct 2025 19:50:36 -0700
Message-ID: <8cf1a828abe0f6b9dee96b4fc8076f407def33a3.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224661

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 5a17ca52ea..086aac2655 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -44,7 +44,7 @@ class MetaIDE(OESelftestTestCase):
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz",
+                        "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.15.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
         self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS'), 0,
-- 
2.43.0


