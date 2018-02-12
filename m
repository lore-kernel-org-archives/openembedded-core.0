Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 071C97826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:27 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f89so17954866ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kHAtQNzXkEJvyGGOPkiK96EZxUmEI4kNrDFJ93cdXtI=;
	b=GuHfT6lfQJtrhUf1DdpaO075bF0NWiBjR9Wp5+xBcEh/LmYKUm75/wWJxl+HAoOZaS
	lWowza5eroiTlMP7N1Ld50c2OrV3jhe9TxSB6iGNUzgEwV/4RWZEQTL4t8oXpnnEBXnm
	z3GOyskUoq15PUbwuGOB7+xtco58eZwcBfNL9jCAqo0jlgtr+Z2l1iIZLrA7+GuM6JB6
	fTLXKT+WQ50kATcsvMAmh6Pq+lTpciFzXqWtuZlWNmiGeiXN9SI7yD73y/DvM3FXDd5e
	h9LKVmaBBIT+XR+8fWCoajGfyI9eqcRZbkwRo1WFRxsIOwtMGYp/y9MuntUmipW8WyvL
	76sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kHAtQNzXkEJvyGGOPkiK96EZxUmEI4kNrDFJ93cdXtI=;
	b=ez389Q/ywDopHifSNpsFLgmfuP3kEg/2cCsnxQnNOiBNqmlM81KxkA5tmIRPT1SQ6o
	kEQminY9w9tfI+3OtP3BRtumNkZLM5BNmdMIvjwIKcDmNNkJTaqC3ziJgjV2lqReljHN
	fPwQONENePqpXKzlh5mVm6t+BUUzF2vuKbgJKyBY6tbcoW5suIgAOsNi+56+2gD2/e/x
	E2pexg86DxmIYLmcUJ6KGPhnEe+fGLWEi0SkFzoUAmNVsizviubbvhsoNDq6ZnDxcCLB
	WRUnIxwxjwMR3718TykXXhK/jrf8krPjfqdPrdeMSInx6frAJJxYW3Xe7eAaiyDhiOon
	ewFg==
X-Gm-Message-State: APf1xPCzO9kNfmOROAS+PYyLnRhooVORZ2KuZTrnT8BPE3MT8GHMSB5P
	3i+AUp1DeF3GTTXn9ybeW6VGYoj9
X-Google-Smtp-Source: AH8x225UYuiWDs/ZnE9t0EUwy9EZ77lVrtCb2kawSG7G00YoS7S4M3eV1eWgVhfHWxHDj266DG0WVQ==
X-Received: by 10.107.157.66 with SMTP id g63mr8598307ioe.108.1518454348856;
	Mon, 12 Feb 2018 08:52:28 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:01 -0600
Message-Id: <1a97b2196f183b7bdef75b32ba3ed994a17b7f3b.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 06/17] icecc-create-env: Use program interpreter for deps
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:28 -0000

ldd cannot always be used to determine a program's dependencies
correctly, particularly when the program specifies an alternate program
interpreter (dynamic loader). This commonly happens when using a
uninative tarball. Instead, determine the program's requested
interpreter, and ask it to list the dependencies.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env                | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index c838256f748..7636d090a48 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -6,6 +6,12 @@
 
 target_files=
 
+is_dynamic_elf ()
+{
+    # Is the file an dynamically linked ELF executable?
+    (file -L "$1" | grep 'ELF' > /dev/null 2>&1) && (! file -L "$1" | grep 'static' > /dev/null 2>&1)
+}
+
 is_contained ()
 {
     case " $target_files " in
@@ -34,8 +40,16 @@ add_file ()
     target_files="$target_files $toadd"
     if test -x "$path"; then
         # Only call ldd when it makes sense
-        if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
-            if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
+        if is_dynamic_elf "$path"; then
+            # Request the program interpeter (dynamic loader)
+            interp=`readelf -w -l "$path" | grep "Requesting program interpreter:" | sed "s/\s*\[Requesting program interpreter:\s*\(.*\)\]/\1/g"`
+
+            if test -n "$interp" && test -x "$interp"; then
+                # Use the dynamic loaders --list argument to list the
+                # depenencies. The program may have a a different program
+                # interpeter (typical when using uninative tarballs), which is
+                # why we can't just call ldd.
+                #
                 # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
                 # this regexp parse the outputs like:
                 # ldd /usr/bin/gcc
@@ -43,7 +57,7 @@ add_file ()
                 #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
                 #         /lib/ld-linux.so.2 (0xb7fe8000)
                 # covering both situations ( with => and without )
-                for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
+                for lib in `$interp --list "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
                     test -f "$lib" || continue
                     # Check wether the same library also exists in the parent directory,
                     # and prefer that on the assumption that it is a more generic one.
-- 
2.14.3


