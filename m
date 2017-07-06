Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEC071C7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:39 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id u62so1905175pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MyXxFFTqsgC4/nC0ZOJZkbcdQpfgko0LLk/6HidsIxo=;
	b=o22kW5mcma46KaKVj73Ab7zxkBBmvjxo4sq1GhwMu+lsqf2K4GMf1A6nQkx3Zh7nw+
	qZUsTMehpBTpAafjvfKRu0dCqQmI3E4iVPQ2hrYLRNa73AOcEnWy/daWoyHO4DXAEjsk
	M4hnm4KCowpIUSsiNZeu2uUo86smrgZyXD9OquGZzG05od8CG+GPwlkAHai4SNJsAhTi
	nOU6R8fyTWbSCEL65ZdIP9R0R1ny7CjpKAwWIpT0YAIT+DyZfBK7H1KEH3C/dGhMH3pU
	TdVgzMzoWw8Kg4PCQYoJYOoQogT4QuAbqY3h3pLMWM785kCM+Po//Q46ZmREqGQV0iT6
	aubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MyXxFFTqsgC4/nC0ZOJZkbcdQpfgko0LLk/6HidsIxo=;
	b=kngpKkR9siiAK1KeCp/5x22ukVCJDuKiM6+BOAlBSrllToHnyP6WqLbC86XanBk+iv
	c5DKaNO+t+jXgI0k3wi3famTjD7x++VHyJcp62UxsHAzG2yNI3OZ2IdS9XEC8jFMDMFn
	LvUNvk1U+5AwBkbTrOSsg/fZRIA018/KkGMxwOkGzTsLSc16qXHq3CNabPpPI1N5Hucw
	93XnshTmz3kqrCKkl2vhE62DBY3xWW0cZbz/kq4gXRArhwPymcVFPDMZy/bTNQ2ySVkS
	wufF+yim4UKpuRFHCPVflzaGrjlWap9p5LfOCES06uWsqjqWdY7LGTyH5mdjfeyGDK4u
	R4LA==
X-Gm-Message-State: AIVw112tIh14danUnhN9LgyhbAgRUSwyCWsQmKVaNGz75olZVoPosOGm
	AoA7/HjEhGjCxAtK
X-Received: by 10.99.56.21 with SMTP id f21mr26099166pga.235.1499351620733;
	Thu, 06 Jul 2017 07:33:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:05 -0700
Message-Id: <1931fa539db3849ede250271e18b20548a9a6616.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 04/22] gcc7: Enable static PIE
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:40 -0000

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


