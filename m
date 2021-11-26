Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45194C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:31 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.20169.1637901390473290125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=phyVL78Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id b13so5894239plg.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JM/1sH8izo0sCsEF9kjmVKBeA4HJv7GllvmOvNffNBI=;
        b=phyVL78QAmYnJXvvUQrqlsLXcKtJg4J3zfJJM2PYlIyDyY7TtgJY9ndz8qdxE6YJHS
         msi/b6VgvMFAOpEQyCjscDPPSAnhQKLmWngE3uyUd7IL5uOKjGDBzE0xAHJfeKd6nBUY
         ++mVJuHf03fbP6bJSCnPgNv0Jqm33ZVrbhYgNSHXKc/6AuY1p+0u2Okn0JkoSwdYeN3z
         iUaW8hzSOl116kAI30q6m3t+clN87CLIK1m38MabPWcSzOZMp62A6VMfm0sOP0aeo0Ro
         yWA7UJMwcBZPv7ArgSOqcksACCZrUP4xdybI6QitezVv+PL1mXPpxDTFqvj3PSkdD38B
         9vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JM/1sH8izo0sCsEF9kjmVKBeA4HJv7GllvmOvNffNBI=;
        b=6yYjCnsuqvo49lkD/ZEsF/COPW1wYZiBhPafkdNZ06sozClJfXKHeYfPoFyTnKjAHB
         tMJ4ovRdoQNYN7pmgirHR2CrRfirmfeQpq0KlHKkAx3wURWfqMAMMZCTnMDawS0AptUl
         FNzUDBaYt19V377xB2Pqd5D8vDznKNi0MePtyz75ax/ypQ+YZo30l+OlosuILO5Z+rli
         L1iOnKc2l2jnTeU482lGFuWpKbQtWgk1/9KId+vHvdK4AdxeccUiyT17pSEqhGhjoeat
         NuYja/rizFw2u0wLDW5DgMr8Rl8Ou/fvlS4t8KTvSjAE7X/7xC0LJAoFRfeEfvHre5Zs
         /1Xw==
X-Gm-Message-State: AOAM532dZ5z60yrIH14XLOg2fW+zODyIkcd6/+KL74AKjB+Cfrp7sReD
	ZIXbp0RBpKFcFyXapv5Q9ykr3ryOdh4=
X-Google-Smtp-Source: 
 ABdhPJxuCN59ACLAN/d0B0J7xR1FHiyW3r/P/8m/4uS3WtQhxx3Daaoa6+LYJFFQdGgxFZufb7CgvA==
X-Received: by 2002:a17:902:aa89:b0:144:ea8e:1bd7 with SMTP id
 d9-20020a170902aa8900b00144ea8e1bd7mr35290400plr.65.1637901389647;
        Thu, 25 Nov 2021 20:36:29 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 18/26] sanity.bbclass: drop usage of distutils
Date: Thu, 25 Nov 2021 20:35:57 -0800
Message-Id: 
 <0553a0d9181bccf4e030bdd6988bc858a0da96c8.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158814

Refactor to use newly imported bb.version.LooseVersion
and replace `import distutils.sysconfig` with 'import sysconfig`.

https://www.python.org/dev/peps/pep-0632/#id23

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/sanity.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9fbc9c18e7c..d7fdd5c04b1 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -462,7 +462,7 @@ def check_sanity_validmachine(sanity_data):
 # Patch before 2.7 can't handle all the features in git-style diffs.  Some
 # patches may incorrectly apply, and others won't apply at all.
 def check_patch_version(sanity_data):
-    from distutils.version import LooseVersion
+    from bb.version import LooseVersion
     import re, subprocess
 
     try:
@@ -478,7 +478,7 @@ def check_patch_version(sanity_data):
 # Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
 # Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
 def check_make_version(sanity_data):
-    from distutils.version import LooseVersion
+    from bb.version import LooseVersion
     import subprocess
 
     try:
@@ -539,7 +539,7 @@ def check_wsl(d):
 # built buildtools-extended-tarball)
 #
 def check_gcc_version(sanity_data):
-    from distutils.version import LooseVersion
+    from bb.version import LooseVersion
     import subprocess
     
     build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
@@ -552,7 +552,7 @@ def check_gcc_version(sanity_data):
 # but earlier versions do not; this needs to work properly for sstate
 # Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
 def check_tar_version(sanity_data):
-    from distutils.version import LooseVersion
+    from bb.version import LooseVersion
     import subprocess
     try:
         result = subprocess.check_output(["tar", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
@@ -567,7 +567,7 @@ def check_tar_version(sanity_data):
 # The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162 
 # The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
 def check_git_version(sanity_data):
-    from distutils.version import LooseVersion
+    from bb.version import LooseVersion
     import subprocess
     try:
         result = subprocess.check_output(["git", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
@@ -655,10 +655,10 @@ def check_sanity_version_change(status, d):
 
     # Check the python install is complete. Examples that are often removed in
     # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
-    # requires distutils.sysconfig.
+    # requires sysconfig module in Python standard library.
     try:
         import xml.parsers.expat
-        import distutils.sysconfig
+        import sysconfig
     except ImportError as e:
         status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
@@ -796,7 +796,7 @@ def check_sanity_everybuild(status, d):
         status.addresult('The system requires at least Python 3.6 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
-    from distutils.version import LooseVersion
+    from bb.version import LooseVersion
     minversion = d.getVar('BB_MIN_VERSION')
     if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
-- 
2.30.2


