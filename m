Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.4885.1625055137442573012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 05:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FqFJ0DFC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o35-20020a05600c5123b02901e6a7a3266cso1416412wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 05:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SiIf8WkNF3+Iz63UaZ4wwUYDjWqijc7TpVXq+FQfWCg=;
        b=FqFJ0DFCcsfOE4p9JyVeiK8wHV72fD9/faihMa2Ty9DayBb4qFMvn0EksvFIayrHvv
         EIgY+L099QiQU+Zukkv3C9laDIa85AcPIco43Gehs+OudvCM8Pw8RFWxCwLKFy15EPJ3
         I0vnZY8IEAzEeEf9xqgAyNBh7DAz8pev1zfLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SiIf8WkNF3+Iz63UaZ4wwUYDjWqijc7TpVXq+FQfWCg=;
        b=iHtGzosmIw9p2/1FBNvIHsakxQfOJ6lJ0C1o6/izGefSCv5KATjkj6HY8k7Hcp7lYR
         Y+V9KpKu3dQoVkpXJqpHDbomB0IFWmCtkqSfo17qFAdx5mhrrmjBKAslzMs1eT4CGVAA
         NtaIH2PmlquKI8+Mf8tGgshIH0y1PaTYtmJOvQNUiDI3Z8V7/RqCFg81cKd71Xyk30/O
         rUINoVv9DmsEiKZhbH0QHjEeLS1F0esVp6Pf80xCAJxymXgTRKn6N+h8WqBVzeANHxfJ
         z48Av9uq6zdWsYyo6LbtvzDZRHHie02n13INEUJ/n7NzOnySkp//53vgqYdr+9GczTY7
         LjpA==
X-Gm-Message-State: AOAM5319kGZZzGNK42wmu1y7rLe39fXObwlelWgoFveUVaBRY/6fCU9g
	eGmpdyZkjd3Aqg5mHQXh8Bkkj6yIoddMxA==
X-Google-Smtp-Source: ABdhPJwQqcvJwzlPBmKsx5gS/DPoq4kR0kcjDYF2C9O8zgxInFXmHMicszFxRQN3NmaHp7wNs7mDjQ==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr4240780wmq.121.1625055135664;
        Wed, 30 Jun 2021 05:12:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fa9c:ff43:b5c6:d04f])
        by smtp.gmail.com with ESMTPSA id i14sm6862076wmq.5.2021.06.30.05.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 05:12:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bash: Fix a rare make race build failure
Date: Wed, 30 Jun 2021 13:12:13 +0100
Message-Id: <20210630121214.1965373-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a rare make race that occurs in bash due to the way it constructs
certain headers and a build tool. Restructure the creation to remove
the race.

