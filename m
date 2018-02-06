Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id C11B07842E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:19 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f34so4123662ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BBUZoySi23Cd7jcmfdQ3xjjjEmjapO8HAHQiY9h75P4=;
	b=DjgC628F3wNokhT3Hn3uU7JM+3ZJ4gPDlukmzqT+H74gMH4kDDwPY69p2xEPAiAD7z
	rjb+8fggF61nCiJx+JI5+kPiyk2+h9bFSHUpMcmBffp11Xfu4FNDd2l7lY+RWGi5KP5W
	5+GGtY6ib3AeFk8RlE8LgtDQ7rgVrMUznFHWIPhu/9NZs3NRdNws/DCEqprmHUCamnUj
	Gic7J6Zpqc0mzX3xZQLgm4D8vkNEhG4WA6xKQVebbLZYrCUeFxPVFPW0V5GVJOwBzNqp
	CrN3CfKZ73af/SHuLCQGgNHlfVUlINiaGsuHgaJ5XwK1YYWMOq8KeVO0XvuRjypCejhm
	6zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BBUZoySi23Cd7jcmfdQ3xjjjEmjapO8HAHQiY9h75P4=;
	b=ifHksp4v1xPBYZAMAPlbZJ5hDuBKh1a6R/XvrjDXdixr6VuGeMZ/1HfpILpkrxgPqb
	qRzpbQTrKx2MBfICopJsF/xHIW3+phqaO3B9sXcQ5fYGA1sONz6Q+uaa/XMDaEhz4Ein
	9wVp/faby+VFhDgDfIc3jZW6EDv6xd/hhLnaWLxi8wOQQjzEQqUksXMksONrp9EMX4uF
	6Bztd0eGtWr4RQ/Mvb7srd+3Ez8OeO7Tzi8Rh5lE2/lAtKTqvskLfMIEXy1rvxpDZ1Gr
	wDL02mizr1git3RKbTFRTNV9ySv38vdTXp9P4ez1r6bqle1lnZMsLr7NXmcAnGvy47AY
	uejg==
X-Gm-Message-State: APf1xPDxaSzNDugv8bH5s+ZJcVlbL3+yqrGkTT7TPy9a26l+pSVqMRQ9
	x+v0BD/zFU/Mt1nXh2/PBFEavNCY
X-Google-Smtp-Source: AH8x225X6dfpvFC3EY/aot/o2vy80unBFrUogsBg/nFTlLA8Y90+s7iBncVzgaPSX8r8JWu3b0XCvA==
X-Received: by 10.107.26.204 with SMTP id a195mr4788170ioa.17.1517954600441;
	Tue, 06 Feb 2018 14:03:20 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:25 -0600
Message-Id: <3864b702a187b9e71a291ff4f7e16d7cd7e4f172.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 06/14] icecc-create-env: Use program interpreter for deps
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:19 -0000

ldd cannot always be used to determine a programs dependencies
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


