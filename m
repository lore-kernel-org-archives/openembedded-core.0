Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA5FC64EC4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 17:20:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.21418.1676481657991055149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 09:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aPNEk06P;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so2922843wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 09:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nl2B8Bhoc8UI1Vi6VdGrVJJOJuAkopIaOw/POBXscc=;
        b=aPNEk06PpqSUVkaCHugkroGIOk/OyXAySkuIyg992TisWNTs5DUcTfn9WoGhqfFbey
         WzG0/VMIxSWK0gBntUm/SBPSQjiN/ExkUXv0eEDiMB+BBDtGodYuxTJjVXMlLbdPoaw+
         gi9rinIz39TzdVOdRoJzgohdoa/WMHTeWf/eYyU8nmbRyKWwfao0NT9fL6WWxSTUbYS7
         Wsad4Ko3D/uNgKAjWKhwMnlD3x8/iMdRU3bq0z6BNCWVVmWsCg+gm+xVKKa9dwpyuZwX
         byFql0PRvphhtLsMPQp8szD3KTtY9izOKHOUUwceMCaWbz+gTwyziKyrHW/Q0ugxaaHE
         wx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nl2B8Bhoc8UI1Vi6VdGrVJJOJuAkopIaOw/POBXscc=;
        b=G+KJaG+eL7b09Yhggs39kfGHo4wGxY9E5RYFd8eYmUV1pJNws5yAyZDIZteAPRrsJJ
         ohtS7t9nHNt9kuC6er0Ml4+NOmKmznZnhuzR7CS3XFMKroikjKVXa2VquPNxpUG1M0uF
         UPyVQQMYB0yWa8RVOog5+fnpLMJ5mQwkCLbKuTkIn0gCXBkTAbfNtOR68V33NavP209y
         oElxFSWZaOkG3YqvAEb+j+G2/O+/gaefpzo/O938tZcMxXbil+68rRxbLkUA/IDeryag
         0+E0hzYPJRmI0fwQNSlkxKeJALTLTA69kaL9zpvTNajJHKq9AMBu1GLKNDJxXTo/No+7
         Hjpg==
X-Gm-Message-State: AO0yUKVrxtvOZBwPKj/5D3zhM0h4epIeA+tmu6Nu+GWZsoJNy3kurD+t
	PFfmkmQ2hd2kR+T28LiyIEd+IcFUxN8=
X-Google-Smtp-Source: AK7set958jA56v3JZbViZJPCP/K10XqvrP56l/dJtqbv8/yDxXPM5V6h5VrHGVbxGqSWnVBsRxvRWA==
X-Received: by 2002:a05:600c:474b:b0:3d2:2d2a:d581 with SMTP id w11-20020a05600c474b00b003d22d2ad581mr2590823wmo.30.1676481656476;
        Wed, 15 Feb 2023 09:20:56 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c1d1000b003dc3f07c876sm3198857wms.46.2023.02.15.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:20:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 3/3] patchreview: use check_upstream_status() from oe.qa
Date: Wed, 15 Feb 2023 18:20:41 +0100
Message-Id: <20230215172041.636292-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215172041.636292-1-Martin.Jansa@gmail.com>
References: <20230215172041.636292-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 17:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177207

* the idea was to reuse the same function as I've noticed that the
  QA check which was added to insane.bbclass in:
  https://git.openembedded.org/openembedded-core/commit/?id=76a685bfcf927593eac67157762a53259089ea8a
  is in some cases more strcit than scripts/contrib/patchreview.py

  To be honest I wasn't aware of scripts/contrib/patchreview.py
  existence when I've asked about moving check_upstream_status()
  to oe.qa in order to write standalone script just like
  patchreview.py, now I don't feel strongly about sharing this
  functionality (other than adjusting regexes in patchreview.py)

* it finds one "new" issue in oe-core:
  Malformed Upstream-Status 'Malformed Upstream-Status in patch
  meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
  Please correct according to https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
  Upstream-Status: Inappropriate[oe specific]' (meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch)

* but unlike the QA check patchreview.py will report this:
  -Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
  +Upstream-Broken-Status: Submitted [https://github.com/madler/zlib/pull/599]

  as a missing Upstream-Status instead of malformed as reported by QA check:

  ERROR: zlib-native-1.2.13-r0 do_patch: QA Issue: Malformed Upstream-Status in patch
  /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
  Please correct according to https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
  Upstream-Broken-Status: Submitted [https://github.com/madler/zlib/pull/599] [patch-status-core]

* RFC: let me know if you think it's worth re-working this to better
  integrate (e.g. detecting Upstream-Broken-Status and not repeating
  .patch path in patchreview.py output) or if I should just adjust
  regexes in patchreview.py.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/contrib/patchreview.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index b22cc07f0a..ce6b0f05c4 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -42,7 +42,9 @@ def blame_patch(patch):
                                     "--", patch)).decode("utf-8").splitlines()
 
 def patchreview(path, patches):
-    import re, os.path
+    import re, os.path, sys
+    sys.path.append(os.path.join(sys.path[0], '../../meta/lib'))
+    import oe.qa
 
     # General pattern: start of line, optional whitespace, tag with optional
     # hyphen or spaces, maybe a colon, some whitespace, then the value, all case
@@ -72,12 +74,11 @@ def patchreview(path, patches):
         else:
             result.missing_sob = True
 
-
         # Find the Upstream-Status tag
         match = status_re.search(content)
         if match:
-            value = match.group(1)
-            if value != "Upstream-Status:":
+            value = oe.qa.check_upstream_status(fullpath)
+            if value:
                 result.malformed_upstream_status = value
 
             value = match.group(2).lower()
-- 
2.39.2


