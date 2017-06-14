Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49443783C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v14so478409pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yLnpr4naLfkOrr2NhFaPo/1TZNwJXdLJYul3LmoLNSw=;
	b=PVoJm8gbF+gfjlzQdLbF/YjhRMLxW8GOLFiXo+i1cAmwUUXcYB3gUcBhCY96653Yrf
	fQ9jkA1H3zR8yEHg3937owa4xsML/bM58ISF/YnZlGdjaJif1YM061kmwNdq0jkgjK6M
	/jSZgo3NrwUVY8dgam/tk91r0AaW7qNwXXThzzIX4Osd0JS9PfGsmCTriAi+tDMQLLCf
	qeRflbaAeuxfkj3mQFvdMbVwz8/yhXzyxKsuxqHMofdL81mlBHh/voXF29V+EOP4XWBH
	67FRaLmGO1NGNQsccA/V2krZUd5EhSHmHe452DVW/x8fcINpCedlkAl64IiQf58eXSYW
	iJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yLnpr4naLfkOrr2NhFaPo/1TZNwJXdLJYul3LmoLNSw=;
	b=V8inQ+Qf1cL3SbdtO8ieR8SjHGZEsT+kFkqqPxlDj/AnnZRC73zRvbne92wt3hdHIG
	RJyqV3KY7l+sfOmphCgUIn4gGk4qJ8JraAXQYrMro8170skJ5F1QtHoUE4Y4lSnMcQat
	XL1R7YSd5MTefa9b2fafQthELkOadf5yfTflkQjzjrq0dC0WLALvp2+2R2DOpYEDQD9C
	u/mzZK8HbjGzdz4wJxJVHWT9hNq9/UwLqHmTBtpQpvnf4ilJjA/u3QoKxuLpL7Z9IF6l
	8rVf9RU4ocs/PdKxc3CHZhMPMD2AkXj8QFxlDrvvqYZdSVZ2B3jzOGijK7tymWIUaI6U
	skuw==
X-Gm-Message-State: AKS2vOzBLiUkMH+l2yMs8knTsHAlr5CG6WDdPq0Qw+BF+++7GQQO5Vjp
	ReIVppcuFgTRR+qf
X-Received: by 10.98.14.131 with SMTP id 3mr581758pfo.23.1497453830442;
	Wed, 14 Jun 2017 08:23:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:27 -0700
Message-Id: <2c3056843b44a67283ed9e031e464bdada4a0080.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] gcc7: Enable static PIE
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
 .../gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch   | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 77d5ac11eb..9d60620ac2 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -79,6 +79,7 @@ SRC_URI = "\
            file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
+           file://0049-gcc-Enable-static-PIE.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch
new file mode 100644
index 0000000000..879e360cf3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0049-gcc-Enable-static-PIE.patch
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
2.13.1


