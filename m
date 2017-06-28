Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6FC977FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:41 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id q86so35669583pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MyXxFFTqsgC4/nC0ZOJZkbcdQpfgko0LLk/6HidsIxo=;
	b=PHA9XKGs7zsk1wjanAd5x1FOj1/9vio/wQOr1NjLhwTgrnEnqA6B6TNmUIFl1PJJmn
	GnmWNk8vbiQLNr7QKXgnVJ8gQ3lyBSXYk4Td5gcQHv9CBK/9vu+vvqjZ690b7mbaTi/7
	2/3TvPAzQMPb+sivgJL/8ocwHMyjHMAG2F5EMFu8lkLBzjgJvOMuUu+RmnV3jvRZNxo5
	LZBU1iqaMuyIURf6rCxsyJiMFiq3pGXm4L8p981A9wiNSsYy9hOZmhH8HU5WIrJ+tEiD
	K4yF2lRvYWdxiK8KbXBDrFAPc/q5ZnQLVIKT3dDE/vUvFO3JQAgaqx02QhotUhF+RD5B
	9D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MyXxFFTqsgC4/nC0ZOJZkbcdQpfgko0LLk/6HidsIxo=;
	b=tm4684lLOk2cfQVXZrvAr3h6cmCMIGkxlg471l2zn/9SnJ02bAbQNjiX3NYI6ROkYv
	j6QATCTDUP/ivcZ7uULfRAUsbUsUh3YnrGjZoH8ohhz9/loBsG8S5OlDxgcGnHkuFY6+
	Ylu+Ciueb2q+Y3f98tcb8FvKnNDBTdvybL69hrMNWUrgpIRO7Be1nNWs9+BXfbFhFLUq
	vYCJD9HEXDQVdFXbvBwcZrIWIXxNTDVyu10nX1u1oMUNUfSmn90L+y9hf8dfiDJKrlIl
	9MSLn3koEnsWsVIV/Kb8XwM1rdf7lMfX/Y9fEuAEvz70Ep7xTMadEy5NC8iavaTBgHlW
	OIyQ==
X-Gm-Message-State: AKS2vOy3lYIOvTF9/y2IsH/ek9MRanDQGgnQePf0CitgCnJ3My8jSGTa
	Fa8xdtkNuH7hIEe3
X-Received: by 10.99.2.146 with SMTP id 140mr10991129pgc.56.1498665882389;
	Wed, 28 Jun 2017 09:04:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:17 -0700
Message-Id: <0eaf46b1f0732b8a2ddd6355c469a7474e5442b9.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] gcc7: Enable static PIE
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:41 -0000

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


