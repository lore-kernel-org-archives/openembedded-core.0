Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39540C54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:31:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.14021.1708612264930935738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1voTlo3g;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d731314e67so57752725ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612264; x=1709217064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9MXg/V4cTa8+Ri9doLIZJtIg2D/fkZ7TkVXh2+BbO0=;
        b=1voTlo3g9iHCgb4+KxHxKPVaW/JIVhzFEbumH5mQCPQEIHgUft07hD9UUZRzSdt6h2
         S42ajhNaU3ici06P15XnzXlSRKlmqkj+dfYmnMi3Rr/EgdVeW3E7B/S+ZKnaA46VVKHg
         mDIH98NHp7EhyxQkN98vMGq5i5PJI+iUteflYkqG5dDGVy30i2MHSs6ES0Q0/pDcX5z/
         +8lfSpPklrfLrilhqHbXmD4k2RZe6t6p/79g5WWpPQZn2HbEWfNmbusPJz9daHFVjMr4
         X9FkU2NgvJffpPKvXUB9styKxD3PXTKHYNQlC/x7uqpjsNJd5AtqhbnHxHm/SxWOJT5Z
         fyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612264; x=1709217064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9MXg/V4cTa8+Ri9doLIZJtIg2D/fkZ7TkVXh2+BbO0=;
        b=oNeOl6pR/pzHoAhEepewpASdj3CHHj9TF91qbA3OKJ3H49K5q7HN8Y3gGzSydDMOLV
         0m6UtIt1+9FN1V7V4/IxCD7RL8dBGqP/AgWubBDPAvV18a2bMOBXD099cS4XEclnHN60
         2WybVvS8NwfaDRG1ui4QaW787iWgmncqF2ExUD6tuK9ghZ/QAo70ql+DjfaGh8evYtXO
         z2vZlcuYDlXpiociv5VdG0U/0U8hHLUiXtf+KhCfNvAz9BC77UkWmkF6U2RnIiiAY6Fo
         2w/kZc95ev8lYSAm5jTVdMp0ctnTDZn4KSD24xmjYb17FEeuGDqVWIRO13DHubpkh+/z
         MQQg==
X-Gm-Message-State: AOJu0YwD4Pan8+8An6/2AoebKcHzreHcBFR3WY1HYGSZLi6mXaSDbNQR
	OfaumNqhJUYA0fpTVw7LNldPOYDiqHZX7iiccM4gTbtNliUYCp4i2yjI+N+toubHADW0QYngNFB
	1NLQ=
X-Google-Smtp-Source: AGHT+IFWICwe7qYxnDMfYaTY/xZcXoNDfER5BMNAWOtnram5qVmF+JIKzO8M4fNRcuGzXtomo5rkxQ==
X-Received: by 2002:a17:902:e5cf:b0:1db:ea2b:d2b2 with SMTP id u15-20020a170902e5cf00b001dbea2bd2b2mr13989430plf.12.1708612264249;
        Thu, 22 Feb 2024 06:31:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.31.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:31:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] sstatesig: Allow exclusion of the root directory for do_package
Date: Thu, 22 Feb 2024 04:30:40 -1000
Message-Id: <90694a6299c94dddab6873191f1e3123c6c4377b.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196028

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The package task references WORKDIR at it's top level and we can't
easily make the timestamp for that determnistic due to writes to files
there and in other subdirs. We could try and force it to a specific value
but it is easier to just remove it from the package task, we don't need
it there or care about it in this case.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
(cherry picked from commit 9cceeb906527f90d8dd3aad75aa3a8805e2a1df5)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aeceb100d7..65bb4efe25 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -480,8 +480,10 @@ def OEOuthashBasic(path, sigfile, task, d):
     if "package_write_" in task or task == "package_qa":
         include_owners = False
     include_timestamps = False
+    include_root = True
     if task == "package":
         include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
+        include_root = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
@@ -592,7 +594,8 @@ def OEOuthashBasic(path, sigfile, task, d):
                 update_hash("\n")
 
             # Process this directory and all its child files
-            process(root)
+            if include_root or root != ".":
+                process(root)
             for f in files:
                 if f == 'fixmepath':
                     continue
-- 
2.34.1


