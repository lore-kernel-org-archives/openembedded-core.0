Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C947FC3DA7F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 23:36:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1138.1722641778319057505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 16:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XgblOVn3;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368380828d6so5615514f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1722641776; x=1723246576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maxWMbH8lvFTZXnrnc7u0dZJPgbQcIOKEDvDdtE09Dc=;
        b=XgblOVn3g0VVyylmyGyMYDqB8Pqu4bk1eO4KsgKgeaBJckAvKllpwJ5+pAqjF/YM0b
         /to76S0qGjry67uKrdncjfmGmAHyHr/Fsth8i3/uAwBCHvHJXRILxEGYCQJyEaUKEabI
         RG3kmhVm06NXk3YhvchMD22POTVnT7FSW25lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722641776; x=1723246576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maxWMbH8lvFTZXnrnc7u0dZJPgbQcIOKEDvDdtE09Dc=;
        b=XC2UoFHHa4A92CkDutCmeaQ+iwWFWV6M55Jl6+K8px1amsFYe+7McIxCdqwVpZ0QQ0
         jUO/9HeGbIiUn8d8ZIz4Z9+2b4PjsAxdud/BhPKaXWa4oyFCeSsmKUmVgwVC8VC00WPF
         eWAbNVv5pR5xScsIEe7WmLXdEAU9o4Lhqzz+Ex1Z9+zednfVXG5NDT5FpGYU/LF1Z5ky
         B0h4cAhgMSjIHao/fi9ujTp+nFa1qhfWfFxwL7rtFuBBC0ZBpJqsQ40OlmQ2mNIPtqiC
         1MvivYVzBF+M0O8HTIkDV4Vf36qBqTJDPrqNiVd/+bHVwv9NZuVbdqrj94YIIsCxeC+Q
         s7pw==
X-Gm-Message-State: AOJu0YxKNWQodq8u6rTH+VnjsFv1ujO16qo8nOsRpnNetLGXU1kAsPN0
	tpsxPKJgHQe1APva3fDRF9e67xXYFarMPWyyRScYMCgyFLj3HjFkx73gwnb04+XqgIRVrDF5GDw
	/WtM=
X-Google-Smtp-Source: AGHT+IGrElnDHQSFTP7mj2qmu7K+myPEXI8QcKtYXDHMBlyB9hNE7lg8pHO4agDsCT8zeie7rpMMyA==
X-Received: by 2002:a5d:5c87:0:b0:36b:bd75:ed73 with SMTP id ffacd0b85a97d-36bbd75ef23mr3155706f8f.23.1722641775647;
        Fri, 02 Aug 2024 16:36:15 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01402csm2962985f8f.39.2024.08.02.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 16:36:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] spirv-tools: Fix git-describe related reproducibility
Date: Sat,  3 Aug 2024 01:35:53 +0200
Message-Id: <20240802233553.2385836-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 23:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202929

From: Yoann Congal <yoann.congal@smile.fr>

This reproducibility problem comes down to git-describe output. Fixes
this by using an environment variable to force the description and use
it to set this description to ${PV}

Fixes [YOCTO #15567].

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...sion.py-support-an-envvar-to-force-t.patch | 43 +++++++++++++++++++
 .../spir/spirv-tools_1.3.283.0.bb             |  9 +++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch b/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
new file mode 100644
index 0000000000..edcbf506b9
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
@@ -0,0 +1,43 @@
+From 39b6385454d705128e684ed779ba9620e2ead1e2 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Thu, 1 Aug 2024 18:58:04 +0200
+Subject: [PATCH] update_build_version.py: support an envvar to force the
+ description
+
+FORCED_BUILD_VERSION_DESCRIPTION envvar can be used to force a version
+description instead of resorting to git describe which can change for a
+given commit if multiple lightweight commits point ot it.
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/5758]
+---
+ utils/update_build_version.py | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/utils/update_build_version.py b/utils/update_build_version.py
+index bb66e18a..9115cab1 100755
+--- a/utils/update_build_version.py
++++ b/utils/update_build_version.py
+@@ -24,9 +24,10 @@
+ #  - The software version deduced from the given CHANGES file.
+ #  - A longer string with the project name, the software version number, and
+ #    git commit information for the CHANGES file's directory.  The commit
+-#    information is the output of "git describe" if that succeeds, or "git
+-#    rev-parse HEAD" if that succeeds, or otherwise a message containing the
+-#    phrase "unknown hash".
++#    information is the content of the FORCED_BUILD_VERSION_DESCRIPTION
++#    environement variable is it exists, else the output of "git describe" if
++#    that succeeds, or "git rev-parse HEAD" if that succeeds, or otherwise a
++#    message containing the phrase "unknown hash".
+ # The string contents are escaped as necessary.
+ 
+ import datetime
+@@ -150,7 +151,7 @@ def main():
+       sys.exit(1)
+ 
+     repo_path = os.path.dirname(changes_file_path)
+-    description = describe(repo_path)
++    description = os.getenv("FORCED_BUILD_VERSION_DESCRIPTION", describe(repo_path))
+     content = OUTPUT_FORMAT.format(version_tag=version, description=description)
+ 
+     # Escape file content.
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
index 292a17f00d..c54f80c756 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
@@ -8,7 +8,9 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "dd4b663e13c07fea4fbb3f70c1c91c86731099f7"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
+           file://0001-update_build_version.py-support-an-envvar-to-force-t.patch \
+           "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
@@ -29,6 +31,11 @@ EXTRA_OECMAKE += "\
     -DSPIRV_SKIP_TESTS=ON \
 "
 
+# Force the version description "git describe" related non-reproducibility
+do_compile:prepend() {
+    export FORCED_BUILD_VERSION_DESCRIPTION="${PV}"
+}
+
 do_install:append:class-target() {
     # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
     # tools can find the right library

