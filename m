Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B1BCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:01:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.47868.1760371296804404065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 09:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kHyBO+re;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so3222849f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760371295; x=1760976095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzvERXmZVjKKOanEuEC73zuvuPfdqzChJFQqeWOY4DY=;
        b=kHyBO+rebog/P8HnN7QCbSt/VoFhX2OOuzNUSl42y4JuPW8IZMXT6qNcTjcEIlrrkW
         HybCJ+Hg4H2odI12rZOOzxztF5txcaQ8bKm0EKLxDL1wV6VCb//l2xiXImRrk0ul16De
         YoBx9sHmSq8udTQ4pk+pkDH/l+qlxzXk1Tj4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371295; x=1760976095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzvERXmZVjKKOanEuEC73zuvuPfdqzChJFQqeWOY4DY=;
        b=CtriKPg9GktXSjYg9vWTDbcfSB5r5a3k+ytv+dOs+V0FF2mmycu60te9on2dzKuOvH
         SomoICCw9tPXMIFo1f/clAv8TltH2d+fTZ4/T13y4BlVNn+AyoFyMEkCEYMpk131mXFl
         hDwC2/QEATwKnlLQVtADnou5fpX4pAjdDtwjjewH+Gb2+F2gDUDFXJtzhdoqnDxy5uH9
         P3TKWP7B5f+UhISgtJpzVKJvA64qtEZcLHspWrYR93cqozeU/azUCA6+R4cnj8In7skF
         EjSGOp0pfYQ22NNCRUq+gTcc+b1rBuyX0TYtgMNUUKgWMw6Wz8KcwfcbFKxFXBKXO+Fc
         0iwA==
X-Gm-Message-State: AOJu0Yyoa3xQrmP4/U3Gaqx4PpO2Y76k/pQmY6UPGfxTQ8AUCAsy8Hh+
	jvWg2uI8i59+IDOSU12V8HAh/nC5KsOayJ+pe674FhEDxbuWMby8UqaWWwPSEG8pAZZWcekwnW5
	/KzXE
X-Gm-Gg: ASbGnct+Z7SiTeo7WmVyIsjxIZrD0zxIHej5V8rn0UiSg3HeM6QqtgqoDSTTSlz1fvm
	u86ZBgfMxg2sMFJtUI2BqRnKL4lRaR3UV9/dNDKx5s6bnsc6zQtUU2A8vgEbV1gWOtIZtIR/dXJ
	m6HZ5eDijLRvelwF5Qw4zrvGZPtu8Z7ka6g8H9UErUDOQcu5qwHCPn718gInL2FZtoO4dSWHMJd
	TzC4FXyZbCUCR8yjEA5/TbCJ7br+Ur6k9/OyhisWTeev46rtCatm8N81m2yLFarCaLT8UZete56
	YGYBDV3SI79smcq6UrFHKrmrTSAFnFYOv4uHYj9n5TuHuxV5iv9Nv8io182KZXACOVYE7UnjrVn
	eFhliXqaO6xxg4qo6evgg8RklVBNdhnh2WkMjtyMx7d8Kj9kguUlsh9IW9BD3gVfObJPmE7oHL3
	I+I5Z+Or6AxzjPtnDQE9jZev4b68w5mAZqACBCzZmRjExwVLl4eiLJ/8rlw4OrtIO/jEeX
X-Google-Smtp-Source: AGHT+IEXmMPWgOOYbM8uamkOhcQ3rMi5HYBMYuIYKwYi4Jh2xSsGG2rGcEf0Q8Thmm7TL5A6lEmtvg==
X-Received: by 2002:a05:6000:2c11:b0:3ec:dd16:fc16 with SMTP id ffacd0b85a97d-4266e7df779mr13816764f8f.43.1760371294828;
        Mon, 13 Oct 2025 09:01:34 -0700 (PDT)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cc03sm19517386f8f.4.2025.10.13.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:01:34 -0700 (PDT)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] sanity.bbclass: Remove tool version repetition for gcc, patch, git, make, tar
Date: Mon, 13 Oct 2025 17:59:51 +0200
Message-ID: <20251013155950.42855-2-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224788

This commit mainly changes the way that error messages are printed when
sanity checking for the version numbers of gcc, patch, git, make and
tar. It affects the following functions:

check_patch_version(),
check_make_version(),
check_gcc_version(),
check_tar_version(),
check_git_version()

Before this commit, the minimum version number and the error string
were hard-coded string literals which the programmer had to maintain
manually and independently. With this change, the version is defined
once in each function and then used both for checking and for error
printing.

