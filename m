Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7553D44D5C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:33:46 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.45598.1730900020744371194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mDgBa4Ke;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720d01caa66so4888780b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900020; x=1731504820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIVRBSH/MHq317EHDwRflQ3kM8XB8985BaibMpciEBQ=;
        b=mDgBa4KeJE0cOmpiSq9Qwctf7ud88Q+9te+ODmESOmFL+Za9duTNN2Z7BHa/oNS+aO
         VAOL54ctnuf2y5BdkcFLdFhY7BgBxEAhihl70oqRm4OAbDzBCt+n94AQhGyB+WzEvDAD
         NKlGPXytAHNTuxaUj0O4OaFPsT2DoVjh+R4/VEnMQQmnFoKilMlzcx1ongis1mz4sK52
         aaKTPQVaPEjI3W3X/jh3e+bw2wKliPcvZkUZV7r8bb3C0VO4Va+Im08CMqRyWR/Ix1wX
         PFOA3lch/OBW5rDY7rVgvh5oaX3xIC8NCF2N6GpjyUOYJpaib76RYXy3xKLquzukY/5T
         Qqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900020; x=1731504820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIVRBSH/MHq317EHDwRflQ3kM8XB8985BaibMpciEBQ=;
        b=xDcU4dvLvhCo9rqq/Ro4NjqN0x/VdNeJZ799eWQn6MTNxKW5T+w6gU+UoyLRzR9YfY
         5HClfZmyA6PVHLFlXzJENh0BCHIf2pF20g6N/B7DuzKGvd/naBdjY8QHAS7jNDL+w51y
         OCQDc2FoS6Sdx9vt2eA2YCnBowjym3hOV9F/Nic0a2O+AIrk18PG6k7QsQziZ9mhbbuk
         SiUIyPuwz0eVHOkzqwbqRJ+ZF/RVEEpGyvauB/wOgX8hvq9/7wb/AHrLVOmT51plb8gV
         A8yz0QTqiv8lJUo4C1dNPhrOVQ/VYzLA2XdzR/28RJEDQQhouK6VhfmYlYrpv3EcKzz3
         FOiA==
X-Gm-Message-State: AOJu0YxcJdk9meMcrKXbcFGYTBfKKY6hw/QgwloPxq+uubsxaOjN1QHA
	6e7GVqgzoBHgB64w/m8ctYMgQVxbbDb8ajpYCFSK28QlqEwh6zfSFIYfU2Bnjoh0X/iktRF1Kig
	W
X-Google-Smtp-Source: AGHT+IGaa2dvr2/F6w4LJ+iKifJO5RNn7owKouN5j2bCp+j6cPMHJSvpQLWD+Jeazj7ISX6m3NYG/A==
X-Received: by 2002:a05:6a00:190f:b0:71e:795f:92f0 with SMTP id d2e1a72fcca58-720b9b84653mr33383214b3a.3.1730900018978;
        Wed, 06 Nov 2024 05:33:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm11631717b3a.71.2024.11.06.05.33.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:33:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] xmlto: backport a patch to fix build with gcc-14 on host
Date: Wed,  6 Nov 2024 05:33:22 -0800
Message-Id: <2e8819c0b9ada2b600aecc40c974a18eb7c0a666.1730899830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730899830.git.steve@sakoman.com>
References: <cover.1730899830.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206772

From: Martin Jansa <martin.jansa@gmail.com>

* need to add dependency on flex-native because now when the
  .l file is modified by the .patch file it will try to regenerate
  the c code and fail:

| make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/build'
| /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c xmlif/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing' flex
| work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line 81: flex: command not found
| WARNING: 'flex' is missing on your system.
|          You should only need it if you modified a '.l' file.
|          You may want to install the Fast Lexical Analyzer package:
|          <https://github.com/westes/flex>

* backport
  https://pagure.io/xmlto/c/32376c053733c6c0ebaca3c25c0725509342fdf3?branch=master
  as well, so that patched xmlif/xmlif.c is newer than xmlif/xmlif.l and the build
  won't try to regenerate it with flex as that leads to random build failures reported
  in:
  https://lists.openembedded.org/g/openembedded-core/message/206412
  https://errors.yoctoproject.org/Errors/Details/810853/
  https://lists.openembedded.org/g/openembedded-core/message/206496
  https://valkyrie.yoctoproject.org/#/builders/29/builds/355

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Fix-return-type-of-main-function.patch |   42 +
 ...mlif.c-and-update-xmlif.l-to-comply-.patch | 1259 +++++++++++++++++
 .../0001-fix-Wimplicit-int-for-ifsense.patch  |   33 +
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |   10 +
 4 files changed, 1344 insertions(+)
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Regenerate-the-xmlif.c-and-update-xmlif.l-to-comply-.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch

diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
new file mode 100644
index 0000000000..f28f1fb56a
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
@@ -0,0 +1,42 @@
+From 6347e1b9da2140acdd55e3e7ac1199456793e17c Mon Sep 17 00:00:00 2001
+From: Thomas Kuehne <thomas@kuehne.cn>
+Date: Sat, 11 Dec 2021 20:56:00 +0000
+Subject: [PATCH] Fix return type of main function
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+xmlif/xmlif.l:242:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
+  242 | main(int argc, char *argv[])
+      | ^~~~
+
+Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/8e34f087bf410bcc5fe445933d6ad9bae54f24b5?branch=master]
+---
+ xmlif/xmlif.l | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
+index ac42136..78a62bc 100644
+--- a/xmlif/xmlif.l
++++ b/xmlif/xmlif.l
+@@ -239,7 +239,7 @@ WS		[ \t\n]*
+ 
+ int yywrap() {exit(0);};
+ 
+-main(int argc, char *argv[])
++int main(int argc, char *argv[])
+ {
+     int i;
+ 
+@@ -265,7 +265,7 @@ main(int argc, char *argv[])
+ 	    exit(1);
+ 	}
+ 
+-    yylex();
++    return yylex();
+ }
+ 
+ /*
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Regenerate-the-xmlif.c-and-update-xmlif.l-to-comply-.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Regenerate-the-xmlif.c-and-update-xmlif.l-to-comply-.patch
new file mode 100644
index 0000000000..2e5344158c
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Regenerate-the-xmlif.c-and-update-xmlif.l-to-comply-.patch
@@ -0,0 +1,1259 @@
+From 32376c053733c6c0ebaca3c25c0725509342fdf3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sloup?= <osloup@redhat.com>
+Date: Thu, 11 Apr 2024 18:09:37 +0200
+Subject: [PATCH] Regenerate the xmlif.c and update xmlif.l to comply with the
+ new version of flex and gcc
+
+Removes warnings in the build process
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/32376c053733c6c0ebaca3c25c0725509342fdf3?branch=master]
+---
+ xmlif/xmlif.c | 449 ++++++++++++++++++++++++++------------------------
+ xmlif/xmlif.l |   2 +-
+ 2 files changed, 232 insertions(+), 219 deletions(-)
+
+diff --git a/xmlif/xmlif.c b/xmlif/xmlif.c
+index 50aa1bc..1b87a9e 100644
+--- a/xmlif/xmlif.c
++++ b/xmlif/xmlif.c
+@@ -1,3 +1,4 @@
++#line 1 "xmlif/xmlif.c"
+ 
+ #line 3 "xmlif/xmlif.c"
+ 
+@@ -7,8 +8,8 @@
+ 
+ #define FLEX_SCANNER
+ #define YY_FLEX_MAJOR_VERSION 2
+-#define YY_FLEX_MINOR_VERSION 5
+-#define YY_FLEX_SUBMINOR_VERSION 37
++#define YY_FLEX_MINOR_VERSION 6
++#define YY_FLEX_SUBMINOR_VERSION 4
+ #if YY_FLEX_SUBMINOR_VERSION > 0
+ #define FLEX_BETA
+ #endif
+@@ -83,65 +84,61 @@ typedef unsigned int flex_uint32_t;
+ #define UINT32_MAX             (4294967295U)
+ #endif
+ 
++#ifndef SIZE_MAX
++#define SIZE_MAX               (~(size_t)0)
++#endif
++
+ #endif /* ! C99 */
+ 
+ #endif /* ! FLEXINT_H */
+ 
+-#ifdef __cplusplus
+-
+-/* The "const" storage-class-modifier is valid. */
+-#define YY_USE_CONST
+-
+-#else	/* ! __cplusplus */
+-
+-/* C99 requires __STDC__ to be defined as 1. */
+-#if defined (__STDC__)
+-
+-#define YY_USE_CONST
+-
+-#endif	/* defined (__STDC__) */
+-#endif	/* ! __cplusplus */
++/* begin standard C++ headers. */
+ 
+-#ifdef YY_USE_CONST
++/* TODO: this is always defined, so inline it */
+ #define yyconst const
++
++#if defined(__GNUC__) && __GNUC__ >= 3
++#define yynoreturn __attribute__((__noreturn__))
+ #else
+-#define yyconst
++#define yynoreturn
+ #endif
+ 
+ /* Returned upon end-of-file. */
+ #define YY_NULL 0
+ 
+-/* Promotes a possibly negative, possibly signed char to an unsigned
+- * integer for use as an array index.  If the signed char is negative,
+- * we want to instead treat it as an 8-bit unsigned char, hence the
+- * double cast.
++/* Promotes a possibly negative, possibly signed char to an
++ *   integer in range [0..255] for use as an array index.
+  */
+-#define YY_SC_TO_UI(c) ((unsigned int) (unsigned char) c)
++#define YY_SC_TO_UI(c) ((YY_CHAR) (c))
+ 
+ /* Enter a start condition.  This macro really ought to take a parameter,
+  * but we do it the disgusting crufty way forced on us by the ()-less
+  * definition of BEGIN.
+  */
+ #define BEGIN (yy_start) = 1 + 2 *
+-
+ /* Translate the current start state into a value that can be later handed
+  * to BEGIN to return to the state.  The YYSTATE alias is for lex
+  * compatibility.
+  */
+ #define YY_START (((yy_start) - 1) / 2)
+ #define YYSTATE YY_START
+-
+ /* Action number for EOF rule of a given start state. */
+ #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
+-
+ /* Special action meaning "start processing a new file". */
+-#define YY_NEW_FILE yyrestart(yyin  )
+-
++#define YY_NEW_FILE yyrestart( yyin  )
+ #define YY_END_OF_BUFFER_CHAR 0
+ 
+ /* Size of default input buffer. */
+ #ifndef YY_BUF_SIZE
++#ifdef __ia64__
++/* On IA-64, the buffer size is 16k, not 8k.
++ * Moreover, YY_BUF_SIZE is 2*YY_READ_BUF_SIZE in the general case.
++ * Ditto for the __ia64__ case accordingly.
++ */
++#define YY_BUF_SIZE 32768
++#else
+ #define YY_BUF_SIZE 16384
++#endif /* __ia64__ */
+ #endif
+ 
+ /* The state buf must be large enough to hold one state per character in the main buffer.
+@@ -158,15 +155,16 @@ typedef struct yy_buffer_state *YY_BUFFER_STATE;
+ typedef size_t yy_size_t;
+ #endif
+ 
+-extern yy_size_t yyleng;
++extern int yyleng;
+ 
+ extern FILE *yyin, *yyout;
+ 
+ #define EOB_ACT_CONTINUE_SCAN 0
+ #define EOB_ACT_END_OF_FILE 1
+ #define EOB_ACT_LAST_MATCH 2
+-
++    
+     #define YY_LESS_LINENO(n)
++    #define YY_LINENO_REWIND_TO(ptr)
+     
+ /* Return all but the first "n" matched characters back to the input stream. */
+ #define yyless(n) \
+@@ -181,7 +179,6 @@ extern FILE *yyin, *yyout;
+ 		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
+ 		} \
+ 	while ( 0 )
+-
+ #define unput(c) yyunput( c, (yytext_ptr)  )
+ 
+ #ifndef YY_STRUCT_YY_BUFFER_STATE
+@@ -196,12 +193,12 @@ struct yy_buffer_state
+ 	/* Size of input buffer in bytes, not including room for EOB
+ 	 * characters.
+ 	 */
+-	yy_size_t yy_buf_size;
++	int yy_buf_size;
+ 
+ 	/* Number of characters read into yy_ch_buf, not including EOB
+ 	 * characters.
+ 	 */
+-	yy_size_t yy_n_chars;
++	int yy_n_chars;
+ 
+ 	/* Whether we "own" the buffer - i.e., we know we created it,
+ 	 * and can realloc() it to grow it, and should free() it to
+@@ -224,7 +221,7 @@ struct yy_buffer_state
+ 
+     int yy_bs_lineno; /**< The line count. */
+     int yy_bs_column; /**< The column count. */
+-    
++
+ 	/* Whether to try to fill the input buffer when we reach the
+ 	 * end of it.
+ 	 */
+@@ -252,7 +249,7 @@ struct yy_buffer_state
+ /* Stack of input buffers. */
+ static size_t yy_buffer_stack_top = 0; /**< index of top of stack. */
+ static size_t yy_buffer_stack_max = 0; /**< capacity of stack. */
+-static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
++static YY_BUFFER_STATE * yy_buffer_stack = NULL; /**< Stack as an array. */
+ 
+ /* We provide macros for accessing buffer states in case in the
+  * future we want to put the buffer states in a more general
+@@ -263,7 +260,6 @@ static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
+ #define YY_CURRENT_BUFFER ( (yy_buffer_stack) \
+                           ? (yy_buffer_stack)[(yy_buffer_stack_top)] \
+                           : NULL)
+-
+ /* Same as previous macro, but useful when we know that the buffer stack is not
+  * NULL or when we need an lvalue. For internal use only.
+  */
+@@ -271,11 +267,11 @@ static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
+ 
+ /* yy_hold_char holds the character lost when yytext is formed. */
+ static char yy_hold_char;
+-static yy_size_t yy_n_chars;		/* number of characters read into yy_ch_buf */
+-yy_size_t yyleng;
++static int yy_n_chars;		/* number of characters read into yy_ch_buf */
++int yyleng;
+ 
+ /* Points to current character in buffer. */
+-static char *yy_c_buf_p = (char *) 0;
++static char *yy_c_buf_p = NULL;
+ static int yy_init = 0;		/* whether we need to initialize */
+ static int yy_start = 0;	/* start state number */
+ 
+@@ -284,82 +280,78 @@ static int yy_start = 0;	/* start state number */
+  */
+ static int yy_did_buffer_switch_on_eof;
+ 
+-void yyrestart (FILE *input_file  );
+-void yy_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
+-YY_BUFFER_STATE yy_create_buffer (FILE *file,int size  );
+-void yy_delete_buffer (YY_BUFFER_STATE b  );
+-void yy_flush_buffer (YY_BUFFER_STATE b  );
+-void yypush_buffer_state (YY_BUFFER_STATE new_buffer  );
+-void yypop_buffer_state (void );
+-
+-static void yyensure_buffer_stack (void );
+-static void yy_load_buffer_state (void );
+-static void yy_init_buffer (YY_BUFFER_STATE b,FILE *file  );
++void yyrestart ( FILE *input_file  );
++void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer  );
++YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size  );
++void yy_delete_buffer ( YY_BUFFER_STATE b  );
++void yy_flush_buffer ( YY_BUFFER_STATE b  );
++void yypush_buffer_state ( YY_BUFFER_STATE new_buffer  );
++void yypop_buffer_state ( void );
+ 
+-#define YY_FLUSH_BUFFER yy_flush_buffer(YY_CURRENT_BUFFER )
++static void yyensure_buffer_stack ( void );
++static void yy_load_buffer_state ( void );
++static void yy_init_buffer ( YY_BUFFER_STATE b, FILE *file  );
++#define YY_FLUSH_BUFFER yy_flush_buffer( YY_CURRENT_BUFFER )
+ 
+-YY_BUFFER_STATE yy_scan_buffer (char *base,yy_size_t size  );
+-YY_BUFFER_STATE yy_scan_string (yyconst char *yy_str  );
+-YY_BUFFER_STATE yy_scan_bytes (yyconst char *bytes,yy_size_t len  );
++YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size  );
++YY_BUFFER_STATE yy_scan_string ( const char *yy_str  );
++YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len  );
+ 
+-void *yyalloc (yy_size_t  );
+-void *yyrealloc (void *,yy_size_t  );
+-void yyfree (void *  );
++void *yyalloc ( yy_size_t  );
++void *yyrealloc ( void *, yy_size_t  );
++void yyfree ( void *  );
+ 
+ #define yy_new_buffer yy_create_buffer
+-
+ #define yy_set_interactive(is_interactive) \
+ 	{ \
+ 	if ( ! YY_CURRENT_BUFFER ){ \
+         yyensure_buffer_stack (); \
+ 		YY_CURRENT_BUFFER_LVALUE =    \
+-            yy_create_buffer(yyin,YY_BUF_SIZE ); \
++            yy_create_buffer( yyin, YY_BUF_SIZE ); \
+ 	} \
+ 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
+ 	}
+-
+ #define yy_set_bol(at_bol) \
+ 	{ \
+ 	if ( ! YY_CURRENT_BUFFER ){\
+         yyensure_buffer_stack (); \
+ 		YY_CURRENT_BUFFER_LVALUE =    \
+-            yy_create_buffer(yyin,YY_BUF_SIZE ); \
++            yy_create_buffer( yyin, YY_BUF_SIZE ); \
+ 	} \
+ 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
+ 	}
+-
+ #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
+ 
+ /* Begin user sect3 */
++typedef flex_uint8_t YY_CHAR;
+ 
+-typedef unsigned char YY_CHAR;
+-
+-FILE *yyin = (FILE *) 0, *yyout = (FILE *) 0;
++FILE *yyin = NULL, *yyout = NULL;
+ 
+-typedef yyconst struct yy_trans_info *yy_state_type;
++typedef const struct yy_trans_info *yy_state_type;
+ 
+ extern int yylineno;
+-
+ int yylineno = 1;
+ 
+ extern char *yytext;
++#ifdef yytext_ptr
++#undef yytext_ptr
++#endif
+ #define yytext_ptr yytext
+ 
+-static yy_state_type yy_get_previous_state (void );
+-static yy_state_type yy_try_NUL_trans (yy_state_type current_state  );
+-static int yy_get_next_buffer (void );
+-static void yy_fatal_error (yyconst char msg[]  );
++static yy_state_type yy_get_previous_state ( void );
++static yy_state_type yy_try_NUL_trans ( yy_state_type current_state  );
++static int yy_get_next_buffer ( void );
++static void yynoreturn yy_fatal_error ( const char* msg  );
+ 
+ /* Done after the current pattern has been matched and before the
+  * corresponding action - sets up yytext.
+  */
+ #define YY_DO_BEFORE_ACTION \
+ 	(yytext_ptr) = yy_bp; \
+-	yyleng = (size_t) (yy_cp - yy_bp); \
++	yyleng = (int) (yy_cp - yy_bp); \
+ 	(yy_hold_char) = *yy_cp; \
+ 	*yy_cp = '\0'; \
+ 	(yy_c_buf_p) = yy_cp;
+-
+ #define YY_NUM_RULES 13
+ #define YY_END_OF_BUFFER 14
+ struct yy_trans_info
+@@ -367,7 +359,7 @@ struct yy_trans_info
+ 	flex_int16_t yy_verify;
+ 	flex_int16_t yy_nxt;
+ 	};
+-static yyconst struct yy_trans_info yy_transition[3478] =
++static const struct yy_trans_info yy_transition[3478] =
+     {
+  {   0,   0 }, {   0,3222 }, {   0,   0 }, {   0,3220 }, {   1,1548 },
+  {   2,1548 }, {   3,1548 }, {   4,1548 }, {   5,1548 }, {   6,1548 },
+@@ -1079,7 +1071,7 @@ static yyconst struct yy_trans_info yy_transition[3478] =
+  {   0,   0 }, {   0,   0 }, {   0,   0 }, {   0,   0 }, {   0,   0 },
+  {   0,   0 }, {   0,   0 }, { 257,  14 }, {   1,   0 },    };
+ 
+-static yyconst struct yy_trans_info *yy_start_state_list[7] =
++static const struct yy_trans_info *yy_start_state_list[7] =
+     {
+     &yy_transition[1],
+     &yy_transition[3],
+@@ -1145,13 +1137,14 @@ char *yytext;
+  */
+ #include <string.h>
+ #include <stdlib.h>
++#include <strings.h>
+ 
+ #define TRUE	1
+ #define FALSE	0
+ 
+ static char **selections;	/* selection tokens */
+ static int nselections;		/* number of selections */
+-static ifsense;			/* sense of last `if' or unless seen */
++static int ifsense;		/* sense of last `if' or unless seen */
+ static char *attribute;		/* last attribute scanned */
+ 
+ struct stack_t {
+@@ -1301,8 +1294,9 @@ static void process_else()
+ }
+ 
+ 
++#line 1297 "xmlif/xmlif.c"
+ 
+-#line 1306 "xmlif/xmlif.c"
++#line 1299 "xmlif/xmlif.c"
+ 
+ #define INITIAL 0
+ #define attrib 1
+@@ -1320,36 +1314,36 @@ static void process_else()
+ #define YY_EXTRA_TYPE void *
+ #endif
+ 
+-static int yy_init_globals (void );
++static int yy_init_globals ( void );
+ 
+ /* Accessor methods to globals.
+    These are made visible to non-reentrant scanners for convenience. */
+ 
+-int yylex_destroy (void );
++int yylex_destroy ( void );
+ 
+-int yyget_debug (void );
++int yyget_debug ( void );
+ 
+-void yyset_debug (int debug_flag  );
++void yyset_debug ( int debug_flag  );
+ 
+-YY_EXTRA_TYPE yyget_extra (void );
++YY_EXTRA_TYPE yyget_extra ( void );
+ 
+-void yyset_extra (YY_EXTRA_TYPE user_defined  );
++void yyset_extra ( YY_EXTRA_TYPE user_defined  );
+ 
+-FILE *yyget_in (void );
++FILE *yyget_in ( void );
+ 
+-void yyset_in  (FILE * in_str  );
++void yyset_in  ( FILE * _in_str  );
+ 
+-FILE *yyget_out (void );
++FILE *yyget_out ( void );
+ 
+-void yyset_out  (FILE * out_str  );
++void yyset_out  ( FILE * _out_str  );
+ 
+-yy_size_t yyget_leng (void );
++			int yyget_leng ( void );
+ 
+-char *yyget_text (void );
++char *yyget_text ( void );
+ 
+-int yyget_lineno (void );
++int yyget_lineno ( void );
+ 
+-void yyset_lineno (int line_number  );
++void yyset_lineno ( int _line_number  );
+ 
+ /* Macros after this point can all be overridden by user definitions in
+  * section 1.
+@@ -1357,35 +1351,43 @@ void yyset_lineno (int line_number  );
+ 
+ #ifndef YY_SKIP_YYWRAP
+ #ifdef __cplusplus
+-extern "C" int yywrap (void );
++extern "C" int yywrap ( void );
+ #else
+-extern int yywrap (void );
++extern int yywrap ( void );
+ #endif
+ #endif
+ 
+-    static void yyunput (int c,char *buf_ptr  );
++#ifndef YY_NO_UNPUT
++    
++    static void yyunput ( int c, char *buf_ptr  );
+     
++#endif
++
+ #ifndef yytext_ptr
+-static void yy_flex_strncpy (char *,yyconst char *,int );
++static void yy_flex_strncpy ( char *, const char *, int );
+ #endif
+ 
+ #ifdef YY_NEED_STRLEN
+-static int yy_flex_strlen (yyconst char * );
++static int yy_flex_strlen ( const char * );
+ #endif
+ 
+ #ifndef YY_NO_INPUT
+-
+ #ifdef __cplusplus
+-static int yyinput (void );
++static int yyinput ( void );
+ #else
+-static int input (void );
++static int input ( void );
+ #endif
+ 
+ #endif
+ 
+ /* Amount of stuff to slurp up with each read. */
+ #ifndef YY_READ_BUF_SIZE
++#ifdef __ia64__
++/* On IA-64, the buffer size is 16k, not 8k */
++#define YY_READ_BUF_SIZE 16384
++#else
+ #define YY_READ_BUF_SIZE 8192
++#endif /* __ia64__ */
+ #endif
+ 
+ /* Copy whatever the last rule matched to the standard output. */
+@@ -1393,7 +1395,7 @@ static int input (void );
+ /* This used to be an fputs(), but since the string might contain NUL's,
+  * we now use fwrite().
+  */
+-#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
++#define ECHO do { if (fwrite( yytext, (size_t) yyleng, 1, yyout )) {} } while (0)
+ #endif
+ 
+ /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
+@@ -1402,7 +1404,7 @@ static int input (void );
+ #ifndef YY_INPUT
+ #define YY_INPUT(buf,result,max_size) \
+ 	errno=0; \
+-	while ( (result = read( fileno(yyin), (char *) buf, max_size )) < 0 ) \
++	while ( (result = (int) read( fileno(yyin), buf, (yy_size_t) max_size )) < 0 ) \
+ 	{ \
+ 		if( errno != EINTR) \
+ 		{ \
+@@ -1456,7 +1458,7 @@ extern int yylex (void);
+ 
+ /* Code executed at the end of each rule. */
+ #ifndef YY_BREAK
+-#define YY_BREAK break;
++#define YY_BREAK /*LINTED*/break;
+ #endif
+ 
+ #define YY_RULE_SETUP \
+@@ -1466,14 +1468,10 @@ extern int yylex (void);
+  */
+ YY_DECL
+ {
+-	register yy_state_type yy_current_state;
+-	register char *yy_cp, *yy_bp;
+-	register int yy_act;
++	yy_state_type yy_current_state;
++	char *yy_cp, *yy_bp;
++	int yy_act;
+     
+-#line 207 "xmlif/xmlif.l"
+-
+-#line 1476 "xmlif/xmlif.c"
+-
+ 	if ( !(yy_init) )
+ 		{
+ 		(yy_init) = 1;
+@@ -1494,13 +1492,18 @@ YY_DECL
+ 		if ( ! YY_CURRENT_BUFFER ) {
+ 			yyensure_buffer_stack ();
+ 			YY_CURRENT_BUFFER_LVALUE =
+-				yy_create_buffer(yyin,YY_BUF_SIZE );
++				yy_create_buffer( yyin, YY_BUF_SIZE );
+ 		}
+ 
+-		yy_load_buffer_state( );
++		yy_load_buffer_state(  );
+ 		}
+ 
+-	while ( 1 )		/* loops until end-of-file is reached */
++	{
++#line 208 "xmlif/xmlif.l"
++
++#line 1504 "xmlif/xmlif.c"
++
++	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
+ 		{
+ 		yy_cp = (yy_c_buf_p);
+ 
+@@ -1515,12 +1518,12 @@ YY_DECL
+ 		yy_current_state = yy_start_state_list[(yy_start)];
+ yy_match:
+ 		{
+-		register yyconst struct yy_trans_info *yy_trans_info;
++		const struct yy_trans_info *yy_trans_info;
+ 
+-		register YY_CHAR yy_c;
++		YY_CHAR yy_c;
+ 
+ 		for ( yy_c = YY_SC_TO_UI(*yy_cp);
+-		      (yy_trans_info = &yy_current_state[(unsigned int) yy_c])->
++		      (yy_trans_info = &yy_current_state[yy_c])->
+ 		yy_verify == yy_c;
+ 		      yy_c = YY_SC_TO_UI(*++yy_cp) )
+ 			{
+@@ -1553,58 +1556,58 @@ do_action:	/* This label is used only to access EOF actions. */
+ case 1:
+ /* rule 1 can match eol */
+ YY_RULE_SETUP
+-#line 208 "xmlif/xmlif.l"
++#line 209 "xmlif/xmlif.l"
+ {BEGIN(attrib); ifsense = FALSE; push_level();}
+ 	YY_BREAK
+ case 2:
+ /* rule 2 can match eol */
+ YY_RULE_SETUP
+-#line 209 "xmlif/xmlif.l"
++#line 210 "xmlif/xmlif.l"
+ {BEGIN(attrib); ifsense = TRUE;  push_level();}
+ 	YY_BREAK
+ case 3:
+ /* rule 3 can match eol */
+ YY_RULE_SETUP
+-#line 210 "xmlif/xmlif.l"
++#line 211 "xmlif/xmlif.l"
+ {BEGIN(attrib); ifsense = FALSE;}
+ 	YY_BREAK
+ case 4:
+ /* rule 4 can match eol */
+ YY_RULE_SETUP
+-#line 211 "xmlif/xmlif.l"
++#line 212 "xmlif/xmlif.l"
+ {BEGIN(attrib); ifsense = TRUE;}
+ 	YY_BREAK
+ case 5:
+ /* rule 5 can match eol */
+ YY_RULE_SETUP
+-#line 212 "xmlif/xmlif.l"
++#line 213 "xmlif/xmlif.l"
+ {process_else();}
+ 	YY_BREAK
+ case 6:
+ /* rule 6 can match eol */
+ YY_RULE_SETUP
+-#line 214 "xmlif/xmlif.l"
++#line 215 "xmlif/xmlif.l"
+ {pop_level();}
+ 	YY_BREAK
+ case 7:
+ YY_RULE_SETUP
+-#line 216 "xmlif/xmlif.l"
++#line 217 "xmlif/xmlif.l"
+ {stash_attribute(yytext);}
+ 	YY_BREAK
+ case 8:
+ YY_RULE_SETUP
+-#line 217 "xmlif/xmlif.l"
++#line 218 "xmlif/xmlif.l"
+ {BEGIN(val);}
+ 	YY_BREAK
+ case 9:
+ YY_RULE_SETUP
+-#line 218 "xmlif/xmlif.l"
++#line 219 "xmlif/xmlif.l"
+ {BEGIN(INITIAL); end_attribute();}
+ 	YY_BREAK
+ case 10:
+ /* rule 10 can match eol */
+ YY_RULE_SETUP
+-#line 219 "xmlif/xmlif.l"
++#line 220 "xmlif/xmlif.l"
+ {
+ 				    yytext[strlen(yytext)-1]='\0';
+ 				    process_value(yytext+1);
+@@ -1613,7 +1616,7 @@ YY_RULE_SETUP
+ 	YY_BREAK
+ case 11:
+ YY_RULE_SETUP
+-#line 224 "xmlif/xmlif.l"
++#line 225 "xmlif/xmlif.l"
+ {
+ 				    fprintf(stderr,
+ 					"xmlif: > where value expected\n");
+@@ -1622,7 +1625,7 @@ YY_RULE_SETUP
+ 	YY_BREAK
+ case 12:
+ YY_RULE_SETUP
+-#line 230 "xmlif/xmlif.l"
++#line 231 "xmlif/xmlif.l"
+ {
+ 				    if (!end->suppressed)
+ 					putchar(yytext[0]);
+@@ -1630,10 +1633,10 @@ YY_RULE_SETUP
+ 	YY_BREAK
+ case 13:
+ YY_RULE_SETUP
+-#line 235 "xmlif/xmlif.l"
++#line 236 "xmlif/xmlif.l"
+ ECHO;
+ 	YY_BREAK
+-#line 1637 "xmlif/xmlif.c"
++#line 1639 "xmlif/xmlif.c"
+ case YY_STATE_EOF(INITIAL):
+ case YY_STATE_EOF(attrib):
+ case YY_STATE_EOF(val):
+@@ -1713,7 +1716,7 @@ case YY_STATE_EOF(val):
+ 				{
+ 				(yy_did_buffer_switch_on_eof) = 0;
+ 
+-				if ( yywrap( ) )
++				if ( yywrap(  ) )
+ 					{
+ 					/* Note: because we've taken care in
+ 					 * yy_get_next_buffer() to have set up
+@@ -1766,6 +1769,7 @@ case YY_STATE_EOF(val):
+ 			"fatal flex scanner internal error--no action found" );
+ 	} /* end of action switch */
+ 		} /* end of scanning one token */
++	} /* end of user's declarations */
+ } /* end of yylex */
+ 
+ /* yy_get_next_buffer - try to read in a new buffer
+@@ -1777,9 +1781,9 @@ case YY_STATE_EOF(val):
+  */
+ static int yy_get_next_buffer (void)
+ {
+-    	register char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
+-	register char *source = (yytext_ptr);
+-	register int number_to_move, i;
++    	char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
++	char *source = (yytext_ptr);
++	int number_to_move, i;
+ 	int ret_val;
+ 
+ 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] )
+@@ -1808,7 +1812,7 @@ static int yy_get_next_buffer (void)
+ 	/* Try to read more data. */
+ 
+ 	/* First move last chars to start of buffer. */
+-	number_to_move = (int) ((yy_c_buf_p) - (yytext_ptr)) - 1;
++	number_to_move = (int) ((yy_c_buf_p) - (yytext_ptr) - 1);
+ 
+ 	for ( i = 0; i < number_to_move; ++i )
+ 		*(dest++) = *(source++);
+@@ -1821,7 +1825,7 @@ static int yy_get_next_buffer (void)
+ 
+ 	else
+ 		{
+-			yy_size_t num_to_read =
++			int num_to_read =
+ 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
+ 
+ 		while ( num_to_read <= 0 )
+@@ -1835,7 +1839,7 @@ static int yy_get_next_buffer (void)
+ 
+ 			if ( b->yy_is_our_buffer )
+ 				{
+-				yy_size_t new_size = b->yy_buf_size * 2;
++				int new_size = b->yy_buf_size * 2;
+ 
+ 				if ( new_size <= 0 )
+ 					b->yy_buf_size += b->yy_buf_size / 8;
+@@ -1844,11 +1848,12 @@ static int yy_get_next_buffer (void)
+ 
+ 				b->yy_ch_buf = (char *)
+ 					/* Include room in for 2 EOB chars. */
+-					yyrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2  );
++					yyrealloc( (void *) b->yy_ch_buf,
++							 (yy_size_t) (b->yy_buf_size + 2)  );
+ 				}
+ 			else
+ 				/* Can't grow it, we don't own it. */
+-				b->yy_ch_buf = 0;
++				b->yy_ch_buf = NULL;
+ 
+ 			if ( ! b->yy_ch_buf )
+ 				YY_FATAL_ERROR(
+@@ -1876,7 +1881,7 @@ static int yy_get_next_buffer (void)
+ 		if ( number_to_move == YY_MORE_ADJ )
+ 			{
+ 			ret_val = EOB_ACT_END_OF_FILE;
+-			yyrestart(yyin  );
++			yyrestart( yyin  );
+ 			}
+ 
+ 		else
+@@ -1890,12 +1895,15 @@ static int yy_get_next_buffer (void)
+ 	else
+ 		ret_val = EOB_ACT_CONTINUE_SCAN;
+ 
+-	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
++	if (((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
+ 		/* Extend the array by 50%, plus the number we really need. */
+-		yy_size_t new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
+-		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
++		int new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
++		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc(
++			(void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf, (yy_size_t) new_size  );
+ 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
+ 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
++		/* "- 2" to take care of EOB's */
++		YY_CURRENT_BUFFER_LVALUE->yy_buf_size = (int) (new_size - 2);
+ 	}
+ 
+ 	(yy_n_chars) += number_to_move;
+@@ -1911,8 +1919,8 @@ static int yy_get_next_buffer (void)
+ 
+     static yy_state_type yy_get_previous_state (void)
+ {
+-	register yy_state_type yy_current_state;
+-	register char *yy_cp;
++	yy_state_type yy_current_state;
++	char *yy_cp;
+     
+ 	yy_current_state = yy_start_state_list[(yy_start)];
+ 
+@@ -1936,11 +1944,11 @@ static int yy_get_next_buffer (void)
+  */
+     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state )
+ {
+-	register int yy_is_jam;
+-    	register char *yy_cp = (yy_c_buf_p);
++	int yy_is_jam;
++    	char *yy_cp = (yy_c_buf_p);
+ 
+-	register int yy_c = 256;
+-	register yyconst struct yy_trans_info *yy_trans_info;
++	int yy_c = 256;
++	const struct yy_trans_info *yy_trans_info;
+ 
+ 	yy_trans_info = &yy_current_state[(unsigned int) yy_c];
+ 	yy_current_state += yy_trans_info->yy_nxt;
+@@ -1958,9 +1966,11 @@ static int yy_get_next_buffer (void)
+ 		return yy_is_jam ? 0 : yy_current_state;
+ }
+ 
+-    static void yyunput (int c, register char * yy_bp )
++#ifndef YY_NO_UNPUT
++
++    static void yyunput (int c, char * yy_bp )
+ {
+-	register char *yy_cp;
++	char *yy_cp;
+     
+     yy_cp = (yy_c_buf_p);
+ 
+@@ -1970,10 +1980,10 @@ static int yy_get_next_buffer (void)
+ 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
+ 		{ /* need to shift things up to make room */
+ 		/* +2 for EOB chars. */
+-		register yy_size_t number_to_move = (yy_n_chars) + 2;
+-		register char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
++		int number_to_move = (yy_n_chars) + 2;
++		char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
+ 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
+-		register char *source =
++		char *source =
+ 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
+ 
+ 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
+@@ -1982,7 +1992,7 @@ static int yy_get_next_buffer (void)
+ 		yy_cp += (int) (dest - source);
+ 		yy_bp += (int) (dest - source);
+ 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =
+-			(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
++			(yy_n_chars) = (int) YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
+ 
+ 		if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
+ 			YY_FATAL_ERROR( "flex scanner push-back overflow" );
+@@ -1995,6 +2005,8 @@ static int yy_get_next_buffer (void)
+ 	(yy_c_buf_p) = yy_cp;
+ }
+ 
++#endif
++
+ #ifndef YY_NO_INPUT
+ #ifdef __cplusplus
+     static int yyinput (void)
+@@ -2019,7 +2031,7 @@ static int yy_get_next_buffer (void)
+ 
+ 		else
+ 			{ /* need more input */
+-			yy_size_t offset = (yy_c_buf_p) - (yytext_ptr);
++			int offset = (int) ((yy_c_buf_p) - (yytext_ptr));
+ 			++(yy_c_buf_p);
+ 
+ 			switch ( yy_get_next_buffer(  ) )
+@@ -2036,14 +2048,14 @@ static int yy_get_next_buffer (void)
+ 					 */
+ 
+ 					/* Reset buffer status. */
+-					yyrestart(yyin );
++					yyrestart( yyin );
+ 
+ 					/*FALLTHROUGH*/
+ 
+ 				case EOB_ACT_END_OF_FILE:
+ 					{
+-					if ( yywrap( ) )
+-						return EOF;
++					if ( yywrap(  ) )
++						return 0;
+ 
+ 					if ( ! (yy_did_buffer_switch_on_eof) )
+ 						YY_NEW_FILE;
+@@ -2080,11 +2092,11 @@ static int yy_get_next_buffer (void)
+ 	if ( ! YY_CURRENT_BUFFER ){
+         yyensure_buffer_stack ();
+ 		YY_CURRENT_BUFFER_LVALUE =
+-            yy_create_buffer(yyin,YY_BUF_SIZE );
++            yy_create_buffer( yyin, YY_BUF_SIZE );
+ 	}
+ 
+-	yy_init_buffer(YY_CURRENT_BUFFER,input_file );
+-	yy_load_buffer_state( );
++	yy_init_buffer( YY_CURRENT_BUFFER, input_file );
++	yy_load_buffer_state(  );
+ }
+ 
+ /** Switch to a different input buffer.
+@@ -2112,7 +2124,7 @@ static int yy_get_next_buffer (void)
+ 		}
+ 
+ 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
+-	yy_load_buffer_state( );
++	yy_load_buffer_state(  );
+ 
+ 	/* We don't actually know whether we did this switch during
+ 	 * EOF (yywrap()) processing, but the only time this flag
+@@ -2140,7 +2152,7 @@ static void yy_load_buffer_state  (void)
+ {
+ 	YY_BUFFER_STATE b;
+     
+-	b = (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
++	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state )  );
+ 	if ( ! b )
+ 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
+ 
+@@ -2149,13 +2161,13 @@ static void yy_load_buffer_state  (void)
+ 	/* yy_ch_buf has to be 2 characters longer than the size given because
+ 	 * we need to put in 2 end-of-buffer characters.
+ 	 */
+-	b->yy_ch_buf = (char *) yyalloc(b->yy_buf_size + 2  );
++	b->yy_ch_buf = (char *) yyalloc( (yy_size_t) (b->yy_buf_size + 2)  );
+ 	if ( ! b->yy_ch_buf )
+ 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
+ 
+ 	b->yy_is_our_buffer = 1;
+ 
+-	yy_init_buffer(b,file );
++	yy_init_buffer( b, file );
+ 
+ 	return b;
+ }
+@@ -2174,9 +2186,9 @@ static void yy_load_buffer_state  (void)
+ 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
+ 
+ 	if ( b->yy_is_our_buffer )
+-		yyfree((void *) b->yy_ch_buf  );
++		yyfree( (void *) b->yy_ch_buf  );
+ 
+-	yyfree((void *) b  );
++	yyfree( (void *) b  );
+ }
+ 
+ /* Initializes or reinitializes a buffer.
+@@ -2188,7 +2200,7 @@ static void yy_load_buffer_state  (void)
+ {
+ 	int oerrno = errno;
+     
+-	yy_flush_buffer(b );
++	yy_flush_buffer( b );
+ 
+ 	b->yy_input_file = file;
+ 	b->yy_fill_buffer = 1;
+@@ -2231,7 +2243,7 @@ static void yy_load_buffer_state  (void)
+ 	b->yy_buffer_status = YY_BUFFER_NEW;
+ 
+ 	if ( b == YY_CURRENT_BUFFER )
+-		yy_load_buffer_state( );
++		yy_load_buffer_state(  );
+ }
+ 
+ /** Pushes the new state onto the stack. The new state becomes
+@@ -2262,7 +2274,7 @@ void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
+ 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
+ 
+ 	/* copied from yy_switch_to_buffer. */
+-	yy_load_buffer_state( );
++	yy_load_buffer_state(  );
+ 	(yy_did_buffer_switch_on_eof) = 1;
+ }
+ 
+@@ -2281,7 +2293,7 @@ void yypop_buffer_state (void)
+ 		--(yy_buffer_stack_top);
+ 
+ 	if (YY_CURRENT_BUFFER) {
+-		yy_load_buffer_state( );
++		yy_load_buffer_state(  );
+ 		(yy_did_buffer_switch_on_eof) = 1;
+ 	}
+ }
+@@ -2299,15 +2311,15 @@ static void yyensure_buffer_stack (void)
+ 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
+ 		 * immediate realloc on the next call.
+          */
+-		num_to_alloc = 1;
++      num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
+ 		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
+ 								(num_to_alloc * sizeof(struct yy_buffer_state*)
+ 								);
+ 		if ( ! (yy_buffer_stack) )
+ 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
+-								  
++
+ 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_state*));
+-				
++
+ 		(yy_buffer_stack_max) = num_to_alloc;
+ 		(yy_buffer_stack_top) = 0;
+ 		return;
+@@ -2316,7 +2328,7 @@ static void yyensure_buffer_stack (void)
+ 	if ((yy_buffer_stack_top) >= ((yy_buffer_stack_max)) - 1){
+ 
+ 		/* Increase the buffer to prepare for a possible push. */
+-		int grow_size = 8 /* arbitrary grow size */;
++		yy_size_t grow_size = 8 /* arbitrary grow size */;
+ 
+ 		num_to_alloc = (yy_buffer_stack_max) + grow_size;
+ 		(yy_buffer_stack) = (struct yy_buffer_state**)yyrealloc
+@@ -2336,7 +2348,7 @@ static void yyensure_buffer_stack (void)
+  * @param base the character buffer
+  * @param size the size in bytes of the character buffer
+  * 
+- * @return the newly allocated buffer state object. 
++ * @return the newly allocated buffer state object.
+  */
+ YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
+ {
+@@ -2346,23 +2358,23 @@ YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
+ 	     base[size-2] != YY_END_OF_BUFFER_CHAR ||
+ 	     base[size-1] != YY_END_OF_BUFFER_CHAR )
+ 		/* They forgot to leave room for the EOB's. */
+-		return 0;
++		return NULL;
+ 
+-	b = (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
++	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state )  );
+ 	if ( ! b )
+ 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
+ 
+-	b->yy_buf_size = size - 2;	/* "- 2" to take care of EOB's */
++	b->yy_buf_size = (int) (size - 2);	/* "- 2" to take care of EOB's */
+ 	b->yy_buf_pos = b->yy_ch_buf = base;
+ 	b->yy_is_our_buffer = 0;
+-	b->yy_input_file = 0;
++	b->yy_input_file = NULL;
+ 	b->yy_n_chars = b->yy_buf_size;
+ 	b->yy_is_interactive = 0;
+ 	b->yy_at_bol = 1;
+ 	b->yy_fill_buffer = 0;
+ 	b->yy_buffer_status = YY_BUFFER_NEW;
+ 
+-	yy_switch_to_buffer(b  );
++	yy_switch_to_buffer( b  );
+ 
+ 	return b;
+ }
+@@ -2375,10 +2387,10 @@ YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
+  * @note If you want to scan bytes that may contain NUL values, then use
+  *       yy_scan_bytes() instead.
+  */
+-YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
++YY_BUFFER_STATE yy_scan_string (const char * yystr )
+ {
+     
+-	return yy_scan_bytes(yystr,strlen(yystr) );
++	return yy_scan_bytes( yystr, (int) strlen(yystr) );
+ }
+ 
+ /** Setup the input buffer state to scan the given bytes. The next call to yylex() will
+@@ -2388,7 +2400,7 @@ YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
+  * 
+  * @return the newly allocated buffer state object.
+  */
+-YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, yy_size_t  _yybytes_len )
++YY_BUFFER_STATE yy_scan_bytes  (const char * yybytes, int  _yybytes_len )
+ {
+ 	YY_BUFFER_STATE b;
+ 	char *buf;
+@@ -2396,8 +2408,8 @@ YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, yy_size_t  _yybytes_len
+ 	int i;
+     
+ 	/* Get memory for full buffer, including space for trailing EOB's. */
+-	n = _yybytes_len + 2;
+-	buf = (char *) yyalloc(n  );
++	n = (yy_size_t) (_yybytes_len + 2);
++	buf = (char *) yyalloc( n  );
+ 	if ( ! buf )
+ 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
+ 
+@@ -2406,7 +2418,7 @@ YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, yy_size_t  _yybytes_len
+ 
+ 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
+ 
+-	b = yy_scan_buffer(buf,n );
++	b = yy_scan_buffer( buf, n );
+ 	if ( ! b )
+ 		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
+ 
+@@ -2422,9 +2434,9 @@ YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, yy_size_t  _yybytes_len
+ #define YY_EXIT_FAILURE 2
+ #endif
+ 
+-static void yy_fatal_error (yyconst char* msg )
++static void yynoreturn yy_fatal_error (const char* msg )
+ {
+-    	(void) fprintf( stderr, "%s\n", msg );
++			fprintf( stderr, "%s\n", msg );
+ 	exit( YY_EXIT_FAILURE );
+ }
+ 
+@@ -2452,7 +2464,7 @@ static void yy_fatal_error (yyconst char* msg )
+  */
+ int yyget_lineno  (void)
+ {
+-        
++    
+     return yylineno;
+ }
+ 
+@@ -2475,7 +2487,7 @@ FILE *yyget_out  (void)
+ /** Get the length of the current token.
+  * 
+  */
+-yy_size_t yyget_leng  (void)
++int yyget_leng  (void)
+ {
+         return yyleng;
+ }
+@@ -2490,29 +2502,29 @@ char *yyget_text  (void)
+ }
+ 
+ /** Set the current line number.
+- * @param line_number
++ * @param _line_number line number
+  * 
+  */
+-void yyset_lineno (int  line_number )
++void yyset_lineno (int  _line_number )
+ {
+     
+-    yylineno = line_number;
++    yylineno = _line_number;
+ }
+ 
+ /** Set the input stream. This does not discard the current
+  * input buffer.
+- * @param in_str A readable stream.
++ * @param _in_str A readable stream.
+  * 
+  * @see yy_switch_to_buffer
+  */
+-void yyset_in (FILE *  in_str )
++void yyset_in (FILE *  _in_str )
+ {
+-        yyin = in_str ;
++        yyin = _in_str ;
+ }
+ 
+-void yyset_out (FILE *  out_str )
++void yyset_out (FILE *  _out_str )
+ {
+-        yyout = out_str ;
++        yyout = _out_str ;
+ }
+ 
+ int yyget_debug  (void)
+@@ -2520,9 +2532,9 @@ int yyget_debug  (void)
+         return yy_flex_debug;
+ }
+ 
+-void yyset_debug (int  bdebug )
++void yyset_debug (int  _bdebug )
+ {
+-        yy_flex_debug = bdebug ;
++        yy_flex_debug = _bdebug ;
+ }
+ 
+ static int yy_init_globals (void)
+@@ -2531,10 +2543,10 @@ static int yy_init_globals (void)
+      * This function is called from yylex_destroy(), so don't allocate here.
+      */
+ 
+-    (yy_buffer_stack) = 0;
++    (yy_buffer_stack) = NULL;
+     (yy_buffer_stack_top) = 0;
+     (yy_buffer_stack_max) = 0;
+-    (yy_c_buf_p) = (char *) 0;
++    (yy_c_buf_p) = NULL;
+     (yy_init) = 0;
+     (yy_start) = 0;
+ 
+@@ -2543,8 +2555,8 @@ static int yy_init_globals (void)
+     yyin = stdin;
+     yyout = stdout;
+ #else
+-    yyin = (FILE *) 0;
+-    yyout = (FILE *) 0;
++    yyin = NULL;
++    yyout = NULL;
+ #endif
+ 
+     /* For future reference: Set errno on error, since we are called by
+@@ -2559,7 +2571,7 @@ int yylex_destroy  (void)
+     
+     /* Pop the buffer stack, destroying each element. */
+ 	while(YY_CURRENT_BUFFER){
+-		yy_delete_buffer(YY_CURRENT_BUFFER  );
++		yy_delete_buffer( YY_CURRENT_BUFFER  );
+ 		YY_CURRENT_BUFFER_LVALUE = NULL;
+ 		yypop_buffer_state();
+ 	}
+@@ -2580,18 +2592,19 @@ int yylex_destroy  (void)
+  */
+ 
+ #ifndef yytext_ptr
+-static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
++static void yy_flex_strncpy (char* s1, const char * s2, int n )
+ {
+-	register int i;
++		
++	int i;
+ 	for ( i = 0; i < n; ++i )
+ 		s1[i] = s2[i];
+ }
+ #endif
+ 
+ #ifdef YY_NEED_STRLEN
+-static int yy_flex_strlen (yyconst char * s )
++static int yy_flex_strlen (const char * s )
+ {
+-	register int n;
++	int n;
+ 	for ( n = 0; s[n]; ++n )
+ 		;
+ 
+@@ -2601,11 +2614,12 @@ static int yy_flex_strlen (yyconst char * s )
+ 
+ void *yyalloc (yy_size_t  size )
+ {
+-	return (void *) malloc( size );
++			return malloc(size);
+ }
+ 
+ void *yyrealloc  (void * ptr, yy_size_t  size )
+ {
++		
+ 	/* The cast to (char *) in the following accommodates both
+ 	 * implementations that use char* generic pointers, and those
+ 	 * that use void* generic pointers.  It works with the latter
+@@ -2613,26 +2627,25 @@ void *yyrealloc  (void * ptr, yy_size_t  size )
+ 	 * any pointer type to void*, and deal with argument conversions
+ 	 * as though doing an assignment.
+ 	 */
+-	return (void *) realloc( (char *) ptr, size );
++	return realloc(ptr, size);
+ }
+ 
+ void yyfree (void * ptr )
+ {
+-	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
++			free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
+ }
+ 
+ #define YYTABLES_NAME "yytables"
+ 
+-#line 235 "xmlif/xmlif.l"
+-
++#line 236 "xmlif/xmlif.l"
+ 
+ #include <string.h>
+ 
+ #include "config.h"
+ 
+-int yywrap() {exit(0);};
++int yywrap() {exit(0);}
+ 
+-main(int argc, char *argv[])
++int main(int argc, char *argv[])
+ {
+     int i;
+ 
+@@ -2658,7 +2671,7 @@ main(int argc, char *argv[])
+ 	    exit(1);
+ 	}
+ 
+-    yylex();
++    return yylex();
+ }
+ 
+ /*
+diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
+index 294fbc7..560508e 100644
+--- a/xmlif/xmlif.l
++++ b/xmlif/xmlif.l
+@@ -203,7 +203,7 @@ WS		[ \t\n]*
+ 
+ %x attrib val
+ 
+-%option batch never-interactive fast 8bit
++%option batch never-interactive fast 8bit yywrap
+ 
+ %%
+ <INITIAL>\<\?xmlif{WS}if{WS}not{WS}	{BEGIN(attrib); ifsense = FALSE; push_level();}
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch
new file mode 100644
index 0000000000..d5c25ba08a
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch
@@ -0,0 +1,33 @@
+From 1375e2df75530cd198bd16ac3de38e2b0d126276 Mon Sep 17 00:00:00 2001
+From: Thomas Kuehne <thomas@kuehne.cn>
+Date: Sat, 11 Dec 2021 21:10:41 +0100
+Subject: [PATCH] fix -Wimplicit-int for ifsense
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+xmlif/xmlif.l:46:8: warning: type defaults to ‘int’ in declaration of ‘ifsense’ [-Wimplicit-int]
+   46 | static ifsense;                 /* sense of last `if' or unless seen */
+      |        ^~~~~~~
+
+Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/1375e2df75530cd198bd16ac3de38e2b0d126276?branch=master
+---
+ xmlif/xmlif.l | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
+index ac42136..6e5970e 100644
+--- a/xmlif/xmlif.l
++++ b/xmlif/xmlif.l
+@@ -43,7 +43,7 @@
+ 
+ static char **selections;	/* selection tokens */
+ static int nselections;		/* number of selections */
+-static ifsense;			/* sense of last `if' or unless seen */
++static int ifsense;		/* sense of last `if' or unless seen */
+ static char *attribute;		/* last attribute scanned */
+ 
+ struct stack_t {
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 5cb9a4c57b..ce6680c507 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
            file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
+           file://0001-Fix-return-type-of-main-function.patch \
+           file://0001-fix-Wimplicit-int-for-ifsense.patch \
+           file://0001-Regenerate-the-xmlif.c-and-update-xmlif.l-to-comply-.patch \
 "
 SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
@@ -36,6 +39,13 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF:append = " BASH=/bin/bash GCP=/bin/cp XMLLINT=xmllint XSLTPROC=xsltproc"
 
+do_configure:prepend() {
+    # make sure xmlif.c is newer than xmlif.l after do_patch (order of
+    # .patch files in SRC_URI isn't enough) to prevent regenerating it
+    # with flex-native which isn't in DEPENDS
+    touch ${S}/xmlif/xmlif.c
+}
+
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
-- 
2.34.1


