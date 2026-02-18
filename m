Return-Path: <adityakurdunkar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E321EE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 22:55:50 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2163.1771455350267535977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 14:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bItV7oOt;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: adityakurdunkar2@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8230c2d3128so131435b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 14:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771455349; x=1772060149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4UFRdKb3XZ7H0UcL2KUcjTMHLSAg7sxIeRNM94GrBc=;
        b=bItV7oOtTze/qjQhU0CcMoufLbgRIcPqkYC8tVNWt/o2Ub7MFH+XpyxFZ8Hgp2S6+G
         uf0uuGhTCUIntrRtoA2NocgoJjNRbq04/LFZy9LCDQUjVXIlREu1t0QZPlA50IjceOR7
         BOPFFjpmFZ8Cj9lgfWi34QZkrfvbUvJEwMvCQNhTFmvoaqaEDktkrI4Br+mlnVPX9O4H
         QPYA0DAdjlrnhpJ7QhHnFlWW2yvuqzUDHKWE4MTvF4P1TNpLhFsAbHx6Qt30EvGRPt4r
         Dw4gSRTlPYur4s/kUxdC8IQlYOKmmDCw3CCdHWhMaW5b1BM0AjgwtnQr6yYnGb1AxwQh
         fFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771455349; x=1772060149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4UFRdKb3XZ7H0UcL2KUcjTMHLSAg7sxIeRNM94GrBc=;
        b=JMef80DKvWRhKmPDLScTJnJTxbsDF7tywmuqzelw6ap5YVXQFUIhkaivkiET5MQ3Nk
         r9BGdiBikFwH+vwdhPnq+5ovMCAQhicsksSv1YB8lNmcvVJ0/4Cc9CGs4pkm97Ki/1aO
         1G/ObrTMr5dpOUhcF/WfNrQ1yuDRAJHRrbKwbyC/NX7m8Fbq3hlQBKcfKRhzN8i7k5XF
         lTCgk7ZpoxQGmwWtGokPtLb8G8t+q10BFAsFhqcrhWuqEJbXRkorGkqkgHWfRxm/nC+4
         bPestyG5ULmd9a4BfRPqTZUK2yy2ROpmcUUKD6RMCZyIS7E5/b0a8IX2I9nbDEE3ZrLd
         tX2g==
X-Gm-Message-State: AOJu0Yy+8cEd2FGJNX1s6M/bJD6Vpsho88IPIrAo8Rg0fWsQznyFaQV1
	ueoiCdLFEuLwrZaLD0W7kB5DEW8/NOAPmC+y8HlLlDCDOkQEAEezagNLEkjgIg==
X-Gm-Gg: AZuq6aK81hhruQxc2kIWVOIBr0CLD7y8Kd7Cj8UT2+t7sY2xiiEGIrj6WGvznGoSEpO
	JeuRPXtefVeFVkWVU8i7n+ogmlqgYVls7zCHvts60dh4pMXzzBRXtHY4abFSIBAicxUF7b1TTeq
	z7KNhAXfSUOBnHPLRN8DGolpYi4hw0+nu7VzhOBOGpRLtSWY4SD1aZmFRf09aLvD+ku76iwLipD
	YgiYVnyKOirPuvnMwBBb9zJsjep6T562r5hV+o37V79+vzGOd3Qq5gCh88hNoti3zyBHNYn+Tui
	rg6Nv64x+dJptWOb+mZrEjGphc3XpECNsfLHXKAslEdZuzkLn5nTYQmoEP1wJFsKAwUIn445mqf
	UCfUwEulE1XvaaGQwroHmi5fkYggzhJwOdDL87AXLWk+cuOo5DkHkCSl9gK8E2Lelu7KyA39mny
	tZniFSTvZ6B49pUyZC5Xd7fee0VG0XFJdAZsOCprdaqaCCGg==
X-Received: by 2002:a05:6a00:2d90:b0:824:ae74:571f with SMTP id d2e1a72fcca58-82527591ec2mr3508116b3a.40.1771455349481;
        Wed, 18 Feb 2026 14:55:49 -0800 (PST)
Received: from e2d838f-lcedt.nvidia.com ([203.200.25.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69f14sm21532945b3a.35.2026.02.18.14.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 14:55:49 -0800 (PST)
From: Aditya Kurdunkar <adityakurdunkar2@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Aditya Kurdunkar <adityakurdunkar2@gmail.com>
Subject: [PATCH] externalsrc: fix duplicate entries in .git/info/exclude
Date: Thu, 19 Feb 2026 04:25:44 +0530
Message-ID: <20260218225544.3523943-1-adityakurdunkar2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 22:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231416

`readlines()` preserves trailing newlines, so the duplicate check
against the stripped link name never matched. Strip lines before
comparing to prevent repeated entries on each devtool modify run.

Signed-off-by: Aditya Kurdunkar <adityakurdunkar2@gmail.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 527c99ab69..902ff2604f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -188,7 +188,7 @@ python externalsrc_configure_prefunc() {
             git_exclude_file = os.path.join(git_dir, 'info/exclude')
             if os.path.exists(git_exclude_file):
                 with open(git_exclude_file, 'r+') as efile:
-                    elines = efile.readlines()
+                    elines = [line.strip() for line in efile]
                     for link in newlinks:
                         if link in elines or '/'+link in elines:
                             continue
-- 
2.43.0


