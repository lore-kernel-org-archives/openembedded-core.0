Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BEFAE6B8BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 03:12:41 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w73so1191268pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 19:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GsULuhdVyje9fopNjycaY5nitf2hslYnVefCXVd2zs=;
	b=EBEUVxk/H8t3q/ZHNfOrHVNHZ2OeqPfLqZGJBIycdMyfI22s0j3oK/0K/+Iiu9HBn8
	VVXb4pTw6RVOfasgFnvQjVL9aSwpy9tGrNiPcnZeVdKQdyg9fTufrRUR5imQd4kV5P99
	pdzJ8KVRxHbRCwEhyqEP1mqe8/QTC5QJe2YvCkKcium6dHGK8A2a+GlIL9TEg4mA9c4h
	7tSZCK+m2BYYQ/TmLk3O4p79SYYDKV9ENbO59XcEoe4Mkqd3U2apKNOL7vrVQUdU7MFn
	krREFPi2ltaZ/4qEQBfOxsWC7JA3GOx/S0fXXabba4kl4CaK4gY5mRB6rQtZpUoow0m+
	zufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GsULuhdVyje9fopNjycaY5nitf2hslYnVefCXVd2zs=;
	b=nNvLcFghb9V78LGmM+C5G9XFOwTx7LY/tANSqTVvKpNvMK3ih8O+0/QtKN9Kk+qQMC
	2WgPKH9XU7r16dqASrFXCY5lFxKhDcZxLeUPG0jeVyOUasRWWS0IeG0gCJJqF53ywFpQ
	9GDv/OBcvh4renGhySBn1x94Ujk58avhWbM3lqhxqdm/sTO6Eb6bdPioZ0wFlU8VKUIy
	EzosHtAB9es0pruZNUXwsARgEY4+SoZoCswM7z1abZn+eWuEq2SHooqCwybA1ndU9EtZ
	M5NOqZiTxejsV9POD7LAnQhZ9TeTTNiqRH7UZYMPVGCNFT3QlTCKwXL7jj6h3T49pZGp
	aWaQ==
X-Gm-Message-State: AA+aEWYyzoMs4QwrJn4HUzzxx2o8GPZSSU6R5iY0TKnPvxJmr3WAe9aT
	rjL/6gyKEgkSzvMxZkHA4XJ/wknhby8=
X-Google-Smtp-Source: AFSGD/UgOmjg1BkCfNrg8qe5bEpbbP186BVgSIudJw0yrdZbABpgo2GelB5+HE3Kl97o4glHC9AXNg==
X-Received: by 2002:a63:d949:: with SMTP id e9mr523218pgj.24.1544152361927;
	Thu, 06 Dec 2018 19:12:41 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	128sm2816266pfu.129.2018.12.06.19.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Dec 2018 19:12:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2018 19:12:33 -0800
Message-Id: <20181207031233.5127-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] binutils: Fix build with clang
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
X-List-Received-Date: Fri, 07 Dec 2018 03:12:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.31.inc                |  1 +
 .../binutils/binutils/clang-bfd-fix.patch     | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 0c9d4cef21..c3c15fb416 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch \
      file://0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch \
      file://0021-PLT-information-was-still-being-generated-when-symbo.patch \
+     file://clang-bfd-fix.patch \
      file://CVE-2018-17358.patch \
      file://CVE-2018-17360.patch \
      file://CVE-2018-18309.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch b/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
new file mode 100644
index 0000000000..caf78488df
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
@@ -0,0 +1,32 @@
+Fix compiler error seen with clang, The return value of this
+function is not checked anywhere so in a way its useless but
+still technically correct to return a value here
+
+Fixes
+
+../../bfd/reloc.c:1638:7: error: non-void function '_bfd_clear_contents' should return a value [-Wreturn-type]
+      return;
+      ^
+1 error generated.
+
+It has been fixed in master along with a larger cleanup and fix for relocations
+
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=1dc9e2d63e37839ff1768346b2e3f52e338baba5
+
+Upstream-Status: Backport [Fixes differently]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/bfd/reloc.c
+===================================================================
+--- git.orig/bfd/reloc.c
++++ git/bfd/reloc.c
+@@ -1635,7 +1635,7 @@ _bfd_clear_contents (reloc_howto_type *h
+     default:
+       abort ();
+     case 0:
+-      return;
++      return 0;
+     case 1:
+       x = bfd_get_8 (input_bfd, location);
+       break;
-- 
2.19.2


