Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C36BCAC5BB
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 02:31:43 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3093.1759977094565283283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 19:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cKypqjq+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f605f22easo395349b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759977094; x=1760581894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnmkbJGUqu+NL/dsHAYhhMxA2kYLTJ0vdYxocWgSqHg=;
        b=cKypqjq+2zil6lBjIaYwTUO4YFgZjKKw6lB80chwATX1sEAG0m/DOaWsRpCwjExfYk
         O7a7HBtsbLlosjETsZudD1l+ainUW/OVIjx/d+FzFup3KAUbiMpOjHtpqwntg0DaFQfN
         rvlvPiKk60M9c0TjP0ueS3Ix/trg6e5dLOTrxkmB6Y+Rn7ChRwaGS+tO2kEk5GGN9USg
         qDbT0jAEzG5Xa0O2fGioBTxgIaXr6eMi0s4Hfh5Kh5lYW0+FLztbRxKU9HOKyWlEOkeV
         ikIisDz8Pn6ylxozukErzamLX6k7nq1TbRi9MdHB9gRQOYwobfYx7uNGwlJJrNGLYxPX
         tzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759977094; x=1760581894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnmkbJGUqu+NL/dsHAYhhMxA2kYLTJ0vdYxocWgSqHg=;
        b=ssl9SSxrMVCB3fC5/wAD+SDKnXl9gXMj5W/Y/zU61AFmldhdXk1Evzr/AVJYtwmPJ2
         KJqX9iG3/OeDBAJngO+UoXZtt9FkhjPCMlbNE7TJ8Wd0BQLtJHyDaQDo1XTGQhPyV4Ie
         fpHERdckoKwGLdPWGppUEnOL8YTUz7olrz7tXBIbY5eQ0okxkKwapIt+2WL6buDdbPkp
         vmBZJOTDQ3mPdW8S40GJBHdfflvNsrS7oWYYqXiTNXX+zbzefo0OhEfbEmyWGs2bMYGm
         2gVAtt5UHEOSl+9hhZegH+8wkRsuqk8zXgdDfubmcyiHkY0Q8JczzULFWB+9n2jsPbQr
         Ohyw==
X-Gm-Message-State: AOJu0YxF9tnRMFwZ2AcDL5xIVEtwzRp7MNqhAVVhcCL/ukZN+L2AuJpF
	1/x6Cm44gG7fVwtun2XMO9K07TNaaHqh06Cjq2Zlbrl9TOIf+SYItGpdn/fTRoZQkDZuXiAAIOM
	lTmiw
X-Gm-Gg: ASbGncs7r+IXKaeuhjVmlfHyplAbqO2PwBSmCTIk5JUtqg5PjCzH5ieYSyifuru3ffY
	CnhWrgHGGkhufIy2QpNQoaNLP5iEFGI81xAvo74n01QjpwzyVO6ei8LbCXAB7j0lwB6m3JBY89r
	q8WzN3HeMlt3m5RjtSEvXsbprTJOCPWUSQ6ZB8F5w54WAf+5r0G38ZMkF3Q5B/zwxI45Gpt3gCV
	j5YvuA/gzLMCqJP5c7RpeU9astzyrhF2BK8cbdx7Bi+K/CqX7RxjF8EbUBeAivLi+mz+VnOj26S
	XF9nYLqOQ9e5YqmrXPYeOB02fS1Als5jxpK+B/dCAjPn9R9YctfgEo6WQWL2oQWljYw6keIe4Rb
	0u9EjQJCqC/D4MA3RZlOeocH+ZpvLoDHoXxpFbQ==
X-Google-Smtp-Source: AGHT+IFdZ1uWFvJhsa//uf1ka4350kzPcxat0GhQx51TfhhlWMHKBwbsz6zmDXvZyFT+tURv4HXuGg==
X-Received: by 2002:a05:6a20:2585:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-32da8462b36mr7343322637.54.1759977093612;
        Wed, 08 Oct 2025 19:31:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3186:2c36:6c8c:efb2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5af9esm1147946b3a.40.2025.10.08.19.31.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 19:31:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] oeqa/selftest/cases/meta_ide.py: use gnu mirror instead of main server
Date: Wed,  8 Oct 2025 19:31:22 -0700
Message-ID: <20251009023123.245604-1-steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 02:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224603

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
index c3a7df4cdf..d3611e04e7 100644
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
         self.assertEqual(self.project.run_configure('CFLAGS="-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration" $CONFIGURE_FLAGS'), 0,
-- 
2.43.0


