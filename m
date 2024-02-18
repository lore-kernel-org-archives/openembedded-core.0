Return-Path: <wslim87@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A45C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 19:11:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.24455.1708283502553300479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 11:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aw15yBsr;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: wslim87@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e45c92a199so237367b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 11:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708283501; x=1708888301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXUVAxB88sAutgE3pvZAz1woZB5/HfAWz/VBLaYmotc=;
        b=aw15yBsrqYDYSu1b3tig6WFbq1JfYn+7jSN/LYcEkknsxQu/HffTUwEgu7Un14qUEP
         Ip00x62cg9oPfFJbjvrcu412/mbIXJ4KhkN/KkT0LFliG0ckNB2GCDpMxVas23VFFwrr
         1+3FqXgfRsAjHLAmszTMingX/jArZOSX0wqm3OhFheyL5wb6ao6ZLrByl9F2MFaFvUW8
         ovhzf1th3DuKXs85oukcHeJEx1Y8Yxdk1/ekqCZtOYvHzIcOlgbd1dlVjkYOoAWhgs76
         LeP7IHhcPFevHpkxiQs9xiMl9IzWTDTbRj7U+NHi+/rnzTUYzFcvkK6B/74QkHhehEo2
         XhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708283501; x=1708888301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXUVAxB88sAutgE3pvZAz1woZB5/HfAWz/VBLaYmotc=;
        b=WmEvFELafmowHpRpi6a0rRv6ihY9WaVfyPAfoWJDsnMo5vbcftpbxmEfdgCjCHX0BP
         8jbc7m+Ca3SUrlTq29vIn9RAgCcoZSILZwuGrYjMdu6zpSW3mlZ6TEWZH2XIFolZEYlT
         tbezBbJ3XeDwMjdjJhrzva956NBjGrBr/BRQMz3HKVm9/lZNyhRpI+WC1oclYYAwiLtL
         BYZ5VW+lVBrgzFbzzNp2bXVLDP5D0YyYezq2mUWehD2eWN/dz/1g74ReYgW+brAxKBEN
         9wrPVr6z1CPcFbY0f7bXpLq8FaVzpq619uqo/R0wxFKtTPYNXTgQ4dhT4wDOfjnLbScP
         O3oA==
X-Gm-Message-State: AOJu0YyZKenT0CJJ9z99ZmYgnvnK6+yFK2chMm/BKqZ9a42aPUS/bdnn
	mLKNJ8fCcu8zWPSWYEJNiCUJXfDKDe+Nkun3Ul95+fim9C9Ca1HmPW6+gGSF3HLW5g==
X-Google-Smtp-Source: AGHT+IEb1UmbiPtqpzP7PJs905QgrQgxTd2WB6Wu4uc2YaGPaHWDQE/4Od3ubsC99gHatvSivky73A==
X-Received: by 2002:a05:6a20:4f05:b0:19e:8b31:f1ae with SMTP id gi5-20020a056a204f0500b0019e8b31f1aemr10365802pzb.29.1708283501049;
        Sun, 18 Feb 2024 11:11:41 -0800 (PST)
Received: from archlinux.. ([2001:d08:d9:e466:be54:85da:1506:26fa])
        by smtp.gmail.com with ESMTPSA id c5-20020a63d505000000b005cf5bf78b74sm3264636pgg.17.2024.02.18.11.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 11:11:40 -0800 (PST)
From: Siong <wslim87@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siong <wslim87@gmail.com>
Subject: [PATCH] useradd.bbclass: Fix missing space when appending vardeps.
Date: Mon, 19 Feb 2024 03:11:31 +0800
Message-ID: <20240218191131.182790-1-wslim87@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 19:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195846

Signed-off-by: Siong <wslim87@gmail.com>
---
 meta/classes/useradd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a58f8287c9..f0ec080920 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -196,7 +196,7 @@ def update_useradd_after_parse(d):
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
-        d.appendVarFlag("do_populate_sysroot", "vardeps", "USERADD_PARAM:%s GROUPADD_PARAM:%s GROUPMEMS_PARAM:%s" % (pkg, pkg, pkg))
+        d.appendVarFlag("do_populate_sysroot", "vardeps", " USERADD_PARAM:%s GROUPADD_PARAM:%s GROUPMEMS_PARAM:%s" % (pkg, pkg, pkg))
         if not d.getVar('USERADD_PARAM:%s' % pkg) and not d.getVar('GROUPADD_PARAM:%s' % pkg) and not d.getVar('GROUPMEMS_PARAM:%s' % pkg):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False), pkg))
 
-- 
2.43.0


