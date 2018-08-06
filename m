Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9EACE753E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:27 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 13-v6so22563759ois.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7EMaVi7sVw3x/Hrazuvp6icoLKoATCOBo5fwcOt9+o8=;
	b=d/RmTT5AHnecaFxLcox86zaOxWut+8PbCSzALThQxUcjDLvfxnI9lYntCdmRn6CKD2
	xLRDK1/n/qGDHgw4vVFEOqnOql1BngP1cA16DoIKkors+g6FEmHzlF2MrUUYMeEvicbl
	bjKNq96mAEh3LPEB4taq2sMqQ9DmHfG3ZmioRvuq9wNLhu2evHo0wvL+l69zAx3qCYfk
	KXvkLa639KVisOA+tktGlxl/MFDgyYlKkIshBw85//1vrGqZHEwnFUd9E2e2U/InmIOr
	uCkUHs/sCNYEFZXGdD2iN4RYpAWiHxczklECZee/iavF7hZ6CRoLRcDS1JzCrmtPUkzX
	R5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7EMaVi7sVw3x/Hrazuvp6icoLKoATCOBo5fwcOt9+o8=;
	b=rSahJwK3hpg6M7Rc0lw0EkC0EG8b6ZyQmzeZ90cQ5gk76Y0GVBeOs+IoH6v9INxwSj
	4nl4/Mddla9/jEwbEnskzg23f32BOOJ4GXYo0lPAqeyMpidNEBm8b6gBSlDw+ddNJA3G
	9FITH/J8xiV2bBee7182rqlX9yXQDOdX2IWkvPpVn2+Z213cHy8G3+MYxjx4zJCzFV3Y
	AQU4dqN/NNJUMkcCCcM5mEaeFJ1XKC3/QhaebKYaC/nnbugbn2bUxwJYl2cdTo93pCIw
	IpzhHRyKbafsspKjTAILoYRqHMOn/C6hMFbc2ZTSRM1XySU4YjeFY8W42zqggYJ8J4dn
	ieTA==
X-Gm-Message-State: AOUpUlF9JeDJhifUcOpVyExTmxngKPYU5hOEI36gWbtm60M4YE3gxsjp
	Z+qUwJFRK6S76NSq2iWsODozsj6U
X-Google-Smtp-Source: AAOMgpfNlkosZGqLmKKEqVYbzQohYt6ZTK+bECtOm0RPPBjalx5ap1SMd5YEtisMYV73XC/Gs6oQxQ==
X-Received: by 2002:aca:3507:: with SMTP id
	c7-v6mr15733682oia.46.1533565768794; 
	Mon, 06 Aug 2018 07:29:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:15 -0700
Message-Id: <1533565758-2467-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 09/12] binutls: Security fix CVE-2018-10373
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:27 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-10373.patch         | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 8995715..7b1705e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -43,6 +43,7 @@ SRC_URI = "\
      file://CVE-2018-7208.patch \
      file://CVE-2018-7569.patch \
      file://CVE-2018-7568.patch \
+     file://CVE-2018-10373.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch
new file mode 100644
index 0000000..d547cf1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch
@@ -0,0 +1,45 @@
+From 6327533b1fd29fa86f6bf34e61c332c010e3c689 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 17 Apr 2018 14:30:07 +0100
+Subject: [PATCH] Add a check for a NULL table pointer before attempting to
+ compute a DWARF filename.
+
+	PR 23065
+	* dwarf2.c (concat_filename): Check for a NULL table pointer.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-10373
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/dwarf2.c  | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -1565,7 +1565,7 @@ concat_filename (struct line_info_table
+ {
+   char *filename;
+ 
+-  if (file - 1 >= table->num_files)
++  if (table == NULL || file - 1 >= table->num_files)
+     {
+       /* FILE == 0 means unknown.  */
+       if (file)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2018-04-17  Nick Clifton  <nickc@redhat.com>
++
++       PR 23065
++       * dwarf2.c (concat_filename): Check for a NULL table pointer.
++
+ 2018-01-29  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22741
-- 
2.7.4


