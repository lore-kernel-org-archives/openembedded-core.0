Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53693C54EFD
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9470.1649763231245035291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 04:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dXDvLWFA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1415793wml.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G7Oh164iogJZ/Teev+W1/n1JTquuTN1qfPxcKOCAIGA=;
        b=dXDvLWFAj4n/iV130I+hphZdtAQRyA0hwf+8NAn8xIWjMFuPeEQFqu7LgelOY8OF1P
         yTJSW6SeSaMOtU7Tcwj8xffiJlYa24RfGTs9LSZfDqXN3AGWA8b2TQ1SbemIv8Us6fln
         rD7IcrUIXTbFJOu5XWU2+yIjaTYtL0wVmFt8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G7Oh164iogJZ/Teev+W1/n1JTquuTN1qfPxcKOCAIGA=;
        b=ifILJJxNgocyohZXgikcWf5ykqLEGBS8V+h7MA+Dj6WZL0bNWZK2VB4wR/y1iY2ZUl
         NccBv7pQU04cxYe+MYp8gKKt09fpgcWajUziknMPhuo108Om1MWmx6dye85DVfJ4tmYl
         3gTjf47YS7q9ENy/RtZri6P/hg4EFxertZ9LuGsFOVZM8GkSTYmoBVotuZnQgDDG5onG
         M+QmMOCu+VZ359YGkmEjywTiJcQCcdmSXMwmEyDd6fm+tUwoeVL+KL2N5vb9mV9mDEC5
         3OLuv8JjlbWEUK+8PhyE4T9+O2QIKE9hkRQGgJaS2MlHRPP93KOiDSkQuCmOG4kCVzDd
         wyJw==
X-Gm-Message-State: AOAM530VZlE4xswgN2ulg77oyE5+zBFIZazhViIl/lC2BKnbkka/p/S3
	a3fMdoG0SUTBuZ99tia2xA1dCS2Mzai4IQ==
X-Google-Smtp-Source: 
 ABdhPJwcgmDmfisw/4tMTzKPX6I6N36Uz96Frqs5aEV8C4MdN0jZsQQdN5FAX13w/ZMZeYZih7LwcA==
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id
 a24-20020a1cf018000000b0037bc13c3128mr3647927wmb.157.1649763229083;
        Tue, 12 Apr 2022 04:33:49 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b168:4a11:27d6:cd01])
        by smtp.gmail.com with ESMTPSA id
 y11-20020a056000168b00b002041af9a73fsm32788496wrd.84.2022.04.12.04.33.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 04:33:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] externalsrc/devtool: Fix to work with fixed export funcition
 flags handling
Date: Tue, 12 Apr 2022 12:33:47 +0100
Message-Id: <20220412113347.2126456-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164264

If we fix bitbake to correctly handle the cleandirs and fakeroot flags
for tasks handled by EXPORT_FUNCTIONS, we break devtool since it only
considers these for top level functions. Add in extra code to intercept
the cleandirs flags for commonly used sub functions too.

[YOCTO #8621]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/externalsrc.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index abfe24bacec..b2f216f361d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -90,15 +90,16 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-            # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
-            cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(task, 'cleandirs', False) or '')
-            setvalue = False
-            for cleandir in cleandirs[:]:
-                if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
-                    cleandirs.remove(cleandir)
-                    setvalue = True
-            if setvalue:
-                d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
+            for funcname in [task, "base_" + task, "kernel_" + task]:
+                # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
+                cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(funcname, 'cleandirs', False) or '')
+                setvalue = False
+                for cleandir in cleandirs[:]:
+                    if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
+                        cleandirs.remove(cleandir)
+                        setvalue = True
+                if setvalue:
+                    d.setVarFlag(funcname, 'cleandirs', ' '.join(cleandirs))
 
         fetch_tasks = ['do_fetch', 'do_unpack']
         # If we deltask do_patch, there's no dependency to ensure do_unpack gets run, so add one
-- 
2.32.0


