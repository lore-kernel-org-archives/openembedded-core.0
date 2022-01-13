Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B912C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 21:27:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3454.1642109227767327992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 13:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e/lYYA2Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d19so12578894wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 13:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o0qF1h3J5k3k01WarxyL4coT2q0AcpIlpJrXXVgLdxs=;
        b=e/lYYA2QeVi+QcMHJ33V2KIsRJfJ4af6sn3Wjx//w6LM6XEk1qajgdy5j/uEDUbcjg
         L9gs7FxxP90lr9QXkjXPFnOxO2S6705pEZ4WISdM4502zwEm6bfoJdu0PBker55mOK51
         Dz9CJKwjERTDdu4WkDi2nxpmOaqDI8/7P+bPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o0qF1h3J5k3k01WarxyL4coT2q0AcpIlpJrXXVgLdxs=;
        b=vmt0hWLmQBN6EG4mYRXsgKVPcgjmEqVwVYxybTAkhO7pnvC8KeaxnhmU2BL86uCN7d
         9Fg/b3HfVQLL4Gml6X5/eDzTFO/Bawh2S+g90CYIRn/Bgr4Y6KxMqlw99I6lmCVYrqaF
         CYT1dgjCqGVr2tnOrZhoLMWqwM/WDjIqYs2rRVkKU5IYWqeRt+8xsSQoRT7TeqsiVfLx
         d9vd7yG273R0WyyEJuGrwh9epEdKTcsGmEV6Us4GGV1w2o03ouQY1lJ3LthoX24WZny3
         pdchYGGBXhU3pMFmUfdbAgerkExhrwi5MOTQCSBogYJtaBUMIzGOp6oEhxXAOYwry8c8
         QyyA==
X-Gm-Message-State: AOAM5333YXakbh4vsJ62jTDu7weP88lj/Z8yExLnW4uij6vrTEopcPsu
	o44HJ7erNxgGYjBAOcFDYsRjI0zq5awCvw==
X-Google-Smtp-Source: 
 ABdhPJzVV4I3j0+3twPBiT9669Ek+Gnko33WD+wA8QiB4VJomEYyKnEowH0UzSqrhtFgO7aeCIRPaQ==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr5703965wri.525.1642109225876;
        Thu, 13 Jan 2022 13:27:05 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 t7sm3413221wrx.48.2022.01.13.13.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 13:27:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Drop TUNEABI, TUNEABI_WHITELIST, TUNEABI_OVERRIDE
Date: Thu, 13 Jan 2022 21:27:04 +0000
Message-Id: <20220113212704.1727295-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 21:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160532

These were added nearly a decade ago but there are no users in OE-Core. I
checked with the likely users and they seem to have no current usage either.
Therefore remove them.

If needed for some prebuilt library somewhere, they could be implemented
in the layer using them instead but I doubt these are in use any longer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass  | 42 ------------------------------------
 meta/conf/documentation.conf |  3 ---
 2 files changed, 45 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 0e20589b22d..f288b4c84c9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -185,37 +185,6 @@ def raise_sanity_error(msg, d, network_error=False):
     
     %s""" % msg)
 
-# Check flags associated with a tuning.
-def check_toolchain_tune_args(data, tune, multilib, errs):
-    found_errors = False
-    if check_toolchain_args_present(data, tune, multilib, errs, 'CCARGS'):
-        found_errors = True
-    if check_toolchain_args_present(data, tune, multilib, errs, 'ASARGS'):
-        found_errors = True
-    if check_toolchain_args_present(data, tune, multilib, errs, 'LDARGS'):
-        found_errors = True
-
-    return found_errors
-
-def check_toolchain_args_present(data, tune, multilib, tune_errors, which):
-    args_set = (data.getVar("TUNE_%s" % which) or "").split()
-    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s:tune-%s" % (which, tune)) or "").split()
-    args_missing = []
-
-    # If no args are listed/required, we are done.
-    if not args_wanted:
-        return
-    for arg in args_wanted:
-        if arg not in args_set:
-            args_missing.append(arg)
-
-    found_errors = False
-    if args_missing:
-        found_errors = True
-        tune_errors.append("TUNEABI for %s requires '%s' in TUNE_%s (%s)." %
-                       (tune, ' '.join(args_missing), which, ' '.join(args_set)))
-    return found_errors
-
 # Check a single tune for validity.
 def check_toolchain_tune(data, tune, multilib):
     tune_errors = []
@@ -247,17 +216,6 @@ def check_toolchain_tune(data, tune, multilib):
             bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
         else:
             tune_errors.append("Feature '%s' is not defined." % feature)
-    whitelist = localdata.getVar("TUNEABI_WHITELIST")
-    if whitelist:
-        tuneabi = localdata.getVar("TUNEABI:tune-%s" % tune)
-        if not tuneabi:
-            tuneabi = tune
-        if True not in [x in whitelist.split() for x in tuneabi.split()]:
-            tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
-                (tune, tuneabi))
-        else:
-            if not check_toolchain_tune_args(localdata, tuneabi, multilib, tune_errors):
-                bb.debug(2, "Sanity check: Compiler args OK for %s." % tune)
     if tune_errors:
         return "Tuning '%s' has the following errors:\n" % tune + '\n'.join(tune_errors)
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index f63f4b223a1..6b50ad08a8b 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -440,9 +440,6 @@ TOOLCHAIN_TARGET_TASK[doc] = "This variable lists packages the OpenEmbedded buil
 TOPDIR[doc] = "The Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
 TRANSLATED_TARGET_ARCH[doc] = "A sanitized version of TARGET_ARCH. This variable is used where the architecture is needed in a value where underscores are not allowed."
 TUNE_PKGARCH[doc] = "The package architecture understood by the packaging system to define the architecture, ABI, and tuning of output packages."
-TUNEABI[doc] = "An underlying ABI used by a particular tuning in a given toolchain layer. This feature allows providers using prebuilt libraries to check compatibility of a tuning against their selection of libraries."
-TUNEABI_OVERRIDE[doc] = "If set, ignores TUNEABI_WHITELIST."
-TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values.  If the variable is not set, all values are allowed."
 TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
 TUNEVALID[doc] = "Descriptions, stored as flags, of valid tuning features."
 
-- 
2.32.0


