Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACE3C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 15:13:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.1113.1716477222540298638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 08:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GG+GAnHx;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-657a07878easo2202514a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716477222; x=1717082022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeQQFu41cjN7bm8AwYQqGVnRbm/gQ5ryCA1WWAtwtfk=;
        b=GG+GAnHxdUhGxGINSfI5D/4nzSIbK+0WojbXwoil2QGGCNKxBS5M0b9SIOwNyyZ8g8
         qntKF1Kqmo5N3++1YgiY11q13zBs6rcg9jPcwqzfNosZ7/U4DHElE0qcuaI4gA7qCjv5
         LhKzwfXnTvqF3CK8HkJxbQSVzid1EH+kBdiLcu4txuXG4cE5GUAiNtqcm+39ruvramr7
         2j0fTZ63BNrsdt/108yEOYt85hXHHuw5XWzxjRkvN2PQlBVXeo+YX6UXGm7FOF2RTbtE
         OS/qcRoZjXFniGs4hsisiF98ysognS25BhUO3NeVrnl/NZnQmSrzlVxRyshRjJ+5MmZq
         e6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716477222; x=1717082022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeQQFu41cjN7bm8AwYQqGVnRbm/gQ5ryCA1WWAtwtfk=;
        b=IANgAZApO41K6qmp5sIzGmebXFsSsTYXdfbb+iltWfJP9xyPlw9jutxAz499f7Kg0t
         47Rnvr6tUmnTKCrU7G7CTVicUGTY1U4I7o9wb6VfyjGe6wSwyypVvIDrxSQZFBCrDG5m
         E2BhXn9dtfpO2tiS1FZpRHnDSHJzUPtfFwy6+ZxyEFzj3blQ+Jn72Orkg2PYuQG3CzKn
         U1NJtw4aGuqhI1Lwfj86wxNhleZJVOJlo49VW5B0tGpxJR8Kvj69KUbCL1p7KzpEEmN4
         YkSJReuQh+3waAek8F9qVG196yIgRpsS5o4Cz8loXaUPFLvkjhjxVQe44B1gEXn/r+WA
         KlEw==
X-Gm-Message-State: AOJu0Yy+AnrTzPKIHcUpd7T7gwd5rOxGV3M2FZnQYPeKugch35xZHlm0
	o5o4ZB5oJIR5YSVRtpT9xFhyje4S7By0T1YQbad8UMcLSpG2OXMXkgjcYdkNnh8=
X-Google-Smtp-Source: AGHT+IHE/JbOqr8bwM5WSv0eQgNFdDdq2yPKoxcQ3lFXJvtHxWBZYwBQE60s0+XabtL3nM8jOp+sfg==
X-Received: by 2002:a17:90a:de91:b0:2bf:4c7a:e47a with SMTP id 98e67ed59e1d1-2bf4cd672eamr239232a91.42.1716477221583;
        Thu, 23 May 2024 08:13:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bddbff4e9asm1661950a91.28.2024.05.23.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:13:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] systemd.bbclass: Clarify error message
Date: Thu, 23 May 2024 08:13:39 -0700
Message-ID: <20240523151339.3204194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 15:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199809

When this error is triggered, its a bit vague in specifying where the
issue is e.g.

ERROR: nbd-3.26.1-r0 do_package: nbd does not appear in package list, please add it

Some packages may intentionally remove PN from packages and find it
confusing as to why the system is still asking this to be in PACKAGES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve a bit more

 meta/classes-recipe/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 48b364c1d4d..0f7e3b5a081 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -85,7 +85,7 @@ python systemd_populate_packages() {
     def systemd_check_package(pkg_systemd):
         packages = d.getVar('PACKAGES')
         if not pkg_systemd in packages.split():
-            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
+            bb.error('%s is marked for packaging systemd scripts, but it does not appear in package list, please add it to PACKAGES or adjust SYSTEMD_PACKAGES accordingly' % pkg_systemd)
 
 
     def systemd_generate_package_scripts(pkg):
-- 
2.45.1


