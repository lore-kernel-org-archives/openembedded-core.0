Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BE8E7719E
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14679.1736325755686880627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DA4qiZBG;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaec111762bso2713674266b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325754; x=1736930554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEbEfiVSLDw3pr72xuSd8Ob6fjHmzX7kwKMipuw0Yak=;
        b=DA4qiZBGlfbpLLIYzDFxjVDk+qjKn8LcQ8X3UMdM/Q6s/9WyF467NiaxeWqRwXIBsj
         kGDDF4xOUwr3KwAFgDTRrPvrY3yMaU+uJCQDBpFW13twWR/AOpmofnFiN1ZQCuR7QPco
         PYPZoCDNVRHPkrnbT+926snKGrgutVnr/Ja9t5W7j0tsXe3/bcLbdZ8T5kHzKOyTq2hb
         XgQ4Z27qDPFTqr3MFsaOH9d6UjkZ8jLiLnJTT7I+p+Afb2M/i5z7rAu8pbNjcqPxGpqO
         z+HMO+OtnHQUg65IwctP5SmGVTQuKqE9W6VhtJMumO+JokF0F8kiDZt6p4DwPb077VB1
         3qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325754; x=1736930554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEbEfiVSLDw3pr72xuSd8Ob6fjHmzX7kwKMipuw0Yak=;
        b=AAl6+OuzcSZzBwoTnaW8rIqBKCEiIgSaucT7kcy6vI8lswDdJmsGd/cLmenWIZGlQV
         LRwGZe+0/M8PtHnBmpqLQYzF4DBhJnreSLnLtL4/gUB436R4mLq4dNR41OMJxtt+mftb
         XFTHZalWKbY723j6h+6Z9PICq/5kN9eEFG736I7bgfsuS65hIlpa/7y7a/bechhWGdjp
         nx5NZebCTahkeZiG4AqSt7X6aD6RJGHAdjAj5yJK/7M8nmQXOByzFJB4fpVUpaIaTgOo
         CvqqdOCl85FqstJrXJwFvZAKmEWGUMmSwckQ56pIyNZSRNNW9wcFB7taTFSbL02yTecr
         O2Ew==
X-Gm-Message-State: AOJu0Yy57vOnzCt5GOagu6GNXmqQ9u0u0YQ2TM6+ipKwd2mElGSTiYM4
	M+wdoxNFnEhOW/a8IX4GYgWuG+1JvCn0h5tQ9sNOP3NGc132N3EtfIF3hQ==
X-Gm-Gg: ASbGncsP5wFGTL6z7QdXa8GtHPFsVlv2n1/To78R7XcsVINCqmszjEImLI0YKk3cLWl
	b+hTgWNDZ0rn6+QcbyHO5X3/jQZJwBpZsVD9FLnBU4QrTk21caUQtMtWmhbcDYuNZSyOqYInz4q
	XylSaHCFDwFGr9Vr3ktcFmFRwadg9/wk0eUulpe7erdzdKi6fBmUwqhCbHeTbiCz7/OGhGpF1Ej
	Y8r2ujAQMZ4SEn6BooqQa8KwkDZjD4QTeLvT8TxiOy3WbG4xsFYK1O8zZ6b+seWtBMtnBSyW5Af
	ksi2RVchv0jc8IxGYw==
X-Google-Smtp-Source: AGHT+IE7M52OSCY/5NVReCyc6MhxECoVs9+MRj91opRr834Lib9qdTZ/XuSabLHFESyji0ZqwsomBA==
X-Received: by 2002:a17:907:9612:b0:aa6:32f9:d1a7 with SMTP id a640c23a62f3a-ab2abca7713mr155067566b.38.1736325753873;
        Wed, 08 Jan 2025 00:42:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/20] bc: update 1.07.1 -> 1.08.1
Date: Wed,  8 Jan 2025 09:42:12 +0100
Message-Id: <20250108084226.117178-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209528

From: Alexander Kanavin <alex@linutronix.de>

Upstream now ships pre-generated libmath.h, so we don't need to do so.

Drop 0001-dc-fix-exit-code-of-q-command.patch
(merged upstream).

License-update: copyright years.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-dc-fix-exit-code-of-q-command.patch  | 44 ------------------
 meta/recipes-extended/bc/bc/libmath.h         | 46 -------------------
 .../bc/bc/no-gen-libmath.patch                | 24 ----------
 .../bc/{bc_1.07.1.bb => bc_1.08.1.bb}         | 12 +----
 4 files changed, 2 insertions(+), 124 deletions(-)
 delete mode 100644 meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
 delete mode 100644 meta/recipes-extended/bc/bc/libmath.h
 delete mode 100644 meta/recipes-extended/bc/bc/no-gen-libmath.patch
 rename meta/recipes-extended/bc/{bc_1.07.1.bb => bc_1.08.1.bb} (72%)

