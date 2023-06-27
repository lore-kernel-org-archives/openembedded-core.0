Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF2FEB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:17:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.9555.1687861059151874997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 03:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kNiTUTfI;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso2719939e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687861057; x=1690453057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwO47ls3MD4DAEiFfx7RYloDCjCAFAOxxcSF/AFU7xg=;
        b=kNiTUTfID6eDDsJTf7dCjjCzVKpoyeK4Jl8/Qq4jALAi79QORisEXQRpvPIPd2y2SO
         b/KyKKZzCbTGBuZG55Pl2VY9sChj1JOuXyxjHBvBXbE/N2xnHV4R72drPlkvSAPRMVbw
         bXycpEyzApRDcA9JD1nHn8VhKEkyStNNit5MZDqiDIOTs60wMuaSoPqfya6te6BKv7wh
         dyrBuYJNZEJnTiGwS7K+mSiIT8aD2YGYpoSF4n9xiMYJYyUWPAKpSQ1Vjz7dhtN1wMgQ
         kU80qlIfTpDTL4VprRloTCIm4kmTXxsG3fqnpuFp3pcMs2RxeElWDQj8ybVx+0bJKNd/
         pJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687861057; x=1690453057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwO47ls3MD4DAEiFfx7RYloDCjCAFAOxxcSF/AFU7xg=;
        b=EuRGaSTmy+DfjcYqjLo+t22RSEkVM1D24Wp18Pz9p5Q/znckCRNNzH0rusMZRNkYm3
         XskCubfWQ8uqsgDqtqfJT8J7SE9YbHC5FLFU426UTipf5Y3TKLplo0T5QBlMhkTcrgqB
         4PuJQyovsttp23mYklLDkQ3uvkhZlUtJ2SRO+JLkNU/ifAg95L7NdFdfVykAlG5Cz0bc
         MBipo4nK9odlMvo4dZjPo8fr0mJ4dshhbNx8MtfwK5LUmz+AUyWjP1TY8dV1u4MGJxxO
         tMWQNAESAu8dy2Eynq1xvuZTzTs/JSCD+RvpxvfrFn6dfjpsBT5VA4XfKoKbQkYHKASu
         BdKw==
X-Gm-Message-State: AC+VfDyImE6Klkc8a4VycTUQC8eHeAuLlYKpXaBQeltYrEgRjhNbHITL
	+mum/XnO/VayckSp1ZedkkwqThJThEE=
X-Google-Smtp-Source: ACHHUZ5GcEA02YB5SloUbInQ5obOwbMmKGqilJHZno6DgcMHkPuDJUgkQDm/7KX+kDORjj1ZaxbQuQ==
X-Received: by 2002:ac2:558e:0:b0:4fb:7d73:d097 with SMTP id v14-20020ac2558e000000b004fb7d73d097mr1502201lfg.39.1687861056620;
        Tue, 27 Jun 2023 03:17:36 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm9961436wrv.37.2023.06.27.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:17:36 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 3/5] kernel-module-split: use context manager to open files
Date: Tue, 27 Jun 2023 10:16:42 +0000
Message-Id: <20230627101644.881715-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627101644.881715-1-jose.quaresma@foundries.io>
References: <20230627101644.881715-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 10:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183481

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

V5: no changes

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


