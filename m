Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C20C83000
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 21:24:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1813.1751059470834238772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 14:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XWUDi5oC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45310223677so2223285e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 14:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751059469; x=1751664269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+RXsOs1c2FLqNGA30AQgjgNZHTKI7aIhD1YsVTNkPU=;
        b=XWUDi5oC1wZxHdtTAj015QJgQFh3gYG54Fel7a/iE4y5HTP9mhDYk5xnoGVKsbRb8G
         kfwcVIYhNlKjgV8YGhbZZmQ+8fulDVVCmE/gUzmCyW350yITw3UDBHDdHRBt+nbdkWAl
         rcGFOjx5uSvV5suggsjayOA5F2Y5y4sFdlbgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751059469; x=1751664269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+RXsOs1c2FLqNGA30AQgjgNZHTKI7aIhD1YsVTNkPU=;
        b=UicOHvG9/FzXDoYrJIRiqBxbpy+ZArfhU1Jl5WgCclS2paeE8m5lrA3J4hd0HjNxV+
         e+mjCN4nZXI5rmhMeW2lmkJfkepqer8A22CjExgHJbhAI6Gc5MIRw0shL5DmDLYaQScM
         LjHfPj51tDPuw3u5PS1R8U6phQ1Ble7Bk6EL8smmbo6gHgeGnE6REr6FKgKGbb0JtUgk
         ABs3F8GKOWf+GWGyFb5bUowJt2Lv/a+wf0cFgilbDurWVVw2liqv3nnqQ9qXiteUG4Aw
         GHKPX/ZFoWo0tNqBTN6pJgDT20jz/aWZuCG93jnbxugzN/OMLWjgG+WAB8j2z7OUPJUo
         PnIQ==
X-Gm-Message-State: AOJu0YyabXa4jyODyL22Erl3OJC9Mg34ygHlbVf3BmpZdv+QhjyPtS8R
	Hf+ZikoX8snT+hRJEMDyqsfw06qrEXF7g3TUeDM8YT2gAsgY2hf3BuXPE8VcCLWc9G42tOWNII4
	nzOEf
X-Gm-Gg: ASbGnctVWpp+qQBAvvlhAY/75eX8NVxE20rC2GacSj2mAPA87axBGasofoKkC96DA2k
	tX3VPHpeSLoe8gmA0TrzYLcjk5K2SXTqjHQYDKixRjYCepBiuQSQ9qJisD9YAjWehwFuCm077pW
	AehmbEiCxPvMM7Tg/KbDhxEOcKJgi4TtqlZ/2TObcvGi9He4DPLCSLrg9TyKsUGeLabpAMCkJHl
	OLIOJMil9kwI29ei9WfxsSwVPD0XIvSxcvZZ9z/Yuzt3QecjrF+zapEaMSnkBIvXJJybTIxfOlc
	YK4XE6tTa/hyLS+c9sxRc0ZdYJd7DH6YzKhWd17qHNGX1gWIDuB6XdpoDAcrQgQdvRneGTtmPNV
	SN/CGGKpCuxcjF+c=
X-Google-Smtp-Source: AGHT+IGW1DT7YhF2Szqr4/haBLciOJrFY2Ay3KVLkTqsKbBpUw26VPJbi6uJ7biBfiCVlXhx17bvdA==
X-Received: by 2002:a05:600c:c4ac:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-4538ee7dcb1mr61584725e9.17.1751059468271;
        Fri, 27 Jun 2025 14:24:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b1d:fac1:a77f:a658])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm61505305e9.11.2025.06.27.14.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:24:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf/sstate: Introduce DEFAULT_SHARED_UMASK to standarise shared area umask
Date: Fri, 27 Jun 2025 22:24:22 +0100
Message-ID: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 21:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219433

Currently, the "shared" directory permissions of sstate are hardcoded. Since
multiple areas of the code reference this, separate it out to a variable to
allow the behaviour to be configurable. Initially this applies to SSTATE_DIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 12 +++++++-----
 meta/conf/bitbake.conf             |  2 ++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2968cc4c2e7..7578aad24ea 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -745,7 +745,7 @@ def pstaging_fetch(sstatefetch, d):
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
 
-    with bb.utils.umask(0o002):
+    with bb.utils.umask(bb.utils.to_filemode(d.getVar("DEFAULT_SHARED_UMASK"))):
         bb.utils.mkdirhier(dldir)
 
         for srcuri in uris:
@@ -776,9 +776,10 @@ sstate_task_prefunc[dirs] = "${WORKDIR}"
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
 
-    omask = os.umask(0o002)
-    if omask != 0o002:
-       bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
+    shared_umask = bb.utils.to_filemode(d.getVar("DEFAULT_SHARED_UMASK"))
+    omask = os.umask(shared_umask)
+    if omask != shared_umask:
+       bb.note("Using umask %0o (not %0o) for sstate packaging" % (shared_umask, omask))
     sstate_package(shared_state, d)
     os.umask(omask)
 
@@ -843,7 +844,8 @@ python sstate_create_and_sign_package () {
 
     # Create the required sstate directory if it is not present.
     if not sstate_pkg.parent.is_dir():
-        with bb.utils.umask(0o002):
+        shared_umask = bb.utils.to_filemode(d.getVar("DEFAULT_SHARED_UMASK"))
+        with bb.utils.umask(shared_umask):
             bb.utils.mkdirhier(str(sstate_pkg.parent))
 
     if sign_pkg:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a3300fc1727..22473bfe23a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -944,6 +944,8 @@ TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
 
 # Set a default umask to use for tasks for determinism
 BB_DEFAULT_UMASK ??= "022"
+# The umask to use for shared files (e.g. DL_DIR and SSTATE_DIR)
+DEFAULT_SHARED_UMASK ??= "002"
 
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"

