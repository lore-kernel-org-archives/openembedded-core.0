Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5AFA7E588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 20:35:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x17so3037864wrl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s4J9ievE1Q9+Ow5KvpKh8UEUTgXZTQOlsp9mQUbKjyM=;
	b=FD/0bOS9uWy2pb3dYCD88O76AgEmb9GYuXhlphN33ndHjH/UMvBHlCNzitbMGxHoZ8
	/iXmLqW3eVvxpuHHfT0HO8SmdmpXXyFNhjbMhagN6xuWBgdDyD5INlLebDKdwrtiDKgS
	59f/4HW/gTt7VXT9RmyjWgVx5yGNUdZmLRoCiUKcDmVhHc7uZEk3nB9knwDkJCMmdYYJ
	N/pUHHMtJxG0wmFYX+N2uGKNNvoXq2iHkgPUUerBW8Xu9XTDEMaMWeerZ9Fu61OtO/IY
	iwB+jjpQbaMl/afMna/yO2JhDE/x9HsfOgmTzPOgP2HcM5lKopdURFONUUKYSTQCjI6S
	OWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s4J9ievE1Q9+Ow5KvpKh8UEUTgXZTQOlsp9mQUbKjyM=;
	b=rhdJmO/6VNYv3ye4YwNtt+X84enfksD9+EVrqv5FDIFA0cqK19Hi1I/fHWTPaUdzNc
	3BzHRccsj79hxhw6rqWdjkbyUPesAfdGdDg3iMSGKvzSZPkalcyG4pKfV2qWLtWx9cRS
	rgW6RTLcjzAPU4HGnhAdfyKKSq4hKY15ZIb4M7IRF8DWZvsePs1ywloEM2FQ0+qqxQh5
	2sBSkoBeRnZs6G03Kcd/i91cZrszUeqMuCFVHORj9LiTUIyn1UmUsVAIjf7x1ZFXp9O6
	9qexA/n+yln74TUkUp9g/P/Nl159B5aQz1SPl9uvQMdry0L+MjLDcLlmNHVnXXQVbPFD
	PeFg==
X-Gm-Message-State: APjAAAXLeJxhfKXMqcAgtm4Z7rivB9fW1U/orUsiXGmkn74717dDIMNB
	Zy64AiXVJwM5i6EoT5+pQi0SaiMeEfc=
X-Google-Smtp-Source: APXvYqximy6Med8Y+ItzNlDosTF8d3tyYlix4vHl76XWxC/hKFY0yx4oRVEj8OlvGEK3ELdYAySTKA==
X-Received: by 2002:a05:6000:11c9:: with SMTP id
	i9mr7286078wrx.258.1560371742387; 
	Wed, 12 Jun 2019 13:35:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j189sm1156818wmb.48.2019.06.12.13.35.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jun 2019 13:35:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 21:35:36 +0100
Message-Id: <20190612203536.32162-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190612203536.32162-1-ross.burton@intel.com>
References: <20190612203536.32162-1-ross.burton@intel.com>
Subject: [PATCH v2 2/2] efibootmgr: add
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
X-List-Received-Date: Wed, 12 Jun 2019 20:35:42 -0000

This was in meta-oe but EFI is sufficiently widespread now that we need it in
core.

The recipe is based on the one in meta-oe but with several updates.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../efibootmgr/0001-remove-extra-decl.patch        | 31 ++++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb       | 34 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
new file mode 100644
index 00000000000..42f3a8182df
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
@@ -0,0 +1,31 @@
+From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 13 Jun 2018 09:41:01 -0400
+Subject: [PATCH] remove extra decl
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+
+Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/efibootmgr.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index de38f01..4e1a680 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
+ 					       "invalid numeric value %s\n",
+ 					       optarg);
+ 			}
+-                        /* XXX efivar-36 accidentally doesn't have a public
+-                         * header for this */
+-			extern int efi_set_verbose(int verbosity, FILE *errlog);
+ 			efi_set_verbose(opts.verbose - 2, stderr);
+ 			break;
+ 		case 'V':
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
new file mode 100644
index 00000000000..0e5a81e3166
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
+SUMMARY = "EFI Boot Manager"
+HOMEPAGE = "https://github.com/rhboot/efibootmgr"
+SECTION = "base"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS = "efivar popt"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+           file://0001-remove-extra-decl.patch \
+          "
+SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+# The directory under the ESP that the default bootloader is found in.  When
+# wic uses a subdirectory, this should use the same one too.
+EFIDIR ?= "/"
+
+EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}'"
+
+CFLAGS += " -Wno-error"
+
+do_install () {
+	oe_runmake install DESTDIR="${D}"
+}
+
+CLEANBROKEN = "1"
-- 
2.11.0


