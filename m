Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6AB77C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:52:12 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id e75so91284602itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=C88LoHmLhVxwkPC3idcvxsHIDs3kjIzeIOxd2s+V370=;
	b=D7JML5mos5PJqmztUfRhLgf64HfUZvGtzUr8fKsB8Xc3tLUSMcTFEY/Y/PiZ/RtQWu
	qLZ4IgG68/IyqYDJb+7T87ZeAMYQOqPg9ASzH9EwUhv5TXak96rmb6G6k5BA/eCoANs3
	EMuel/UXvrOvyEjdi6eET/9FW9DfO3EVcWFNEOW4onu/tQk8sIuMDo8kRf13fIefkh+U
	UBUhbMPm7vKNK2b/HPfkDUy3UYn62RzZ9ZElTqWHpjIn8204ZYm1+gGjNNcshxPgKdYK
	AU2n2o/EqCwmW1pgVjFZbj26im4XC6Hc5sxAinWVYETvXM4W2vPXGjCXDe7HAPz4Ud47
	aFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C88LoHmLhVxwkPC3idcvxsHIDs3kjIzeIOxd2s+V370=;
	b=X9dteMhdT9oBdhXUMeujDEpoIoNJnOgPdv4vKE+g9uhus9Bat1kjzJCIEKmJcSYtY1
	YcZpBDqB+kUd5f93kOkMVWKOaEs5Fnh5AKtTGXt0opPCBuqrS8ATQFM/grcd76uwosRM
	2Wu+UVMd9YPKaSBC7uDnh7DZL58vUVNp/xfumF2GTRIl1mmIUj1BZZaH6Te5C94o7oDb
	FFn9TSvswxkQTAOpvBE3/reynBulvoZGBnA+tFs4pnEYevTZLSSnNqnKd/7jDi9q99fb
	5dF4qRbvvm1KL6k9dHkVTXJ4WDuMzUY4PL+3eNJFIcfAcifJ1QN/Z/X/vofnN7rpbl0P
	E+qg==
X-Gm-Message-State: AFeK/H29XDY1+Q+7F+UsxxE/xuy9d3CahpVvM3DTULpI70HCYdMUHk//N+pq/cevv+d+J+Y7
X-Received: by 10.107.30.67 with SMTP id e64mr601138ioe.54.1490791932506;
	Wed, 29 Mar 2017 05:52:12 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215])
	by smtp.gmail.com with ESMTPSA id p6sm3670027iof.12.2017.03.29.05.52.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Mar 2017 05:52:11 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 14:52:06 +0200
Message-Id: <e4f5d88b8e69964c40e7011c1e7f33f6484b9090.1490791914.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ovmf: avoid linking with gold
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 12:52:12 -0000

Linking with gold fails due to an internal error in gold. The ovmf
linker is gcc, which has a -fuse-ld=bfd option to choose the linker
which (for ovmf) is known to work.

Like the choice of the compilers, this is done in ovmf-native. To keep
that recipe independent of DISTRO_FEATURES, choosing bfd is done
unconditionally.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 898c5b7..73fdfc6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -98,6 +98,14 @@ fix_toolchain_append_class-native() {
         -e '/^LINKER/a LFLAGS += ${BUILD_LDFLAGS}\nCFLAGS += ${BUILD_CFLAGS}' \
         ${S}/BaseTools/Source/C/Makefiles/app.makefile \
         ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+    # Linking with gold fails:
+    # internal error in do_layout, at ../../gold/object.cc:1821
+    # make: *** [.../OUTPUT/Facs.acpi] Error 1
+    # We intentionally hard-code the use of ld.bfd regardless of DISTRO_FEATURES
+    # to make ovmf-native reusable across distros.
+    sed -i \
+        -e 's#^\(DEFINE GCC.*DLINK.*FLAGS  *=\)#\1 -fuse-ld=bfd#' \
+        ${S}/BaseTools/Conf/tools_def.template
 }
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"

base-commit: c31440874d6a41b98fe3f8aacbc5666fd68c9635
-- 
git-series 0.9.1

