Return-Path: <tomi.belan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26489C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 18:17:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.14381.1661365018070130463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 11:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lnbc0Hyv;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: tomi.belan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id d21so15764160eje.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2JlllfKpkFy057jKX/3YSkSxi5p/6XvON6paVdYzg+k=;
        b=Lnbc0Hyvtt1Tx/6+nnHHhaxE+rFkW3CLksNhwGXBTXT0wWCVhwhzAR7Y8DXdjn+mrW
         L9sfD7qSqbgg9VS6JNc7uKt3WWPyCPWFDhJOmfBkrUcjG/ZtIn2nw6lcFuMS4MptiPy6
         IGqrZYY7H0DCb4kUF88vbQiLbG9CzoOKqkoe7xnpsSTZCIQDTixiDK9+fXglvDkVPPMy
         CnDx/uwd0z5bCWnHFGhinDjsBuZgmoouZONUgE91+q8QSjfAgftYbzcXmRH9v2vqsGpm
         lv9YyFvWLWfOe4L6FXgbnmUORjPLbe+R5uHr/UyGO/dey4xEQxjLt8zsfsLgf8+8lIK3
         WHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2JlllfKpkFy057jKX/3YSkSxi5p/6XvON6paVdYzg+k=;
        b=qrZEhF/wIbS1Aeo1RaDg4x4YX/Zek3hoYrsE3kAdR5LrBOKO22Ted+G8QkIDgrrtDA
         NU/uaIUvdF5m3g8F1yFI4tzbaThMflxdhQd3CIRtaHxxx3oRWgl7/MzAqsgAVibSTUOe
         l8cTYrmdn7fLPRNYqIwB9Ccme/xRoW38naPbcAcq2lXHtbd98dQKuTnCdMdaA8OuX74/
         xwEpPWch8FFmuaJoyNYfwx876rAM1r0Avd2BIuGYCkwX0/vDqgWBZaH4GcEbDvZYKmXF
         fQRA2AYVh3oxcGa7JIu5VSe7/EC0g2HQJg3M/B+DMxK4OmTs+I4JsEl1dbx+wDLuV4TY
         y7Ag==
X-Gm-Message-State: ACgBeo2JUATV3oH6PautrNEa9KcTkXs4JS/MYMqnLUt9vJmR5cv81/0p
	Misw4gNOv2rRxFCFbQ2A4IV3yzWOYE4=
X-Google-Smtp-Source: 
 AA6agR7pKScndqnJxS70n48RlaXR4TfVZOOvI5py6UM6G0CaVlzHSwX8qHmfXBAn0ykK7OHmwxbMpQ==
X-Received: by 2002:a17:907:2d2b:b0:731:2179:5ba with SMTP id
 gs43-20020a1709072d2b00b00731217905bamr123547ejc.207.1661365015881;
        Wed, 24 Aug 2022 11:16:55 -0700 (PDT)
Received: from smnd.sk (deuterium.smnd.sk. [193.87.13.210])
        by smtp.gmail.com with ESMTPSA id
 n13-20020aa7c44d000000b00446639c01easm3389334edr.44.2022.08.24.11.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 11:16:55 -0700 (PDT)
From: Tomi Belan <tomi.belan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tomi Belan <tomi.belan@gmail.com>
Subject: [pseudo][PATCH] Minor build fixes
Date: Wed, 24 Aug 2022 18:16:50 +0000
Message-Id: <20220824181650.10609-1-tomi.belan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 18:17:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169827

- "make test" did not build "test/test-chroot-symlink", so the test failed
- "make clean" did not delete libpseudo.so correctly
- "test/test-umask.sh" did not clean up its test files
- build test binaries only if needed, and delete them in "make clean"
- remove var/pseudo from Makefile (run_tests.sh makes it anyway)
- add *.pyc and test binaries (no file extension) to .gitignore
- delete more things in "make distclean"

