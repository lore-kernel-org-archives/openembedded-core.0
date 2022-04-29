Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB389C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:19 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.11889.1651248137989494994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=laNyuxDh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id q12so6831436pgj.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lDr4wrKCLaSuFcf/yjvUJsvf8fMdBbBDGAqfU08FWO0=;
        b=laNyuxDhlVMV+PovTXvelwGctazpRCF3SSHVEpe6r4NsRPpuTv7qw7zAiPak6YgFQa
         mCFdr9G68MlwK0ImyQ/+uYV9TcrLcj9WXWX/9Yob1jZ0EEOsqNZEjTt7HERBNgXqEvd2
         +05ZACDaznX6fbF/F6cSEpbc7bls+0mbJYtDvKxFmQ8Yn5vqU945/W4p9HYLJ1Di6pBG
         j3iLGaVn/NG1MxNQDlR7qRpfHzbH1BdLVHacVax7HG1e9q3Jt9xejqW80TIKY6U8YBaZ
         EN5Z8Ct6jcr+CJo1rfsmh/n6RMqHQrOhCQDNqWE9Tu10afmOKpVVAW39jjQsB8Iib7JS
         kmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lDr4wrKCLaSuFcf/yjvUJsvf8fMdBbBDGAqfU08FWO0=;
        b=DWdpJmry54k8nmF1hTh7iv4BQd3GypHBW3irFwQDv9mjvfJ1e/NC5EN9mOAUlySC9d
         x4HYkFJJQ4Luy79kALLlYnYuKvTVXhVuotaaTMHBNcNupbQyvk5xSDcgmwJQtXjwG0vQ
         VdmQHcq7JgtlLE2GTHLBvoZ64pADEe5aSULprmr7Mn7loemrDBBXPqxMOXjlJORMxNke
         ClrMr25QgtwQVscJt24sxcXJh8UOG5UpUPUZFyKGLIOfHriRYAAhfc+IZS4NIOJBVH03
         gUiXn/x0BGGTWZuWuh794z96km1qc/FL9d86S/XsHCoIx+7oF6e21jjiSDwkiD4eJdeP
         MyQQ==
X-Gm-Message-State: AOAM532FCHJ5BgwtjXz2ANnd6m/P1RDgRtumBA85ofoo3Q4xTahctZri
	LbQBbD+0lbvMLJNTsYS1II4rhd+CcNkRV3tTpqk=
X-Google-Smtp-Source: 
 ABdhPJxySOzneeEmZPV/YuClEyuMUD5LDsVhEhIj3E8sisXwpw5jTxMryMiOEs7Gt3abN5/LDS7IBg==
X-Received: by 2002:a63:8548:0:b0:3aa:fc6b:a36c with SMTP id
 u69-20020a638548000000b003aafc6ba36cmr56432pgd.267.1651248136623;
        Fri, 29 Apr 2022 09:02:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/34] terminal.py: Restore error output from
 Terminal
Date: Fri, 29 Apr 2022 06:00:41 -1000
Message-Id: 
 <f8f8e2e159a5ac03f619e6d0882011445e6a2545.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165041

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

In bitbake commit 1ecc1d94 (process: Do not mix stderr with stdout),
bb.process.Popen() was changed to no longer combine stdout and stderr by
default. However, the Terminal class was not updated to reflect this and
subsequently only output stdout in case of failures.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 116d0bb07ba044cf8847bf3d5c3996ad7e58b7ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/terminal.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 53186c4a3e..de8dcebf94 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -30,9 +30,10 @@ class Registry(oe.classutils.ClassRegistry):
 
 class Terminal(Popen, metaclass=Registry):
     def __init__(self, sh_cmd, title=None, env=None, d=None):
+        from subprocess import STDOUT
         fmt_sh_cmd = self.format_command(sh_cmd, title)
         try:
-            Popen.__init__(self, fmt_sh_cmd, env=env)
+            Popen.__init__(self, fmt_sh_cmd, env=env, stderr=STDOUT)
         except OSError as exc:
             import errno
             if exc.errno == errno.ENOENT:
-- 
2.25.1


