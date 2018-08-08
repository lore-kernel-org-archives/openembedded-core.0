Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9C91C78E6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:31 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id y4-v6so1256016pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZYafQsHWUv7DYhTSfYZjZJM4lspWnWlwIlVf0PWOCOM=;
	b=txGI9sgO0+iDHHVVoNAWGV5e6LVjDULP7ytm8uBr68d1GPsWWsGJMwrF/t74ASyxcv
	ta1TBmUwmONHx1YFsA+0qEINPIsQ8w9tnO/GfUA3pOAg/Pcd/K2hVQMG4JP5BYi2p8Bz
	GehfzS13ZQSFzMa8xHXvtCd5pHj+7isM2TWK93vWT2kJ/llDzriYG3/Aduu6+J7AMTmX
	LihsZUfdXaSlbnxi9RRpooJQrooGvhAGx2UHzBiwNBuJjPbXEoikH7Y5A7HUEBBXrRPx
	e/B/RzN8j3bBb5+zwokxus3KtgEc0sR7N85fO8rmEKgL75c9r52IWNE0wJJ8Mb2Zewl7
	zXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZYafQsHWUv7DYhTSfYZjZJM4lspWnWlwIlVf0PWOCOM=;
	b=P4PeG2BCC4lI7I4rtgpuLsjRLy83JlupAHSff9iOED+G0DuU+RUvIu9PjSj6viQvzw
	lTeEARzILranxmYsFVX2yCcYQt3kcx5Kfv7VJRoBJQXjQXx60UQrXRlbbxULrle95nd3
	v7BboaQN6pNcNUyRzM4ggTUEDJNCK7f4ye8eylkhx4aTO+GU0vuhIkN2s3NHgyeHvVwe
	yl+tF+zkUCYlH0M/UByfQfoQH9/4EUa69s4DDF6oA4wO6sWkVG4C6EhEwUKZTujwyY3+
	xx+knpQ3ZTfRPP+2zpGaZaiktoB/oOhW90m+YYtrP5wKOdCkVK2V2jxeZXkwYXhTJszx
	PZwQ==
X-Gm-Message-State: AOUpUlEIY68DXpzp6Hj9e+pJ/TMXs+UVPhtIuaoU16fSoBw/HMYRpVzH
	FGqmZLugLRCO9W55DMLAuRk=
X-Google-Smtp-Source: AA+uWPyNANQloHmzmSgSGVsLH8CSZBANf9PM27MR0NZYyOCL15rRkIi+fUutUnIJmBMgZGo4F19siA==
X-Received: by 2002:a62:e0d5:: with SMTP id
	d82-v6mr3495547pfm.59.1533742532838; 
	Wed, 08 Aug 2018 08:35:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:04 -0700
Message-Id: <1533742522-24357-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 09/27] binutls: Security fix for CVE-2017-15021
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:32 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-15021.patch         | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15021.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 45e4393..6f7d655 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -44,6 +44,7 @@ SRC_URI = "\
      file://CVE-2017-14938.patch \
      file://CVE-2017-14939.patch \
      file://CVE-2017-14940.patch \
+     file://CVE-2017-15021.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15021.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15021.patch
new file mode 100644
index 0000000..caca7b1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15021.patch
@@ -0,0 +1,48 @@
+From 52b36c51e5bf6d7600fdc6ba115b170b0e78e31d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 21:36:18 +0930
+Subject: [PATCH] PR22197, buffer overflow in bfd_get_debug_link_info_1
+
+	PR 22197
+	* opncls.c (bfd_get_debug_link_info_1): Properly check that crc is
+	within section bounds.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15021
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/opncls.c  | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/opncls.c
+===================================================================
+--- git.orig/bfd/opncls.c
++++ git/bfd/opncls.c
+@@ -1200,7 +1200,7 @@ bfd_get_debug_link_info_1 (bfd *abfd, vo
+   /* PR 17597: avoid reading off the end of the buffer.  */
+   crc_offset = strnlen (name, bfd_get_section_size (sect)) + 1;
+   crc_offset = (crc_offset + 3) & ~3;
+-  if (crc_offset >= bfd_get_section_size (sect))
++  if (crc_offset + 4 > bfd_get_section_size (sect))
+     return NULL;
+ 
+   *crc32 = bfd_get_32 (abfd, contents + crc_offset);
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,5 +1,11 @@
+ 2017-09-24  Alan Modra  <amodra@gmail.com>
+  
++       PR 22197
++       * opncls.c (bfd_get_debug_link_info_1): Properly check that crc is
++       within section bounds.
++
++2017-09-24  Alan Modra  <amodra@gmail.com>
++ 
+        PR 22167
+        * dwarf2.c (scan_unit_for_symbols): Check u.blk->data is non-NULL.
+ 
-- 
2.7.4