Additionally, the affected error messages have been made to spill
over multiple lines for better source code readability.

Link to the relevant discussion:
https://lists.openembedded.org/g/openembedded-core/topic/115491380#msg224131

This change has been tested by changing the version string and making
sure that the test fails and the proper minimum version is reported
in the error message.

Suggested-By: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
---
 meta/classes-global/sanity.bbclass | 32 ++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 439dc5ad75..6934e071a3 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -434,11 +434,14 @@ def check_sanity_validmachine(sanity_data):
 def check_patch_version(sanity_data):
     import re, subprocess
 
+    patch_minimum_version = "2.7"
+
     try:
         result = subprocess.check_output(["patch", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
         version = re.search(r"[0-9.]+", result.splitlines()[0]).group()
-        if bb.utils.vercmp_string_op(version, "2.7", "<"):
-            return "Your version of patch is older than 2.7 and has bugs which will break builds. Please install a newer version of patch.\n"
+        if bb.utils.vercmp_string_op(version, patch_minimum_version, "<"):
+            return ("Your version of patch is older than %s and has bugs which will break builds. "
+                "Please install a newer version of patch.\n" % patch_minimum_version)
         else:
             return None
     except subprocess.CalledProcessError as e:
@@ -446,6 +449,7 @@ def check_patch_version(sanity_data):
 
 # Glibc needs make 4.0 or later, we may as well match at this point
 def check_make_version(sanity_data):
+    make_minimum_version = "4.0"
     import subprocess
 
     try:
@@ -453,8 +457,8 @@ def check_make_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute make --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
-    if bb.utils.vercmp_string_op(version, "4.0", "<"):
-        return "Please install a make version of 4.0 or later.\n"
+    if bb.utils.vercmp_string_op(version, make_minimum_version, "<"):
+        return "Please install a make version of %s or later.\n" % make_minimum_version
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
@@ -511,9 +515,12 @@ def check_userns():
 # built buildtools-extended-tarball)
 #
 def check_gcc_version(sanity_data):
+    gcc_minimum_version = "10.1"
     version = oe.utils.get_host_gcc_version(sanity_data)
-    if bb.utils.vercmp_string_op(version, "10.1", "<"):
-        return "Your version of gcc is older than 10.1 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+    if bb.utils.vercmp_string_op(version, gcc_minimum_version, "<"):
+        return ("Your version of gcc is older than %s and will break builds. Please install a newer "
+            "version of gcc (you could use the project's buildtools-extended-tarball or use "
+            "scripts/install-buildtools).\n" % gcc_minimum_version)
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
@@ -521,6 +528,7 @@ def check_gcc_version(sanity_data):
 # Version 1.28 is needed so opkg-build works correctly when reproducible builds are enabled
 # Gtar is assumed at to be used as tar in poky
 def check_tar_version(sanity_data):
+    tar_minimum_version = "1.28"
     import subprocess
     try:
         result = subprocess.check_output(["tar", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
@@ -529,8 +537,10 @@ def check_tar_version(sanity_data):
     if not "GNU" in result:
         return "Your version of tar is not gtar. Please install gtar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     version = result.split()[3]
-    if bb.utils.vercmp_string_op(version, "1.28", "<"):
-        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
+    if bb.utils.vercmp_string_op(version, tar_minimum_version, "<"):
+        return ("Your version of tar is older than %s and does not have the support needed to enable reproducible "
+            "builds. Please install a newer version of tar (you could use the project's buildtools-tarball from "
+            "our last release or use scripts/install-buildtools).\n" % tar_minimum_version)
 
     try:
         result = subprocess.check_output(["tar", "--help"], stderr=subprocess.STDOUT).decode('utf-8')
@@ -545,14 +555,16 @@ def check_tar_version(sanity_data):
 # The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162 
 # The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
 def check_git_version(sanity_data):
+    git_minimum_version = "1.8.3.1"
     import subprocess
     try:
         result = subprocess.check_output(["git", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
     except subprocess.CalledProcessError as e:
         return "Unable to execute git --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
-    if bb.utils.vercmp_string_op(version, "1.8.3.1", "<"):
-        return "Your version of git is older than 1.8.3.1 and has bugs which will break builds. Please install a newer version of git.\n"
+    if bb.utils.vercmp_string_op(version, git_minimum_version, "<"):
+        return ("Your version of git is older than %s and has bugs which will break builds. "
+            "Please install a newer version of git.\n" % git_minimum_version)
     return None
 
 # Check the required perl modules which may not be installed by default

