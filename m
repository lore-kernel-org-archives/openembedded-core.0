Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578ECC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.677.1666048139626889648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0cjQzr6X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id l1so12128477pld.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rA436JMOmgqPSe4kyGugStqAMDHlgPuOYBEZm6rapM=;
        b=0cjQzr6X8abAHa+cg4rm2tDmaXSbpoxLehcBADt6t7TxJnEg+75KlF5k6Hj7GXcanT
         Aj7E3QfrSSJ2AimmBWxNZQFUxJ8BTEpTJ4PcvciMJqS5YyPd6eWq2LqHsxvba7CNrZ4h
         eiUUDSClx/FtaBaXE3w7LS6bkTYKb2RwJIERY5xX6ryZzhzy2wQUUUEn2Wvb4NJGIaAC
         ZjZ0IfGUJZmiHqVXoZghjlFpTxoOaxO4A/hZLRk7/3Tv/qMkGEFuVJdpnP5gVVcXPY3t
         XbCjtlNFJdA7A4tJ8tf/rfM/aCYjTF9oUFUUDXFj0XfxbQCKqumcMynK/pDYVs0/r9jU
         FmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rA436JMOmgqPSe4kyGugStqAMDHlgPuOYBEZm6rapM=;
        b=fB7WN918qlCjx3CjmJo/2xCzsUOS5oceuR+fSUMUMKZ7VpXdEfrOLqnab8ggwz6c5J
         XRrGvdGju0kYhgNr+DG/LZ04nlTpgXUD3fmCZlstrYrjpje0+X/sVyg/pTzCLCXbLhbQ
         /oK3ISwVMH7Nq5PdVK3X4jtiGBpT7apoz134E6ozQpud6A4KH26T3qgHWwRg6Aypctt/
         tcsXUkx6deoI5OHJX/HdrDj2CWpq2V5ZusV51K0DnC3bl+Y7FROUWj769mBhj2cR7m37
         MU1m60LePjymXEEUj5N5e42Iat1PYIQCknOhBSnt6BDSTmYZ16+ifbbX1oDYa+u65IGR
         S6fw==
X-Gm-Message-State: ACrzQf0ALHjVuIJCoqJfE7rn9UtAa0EyRzrH0fu6Wiw4t+UZbApa2UEM
	sPJZ6whLS3ZO8nUl+UizLVrZD9NjckaLkrZW
X-Google-Smtp-Source: AMsMyM4kyy0y3vu2NKLbhK5ETsoCf7fwwrMr6IZvve3Q27Erk4T5yl953MzWMv4Ld6bIWqEMpmPU0w==
X-Received: by 2002:a17:90b:3b47:b0:20d:a991:3f24 with SMTP id ot7-20020a17090b3b4700b0020da9913f24mr26548515pjb.108.1666048149160;
        Mon, 17 Oct 2022 16:09:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.09.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:09:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] own-mirrors: add crate
Date: Mon, 17 Oct 2022 13:08:28 -1000
Message-Id: <d1edc5882955508827a19c4f507d97dca398f3fa.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171930

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Support downloading crate files from a mirror at SOURCE_MIRROR_URL.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/own-mirrors.bbclass | 1 +
 meta/classes/sanity.bbclass      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index ef972740ce..30c7ccd8e7 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -11,4 +11,5 @@ https?://.*/.*  ${SOURCE_MIRROR_URL} \
 ftp://.*/.*     ${SOURCE_MIRROR_URL} \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \
 s3://.*/.*      ${SOURCE_MIRROR_URL} \
+crate://.*/.*   ${SOURCE_MIRROR_URL} \
 "
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a79e36b594..5c97effb96 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -859,7 +859,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps', 'crate']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.25.1


