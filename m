Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC361C04A6A
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:34:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.840.1689374041506947791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MCcQznKz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b9cd6a0051so15731595ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374040; x=1691966040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+kcd4fsWTFfaQsxgWeH1cjZ24/fsAWFBBlJ5R64ZR0=;
        b=MCcQznKzMglWXdPs7ovy6yes7KyPJbyefjtBkxCx6jh3+TeqjeGU3xxKwzc9V2fnqQ
         +Q5sVFnl5pxYmb6tyhwCvtTxrB0UjYKw3ZIJXg/iInXIDuQeWUslwnlKSK+RmmCp4fhW
         aw49fcea2qCD/ouzPYLaotk+QFzjgmVSO3g/JkZ/x6cy4sm4MLke9vZ1XH5dX7n4OUUQ
         0n3hYlkMp4JYsa0FBaXs4EEg79R/EnsrPblFfBF6WFU+gevWsdIhi3OCd7ivSvNC0+zC
         Io2kZKQVruwzR+kdrJYAticI3kD73GmB0S3/iWcnlxAp5O5MptjrXOAtqIhIvbbsaVZ/
         KiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374040; x=1691966040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+kcd4fsWTFfaQsxgWeH1cjZ24/fsAWFBBlJ5R64ZR0=;
        b=NLWUF86JLLPNozdKlJjQIBPBZNCX0YHlIMqhaCx/gJ9niWbJR1WHwC4M0XDIdGTW/5
         I3y4UXATUwVXaVx5QfSo9k/fwp5YHp4iWV+xCGmJPtF7xQVrY34zODbVoamCqT3+bUVJ
         5CJhhTqBmAVKPvtnGxrUvjoshYxUVFOHw6GKahEjLoM2/4lA0nqAlOK+8xLSFv9Shh0F
         Uhg/tq6Kgn+Oinb1t5cOUz4NrRjQw1TrnDMcxWMWPWFr0oIfoqgjpMpqXOkdlA54eN5j
         pM4dcF2MBabAE+fGDJ7neBHPlDygEjKeV+weoAKhF/bTbZWYFboRLaYnweJNTgXYy2Td
         sSJg==
X-Gm-Message-State: ABy/qLZN+KnXqaMGNKUfHtCcCpExL7aEiwrD4ZqbtV6dWAsN0m8Vd1e3
	Vx2wsM05g7W4oAGj6FsUXAJhOi4/IkuorjWZT98=
X-Google-Smtp-Source: APBJJlEqBd6h2Q1/vYBg1ujEKKjb4s0gyDmjrwC/YdV8eK9B3tijttd8xvTq8Rejp6lX61YQNaKSKw==
X-Received: by 2002:a17:902:7894:b0:1b5:3c7f:1b3b with SMTP id q20-20020a170902789400b001b53c7f1b3bmr4198904pll.35.1689374040462;
        Fri, 14 Jul 2023 15:34:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/26] kernel-module-split: use context manager to open files
Date: Fri, 14 Jul 2023 12:32:56 -1000
Message-Id: <8fbf05a91667a054083b45632c1f8afb6b8e1367.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184304

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc9c9471952042395bb405e7f6cf507bb2b72f31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../kernel-module-split.bbclass               | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9467a28208..c59e10adcd 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -69,9 +69,8 @@ python split_kernel_module_packages () {
             cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
         subprocess.check_call(cmd, shell=True)
         # errors='replace': Some old kernel versions contain invalid utf-8 characters in mod descriptions (like 0xf6, 'ö')
-        f = open(tmpfile, errors='replace')
-        l = f.read().split("\000")
-        f.close()
+        with open(tmpfile, errors='replace') as f:
+            l = f.read().split("\000")
         os.close(tf[0])
         os.unlink(tmpfile)
         if compressed:
@@ -101,13 +100,12 @@ python split_kernel_module_packages () {
             conf = '/etc/modules-load.d/%s.conf' % basename
             name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
-            f = open(name, 'w')
-            if autoload:
-                for m in autoload.split():
-                    f.write('%s\n' % m)
-            else:
-                f.write('%s\n' % basename)
-            f.close()
+            with open(name, 'w') as f:
+                if autoload:
+                    for m in autoload.split():
+                        f.write('%s\n' % m)
+                else:
+                    f.write('%s\n' % basename)
             conf2append = ' %s' % conf
             d.appendVar('FILES:%s' % pkg, conf2append)
             d.appendVar('CONFFILES:%s' % pkg, conf2append)
@@ -124,9 +122,8 @@ python split_kernel_module_packages () {
             conf = '/etc/modprobe.d/%s.conf' % basename
             name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
-            f = open(name, 'w')
-            f.write("%s\n" % modconf)
-            f.close()
+            with open(name, 'w') as f:
+                f.write("%s\n" % modconf)
             conf2append = ' %s' % conf
             d.appendVar('FILES:%s' % pkg, conf2append)
             d.appendVar('CONFFILES:%s' % pkg, conf2append)
-- 
2.34.1


