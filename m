Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8641C8303F
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 05:32:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.16695.1751434346752562241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 22:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yk+1hcCa;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-237311f5a54so36505795ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751434346; x=1752039146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3BH9p+1bjBPBbTVsHhdAov30OgxV3XgfeJ14jhagfk=;
        b=Yk+1hcCayXuWMYnPpdN83b+T/hzXjm0FR24piFl1iu33omYTdBpEA3sgwZfcOzxk2A
         vvuZmjQm5XI321gVFsTPXaJPEUd+3tOqKet+MEICkcfHTUXl4iolkV03x4sW4laA8kOM
         snsbhmQFyrFd6s6egJeUECfyKNppZzeWYdDiQD2ycjXG3FCHFG9BQ84meM08yg+gxihG
         B+SIikPIZ1TQGNOTttfpJuymsFjLp9I51NRrd8kmT2cfAM28iz7hnBdIrhAQu8eHcbzD
         LAutumeE4obVc/JR0l8ehqYCdJOjSN8RZ206ifxyR0qDCBHSee4bmCpKbtcSKjhbcdeq
         bTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434346; x=1752039146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3BH9p+1bjBPBbTVsHhdAov30OgxV3XgfeJ14jhagfk=;
        b=OyN4YnHgrYuK0ihIFu+yZufmWmU/8pHEinsD1YSVdyV79H4M9/NJwixkKzYh3Q5q27
         3scASguZPs18/zDKTac5OZSiG7+3VEfKmgNIY07a4cQQZ9KDI02PjHVL+9/JvMzZ7Qs8
         mUV/kSfmRDun8JwDi6Y5xrE0ZLXNPoPpLl4DVJomSG9PRG8/v9e8GAMAlhChUDzprCTY
         t7BtkCp51nkof1obhixg+7Cypo8eQWDA7B3zso1v1CEoiHlq7g1jUy2Xe6kSS7b0es0J
         occgFZ5PrcyLKWOuLCjSrlfcCFnlOge5EaJKEAr71Oj/aQj8W9bCNWRuN65GW+F855yP
         jIDg==
X-Gm-Message-State: AOJu0Yyqjiv25OfHAcDNX2NTgldE95wPcYD8O7Pp5O8tdew7L6Un/zBa
	oLVAiCLeLlHPCrjMl+o87LxpEQWr/PBS2r7l83jByu4LjBho8dPpFS3opdrg8R0r
X-Gm-Gg: ASbGncu1VHyeGLSL9W1s1j2gdRls0UBZui1FPY2OccKoDTeGGLZ51kjFOQpeQcDMiWe
	QKYXV+LsobtUiWLhKU0mz7ELsJMjLSdmQaMAUnib3QSGxMXHXapEBjSbtHnMj8VYtRFvibvW8ZD
	cZbJSPdVb+aNY4JZrdXQf2468dPQXF3/vfsCYkPsCx64c43ZkElm7RIlWwugCikacqA5HzGRU/0
	vB0k27fMr5u3Xm1N2hCCMkGNgFChV9zRQxRpbnLfnw1jG8XOo3lSbOQtCdopl6q9qevQB607ViU
	WMXV78LQV8uU2qfZDJzAQFPz+ArRyNyyu/8hz6+EUnfeSLOqIpuGkhnrO6dkh25/
X-Google-Smtp-Source: AGHT+IFKtDYjEWjBn+QKaQKq5nd6zTsCrTAJSmC0tQSmtt2QKu5rNaM51zpKNpge3hA7Sblz+bc0gQ==
X-Received: by 2002:a17:903:190d:b0:235:f298:cbbd with SMTP id d9443c01a7336-23c6e5036e4mr27271415ad.21.1751434345735;
        Tue, 01 Jul 2025 22:32:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e2423sm120125985ad.37.2025.07.01.22.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:32:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 4/5] sanity/utils: Directly use gcc, not BUILD_CC
Date: Tue,  1 Jul 2025 22:32:19 -0700
Message-ID: <20250702053220.4104358-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702053220.4104358-1-raj.khem@gmail.com>
References: <20250702053220.4104358-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219777

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The test/helper is written assuming gcc, so just call that and stop
accessing BUILD_CC which may be set to clang.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/sanity.bbclass |  9 +++------
 meta/lib/oe/utils.py               | 17 ++++++-----------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index d1452967fc1..3c103d3bfb3 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -514,12 +514,9 @@ def check_userns():
 # built buildtools-extended-tarball)
 #
 def check_gcc_version(sanity_data):
-    import subprocess
-    
-    build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
-    if build_cc.strip() == "gcc":
-        if bb.utils.vercmp_string_op(version, "8.0", "<"):
-            return "Your version of gcc is older than 8.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+    version = oe.utils.get_host_gcc_version(sanity_data)
+    if bb.utils.vercmp_string_op(version, "8.0", "<"):
+        return "Your version of gcc is older than 8.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a11db5f3cd9..27d304ec72d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -415,34 +415,29 @@ def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
     return output_str
 
 
-# Helper function to get the host compiler version
-# Do not assume the compiler is gcc
-def get_host_compiler_version(d, taskcontextonly=False):
+# Helper function to get the host gcc version
+def get_host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
 
     if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
         return
 
-    compiler = d.getVar("BUILD_CC")
-    # Get rid of ccache since it is not present when parsing.
-    if compiler.startswith('ccache '):
-        compiler = compiler[7:]
     try:
         env = os.environ.copy()
         # datastore PATH does not contain session PATH as set by environment-setup-...
         # this breaks the install-buildtools use-case
         # env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
+        output = subprocess.check_output("gcc --version", \
                     shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
-        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
+        bb.fatal("Error running gcc --version: %s" % (e.output.decode("utf-8")))
 
     match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
-        bb.fatal("Can't get compiler version from %s --version output" % compiler)
+        bb.fatal("Can't get compiler version from gcc --version output")
 
     version = match.group(1)
-    return compiler, version
+    return version
 
 
 def host_gcc_version(d, taskcontextonly=False):