diff --git a/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch b/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
deleted file mode 100644
index 1ef797dd66a..00000000000
--- a/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e174b6e7d195d5a7465575641b7f68581f162574 Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 27 Jun 2019 13:10:47 +0800
-Subject: [PATCH] dc: fix exit code of q command
-
-The exit code for "echo q | dc" is 1 for dc-1.4.1;
-while the exit code for "echo q | dc" is 0 for dc-1.4.
-
-Here is the answer from ken@gnu.org:
-dc-1.4 was right.  There was a rewrite of a chunk of code for 1.4.1 to
-fix a corner case in the Q command, and somehow the placement of the
-clean-up label for the 'q' command got misplaced on the error-handling
-branch instead of the clean-exit branch.  The patch below fixes this
-(it is committed for whenever the next bc/dc release gets made).
-
-Thanks for the report,
-        --Ken Pizzini
-
-Upstream-Status: Backport [Got the solution from maintainer]
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- dc/eval.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dc/eval.c b/dc/eval.c
-index 05a3d9e..bcab8db 100644
---- a/dc/eval.c
-+++ b/dc/eval.c
-@@ -814,10 +814,10 @@ error_fail:
- 	fprintf(stderr, "%s: ", progname);
- 	perror("error reading input");
- 	return DC_FAIL;
--reset_and_exit_quit:
- reset_and_exit_fail:
- 	signal(SIGINT, sigint_default);
- 	return DC_FAIL;
-+reset_and_exit_quit:
- reset_and_exit_success:
- 	signal(SIGINT, sigint_default);
- 	return DC_SUCCESS;
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/bc/bc/libmath.h b/meta/recipes-extended/bc/bc/libmath.h
deleted file mode 100644
index 63e1acb9ef5..00000000000
--- a/meta/recipes-extended/bc/bc/libmath.h
+++ /dev/null
@@ -1,46 +0,0 @@
-{"@iK20:s2:p@r",
-"@iF1,5.6,7,8,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C1,0:",
-"s14:pl7:s0:pl14:RN1:l5:0<Z2:1s12:pl5:ns5:pN2:l2:s15:pK6:l15:+",
-"K.44:l5:*+s13:pl5:cS1+s2:pN3:l5:1>Z4:l10:1+s10:pl5:K2:/s5:pl2:",
-"1+s2:pJ3:N4:l13:s2:p1l5:+s14:pl5:s6:p1s8:pK2:s11:pN6:1B7:J5:N8:",
-"l11:i11:pJ6:N7:l6:l5:*s6:l8:l11:*s8:/s9:pl9:0=Z9:l10:0>Z10:N11:",
-"l10:d10:Z12:l14:l14:*s14:pJ11:N12:N10:l15:s2:pl12:Z13:1l14:/R",
-"N13:l14:1/RN9:l14:l9:+s14:pJ8:N5:0R]@r",
-"@iF2,5.7,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C2,0:",
-"s14:pl7:s0:pl14:RN1:l5:0{Z2:1K10:l2:^-1/RN2:l2:s15:pK6:l2:+s2:",
-"pK2:s10:p0s11:pN3:l5:K2:}Z4:l10:K2:*s10:pl5:cRs5:pJ3:N4:N5:l5:",
-"K.5:{Z6:l10:K2:*s10:pl5:cRs5:pJ5:N6:l5:1-l5:1+/s13:s14:pl13:l13:",
-"*s12:pK3:s11:pN8:1B9:J7:N10:l11:K2:+s11:pJ8:N9:l13:l12:*s13:l11:",
-"/s9:pl9:0=Z11:l10:l14:*s14:pl15:s2:pl14:1/RN11:l14:l9:+s14:pJ10:N7:",
-"0R]@r",
-"@iF3,5.7,9,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C3,0:",
-"s14:pl7:s0:pl14:RN1:l2:s15:pK1.1:l15:*K2:+s2:p1C4,0:s14:pl5:0",
-"<Z2:1s12:pl5:ns5:pN2:0s2:pl5:l14:/K2:+K4:/s13:pl5:K4:l13:*l14:",
-"*-s5:pl13:K2:%Z3:l5:ns5:pN3:l15:K2:+s2:pl5:s9:s14:pl5:nl5:*s16:",
-"pK3:s11:pN5:1B6:J4:N7:l11:K2:+s11:pJ5:N6:l9:l16:l11:l11:1-*/*",
-"s9:pl9:0=Z8:l15:s2:pl12:Z9:l14:n1/RN9:l14:1/RN8:l14:l9:+s14:p",
-"J7:N4:0R]@r",
-"@iF5,5.7,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C5,0:s14:pl7:s0:pl14:",
-"RN1:l2:s15:pl2:K1.2:*s2:pl5:1C4,0:K2:*+C3,0:s14:pl15:s2:pl14:",
-"1/R0R]@r",
-"@iF4,5.6,7,9,10,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:",
-"C4,0:s14:pl7:s0:pl14:RN1:1s12:pl5:0<Z2:1ns12:pl5:ns5:pN2:l5:1",
-"=Z3:l2:K25:{Z4:K.7853981633974483096156608:l12:/RN4:l2:K40:{Z5:",
-"K.7853981633974483096156608458198757210492:l12:/RN5:l2:K60:{Z6:",
-"K.785398163397448309615660845819875721049292349843776455243736",
-":l12:/RN6:N3:l5:K.2:=Z7:l2:K25:{Z8:K.1973955598498807583700497",
-":l12:/RN8:l2:K40:{Z9:K.1973955598498807583700497651947902934475",
-":l12:/RN9:l2:K60:{Z10:K.197395559849880758370049765194790293447585103787852101517688",
-":l12:/RN10:N7:l2:s15:pl5:K.2:>Z11:l15:K5:+s2:pK.2:C4,0:s6:pN11:",
-"l15:K3:+s2:pN12:l5:K.2:>Z13:l10:1+s10:pl5:K.2:-1l5:K.2:*+/s5:",
-"pJ12:N13:l5:s13:s14:pl5:nl5:*s16:pK3:s11:pN15:1B16:J14:N17:l11:",
-"K2:+s11:pJ15:N16:l13:l16:*s13:l11:/s9:pl9:0=Z18:l15:s2:pl10:l6:",
-"*l14:+l12:/RN18:l14:l9:+s14:pJ17:N14:0R]@r",
-"@iF6,13,5.6,7,8,9,10,11,12,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl13:",
-"l5:C6,00:s14:pl7:s0:pl14:RN1:l2:s15:p0s2:pl13:1/s13:pl13:0<Z2:",
-"l13:ns13:pl13:K2:%1=Z3:1s12:pN3:N2:1s10:pK2:s11:pN5:l11:l13:{",
-"B6:J4:N7:l11:i11:pJ5:N6:l10:l11:*s10:pJ7:N4:K1.5:l15:*s2:pl5:",
-"l13:^K2:l13:^/l10:/s10:p1s9:s14:pl5:nl5:*K4:/s16:pK1.5:l15:*l10:",
-"cL+l10:cS-s2:p1s11:pN9:1B10:J8:N11:l11:i11:pJ9:N10:l9:l16:*l11:",
-"/l13:l11:+/s9:pl9:0=Z12:l15:s2:pl12:Z13:l10:nl14:*1/RN13:l10:",
-"l14:*1/RN12:l14:l9:+s14:pJ11:N8:0R]@r",0}
diff --git a/meta/recipes-extended/bc/bc/no-gen-libmath.patch b/meta/recipes-extended/bc/bc/no-gen-libmath.patch
deleted file mode 100644
index c4cce587593..00000000000
--- a/meta/recipes-extended/bc/bc/no-gen-libmath.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-These rules are not cross-friendly so delete them and we'll generate the file offline.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/bc/Makefile.am b/bc/Makefile.am
-index d9d412e..f244241 100644
---- a/bc/Makefile.am
-+++ b/bc/Makefile.am
-@@ -31,14 +31,6 @@ global.o: libmath.h
- 
- fbcOBJ = main.o bc.o scan.o execute.o load.o storage.o util.o warranty.o
- 
--libmath.h: libmath.b $(fbcOBJ) $(LIBBC)
--	echo '{0}' > libmath.h
--	$(MAKE) global.o
--	$(LINK) -o fbc $(fbcOBJ) global.o $(LIBBC) $(LIBL) $(READLINELIB) $(LIBS)
--	./fbc -c $(srcdir)/libmath.b </dev/null >libmath.h
--	$(srcdir)/fix-libmath_h
--	rm -f ./fbc ./global.o
--
- sbcOBJ = main.o sbc.o scan.o execute.o global.o load.o storage.o util.o \
-          warranty.o
- sbc.o: sbc.c
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.08.1.bb
similarity index 72%
rename from meta/recipes-extended/bc/bc_1.07.1.bb
rename to meta/recipes-extended/bc/bc_1.08.1.bb
index 74387c50abe..473d78d8a77 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.08.1.bb
@@ -6,19 +6,15 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://bc/bcdefs.h;endline=17;md5=4295c06df9e833519a342f7b5d43db06 \
-                    file://dc/dc.h;endline=18;md5=36b8c600b63ee8c3aeade2764f6b2a4b \
+                    file://dc/dc.h;endline=18;md5=bad31533d57fe5948c996f9ef6643206 \
                     file://lib/number.c;endline=20;md5=cf43068cc88f837731dc53240456cfaf"
 
 SECTION = "base"
 DEPENDS = "flex-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://no-gen-libmath.patch \
-           file://libmath.h \
-           file://0001-dc-fix-exit-code-of-q-command.patch \
            file://run-ptest"
-SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
-SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
+SRC_URI[sha256sum] = "b71457ffeb210d7ea61825ff72b3e49dc8f2c1a04102bbe23591d783d1bfe996"
 
 inherit autotools texinfo update-alternatives ptest
 
@@ -26,10 +22,6 @@ PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 
-do_compile:prepend() {
-    cp -f ${UNPACKDIR}/libmath.h ${B}/bc/libmath.h
-}
-
 do_install_ptest() {
         install ${S}/Test/*.b ${D}${PTEST_PATH}
 }
-- 
2.39.5


