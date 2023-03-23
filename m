Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C04FC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 09:57:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.68681.1679565420222565682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 02:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=kVb8YLzJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id n19so2826664wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679565418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bqpntdc5SdaLi2+SacNND2wLu1LjVy3KwgJSshY223k=;
        b=kVb8YLzJUDJMGFEJIMdWsm/Kghwj/up7A8bNemBxlXjEb1D+ZvDol++8NJo1YND4ax
         /PWFUcechyaiDjixjLEVdv0FUE4BN/fP2iNjRe1TdVYQY6M3dlV3/Gb1BJuX1Kw/gSXX
         cwqkFeG/v9WEw64HIXq2jScbDKWX33zUa0qyizJf/IkVDBi8RfZeM1FepE4Fbgrd2dNa
         GbpXHKvubYuj+mpSWPO5FVMUr2cw+1tEOrNhbgkAQ9o9ahYB6PiOpb1UbmbdoW5fdG/J
         LN5UfPihMDlhEkjYS8wtvIrNmRGji1TegXwXLSa03VkVVuFzHu3ehz8Rwh0kueE0pOfd
         ncfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bqpntdc5SdaLi2+SacNND2wLu1LjVy3KwgJSshY223k=;
        b=5WM2jI8642DffOyJL0ulDV7Ww3ODd90kxdFGSMCTiJnjHB2d8P3iOKCKkTXsICON3P
         k+IAiscSqX8iaZ7koEavATjkWi1h9OhqmzSk++r4KDoXLQ+bbUFNCwnoqZCw49puGJQR
         IYcJ39fovc99/ERsQ5SRSBcdbYiIHjo3drBjVlZNXTdFUbLrtmqAZ9fHJUVYiIX7UqEu
         xDIE6W1ogIBwgXrYEleD/3mH2bKQUaO4YAg3yLKw3zskeJ6+MXSZgzPcJ/JpVYoJbWBB
         kBOCIxKZTCG/ADDYKE28/NfBzPZeFSZvxJPZOpYQZjd5R8rrapKVqLRZvtACyLF3icuE
         1axg==
X-Gm-Message-State: AO0yUKVH82UeF+V9wpVmVSefsocJPCnf5xi6iWRl0jZV+6WMMV3fKYQY
	AIq7TYEozj8/1izl7iDxH3staXP/Cpu+aXAzx4A=
X-Google-Smtp-Source: AK7set+4xycC3wvG3AwyDnjRG9dXEeQE7lADg2lmVMRvuWvOQeHDkI3FmyGGLEE1WR64ycbiChq81g==
X-Received: by 2002:a05:600c:27d0:b0:3eb:389d:156c with SMTP id l16-20020a05600c27d000b003eb389d156cmr1759849wmb.37.1679565418290;
        Thu, 23 Mar 2023 02:56:58 -0700 (PDT)
Received: from P-ASN-SCRUM.home (2a01cb000236d8006dc035242cd5cfe3.ipv6.abo.wanadoo.fr. [2a01:cb00:236:d800:6dc0:3524:2cd5:cfe3])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003edd2ec9f85sm1483131wms.6.2023.03.23.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:56:58 -0700 (PDT)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v2 1/2] package.bbclass: check packages name conflict in do_package
Date: Thu, 23 Mar 2023 10:56:54 +0100
Message-Id: <20230323095655.6319-1-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 09:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178973

It is possible to rename packages with the macro PKG:${PN} and result in
a package name conflict if the target name exists already.

Add a fatal check to prevent this issue to go unnoticed.

Fix [Yocto #12060]

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 meta/classes-global/package.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 7e96601cd9..30dfd63d4f 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -496,6 +496,16 @@ python do_package () {
 
     bb.build.exec_func("package_convert_pr_autoinc", d)
 
+    # Check for conflict between renamed packages and existing ones
+    # for each package in PACKAGES, check if it will be renamed to an existing one
+
+    for p in packages:
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', p)
+        rename = localdata.getVar('PKG')
+        if (rename != None) and rename in packages:         
+            bb.fatal('package %s is renamed %s using PKG:%s, but package name already exists'%(p,rename,p))
+
     ###########################################################################
     # Optimisations
     ###########################################################################
-- 
2.39.2


