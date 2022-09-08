Return-Path: <kristian.amlie@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4741C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 12:16:10 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.4583.1662639369796692650
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 05:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=Blc1W6Fv;
 spf=pass (domain: northern.tech, ip: 209.85.167.46,
 mailfrom: kristian.amlie@northern.tech)
Received: by mail-lf1-f46.google.com with SMTP id a8so5807374lff.13
        for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=joX0h+0gLYSBcyqN4kixZMgvk8NvA9ydpRE+hNyLhKM=;
        b=Blc1W6Fv0Fq9HOw2Vmo8zZjX+90EZiznRPYERn54/7rUFXGSMZ5S0yh6IkfHfOSPlB
         FpYyscSiC32DiRfArGMfHP2NyGVtKa125X2vWo8O8GwCus80qFweNqdwOIVILkQ4BVOf
         0E6q5XIMzQQxZLYXXIzxzxYxFRQidDS7O03AmYNyhUG9UYPfg3WJNQdtKaLCC259Azq0
         W7uWQ8y7bzX8tFO0MX/DGM4UTimlmhI12G/c0K+4kcKTOXenFlqK3vDlxqZwAZYBICgA
         aS4P+OhsC2FfNfYI/31yBpGIwxdBv9bzKUc2MVZGzgvKoiKQA7rWkqGdZrhZtv1CYl2b
         lkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=joX0h+0gLYSBcyqN4kixZMgvk8NvA9ydpRE+hNyLhKM=;
        b=kOfxSTo7oTl15ke8Rcw6uyFNez3h8KRMgm/t2iN0qr2q5vCGuTJDmSUiwl65818q4O
         bc99ON7FbaVGe2CyCKNlANSD0yX7K9dWcwdc+iXvpocSU6y5Dk6hUrnCVQxC15+qD/1C
         iMtAVTK0uiXxHKoNu/hse2XV3N2W3YoVYYZqDrZ8gpiGt3SxuOOvtcOBOJaukqxC38Ce
         kSd4i4NhinZVwghYNvS8QNoE80bu23ljVLTjaO6yDU789KKRVrWEjVi3TeHVwZwO6/Ck
         zK9uQFAgqXYr9YuXTqo/BCOUpdypbEAE6rPsmIS0/6eDudgtVDj/9JWuvulgGXBzDqp8
         MCaA==
X-Gm-Message-State: ACgBeo3vk6uuaxbxvvtnlE+o10HDUbH8i2+L09ml6p++iugn5YAsZSC3
	qUh7XETFiY12kPfcwUnM7wMwYHAGwAZ/Bg==
X-Google-Smtp-Source: 
 AA6agR4ri65NzMZRilb83vgrgJuEFzxk7Gw5y9xqlVZw8xBJ/0aKp5D3lZARROcy12+S46Z0kbdgTg==
X-Received: by 2002:ac2:5e69:0:b0:497:a698:1acc with SMTP id
 a9-20020ac25e69000000b00497a6981accmr2753725lfr.316.1662639367683;
        Thu, 08 Sep 2022 05:16:07 -0700 (PDT)
Received: from localhost.localdomain ([91.232.32.6])
        by smtp.googlemail.com with ESMTPSA id
 q2-20020a056512210200b00492d108777dsm277240lfr.136.2022.09.08.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 05:16:07 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: Openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 1/1] externalsrc: Don't wipe out src dir when EXPORT_FUNCTIONS
 is used.
Date: Thu,  8 Sep 2022 14:16:06 +0200
Message-Id: <20220908121606.25027-1-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 12:16:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170458

When 73fa855f6af5ef9c3 was introduced, the "cleandirs" variable flag
started applying to functions exported using EXPORT_FUNCTIONS.
The externalsrc class is supposed to remove cleandirs in order to
prevent wiping out an external src folder (home directory?), but
doesn't take the previous point into account. The result is that
cleandirs is still in effect.

To fix this, apply the cleandirs manipulation to all variables, not
just predefined ones. This is expensive, but since it executes inside
an `if externalsrc` clause, and EXTERNALSRC is usually only set for
specific single recipes, it won't affect most recipes.

Richard Purdie <richard.purdie@linuxfoundation.org> is the original
author of this patch. I just submitted it under my name for blame
purposes, and also we have been testing it a lot in my company.

This is the original discussion:
https://lists.openembedded.org/g/openembedded-core/topic/91374926

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 meta/classes-recipe/externalsrc.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/externalsrc.bbclass b/meta/classes-recipe/externalsrc.bbclass
index 51dbe9ea5a..ce753fce76 100644
--- a/meta/classes-recipe/externalsrc.bbclass
+++ b/meta/classes-recipe/externalsrc.bbclass
@@ -91,16 +91,18 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-            for funcname in [task, "base_" + task, "kernel_" + task]:
+        for v in d.keys():
+            cleandirs = d.getVarFlag(v, "cleandirs", False)
+            if cleandirs:
                 # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
-                cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(funcname, 'cleandirs', False) or '')
+                cleandirs = oe.recipeutils.split_var_value(cleandirs)
                 setvalue = False
                 for cleandir in cleandirs[:]:
                     if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
                         cleandirs.remove(cleandir)
                         setvalue = True
                 if setvalue:
-                    d.setVarFlag(funcname, 'cleandirs', ' '.join(cleandirs))
+                    d.setVarFlag(v, 'cleandirs', ' '.join(cleandirs))
 
         fetch_tasks = ['do_fetch', 'do_unpack']
         # If we deltask do_patch, there's no dependency to ensure do_unpack gets run, so add one
-- 
2.17.1


