Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE0AE60E5D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 02:42:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g1so753309wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 18:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dudQ/Qpl0rAq4Gr4uvQ4qGZ+8MGMURNcdcOc2IAgr+Y=;
	b=BC6joIE114rtux45XlpVQFOcqismDcURYgY9Ee8tzmvJgt/F0JAmwM+xFN1C9qjM9h
	iQPOfu1255i/suSO50WNTj0ACXtnUm904Yw8JBFGSX//A+FWwXdo1WUdR+Wl8tot1GuZ
	tIUc7lF6Mi8bsqblC60e8dQqcFhFuHLeyWe911I+FG3QC6qhTKZZ3YDqrosMcd43wGoV
	1W8ojl7UUeZRzuBj/FUMpoI40P+CsAVeSYUEHUsKnOQQWtCvPtYNahJBtObtSrDaMd6X
	mzjnO0XMwFGM14qBqpz1+yRmn2XuJh5QvOpyxRyeZ5LYIdwwpGJyc5G6fmmvIn0iPcly
	QvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dudQ/Qpl0rAq4Gr4uvQ4qGZ+8MGMURNcdcOc2IAgr+Y=;
	b=CdwWxU3h6S7XpZdD0DX7I7SzJcYqwB84Q3dHYarCbK6FyfPtOv24CD/FPVfF2o4Htv
	XNk9kHOONZzhuAEMGo/bq9zMvaBmXV/QgoMF7bOCl5EuN/GOw0862AEYrQx9us7KZxQS
	XI8Rjs9R5MQH+NXMGatPAZBOxFVUWsO1Fh6OHhEu4+w0YrfsDLaNW3xnAlUJqQtMBFUI
	w0ZKT3kRdmSniPKXuP/6t4g56mFQ5cetugXsmSpiJiqL5U8qXqiBxdO5jUjtrAjsVmKE
	mte1CiDoITKPuxQjMkHq7TcLIYgm/ad7UHCi/oYsClsZkCJXQpoNuj0P+h3BZFbsGi6K
	R9PA==
X-Gm-Message-State: APjAAAV/EuSzbFnSdk1w9fh9J8MWg3BLp8YPP2vyNnlqqv6Vy9vV0XqZ
	MJuk6rw4ZTD6k/SMeDr22SQab4vY
X-Google-Smtp-Source: APXvYqwA1k7Dx2O9bjqWwNa4d4JNxUhG/BDP4yh0o73MQQeAjN34zLjtj35hsZISXqzMyCeHI5AkRg==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr2498391wme.21.1580870568080; 
	Tue, 04 Feb 2020 18:42:48 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	q124sm7712866wme.2.2020.02.04.18.42.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 18:42:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 03:42:40 +0100
Message-Id: <20200205024241.27828-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205024241.27828-1-Martin.Jansa@gmail.com>
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] kern-tools-native: pass LD variable from shell environment to the make call
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
X-List-Received-Date: Wed, 05 Feb 2020 02:42:48 -0000
Content-Transfer-Encoding: 8bit

* since 5.4 kernel Kconfig will fail immediately when it detects
  that LD points to gold linker:

  scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not supported

* in OE we already pass bfd linker in KERNEL_LD variable to merge_config.sh
  but we need to pass it also into the make call here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kern-tools/kern-tools-native_git.bb       |  2 ++
 ...pass-LD-variable-from-shell-environm.patch | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 57ec1abc6d..8053483355 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -22,3 +22,5 @@ do_install() {
 	cd ${S}/git
 	make DESTDIR=${D}${bindir} install
 }
+
+SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch;patchdir=git"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch b/meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch
new file mode 100644
index 0000000000..d7d3d9dd2b
--- /dev/null
+++ b/meta/recipes-kernel/kern-tools/kern-tools/0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch
@@ -0,0 +1,32 @@
+From 091dbfede29c128a1a467d7f3c0aedc33ba3d2cb Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 5 Feb 2020 03:26:57 +0100
+Subject: [PATCH] merge_config.sh: pass LD variable from shell environment to
+ make
+
+* since 5.4 kernel Kconfig will fail immediately when it detects
+  that LD points to gold linker:
+
+  scripts/Kconfig.include:39:  gold linker 'i686-oe-linux-ld' not supported
+
+* in OE we already pass bfd linker in KERNEL_LD variable to merge_config.sh
+  but we need to pass it also into the make call here
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/merge_config.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/merge_config.sh b/tools/merge_config.sh
+index 296e759..11f3085 100755
+--- a/tools/merge_config.sh
++++ b/tools/merge_config.sh
+@@ -153,7 +153,7 @@ fi
+ # Use the merged file as the starting point for:
+ # alldefconfig: Fills in any missing symbols with Kconfig default
+ # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
+-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
++make LD=$LD KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+ 
+ 
+ # Check all specified config values took (might have missed-dependency issues)
-- 
2.20.1


