Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3392C7EE2C
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 10:42:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.10638.1692960135631723690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 03:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=S9RxMfIn;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a1de3417acso385919566b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692960134; x=1693564934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVj720IdOlpD97OmR+sTH2XRuQ0KtEOZPAOiWE/eqCY=;
        b=S9RxMfInTh9f6LiAwHlS0gYuP4Tz0nGnGuxFHig1v0PXKtCAgQ1Z0xv2O/M4lX1M73
         UcK4j68naWi15CLD3PSroPgOVRhVnypQuE55Y+ol2HchxiMXXx2csVvxB909bWbielak
         YuNckj2ix6aLVitJbghF8JmsFQQMxP28CWSZbU+n7J83b6bUTKZTcAE3HHjY9wMy11G+
         W3cdN53tOW3vU2g++ZnfoexuBZtd01ryjU6AG+OvOXPNUOH8PnNGFimENUltNsp9YY6t
         vfU1fGZ1xnDmeUbwQ5kCMU0ApkZWN9yJi6MprBRAG9XbBW2Fri7KqS2P8C6pSeniw0kJ
         N3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692960134; x=1693564934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVj720IdOlpD97OmR+sTH2XRuQ0KtEOZPAOiWE/eqCY=;
        b=I29n419EoFN6V0TLxcoqA5DzBBGYtyKmEMiL+Xk2v0bT+jue7g++XYcnXMIhw/vwT5
         xU1ywZ67QYyDTitRpl5eK3FuHTPhJTueFYZKYWlES1+1/KSF9X7rvIgLq/PDBimdeYKi
         kRT+IOeRhRSwc/t7hmK4nmadUL6w/ng95VktqeQpR3afpwqfiDptvLnwV+L4/DHVEX8U
         5DK4pv6/DvZTCW2xqRw1Ap+1Ya2JZsnenkZqGElCKDtFoTPZXAQdsocOnBzi2wDs+qOW
         SK2SfAHb32MrSw3G9oAobEmUmKQLixbHZlTrkX6ej72WTchT5bMtV1l10qPv+gTqe0aR
         n2ag==
X-Gm-Message-State: AOJu0YwjQ+bTHvov6Y0vdbtnQJbUD80IfBonC1weeTQ/ZzxP98ksi0c6
	ptwyRfbWB316Qwhy/XsF04NyhhedC1c=
X-Google-Smtp-Source: AGHT+IFIPpYtC6thjbfkvEt8fbDxvKcCfd1TW6gyf/GZgaBW3PsCB53OXZZ7IxbLJdgsybH+VeeX5g==
X-Received: by 2002:a17:907:7804:b0:9a1:914e:491a with SMTP id la4-20020a170907780400b009a1914e491amr16514329ejc.3.1692960133766;
        Fri, 25 Aug 2023 03:42:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b0099bd6026f45sm825219ejb.198.2023.08.25.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 03:42:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] lib/oe/recipeutils.py: accommodate SRCPV being optional and deprecated in version check regex
Date: Fri, 25 Aug 2023 12:41:57 +0200
Message-Id: <20230825104158.3273715-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 10:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186703

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/recipeutils.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 6996e426ec0..3336db8ab06 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -945,10 +945,9 @@ def replace_dir_vars(path, d):
         path = path.replace(dirpath, '${%s}' % dirvars[dirpath])
     return path
 
-def get_recipe_pv_without_srcpv(pv, uri_type):
+def get_recipe_pv_with_pfx_sfx(pv, uri_type):
     """
-    Get PV without SRCPV common in SCM's for now only
-    support git.
+    Get PV separating prefix and suffix components.
 
     Returns tuple with pv, prefix and suffix.
     """
@@ -956,7 +955,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
     sfx = ''
 
     if uri_type == 'git':
-        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>.*?)(?P<sfx>\+[^\+]*(git)?r?(AUTOINC\+))(?P<rev>.*)")
+        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>.*?)(?P<sfx>\+[^\+]*(git)?r?(AUTOINC\+)?)(?P<rev>.*)")
         m = git_regex.match(pv)
 
         if m:
@@ -1008,7 +1007,7 @@ def get_recipe_upstream_version(rd):
     src_uri = src_uris.split()[0]
     uri_type, _, _, _, _, _ =  decodeurl(src_uri)
 
-    (pv, pfx, sfx) = get_recipe_pv_without_srcpv(rd.getVar('PV'), uri_type)
+    (pv, pfx, sfx) = get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri_type)
     ru['current_version'] = pv
 
     manual_upstream_version = rd.getVar("RECIPE_UPSTREAM_VERSION")
-- 
2.30.2


