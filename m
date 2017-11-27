Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B12F780B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:33 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 62so7598310plc.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E/iBGKO34gSi5fqUx+ZGUzF4bzLLcNYoG9+mO6Izu/w=;
	b=XpGzwklJ8RMYEdgkQlWTqumFmCUKfudN8RRVcwu4estIgkKRDT1ViOx8PKBtZYQJqU
	a9c5k/BERm/drNr8VYReWMuNiBMj1+pus//D5hWDxEGqWQ/PC/vyP7GAsrxHDqVhJFao
	Dg2WRwwXuf1BcTn0YWu1lrNachEYi4S3q32nj6oelhK5PAaOX/mKCU8BJxgKu8ZCfkXe
	JNTPupeo4rd243kDce+v6Mtx9VEo2O88EPBdUfMuVwckEejQiVZFun61kgx6LqDAbhf7
	R7I+IDbqBui5SGOsqC2DagBrshsqUamIyxSLW8gjt1WmLXen5JKlAaQ+WeqqNewdqvy2
	ZlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E/iBGKO34gSi5fqUx+ZGUzF4bzLLcNYoG9+mO6Izu/w=;
	b=XmIf2y6kpj5L6SESOKecgdrHFks/lswZ7A49NNLp0F7uCqMpBfFXBL21yso8j0dA5D
	FpwrtuzQRA+OnV0bs1dr4eJxr0Q4DI5dpC1Y0Uyhwby6l7UPZJNobw/yr6PoexPTycS2
	nd9qqTILwAwFvQ3hwwlmUCG13D9NdVyCcVEqpgeJW44hLoFiEwLlwNjPPj+4C/JowVs3
	Mb0k5PZwFFF2MRmmIwmi/J2H6BcJqNKkCoNSOkhm9tW7Ov5vzrD92G0Zog7BZEmMCMUk
	D6Nr2qiU8yuMFNNTrOjLzJAYnwWzm/5eZUbxWvsP6Pe935CTlia2Z3vcxvcLdJNV+5NS
	fxNQ==
X-Gm-Message-State: AJaThX4vZ8AA/uzjlabHrnOXz0FawKYRbP8fdwx5xAN5VJowlVwNBo7p
	9lRwtFwq8SY8A2mcAw0Pulc=
X-Google-Smtp-Source: AGs4zMY0o5kqdlZPpyo1hSheMsa1aigB+XiAyAo5IBXserHpmWTKGHkWaUL5EzC6U6yaPygsz1yeLg==
X-Received: by 10.84.234.9 with SMTP id m9mr37638335plk.3.1511750135174;
	Sun, 26 Nov 2017 18:35:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:09 -0800
Message-Id: <1511750112-2263-23-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 23/26] binutls: Security fix for CVE-2017-9755
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:33 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9755.patch          | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9755.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index c6ef647..b4299c8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
      file://CVE-2017-9751.patch \
      file://CVE-2017-9752.patch \
      file://CVE-2017-9753.patch \
+     file://CVE-2017-9755.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9755.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9755.patch
new file mode 100644
index 0000000..15dc909
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9755.patch
@@ -0,0 +1,63 @@
+From 0d96e4df4812c3bad77c229dfef47a9bc115ac12 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 15 Jun 2017 06:40:17 -0700
+Subject: [PATCH] i386-dis: Check valid bnd register
+
+Since there are only 4 bnd registers, return "(bad)" for register
+number > 3.
+
+	PR binutils/21594
+	* i386-dis.c (OP_E_register): Check valid bnd register.
+	(OP_G): Likewise.
+
+Upstream-Status: Backport 
+CVE: CVE-2017-9755
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ opcodes/ChangeLog  |  6 ++++++
+ opcodes/i386-dis.c | 10 ++++++++++
+ 2 files changed, 16 insertions(+)
+
+Index: git/opcodes/ChangeLog
+===================================================================
+--- git.orig/opcodes/ChangeLog
++++ git/opcodes/ChangeLog
+@@ -1,3 +1,9 @@
++2017-06-15  H.J. Lu  <hongjiu.lu@intel.com>
++
++	PR binutils/21594
++	* i386-dis.c (OP_E_register): Check valid bnd register.
++	(OP_G): Likewise.
++
+ 2017-06-15  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR binutils/21588
+Index: git/opcodes/i386-dis.c
+===================================================================
+--- git.orig/opcodes/i386-dis.c
++++ git/opcodes/i386-dis.c
+@@ -14939,6 +14939,11 @@ OP_E_register (int bytemode, int sizefla
+       names = address_mode == mode_64bit ? names64 : names32;
+       break;
+     case bnd_mode:
++      if (reg > 0x3)
++	{
++	  oappend ("(bad)");
++	  return;
++	}
+       names = names_bnd;
+       break;
+     case indir_v_mode:
+@@ -15483,6 +15488,11 @@ OP_G (int bytemode, int sizeflag)
+       oappend (names64[modrm.reg + add]);
+       break;
+     case bnd_mode:
++      if (modrm.reg > 0x3)
++	{
++	  oappend ("(bad)");
++	  return;
++	}
+       oappend (names_bnd[modrm.reg]);
+       break;
+     case v_mode:
-- 
2.7.4


