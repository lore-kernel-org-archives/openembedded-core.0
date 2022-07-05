Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE30C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 16:40:00 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.86435.1657039196286697655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 09:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kl7VGlxu;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r6so4593703edd.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVwju2X6Twifr46qqqbCCfTrXKdWHkhey0CTw/wm6ZI=;
        b=kl7VGlxui3vkwhzosXsLyj+lxJiNMRBYTSMnTwv3vDMaLRu4+n1qEX5tGqyDUpxJkQ
         PAUceBPxDQSthOxRzTZfANEwA1dCApv5YgBrPE7dKhXsV2d84cUmC08+5Ac7uDnSnb+C
         z7mXz1d2U3i+JPGZ60a7cAEuwQlQnx0rZvtFJrjsMuQA7ebaov2xibuvAVLH4Uze9d72
         f7XWLo8r4lQzBLUsJQZnQCl0OUiAwikxUA28V3WULlVi8A6aKQtQqNDWF49qvgC2IFVE
         i/QHusovR0m4qcy6Exn1J+9fu1JoWMYUQPWKu1XBR/2b+wvKUsn34LNSJGbgYThkhzGt
         1Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVwju2X6Twifr46qqqbCCfTrXKdWHkhey0CTw/wm6ZI=;
        b=kukusp19ip+jS8U9H+1wgAuGRVCZOAqibZnrCTYsY5uRNWcWYHPvoRa7ztDHM1uRcG
         v1uY3wMZmdLXHi5n0VRt6kgdrKpxcg3OneOIeHbY3/22vb75MzsgojR74r1kXwr3wI7U
         QLgaIdE/x1wpluXt/g2J5Ccn6QrZhh73xT77o/OLEJWcdp36QL/yPMLugz9szILp0SeJ
         grQD5jzEkLiHlDEd+3dCCVCLtEzz+451+0isM6/ePu17MIj2176hNEqz9ltHhM0IMmgN
         QysQIHC8wDGy+mlAGGEgrw2TYTl0pR3IfTXZL7Pec7BZF5IyUimTD4/tNPw4ixOS2zha
         +nyA==
X-Gm-Message-State: AJIora9uV221H+Btaxk1oF0gxJro1sIyxtFlRq8pkW7sn4UejXgbKvz/
	d2WXqjkU92M0+0mI7uHP2SpIKwQ+RzytlQ==
X-Google-Smtp-Source: 
 AGRyM1s2RkezWcg7Sw3RNdhGyMsySdQoevJOaOOVdhT8I2F6mRYoIhe8UMTSXOklJ20+Iier/7zO3g==
X-Received: by 2002:a05:6402:448c:b0:435:9dcc:b8a5 with SMTP id
 er12-20020a056402448c00b004359dccb8a5mr47222988edb.287.1657039194757;
        Tue, 05 Jul 2022 09:39:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 eg37-20020a05640228a500b0043a587eb95dsm4975978edb.5.2022.07.05.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:39:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] externalsrc: write task locks into ${T}, not into ${S}
Date: Tue,  5 Jul 2022 18:39:49 +0200
Message-Id: <20220705163949.770641-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 16:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167668

Otherwise lock files appearing and disappearing can interfere
with reproducibility code enumerating source files in do_unpack():

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3745/steps/14/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 90792a737b..b326f10050 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -88,7 +88,7 @@ python () {
                 bb.build.deltask(task, d)
             elif os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
-                d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
+                d.appendVarFlag(task, "lockfiles", " ${T}/singletask.lock")
 
             for funcname in [task, "base_" + task, "kernel_" + task]:
                 # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
-- 
2.30.2


