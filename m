Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F073FC433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 22:18:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.16201.1633213086966752552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hQDF+s5v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w29so21840706wra.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZcDXxMLYgPv/UA2g8vZClZfsGNZCzSNYPlgo4ltE9+c=;
        b=hQDF+s5vbvSL1PSbj4mG+bW/bITnKt7rXuNTO1sS/tLjVhfZqofQ+Ia/jZM7hTB7+2
         xx0R9DBzSrbGi8YFoio43XyI6NeJ9VLV5jwwo/BTvdOwkre026eKrYOHDwfdPY24Sh9l
         H7V9X4/gZT31U1DxKHAuQ3NE+PUumIYvoSSPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZcDXxMLYgPv/UA2g8vZClZfsGNZCzSNYPlgo4ltE9+c=;
        b=ivtONTVZ79hmntZJCS0qRheAVJCgXGthr2EecSplJHg4CZ3JM5VU+l/yzWtfs786RX
         zdHcYA2OPdQSzrXOxbEYpLuNwvWE03aqFC1SCWQg8tEcmhiFhqT98Sw3qhG46rAScxC1
         PYnz6ow9aL3GmWH6KG+OofMemuZS9ckN8PNgTbrsQCtZScj/TGrnhHn+Etz0+eGDXhuu
         iXxGDjUHjDUZbJ/ssPrKhuXyw8AjWv2h23mojys5dL1ekImzqDfwXbW7TofLkSMjyKRM
         rkpf4R/bf/xEt/kevefYGyvHvQlVdvlcGMs0m11PhOXUobdFXnUASyCXD85tBNBYkLlI
         Ry4Q==
X-Gm-Message-State: AOAM533yw1yuABkVeVQCOYE3glTPHhsYbPSxjzCNaf8TWZFhZCZ3Rqju
	CoQH/ozepxh+HDpaj1bQ3QMAWwSuskgISdxH
X-Google-Smtp-Source: 
 ABdhPJyFR1DNDVMlFl2N2RV4vdisacG9pYLby2rwm9eZmPsTdmGgq9jhJsnLvl4YTGXYTyy5SJL4Xg==
X-Received: by 2002:a5d:4601:: with SMTP id t1mr5084396wrq.298.1633213085141;
        Sat, 02 Oct 2021 15:18:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 z8sm11172777wrm.63.2021.10.02.15.18.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 15:18:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] externalsrc: Fix a source date epoch race in reproducible
 builds
Date: Sat,  2 Oct 2021 23:17:59 +0100
Message-Id: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Oct 2021 22:18:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156539

When reproducible builds are enabled and externalsrc is in use, the
source date epoch function is added. The conditions on the conditional
code removing the unpack task need to match the deltask function, else
the source date epoch function can end up running twice and the functions
can race with each other causing build failures or corruption.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/externalsrc.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 7f1a760eec5..ad93b2d2abf 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -109,16 +109,15 @@ python () {
             if local_srcuri and task in fetch_tasks:
                 continue
             bb.build.deltask(task, d)
-
-        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
-            # The reproducible_build's create_source_date_epoch_stamp function must
-            # be run after the source is available and before the
-            # do_deploy_source_date_epoch task.  In the normal case, it's attached
-            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
-            # we need to move the function elsewhere.  The easiest thing to do is
-            # move it into the prefuncs of the do_deploy_source_date_epoch task.
-            # This is safe, as externalsrc runs with the source already unpacked.
-            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
+            if bb.data.inherits_class('reproducible_build', d) and task == 'do_unpack':
+                # The reproducible_build's create_source_date_epoch_stamp function must
+                # be run after the source is available and before the
+                # do_deploy_source_date_epoch task.  In the normal case, it's attached
+                # to do_unpack as a postfuncs, but since we removed do_unpack (above)
+                # we need to move the function elsewhere.  The easiest thing to do is
+                # move it into the prefuncs of the do_deploy_source_date_epoch task.
+                # This is safe, as externalsrc runs with the source already unpacked.
+                d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
-- 
2.32.0