Signed-off-by: Tomi Belan <tomi.belan@gmail.com>
---
Here is my fourth patch for 'pseudo'. It is a bunch of developer experience
improvements. It does not affect pseudo and libpseudo itself. It could be split
into smaller commits, but I thought this would be easier to send and to review.

Now "git status" doesn't show any untracked files, and "make distclean" deletes
everything listed by "git ls-files -o", with one exception: there is still a
generated file named "ports/linux/guts/prctl.c". I didn't know what to do with
it and why it isn't committed in Git, so I left it alone.

 .gitignore         |  3 +++
 Makefile.in        | 22 +++++++++++-----------
 test/test-umask.sh |  1 +
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index e6e11d9..bc4cbe8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,5 @@
 *.o
+*.pyc
 Makefile
 libpseudo.so
 pseudo_wrapfuncs.*
@@ -14,3 +15,5 @@ pseudo_ports.h
 templatefile.pyc
 func_deps.mk
 port_deps.mk
+test/test-*
+!test/test-*.*
diff --git a/Makefile.in b/Makefile.in
index 4ebe5da..48fdbd2 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -55,6 +55,7 @@ GUTS=$(filter-out "$(GLOB_PATTERN)",$(wildcard $(GLOB_PATTERN)))
 
 SOURCES=$(wildcard *.c)
 OBJS=$(subst .c,.o,$(SOURCES))
+TESTS=$(patsubst %.c,%,$(wildcard test/*.c))
 
 SHOBJS=pseudo_tables.o pseudo_util.o
 DBOBJS=pseudo_db.o
@@ -74,13 +75,11 @@ TABLES=table_templates/pseudo_tables.c table_templates/pseudo_tables.h
 
 all: $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) $(PSEUDO_PROFILE)
 
-test: all | $(BIN) $(LIB) $(LOCALSTATE)
-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-rename-fstat test/test-rename-fstat.c
-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-statx test/test-statx.c
-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fstat test/test-fstat.c
-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fcntl test/test-fcntl.c
-	@./run_tests.sh -v
+test: all $(TESTS) | $(BIN) $(LIB)
+	./run_tests.sh -v
+
+test/%: test/%.c
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $@ $<
 
 install-lib: $(LIBPSEUDO)
 	mkdir -p $(DESTDIR)$(LIBDIR)
@@ -96,7 +95,7 @@ install-data:
 
 install: all install-lib install-bin install-data
 
-$(BIN) $(LIB) $(LOCALSTATE):
+$(BIN) $(LIB):
 	mkdir -p $@
 
 pseudo: $(PSEUDO)
@@ -170,7 +169,8 @@ pseudo_profile: Makefile pseudo_profile.c tables wrappers
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o pseudo_profile pseudo_profile.c
 
 clean:
-	rm -f *.o *.so $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) \
+	rm -f *.o $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) \
+		$(TESTS) \
 		pseudo_wrapfuncs.h pseudo_wrapfuncs.c \
 		pseudo_wrapper_table.c \
 		pseudo_tables.c pseudo_tables.h \
@@ -181,8 +181,8 @@ clean:
 	touch port_deps.mk func_deps.mk
 
 distclean: clean
-	rm -f Makefile
-	rm -rf ./$(BIN) ./$(LIB) ./$(LOCALSTATE)
+	rm -f Makefile port_deps.mk func_deps.mk
+	rm -rf ./$(BIN) ./$(LIB) ./$(LOCALSTATE) ./__pycache__
 	@echo "WARNING: Makefile has been removed.  You must reconfigure to do anything else."
 
 nuke: distclean
diff --git a/test/test-umask.sh b/test/test-umask.sh
index e4e366b..e09fdbf 100755
--- a/test/test-umask.sh
+++ b/test/test-umask.sh
@@ -35,3 +35,4 @@ case $(mode b) in
 *)	exit 1;;
 esac
 
+rm a b
-- 
2.25.1


