Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C78C761A6
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 08:58:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.19730.1680080285668453821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 01:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=lXo0H1Zz;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id d17so14836440wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680080284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oAzpfDerf7SEiwn2C6nnDPzW9AFs1upHUoj0mUrQLSs=;
        b=lXo0H1ZzrUm9q1wwG+bwZLz5X/5s3tXJfJVFN4+QZTB9KLL2MygPEbpbl0mdMcYwPp
         1b6AmciKK0QjfmkIX8u3GQltuAuL2R7F2mZ5CxPCRv+ffNY6LQtgxVLOG58rgTiq/WU3
         i6FHr2kojgpNeGcK8gDc/MAMqOKI/wnLaenDBIx1CM7KVdfnV8KBQFFYig/Qezu8NboL
         +fZP+5wWlP81KVfB3bguTzFt7eXt0J6NHNTD1/9Ao9AYymS75N5lbOrkfFOg72sM5Jxf
         quGK5c9V6MlWH1mEIPLpGeuz2FjzjfcJYTcLPgiAc/ANsK4LReInxBYrBZQKAzhFe/Yd
         hkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAzpfDerf7SEiwn2C6nnDPzW9AFs1upHUoj0mUrQLSs=;
        b=Izdp3nKwqXmU+KgQlmeDLFO6LXVLls+DRj9+PdImv/gZksovtVn+jtU712YcvN1Mso
         9/wAsq3G5I2NBMW+5eqaa49hxCnP7hi5wVzCt9GSs0Ah3rGSfyYYhMJ61a8z4GlaVakP
         vnfI04Wa6oFwgOHpHFb2+kSXuMVvLkEvvOp/5OpgGzmHsMak+CquCnn7MSXRODXDZ+1j
         796GdYSlXLZW0Ix7WLTYxDcLBjKHC8AqyiT2AuySTaZIxnYTBMCjNV8ci8Cd3T42CeS9
         CEAe/GUvTF9DC6J84QxORDzrT8gIGBNcZIhl0fe8/gN4HObiFZrVkfqYxcWdTmb39MVo
         WlcA==
X-Gm-Message-State: AAQBX9dzObuxqG44HdlRYyIvsy8ZIkr3gEmVL12Xs0K26ygWTnX6L8Md
	seMl8hBXDH5jv4fru5B017cocraIF9DIk8EQ2AQ=
X-Google-Smtp-Source: AKy350aohGwrQRLliZ2NUSq30FZyBmScwMuokV4XklewKsPNrsOoMWyAJSl5t7qN4pZCve8dKM4r9Q==
X-Received: by 2002:a5d:45c5:0:b0:2d1:e3b7:26ad with SMTP id b5-20020a5d45c5000000b002d1e3b726admr14236368wrs.61.1680080283609;
        Wed, 29 Mar 2023 01:58:03 -0700 (PDT)
Received: from P-ASN-SCRUM.home (2a01cb000236d800046b4bc25620f21a.ipv6.abo.wanadoo.fr. [2a01:cb00:236:d800:46b:4bc2:5620:f21a])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002cfe685bfd6sm29668014wrw.108.2023.03.29.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:58:03 -0700 (PDT)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v3 1/2] package.bbclass: check packages name conflict in do_package
Date: Wed, 29 Mar 2023 10:57:56 +0200
Message-Id: <20230329085757.15412-1-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179270

It is possible to rename packages with the macro PKG:${PN} and result in
a package name conflict if the target name exists already.

Add a fatal check to prevent this issue to go unnoticed.

Fix [Yocto #12060]

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 meta/classes-global/package.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 7e96601cd9..b88a55bd55 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -496,6 +496,15 @@ python do_package () {
 
     bb.build.exec_func("package_convert_pr_autoinc", d)
 
+    # Check for conflict between renamed packages and existing ones
+    # for each package in PACKAGES, check if it will be renamed to an existing one
+    for p in packages:
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', p)
+        rename = localdata.getVar('PKG')
+        if (rename != None) and rename in packages:
+            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but package name already exists'%(p,rename,p))
+
     ###########################################################################
     # Optimisations
     ###########################################################################
-- 
2.39.2


