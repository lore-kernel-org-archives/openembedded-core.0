Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D26ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:52:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.21144.1666626777158155126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FLCgov+j;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id g12so4148310wrs.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThSAK8EO/CyPxPCHNkBw1t1o0/AUnM0WHM3w5U5d85U=;
        b=FLCgov+j7G/neTpQqQXo04sX/uf5grFMunQIG8k3nMtLzaj9nQvQhqxhbb39RoZGk4
         qNtzHquY2VBeMEBf6VYXZ7IONaJezdpXykJvoFFzKAHccn8U16D4jihzyPAYHu3+XrmQ
         5086pA83dfv8HvU1XmkAsfAmWtckW+3LHHKN3Gcq2ATwvYhz9ouUfYckVM18z2dzrvjB
         C2WhKjGUw4aIIecqfAa9K5R1Vk8xadVqdLKuWcs+6kIZyLKOZL7n0IVCoe3DwNN3HrHr
         NDGWeez+OkBZgz/YWgGwaHhtne/5aDMjxpxmuyxy4l0WtDWJrFrqRstDgM/7/GbL73n9
         +1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThSAK8EO/CyPxPCHNkBw1t1o0/AUnM0WHM3w5U5d85U=;
        b=1PrJcZsOLJhY7pMyhv0pD27S1KsHv9uHiy6ZHHfw8bm5wzaG8Pj44ZlU1YitAwCOmW
         3sxazor+eGr1wkI6/yXMyeh86d4BnqOYmbPwDnRV4L81o87KeSNmbgF2D1u5gQsvIihX
         BuFjFHYWoKSb0JeSHSRaRpZ/oG5iFT+KEDPwbeorJmB661wDxWaDJaCO24FexIDSWX42
         FO4ai337E70jgB8ilXEIAg0MHzij+DiPYHTUS0iAyBy33hB0B2Vs2f/kO0nRF6XzIkqy
         5p9yHFEAMb+QfK0skTrgbpocm0EKVtxpoZqUusOh9qbpvscU8TlnQMSdH7SY0snPCCB+
         e11Q==
X-Gm-Message-State: ACrzQf0Q/YyxR/peopePNnmPYY7vJwFLBxBVko8MgJRJ/KhudbuHQJTE
	ZZveVvKjF11pBaD2JhH2UsdxOVx8NN6/J3V9
X-Google-Smtp-Source: AMsMyM6FRcTfsoN/ZxpM6xlolNBpx0PiMmInxjpRVyQDzbXucfKFtmgZ4DmcIc6KvY6Q7k3FXXKjiA==
X-Received: by 2002:a5d:46c1:0:b0:236:6a2f:9e53 with SMTP id g1-20020a5d46c1000000b002366a2f9e53mr6108778wrs.256.1666626775259;
        Mon, 24 Oct 2022 08:52:55 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id h20-20020a1ccc14000000b003b492753826sm206880wmb.43.2022.10.24.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:52:54 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH v3] kernel-yocto: improve fatal error messages of symbol_why.py
Date: Mon, 24 Oct 2022 15:51:55 +0000
Message-Id: <20221024155154.2915-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172108

Improve the fatal error message of the yocto-kernel-tools symbol_why.py
and shows the command that generate the error as it can help understand
the root cause of the error.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: get cmd from the exception CalledProcessError
v3: apply on master instaed of kirstone

 meta/classes-recipe/kernel-yocto.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 8eda0dcaf3..1a6695ba7e 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -506,7 +506,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
 
@@ -514,7 +514,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
 
@@ -575,7 +575,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
@@ -597,7 +597,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
@@ -616,7 +616,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
-- 
2.34.1


