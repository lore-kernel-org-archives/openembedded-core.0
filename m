Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB9FC61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:13 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.16691.1675547327832744801
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yE3mnQSX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 143so5897974pgg.6
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSZTW7GNajue8qsi4HzJoIoTOaSVY4IJAmlWXXtnJvo=;
        b=yE3mnQSXPx8OjD5l53SLn/yGLPc0fRXNdPNmzfc4Z2llJK8te/SigRQ6/HzFX5LUf9
         AzBhx74qrv4WBeSmrJIZn8bEZlrXx5my1Lai2URbR0dH+chjKA4hdNNCuwE71hOWWmVW
         ALUCuaxuq/K6Ca8Hdo35lu0eAdrvdbOyNBiD7wY4duE9BgUP17Dbc1M3Ah048TXOvk7V
         Tg2jGolYrvwhU/1yA2MYOeoJZaeDxUgRiP02+mCUd7rKqibREm10jKRsyJbm9j8ocx5F
         t/5jrQR9Izc+kvp7r6z9zGgMmEYAYr6X0YjpghRFxJpX1pBnTVCm0bcOdOHceKYUFoQR
         aTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSZTW7GNajue8qsi4HzJoIoTOaSVY4IJAmlWXXtnJvo=;
        b=6jcCzG19YyBWdrX9f1bW6koKpP2zYF2hWr1ACqZnFyYjekrDkzMyT54TZnmVZDoRtU
         NIk5WQ+8s9moTMUjWY1BF9R1iY2gS+D8M8lvGHgQ6qAmh7IMr64JXgmX6lcjoJE9l2M5
         Yzp1aWCE0pbkOXeh2nUIkx4OmKCghShViPw2MokOY43MjO2RmxOvJi98Gu2MFG1rojGM
         FybWJXXbpdgMDS6wJRf6OeNh4wSxxf0KG2y3PZ41LkMNhYXiChkCgXpe9rPC8385Munr
         10fvPSfuBEL+pkcv+bnOrUEBKAvtYTDl/kLcnTjxuY7Xgvmy5kti7IkrMGdeHXMa8BcE
         Yv4A==
X-Gm-Message-State: AO0yUKU/XBbo/ovsyogemrWS4WxvKJ3h7gK77NFI4jnUhyep3ujIJ17B
	so8tgF5xOXyHoL5QM+dfOQhzeC8lHJ1pgEQ7cQ8=
X-Google-Smtp-Source: AK7set8ww8IhHkuY5f2Jo43Tgr8CkRjEDA/UOkKdLizmGV2ZY7aXG4r5gOxRSvpyOiwjGiOs8YbFSQ==
X-Received: by 2002:a62:7b0e:0:b0:593:a131:3692 with SMTP id w14-20020a627b0e000000b00593a1313692mr15245036pfc.13.1675547346471;
        Sat, 04 Feb 2023 13:49:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.49.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:49:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] devtool: fix devtool finish when gitmodules file is empty
Date: Sat,  4 Feb 2023 11:48:36 -1000
Message-Id: <077edd3992683985f0779afc73d4207a795ced39.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176778

From: Thomas Roos <throos@amazon.de>

When a .gitmodules file exists but is empty then devtool finish fails.
Add an additional check for this.

[YOCTO #14999]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4f0f7c4934bade9e4d4a1086f9d8b29d8e9ad45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ed118afada..9c9451e528 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -225,7 +225,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")) and os.path.getsize(os.path.join(s_dir, ".gitmodules")) > 0:
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


