Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989A9C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:55:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.294.1664560504110835613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tkz14sYx;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id s14so7992672wro.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gGpwkyHvltSHV2G0ckc1YdG6S/Xe1DD7C6hr7kdk6ns=;
        b=Tkz14sYxUMl5mLQ/LYu90/wWJXRXiZAp97WcPwLDflCCsE1k738dLH6Wzf7pMpyHRj
         qr0GQ+UxGzx6Fy0i08wFSYNlFlyO20rOiM28R1/O+TkWPcfDCln7UDunw/otgMspP40H
         ndhTxgFsE28WLbagDyafj2HxuzGUODCcUabUiNKRwFZGM/r/nFl292XAtIJkruCDcqcb
         8kuo5Ruo3OgHc3UX3o2G1ygTKuIoF3QY3M6imksYc0+yIh9VRUw1QTAb6sjgpdWr7Bru
         /Rso/QZQGbHwa4kx6OlV1sOuMxgDmG24PPSrd8/JMCxjRg3ep0V2AwTpkeAA/aC1et3b
         O7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gGpwkyHvltSHV2G0ckc1YdG6S/Xe1DD7C6hr7kdk6ns=;
        b=k1HpB+ZNxagu4EgQS6vG1ra7RvQFwwX6Nt4tmANhXRfHwLsIGzFvr9pY5GABoUn00y
         u7ZjZ4ulUEhkwaAeMxU1ve8pSM+KeUhJnfyGT0iR8rEtBnc7q6OmjgzIK064anT22/RC
         96mzVfYqFTDolKvtz5oq5Gv0wGkKv7T1N+e/Kond5S5aAsUaU+Y6fiOfbrBH5eOiIyga
         EtGa2sLJaWZLN4chdczSOnAZ3hdylMua1oqbjnYXeD4PCDXGuYH/Ljug2K67UN0qU4mU
         VyGk/WC2s4YFALrglUNw1y76RplYrzspHXC0im3qpeN3eNKL5LnupH0tqQdBXjnt1mSg
         mItA==
X-Gm-Message-State: ACrzQf3TESa8S+GitImS5FtBgwzpqnbKE1cblEsMLH7eXyNdhNtnOnC4
	kQi0eePqmVMT0q1WeNJk1Er8bGeNnRXuMTJ7
X-Google-Smtp-Source: 
 AMsMyM4nzTtLKxZHOtQHOo7KtfYzKL6FejFOU8NYtuz15DmViyQo18y+kCfkbsEzUnKeKK2uK90pdA==
X-Received: by 2002:adf:eacf:0:b0:22e:369:2081 with SMTP id
 o15-20020adfeacf000000b0022e03692081mr2292430wrn.339.1664560502239;
        Fri, 30 Sep 2022 10:55:02 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 y9-20020a05600c20c900b003a531c7aa66sm2636017wmm.1.2022.09.30.10.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:55:01 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 3/3] kernel-yocto: improve fatal error messages of
 symbol_why.py
Date: Fri, 30 Sep 2022 17:54:40 +0000
Message-Id: <20220930175440.2168008-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930175440.2168008-1-jose.quaresma@foundries.io>
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:55:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171235

Improve the fatal error message of the yocto-kernel-tools symbol_why.py
and shows the command that generate the error as it can help understand
the root cause of the error.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/kernel-yocto.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 8eda0dcaf3..46df9b23dc 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -573,9 +573,10 @@ python do_kernel_configcheck() {
 
     # category #1: mismatches
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
+        cmd = ['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params]
+        analysis = subprocess.check_output(cmd, cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
@@ -595,9 +596,10 @@ python do_kernel_configcheck() {
     if bsp_check_visibility > 1:
         extra_params = "--strict"
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
+        cmd = ['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params]
+        analysis = subprocess.check_output(cmd, cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
@@ -614,9 +616,10 @@ python do_kernel_configcheck() {
 
     # category #3: redefined options (this is pretty verbose and is debug only)
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
+        cmd = ['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity']
+        analysis = subprocess.check_output(cmd, cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
-- 
2.34.1


