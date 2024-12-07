Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B647CE7717B
	for <webhook@archiver.kernel.org>; Sat,  7 Dec 2024 08:27:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.56893.1733560038641688628
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Dec 2024 00:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUf/kgPp;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa549d9dffdso406273366b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Dec 2024 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733560037; x=1734164837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1e6NZX6Y79kHg2BuCoR6c+/iLrZ5E4Y8fu2KUl47Jpk=;
        b=XUf/kgPp0fN8wbryJLqdJfHzprvxsABZr1TEr9qri1oD3m6gs/NNaV6wXjM5DzKsAo
         4IQbPgvlqLpq6Yt6pgNZ32C1e42kc9fs7az6zhzKVvCreF2F5BvEcPOw/GybZ6e2J2qv
         +D/gov/ZutAtNneoP68WCOOfiHaS4mlvxjnZHlzr+9vVUKw+enrzGFiwrksmvY5zFfnL
         GEq0sTNjHBCg+Xg7i3JhVLTa1YemSuUIQoSk2VCuEeGomJlUr593SoIh6Rx55aKFY08z
         PeidlTb2meHi/VAJy/QZ4ZTKW1BVgVVrOG9LkyVrTjqAfKg0EqDoTh9mwuS/63+unRBv
         JWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733560037; x=1734164837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1e6NZX6Y79kHg2BuCoR6c+/iLrZ5E4Y8fu2KUl47Jpk=;
        b=SZMx9lvWdxGcUU6gAVnuMGrOGVckGVcFe9CaQiC82BowocKdUetNkbWefOpDeKu+sY
         d8jJ9pn/acAKWyMLuQ6YGW4W5jFYJ0lv5a7fIxwSUMRHp1k+hjapsbmc/IModXEbbCwB
         SeAHe9xfZ+hlh3AKOr5OAEV1oEPuc1nf+qZCbbRTK6jUeK4jFe/Dx5nkHeR5OB9I54N0
         JSsSIs6vvWikxoJLulcRZ4F/2ZG1+qdBEQWdZsI08zbIKU5gInC1qjAUnu4YV+4HvRv6
         13pu5Do98vBXllXKI3y55SXfo6/ExPedKMuNWOAFryH6exSUlbACXnwRe8B0w912IIW9
         EpeQ==
X-Gm-Message-State: AOJu0YybRIn7k/jYs/t+DlCYvG7tS0TLUK41UakNyP9lQ9eRjZZ9hUSa
	aBFRPDghu0GP7ZQEAsrQ1LVN96NeziXDxyo4BURATPKAKdVtmzJAXFtxxg==
X-Gm-Gg: ASbGnctpNGKF5gP1YEis+QxnxFmNK7ZWpgSE5c3J00c7nhardOucMqa5XrSMKT8g4PS
	g/8TV/P0QV3gidEYIEAbZy+OK/BWVL0s3G+2oVZ9295OWYQCif2XfX38O6BmspIRAMXP90tA4A7
	vnt1VZGMPXZipvxz2tnyc7dHvyr5bl5WxB+oJSkl23E9/AzwP/h4NAHifQtPb+SnfSOpGLHQ795
	GVFCfafqJeAqCde9MH0kHaO+LGAo0eCu29w1fFtblWAY0mndvS489QKc/EuPNfq1gqbm8pb2s4m
	C2dGSE0=
X-Google-Smtp-Source: AGHT+IFFgUwKsd0cpI0o58g3bClBhln3PubThEQaWLULVXKEHmCvkVQ/aAAulePwxzpeuiBnAgkloA==
X-Received: by 2002:a17:907:760c:b0:aa6:4114:8d89 with SMTP id a640c23a62f3a-aa641149194mr325513366b.53.1733560036715;
        Sat, 07 Dec 2024 00:27:16 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6590f5457sm37240966b.195.2024.12.07.00.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:27:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] elfutils: backport a fix for libeu objects missing in libelf.a
Date: Sat,  7 Dec 2024 09:27:08 +0100
Message-ID: <20241207082708.1528966-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Dec 2024 08:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208444

* since the 0.192 upgrade from:
  https://git.openembedded.org/openembedded-core/commit/?id=1d6ac3c811798732e6addc798656bbe104661d77
  some recipes are failing to build, backport a fix

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 ...u-objects-to-libelf.a-static-archive.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index f455178e16..7bf9865555 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
+           file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
new file mode 100644
index 0000000000..1587087896
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
@@ -0,0 +1,35 @@
+From f5d6e088f84dd05278c4698a21cbf1ff4569978d Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Tue, 22 Oct 2024 15:03:42 +0200
+Subject: [PATCH] libelf: Add libeu objects to libelf.a static archive
+
+libelf might use some symbols from libeu.a, specifically the eu-search
+wrappers. But we don't ship libeu.a separately. So include the libeu
+objects in the libelf.a archive to facilitate static linking.
+
+	* libelf/Makefile.am (libeu_objects): New variable.
+	(libelf_a_LIBADD): New, add libeu_objects.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32293
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=f5d6e088f84dd05278c4698a21cbf1ff4569978d]
+---
+ libelf/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libelf/Makefile.am b/libelf/Makefile.am
+index 3402863e..2d3dbdf2 100644
+--- a/libelf/Makefile.am
++++ b/libelf/Makefile.am
+@@ -122,6 +122,9 @@ libelf.so: $(srcdir)/libelf.map $(libelf_so_LIBS) $(libelf_so_DEPS)
+ 	@$(textrel_check)
+ 	$(AM_V_at)ln -fs $@ $@.$(VERSION)
+ 
++libeu_objects = $(shell $(AR) t ../lib/libeu.a)
++libelf_a_LIBADD = $(addprefix ../lib/,$(libeu_objects))
++
+ install: install-am libelf.so
+ 	$(mkinstalldirs) $(DESTDIR)$(libdir)
+ 	$(INSTALL_PROGRAM) libelf.so $(DESTDIR)$(libdir)/libelf-$(PACKAGE_VERSION).so
-- 
2.47.1


