Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA94E810C4
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:48:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.14314.1695811704688107060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ISoD8bIJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-307d58b3efbso9143727f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695811703; x=1696416503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+Qdt8lnfB+fnKGmuAghbxnRNt5rK/q0fwN9PJ00d58=;
        b=ISoD8bIJoJGrj/o9rNiMTNHiN4JPIQNEoPR8cNi8W+x5UrizbaWTPvz3oc8V8a9Rnj
         Zcyzo9qC1mjER9IONIx3ScoJHiG1r84qaMMYr7rqrxkWyHmdRIGqZQKVhWxewIu1UruF
         xjG5lECgboaoOqo+cQIPEWJyYS+Ti6lPynast0gstHmKuXGMPnDo10hhXXlRX8nuKn29
         lWWWbRPKkojjFWajyNfCEhNIYe22pK8yLx3YetzhpWR35npGJ9RQfv/mp4SHQ05j5mKf
         d4ryi0tKmQkJOvDAHEFnH6DwJijDC3VKUyKT+Yof39i4GQtgEmsg5OOascpMXxekobJ0
         nQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811703; x=1696416503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+Qdt8lnfB+fnKGmuAghbxnRNt5rK/q0fwN9PJ00d58=;
        b=Tt6c9C8stOZkAzOYeIm9/rVZ0fXDO6FcnEXFYfJIxU7G7Hezv1/Unfxclfg/EB2dr2
         q5j1B9YAkAdM+q7+L5RHCGHHWJYQYepynMeUXhUazBp/owvRqDwBoRmGdc6zQTRhRjkN
         zoFZHIN97wnvaFFPeHwy8rmKOcWEZv404/HuNzeguyYO3r+2Q3slj5sh7OWlvihO4ZQA
         B2S6XQixhA1k5knag6NfFAPjFOZhBXo/Nepdr5y9zOuNOnJlHJzwoUmOYhbCOwd2BnI0
         pfamZRFM3DiDmq5U8bllf6zkxltzSYjVCNPTtrMInPoKtoHmFa+kAhPnhBTcOXN10CUG
         DFQw==
X-Gm-Message-State: AOJu0YxIRR/5qa4gJBrb1ZByOgD5FCG7E78LPnAGxX9FMz4V3ElLV5wO
	700ZvM2J2Mv5lvmu4PnjbSPR4B9Nh8U=
X-Google-Smtp-Source: AGHT+IGVmXCENTYxGyVOMlQA6nxo4/H8AbKRFTpBM8V5lfS+rXcCoc1SIhFUxdQb+SP+GkHxmg1E5A==
X-Received: by 2002:adf:f505:0:b0:31f:f94f:e13f with SMTP id q5-20020adff505000000b0031ff94fe13fmr1417280wro.19.1695811702857;
        Wed, 27 Sep 2023 03:48:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4585000000b0031ad5470f89sm16807452wrq.18.2023.09.27.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:48:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] multilib_script.bbclass: expand script name as well
Date: Wed, 27 Sep 2023 12:48:18 +0200
Message-ID: <20230927104818.2051381-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188301

* e.g. mozjs from meta-oe contains major version from PV in the script name
  but currently cannot use a variable there because it would be unexpanded
  in the varflag name as shown in bitbake -e (lib32-curl included for comparison)

env.lib32-curl:# $ALTERNATIVE_TARGET [2 operations]
env.lib32-curl-#   set oe-core/meta/conf/documentation.conf:66
env.lib32-curl-#     [doc] "Used by the alternatives system to create default link locations for duplicated commands."
env.lib32-curl-#   set multilib_script.bbclass:37 [__anon_40_oe_core_meta_classes_recipe_multilib_script_bbclass]
env.lib32-curl-#     [curl-config] "${bindir}/curl-config-${MULTILIB_SUFFIX}"
env.lib32-curl-# pre-expansion value:
env.lib32-curl-#   "None"
--
env.lib32-mozjs-115:# $ALTERNATIVE_TARGET [2 operations]
env.lib32-mozjs-115-#   set oe-core/meta/conf/documentation.conf:66
env.lib32-mozjs-115-#     [doc] "Used by the alternatives system to create default link locations for duplicated commands."
env.lib32-mozjs-115-#   set multilib_script.bbclass:37 [__anon_40_oe_core_meta_classes_recipe_multilib_script_bbclass]
env.lib32-mozjs-115-#     [js${MAJ_VER}-config] "${bindir}/js${MAJ_VER}-config-${MULTILIB_SUFFIX}"
env.lib32-mozjs-115-# pre-expansion value:
env.lib32-mozjs-115-#   "None"
--
env.lib32-mozjs-115-escript:# $ALTERNATIVE_TARGET [2 operations]
env.lib32-mozjs-115-escript-#   set oe-core/meta/conf/documentation.conf:66
env.lib32-mozjs-115-escript-#     [doc] "Used by the alternatives system to create default link locations for duplicated commands."
env.lib32-mozjs-115-escript-#   set multilib_script.bbclass:38 [__anon_41_oe_core_meta_classes_recipe_multilib_script_bbclass]
env.lib32-mozjs-115-escript-#     [js115-config] "/usr/bin/js115-config-${MULTILIB_SUFFIX}"
env.lib32-mozjs-115-escript-# pre-expansion value:
env.lib32-mozjs-115-escript-#   "None"

Otherwise log.do_package shows that apply_update_alternative_renames first
renames the js115-config to js115-config.mozjs-115 (default ALTERNATIVE_TARGET suffix is '.${BPN}')
and multilibscript_rename later fails:

DEBUG: Executing python function apply_update_alternative_renames
NOTE: mozjs-115: Rename /usr/bin/js115-config -> /usr/bin/js115-config.mozjs-115
DEBUG: Python function apply_update_alternative_renames finished
DEBUG: Executing shell function multilibscript_rename
mv: cannot stat 'BUILD/work/mach-oemllib32-linux-gnueabi/lib32-mozjs-115/115.2.0/package/usr/bin/js115-config': No such file or directory
WARNING: exit code 1 from a shell command.

I wonder if we actually need multilibscript_rename as apply_update_alternative_renames seems
to do the rename already.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/multilib_script.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/multilib_script.bbclass b/meta/classes-recipe/multilib_script.bbclass
index 7011526254..e6f0249529 100644
--- a/meta/classes-recipe/multilib_script.bbclass
+++ b/meta/classes-recipe/multilib_script.bbclass
@@ -31,10 +31,11 @@ python () {
     for entry in (d.getVar("MULTILIB_SCRIPTS", False) or "").split():
         pkg, script = entry.split(":")
         epkg = d.expand(pkg)
-        scriptname = os.path.basename(script)
+        escript = d.expand(script)
+        scriptname = os.path.basename(escript)
         d.appendVar("ALTERNATIVE:" + epkg, " " + scriptname + " ")
-        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
-        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
-        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
-        d.appendVar("FILES:" + epkg, " " + script + "-${MULTILIB_SUFFIX}")
+        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, escript)
+        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, escript + "-${MULTILIB_SUFFIX}")
+        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + escript + " ${PKGD}" + escript + "-${MULTILIB_SUFFIX}")
+        d.appendVar("FILES:" + epkg, " " + escript + "-${MULTILIB_SUFFIX}")
 }
-- 
2.42.0


