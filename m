Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 46AF3775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:47 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id c73so80194572pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MyXxFFTqsgC4/nC0ZOJZkbcdQpfgko0LLk/6HidsIxo=;
	b=K5ajn0Y6nn+S1AHWlSasUmbQZKapwOdi9tN8A5k/YVd2zUpTmEBjMIaVORjpu91kqC
	SQdTWnGos35VqK4Uav++p+qBwt6hvzno+Pl8zMQExxfLeCQ4Y0ReB+3gOln3mCwYwxqH
	177kD9zKIWLIcO94OMqEJ6NCUJEmZ8V96aE3ux5LfeRLj9bDade0txug/YQK8FG/SVif
	3wHs0DN3v+f8LjwAIYDsx4PvRgaJmH/r8x6LdeybGMuwDd3s3xpoCWmNoN7tLN5KZHIj
	PN47cuvjPGm60uSWfZeofjPU3NDXTyHZcUqw1NCK4aE1X88D5e6Y90QdJ0FOX/7el6H9
	Ypew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MyXxFFTqsgC4/nC0ZOJZkbcdQpfgko0LLk/6HidsIxo=;
	b=Ck9bM7ARG72zvWptVALVwtQZF2VrNURmZiP1h6cgrMsKSdXGzXJxZsJGAN7q/u2ncg
	ebbj0vJuFf68KsQoMV5X7weysUeQ3rL/hc3CJN8TlULgjI8wfDvFDWGlXbbS8bWryahY
	2w43meesb7e2Ab4e1XAB+lRaEg4OubZE6PQiUrBCLkl/d1ku52AZ4wmh3VDKTsVFZDBv
	CWN4KOolurP5TqZAAK/kTdignl9HGoPBwI0yNgMBo4coVSzBrBbgayAkL6T/Nu4cBbdW
	9oHybFcW2drVXyiSixTB/i4eCVvpnIJyu+Wmp0Lf3E6S39Dh7nXQ6oDKtSAFZ5ej1yfx
	1sww==
X-Gm-Message-State: AIVw110g/d9A6LTq6kQ6CBRPimvHu9oRRBkBtiscZxEWuy+J6yZfcx3B
	sVUt3sJyn6iAd5wA
X-Received: by 10.84.132.40 with SMTP id 37mr996780ple.141.1498919029028;
	Sat, 01 Jul 2017 07:23:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:10 -0700
Message-Id: <b2a086b7ab2bdd94f64ec8ddf7b29d1321135526.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 07/19] gcc7: Enable static PIE
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
 .../gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch   | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 4098d6a2c1..b52d51fba6 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
+           file://0048-gcc-Enable-static-PIE.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
new file mode 100644
index 0000000000..879e360cf3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
@@ -0,0 +1,37 @@
+From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 13 Jun 2017 12:12:52 -0700
+Subject: [PATCH 49/49] gcc: Enable static PIE
+
+Static PIE support in GCC
+see
+https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/gnu-user.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
+index 2787a3d16be..ee7b781319e 100644
+--- a/gcc/config/gnu-user.h
++++ b/gcc/config/gnu-user.h
+@@ -51,10 +51,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #if defined HAVE_LD_PIE
+ #define GNU_USER_TARGET_STARTFILE_SPEC \
+   "%{!shared: %{pg|p|profile:gcrt1.o%s;: \
+-    %{" PIE_SPEC ":Scrt1.o%s} %{" NO_PIE_SPEC ":crt1.o%s}}} \
+-   crti.o%s %{static:crtbeginT.o%s;: %{shared:crtbeginS.o%s} \
++    %{" PIE_SPEC ":%{static:rcrt1.o%s;:Scrt1.o%s}} %{" NO_PIE_SPEC ":crt1.o%s}}} \
++   crti.o%s %{shared:crtbeginS.o%s;: \
+ 	      %{" PIE_SPEC ":crtbeginS.o%s} \
+-	      %{" NO_PIE_SPEC ":crtbegin.o%s}} \
++	      %{" NO_PIE_SPEC ":%{static:crtbeginT.o%s;:crtbegin.o%s}}} \
+    %{fvtable-verify=none:%s; \
+      fvtable-verify=preinit:vtv_start_preinit.o%s; \
+      fvtable-verify=std:vtv_start.o%s} \
+-- 
+2.13.1
+
-- 
2.13.2


