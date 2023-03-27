Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ECEC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.39601.1679932816226119286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QYCBK4xp;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso5086433wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679932814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rp9AGKie5i659qJ94RFxQUzkqcfw1jgowTdxTwTGU8=;
        b=QYCBK4xpiF3vY+FgRicT4gu4a7wxpFkdOLCCOfvldIlKPHM6WIHLobiq3/NYJUwi2Y
         QRRA7IAk0vhyYAxU2idtWYQNmnRUxG90umdCyqrS6V82Oq/yAVfTq9HXrBUlAhtLoMU5
         gA/5HLgWXZ5Ri1dXZT9K4Xp1dzDQr8dwrCL0WBUp0k0BXl6XthNJW56lKQtjNjVd/ZOQ
         0RbZ3osbBPG/Qt+jPt6Ef75k/KbUJYjwCVJJn1kvKLU8t6QUUbHt5fBGGf9Du89FCf9v
         lik6Ru7E3/GEzrWRFmnH32URiqUAy5r6ko+XmjpUs9Qv5HsfjbOhrlzAJRKJTCD8vaUT
         w68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679932814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rp9AGKie5i659qJ94RFxQUzkqcfw1jgowTdxTwTGU8=;
        b=sE498BtDwH5Imp6TmR77g/2mm0QOvSh6xAp1JDTd5NR/sluK+iF90h+Soi64JJqLDJ
         yT6qNxgOrEHW1q7QeGUlgnU3tProMRLdx+pRp+49UwouNurDFsD9QQA5ScixBwKERNdX
         tnWoU5I6eL7k3T1m/eeKS/ypiNmpOW9eQbRQJAQWnI+Y+mRrqqnb6KjPINUR046ImQoB
         V0zMnN/tTPQnr4jjHurdzIPfUDvOxpPrXJQh3WNup4+eXus4FVVnIiVxV3N8PGIFt6Na
         lOSS+m2ml02QYqnYlr6+Syo/KpV1W7daZeqNrA6C8oRpaa/c7RaKggdLBmOzAPbIueSh
         EGmw==
X-Gm-Message-State: AO0yUKWQkg6KdSFPyHRJguq36db7kOu0+pZousnkZauWUcxOVcQED4yW
	xS3B4My2FtTvDYc5KdQ03bc3P/vMl2Ot9A==
X-Google-Smtp-Source: AK7set+MwdBiCyLNEVD3ADzxihYlPhoWgs2wiBnTFUI6j7BEhoDeVruny9PfhiBOKHldmPkgbj7R6A==
X-Received: by 2002:a7b:cbc2:0:b0:3df:de28:f819 with SMTP id n2-20020a7bcbc2000000b003dfde28f819mr10055603wmi.15.1679932814349;
        Mon, 27 Mar 2023 09:00:14 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c218800b003ede06f3178sm14096726wme.31.2023.03.27.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:00:13 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 1/2] OESelftestTestContext: replace the os.environ after subprocess.check_output
Date: Mon, 27 Mar 2023 15:59:36 +0000
Message-Id: <20230327155937.460133-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179165

No function change but is needed to simplify the next patch.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/context.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index ab13131f29..adfb1170db 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -97,17 +97,17 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
+        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
+
+        # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
+        subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
+
         for e in os.environ:
             if builddir + "/" in os.environ[e]:
                 os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
             if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
-        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-
-        # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
-        subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
-
         os.chdir(newbuilddir)
 
         def patch_test(t):
-- 
2.34.1


