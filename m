Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EDAEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 22:23:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3240.1687299817591901321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 15:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EQP1/hPz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f8f3786f1dso57436185e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687299816; x=1689891816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1JRSoVAvPvRbzYXJnc/vim6qKlp+3HP1acwaNNpTmc=;
        b=EQP1/hPzr2ubryja8vtAcjAPttlWOakqx1j0oP0+rvLSJDbE4RjFaTSwXJk+dHsRGI
         oGtzQIdnVreXWL+6ZSGA73nmy1DtoLZrc2e+qj+3Ctl2SMJau/MpdoaH8V7dRixAsAIt
         P/kJpHcDs8t2PYm6tkzVt06W9yGLG2iNc2FBadUSwO4gW47PPd1Z1Dusvw4QVP0KwzoG
         TLN6w4Iy+Uexp9uPMoHXArc/d6AGV+g+NiF8fkfwg+4sMDTMLobr/nmXRRUwmDLHqcne
         dMid4LFRiL8t5LTov0aJqd+KQqRRRISMGZhA6niwLa4NjRSgUDOfVJebUFBPFmexw/il
         mRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687299816; x=1689891816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1JRSoVAvPvRbzYXJnc/vim6qKlp+3HP1acwaNNpTmc=;
        b=MqO/SGmzLXzm52UtfHAdBn7xakw56wUivp+b9EHKWJwQz4yW12Rn4FZ9A9Yvfd6s6d
         X4rQxTx+etAEt66ONCOEM+mEy8AT4egQ9yOfesRifH9VTog72x2N1vz8eWiGGRRbZRpB
         hu+36/Mc3+QM/ji1kTtqtO2AavJguNriZtVWkeU9XBUshmF0vYx+jhDVuB8QsTHMKsoB
         by9dJrFu1pJ7iCd02TREWQStAnI2rZ/5WpnrXaJ8deB+tld3flwKuojy/gTyKPo8Lc1R
         p2Zr63GB7/dXFld1cODkF+WQlFJ+3b61C64yPSd/zZhFRISmdQQGIJsy43Q6IuBJzPFG
         QWZw==
X-Gm-Message-State: AC+VfDzCS4+6XcP004WHS2w1fU/2BAxQP3oOwcfEWEIvg8n9JiHHxN0J
	ayfxUwA0i5jqAchEgS0TMFSM31qSZOOQvg==
X-Google-Smtp-Source: ACHHUZ40E7PU1hGBNd9TyoPMwU+WXU9avQ2vNZiXAJjgp3Z/XgqOEIMEpU/N8+Ce5xYU9CtrBb5FDQ==
X-Received: by 2002:a7b:cd89:0:b0:3f9:137:af7c with SMTP id y9-20020a7bcd89000000b003f90137af7cmr10630698wmj.10.1687299815621;
        Tue, 20 Jun 2023 15:23:35 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l13-20020a1c790d000000b003f7ed463954sm3302928wme.25.2023.06.20.15.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 15:23:35 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH V3 2/3] kernel-module-split: use context manager to open files
Date: Tue, 20 Jun 2023 22:19:44 +0000
Message-Id: <20230620221942.2801107-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620221942.2801107-1-jose.quaresma@foundries.io>
References: <20230620221942.2801107-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 22:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183159

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v3: new patch in added tu use context manager to open files

 .../kernel-module-split.bbclass               | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index e7ee6c55be..a8ed9e3976 100644
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