[YOCTO #14227]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bash/bash/makerace2.patch                 | 98 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.8.bb      |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/makerace2.patch

diff --git a/meta/recipes-extended/bash/bash/makerace2.patch b/meta/recipes-extended/bash/bash/makerace2.patch
new file mode 100644
index 00000000000..43cdd041579
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/makerace2.patch
@@ -0,0 +1,98 @@
+The main makefile can call mkbuiltins from multiple different codepaths in parallel.
+When called, it moves the existing files out the way and creates new ones, then
+compares which will break the build if timing is unlucky.
+
+The root of the problem is mkbuiltins.c creating a file but also referencing that
+file under the same name. By modifing it to allow the final name and the temp name
+to be specified, we can avoid the original reason for the moving of files around.
+This allows them to be created under a new name and then replaced if changed,
+removing any race windows around accessing the files whilst they've been
+moved or are being rewritten.
+
+See [YOCTO #14227]
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: bash-5.1.8/builtins/Makefile.in
+===================================================================
+--- bash-5.1.8.orig/builtins/Makefile.in
++++ bash-5.1.8/builtins/Makefile.in
+@@ -185,19 +185,17 @@ gen-helpfiles:	tmpbuiltins.o gen-helpfil
+ 	$(CC_FOR_BUILD) ${CCFLAGS_FOR_BUILD} $(LDFLAGS_FOR_BUILD) -o $@ gen-helpfiles.o tmpbuiltins.o $(LIBS_FOR_BUILD)
+ 
+ builtext.h builtins.c: $(MKBUILTINS) $(DEFSRC)
+-	@-if test -f builtins.c; then mv -f builtins.c old-builtins.c; fi
+-	@-if test -f builtext.h; then mv -f builtext.h old-builtext.h; fi
+-	./$(MKBUILTINS) -externfile builtext.h -structfile builtins.c \
++	./$(MKBUILTINS) -externfile builtext-new.h -externfinalfile builtext.h -structfile builtins-new.c \
+ 	    -noproduction $(DIRECTDEFINE) $(HELPDIRDEFINE) $(HELPSTRINGS) $(DEFSRC)
+-	@-if cmp -s old-builtext.h builtext.h 2>/dev/null; then \
+-		mv old-builtext.h builtext.h; \
++	@-if ! cmp -s builtext.h builtext-new.h 2>/dev/null; then \
++		mv builtext-new.h builtext.h; \
+ 	 else \
+-		$(RM) old-builtext.h; \
++		$(RM) builtext-new.h; \
+ 	 fi
+-	@-if cmp -s old-builtins.c builtins.c 2>/dev/null; then \
+-		mv old-builtins.c builtins.c; \
++	@-if ! cmp -s builtins.c builtins-new.c 2>/dev/null; then \
++		mv builtins-new.c builtins.c; \
+ 	 else \
+-		$(RM) old-builtins.c; \
++		$(RM) builtins-new.c; \
+ 	 fi
+ 
+ helpdoc:	gen-helpfiles
+Index: bash-5.1.8/builtins/mkbuiltins.c
+===================================================================
+--- bash-5.1.8.orig/builtins/mkbuiltins.c
++++ bash-5.1.8/builtins/mkbuiltins.c
+@@ -113,6 +113,9 @@ char *struct_filename = (char *)NULL;
+ /* The name of the external declaration file. */
+ char *extern_filename = (char *)NULL;
+ 
++/* The final name of the external declaration file. */
++char *extern_final_filename = (char *)NULL;
++
+ /* Here is a structure for manipulating arrays of data. */
+ typedef struct {
+   int size;		/* Number of slots allocated to array. */
+@@ -230,6 +233,8 @@ main (argc, argv)
+ 
+       if (strcmp (arg, "-externfile") == 0)
+ 	extern_filename = argv[arg_index++];
++      else if (strcmp (arg, "-externfinalfile") == 0)
++	extern_final_filename = argv[arg_index++];
+       else if (strcmp (arg, "-structfile") == 0)
+ 	struct_filename = argv[arg_index++];
+       else if (strcmp (arg, "-noproduction") == 0)
+@@ -273,6 +278,9 @@ main (argc, argv)
+ 	}
+     }
+ 
++  if (!extern_final_filename)
++    extern_final_filename = extern_filename;
++
+   /* If there are no files to process, just quit now. */
+   if (arg_index == argc)
+     exit (0);
+@@ -1174,7 +1182,7 @@ write_file_headers (structfile, externfi
+ 	fprintf (structfile, "%s\n", structfile_header[i]);
+ 
+       fprintf (structfile, "#include \"%s\"\n",
+-	       extern_filename ? extern_filename : "builtext.h");
++	       extern_final_filename ? extern_final_filename : "builtext.h");
+ 
+       fprintf (structfile, "#include \"bashintl.h\"\n");
+ 
+@@ -1184,7 +1192,7 @@ write_file_headers (structfile, externfi
+   if (externfile)
+     fprintf (externfile,
+ 	     "/* %s - The list of builtins found in libbuiltins.a. */\n",
+-	     extern_filename ? extern_filename : "builtext.h");
++	     extern_final_filename ? extern_final_filename : "builtext.h");
+ }
+ 
+ /* Write out any necessary closing information for
diff --git a/meta/recipes-extended/bash/bash_5.1.8.bb b/meta/recipes-extended/bash/bash_5.1.8.bb
index 55d3d0b16ea..5d7704af17b 100644
--- a/meta/recipes-extended/bash/bash_5.1.8.bb
+++ b/meta/recipes-extended/bash/bash_5.1.8.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
            file://makerace.patch \
+           file://makerace2.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "0cfb5c9bb1a29f800a97bd242d19511c997a1013815b805e0fdd32214113d6be"
-- 
2.30.2

