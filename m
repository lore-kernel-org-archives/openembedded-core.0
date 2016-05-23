Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4C9606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 21:19:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f75so218447wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WFfx6zY12bvqhpvBQ1nLBDCmpp/WFSenNj6unMDvibA=;
	b=YSIgBMTJnuwRRCT1cqlMskXKufBBjRBSlmEaiBtO7Atmxz57xNZmn2CNgjMpIkbuIk
	Y50pqU8Jc3wNX0kTEU1U6/kfO4GfQ2ljNv+qVS1mXWa3HDiCSMDsfJLEDVRInuKhBXHh
	Xwmzms3SIMOBAefzp1y1MTsUHbzKb2POI0fS8V42UmT9OpZ6wZry4dD4XMjkZ2BIMA14
	/iJuQ6UJAbJnC4wcZfoW2jGPfLIv/ERy/Hqjn+Bk9JCLDEwZ+2/ADHohCJmBKZhqBow4
	mtHtNTOMbk9DFlkf2NseaBXLVr8KhfMIjklQzjfYuOUIUpVF45c93oq7SM8yZBIUqZfF
	4MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WFfx6zY12bvqhpvBQ1nLBDCmpp/WFSenNj6unMDvibA=;
	b=FFMVz+EbVir9WpXo0661yHbDzo5Se5LnM1/qj53l5DxFaAFMyt7vE/Vkz7lWltGlug
	lODroPgGtY8PCIi+nsaZhCwdQJv/3SGukCSaWj+pk9IgHtnq25zslgl0j/ZsOfuoXkag
	DmWFUbGLdIq5DiIoDaxNPqUTaX9mfi2DiZ7RxMyG5XjEHsEaBpiu1avwYTiRJPcpbuz/
	9TSRvxPfy1Agpo4ZA1e3ANf5mdf5nhpjr0uUV7a9nv1vts5bzC5oeMa+ENc9jnNZXr2S
	f7LNkrAAibqQMybsX/btxKBo0wx8Oz3VGs9FMTPBgkMOtW7jJ67dHjG1OWRqZ0dt3z/N
	W15g==
X-Gm-Message-State: ALyK8tIW7F/z0FbDnZaKJK3ETwnESt/VAUfAemjdawv+kwfvGkcgjxh9U2Qe7Lf7DpuDYQ==
X-Received: by 10.194.205.134 with SMTP id lg6mr729672wjc.153.1464038363309;
	Mon, 23 May 2016 14:19:23 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f188sm15679430wma.2.2016.05.23.14.19.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 14:19:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 14:19:28 -0700
Message-Id: <1464038368-27249-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] mkelfimage: fix compile issues
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
X-List-Received-Date: Mon, 23 May 2016 21:19:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

This fixes a couple issues introduced by the previous patch. There were
a couple spots where HOST_CFLAGS needed changing to CFLAGS. This fixes builds
with security_flags.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch | 4 ++--
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb              | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
index 2ae9fb5..a162eb7 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
@@ -67,7 +67,7 @@ index 51531d6..7e8aa3c 100644
  $(LI386_OBJ)/mkelf-linux-i386.o: $(LI386_DIR)/mkelf-linux-i386.c $(LI386_DIR)/convert.bin.c $(LI386_DEP)
  	$(MKDIR) -p $(@D)
 -	$(HOST_CC) $(HOST_CFLAGS) -c -g $< -o $@
-+	$(CC) $(HOST_CFLAGS) -c -g $< -o $@
++	$(CC) $(CFLAGS) -c -g $< -o $@
  
  
  ifdef I386_CC
@@ -80,7 +80,7 @@ index 38f5d8c..5df8870 100644
  $(LIA64_OBJ)/mkelf-linux-ia64.o: $(LIA64_DIR)/mkelf-linux-ia64.c $(LIA64_DIR)/convert.bin.c $(LIA64_DEP)
  	$(MKDIR) -p $(@D)
 -	$(HOST_CC) $(HOST_CFLAGS) -c -g $< -o $@
-+	$(CC) $(HOST_CFLAGS) -c -g $< -o $@
++	$(CC) $(CFLAGS) -c -g $< -o $@
  
  ifdef IA64_CC
  
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index d7a4429..2bcc8d7 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -24,8 +24,11 @@ CLEANBROKEN = "1"
 S = "${WORKDIR}/git/util/mkelfImage"
 
 CFLAGS += "-fno-stack-protector"
-CACHED_CONFIGUREVARS += "HOST_CC='${BUILD_CC}'"
-EXTRA_OEMAKE += "HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
+CACHED_CONFIGUREVARS += "\
+    HOST_CC='${BUILD_CC}' \
+    HOST_CFLAGS='${BUILD_CFLAGS}' \
+    HOST_CPPFLAGS='${BUILD_CPPFLAGS}' \
+"
 
 inherit autotools-brokensep
 
-- 
2.8.0


