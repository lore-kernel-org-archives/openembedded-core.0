Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAB6EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 08:48:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6943.1687423706371073617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 01:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HYO3YN6b;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so15081005e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687423704; x=1690015704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQUbO3Dg7IDuIU9H4guQAvTfA4Sdr/8JWCDMqyUDQqo=;
        b=HYO3YN6bPuntegdQBdZa6uEEdwfTkzphVoI4/izQmdZg6BQNrK6wAY9XGjTV4HR68D
         OkXb83ZQTZI6Git6/Rt9D/kO22eS8bOsT4e5wmqJa37zywj5dRK5Jh6OX6I3EnAKaOIW
         mvWVf656jzZuk9/Y0f5/OVlQALCU1PI/Q0SmGOMtpn6GBX0wsJi9wdAj2OeWrYqWe6fv
         vVE/Waz0T12yGRRvEe+1F4gdjY1PwxDiaQZePaTnvtghJom3aGglRO+UGhsgdwk+M/LL
         jTct9uxIu+DmLcbu/5WIDBib/ZDBZ5JuimkuDS0zwHoCt6I6pUNW61un06daO71EeKDh
         G+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687423704; x=1690015704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQUbO3Dg7IDuIU9H4guQAvTfA4Sdr/8JWCDMqyUDQqo=;
        b=OwE5dMw97IbtLYvvFz74NHxrmYOPo/ikq06cV0Mx3fvY9q7zWJu/hThWCrg5BUUyZf
         HZkwFEm41kqK2tfZ8xvOjKcjJKi3Kj96Iym/7YkqQaVs/SMfueoVwpCw31W4MCsBvGQX
         JpT324VnmF5RzsefIzmToBSUwWoSqOTOJmQ4VlX2IMV+DjMKgCJ+64IdAlLLRxBQZTu4
         99SoS/vhrwFaECEsm1kiMhLEGGTdlHFr/W88mlbCMyz267um4N46n+nIhfohDsMFg0YS
         sy6lGCF0hFW/U7QmsR5sFnIrXTC8847F5pO+jqhC8hltF8SlQ8UY2kj1rCI40xuvxuQU
         fxNA==
X-Gm-Message-State: AC+VfDwiILOB3N/IO6tyl/7aAIxUukRH+AWCDG0Hva+4XsPfUnSjbLyK
	BE+GuAKk2D7E5njiy3QiGnC6KZWDgp4FVw==
X-Google-Smtp-Source: ACHHUZ7U5c313pAaB2BIztLJ8WPUdgvlhBXH2ywo4HE0cn7MVDmC1sFKsJ1daiaH0ypdrsCdhjSFyg==
X-Received: by 2002:a7b:ce87:0:b0:3f9:b35:bf7f with SMTP id q7-20020a7bce87000000b003f90b35bf7fmr10234337wmj.41.1687423704353;
        Thu, 22 Jun 2023 01:48:24 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id az27-20020a05600c601b00b003f9bb026e5fsm2018295wmb.0.2023.06.22.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 01:48:24 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH V4 2/3] kernel-module-split: use context manager to open files
Date: Thu, 22 Jun 2023 08:44:52 +0000
Message-Id: <20230622084452.2026849-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622084452.2026849-1-jose.quaresma@foundries.io>
References: <20230622084452.2026849-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183228

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../kernel-module-split.bbclass               | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 1d5e39b44d..e19ad8e3c5 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -76,9 +76,8 @@ python split_kernel_module_packages () {
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
@@ -106,13 +105,12 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            f = open("%s%s" % (dvar, autoloadpath), 'w')
-            if autoload:
-                for m in autoload.split():
-                    f.write('%s\n' % m)
-            else:
-                f.write('%s\n' % basename)
-            f.close()
+            with open("%s%s" % (dvar, autoloadpath), 'w') as f:
+                if autoload:
+                    for m in autoload.split():
+                        f.write('%s\n' % m)
+                else:
+                    f.write('%s\n' % basename)
             autoloadpath2append = ' %s' % autoloadpath
             d.appendVar('FILES:%s' % pkg, autoloadpath2append)
             d.appendVar('CONFFILES:%s' % pkg, autoloadpath2append)
@@ -127,9 +125,8 @@ python split_kernel_module_packages () {
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
-            f = open("%s%s" % (dvar, modconfpath), 'w')
-            f.write("%s\n" % modconf)
-            f.close()
+            with open("%s%s" % (dvar, modconfpath), 'w') as f:
+                f.write("%s\n" % modconf)
             modconfpath2append = ' %s' % modconfpath
             d.appendVar('FILES:%s' % pkg, modconfpath2append)
             d.appendVar('CONFFILES:%s' % pkg, modconfpath2append)
-- 
2.34.1


