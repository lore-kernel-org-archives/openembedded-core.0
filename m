Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id C03B07493E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:12 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 19-v6so787762itw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gEKREUvkRY3UERZ+JPXVSvQn85CCekmMdoe+xAt6gGA=;
	b=D1u2/vroAcJ2I8Bm5KBBoitw3sm9aCeIP8kh8mk0wV+vP5m0hOFZ7HGDaJTlL2q5qv
	RyCG1z8YxNg/lGEaRC8GJfah/3dARO16Hs7McDoH1jAnqfgZdXiw+Ke9nVenkIoItgDU
	A/49XeoCIb1z33WPpRXcd6PRH8UP070SOJSDUr3Y67U3tJ2OlNQM3BEna/qnxuANbMvS
	Bc921ICpYPKyJ0wIpPd5JHF+yQ2n8qrMPlE8Ctk/aX0ddrqgDSzW62IgdXPJQZPky2RE
	2wgJE0Nv5zHdaA1zX7JV1jbCYAqJC17IC5BaEHdDokMaLN+wVm2AG0kpVWbHzs8N+qSR
	//vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gEKREUvkRY3UERZ+JPXVSvQn85CCekmMdoe+xAt6gGA=;
	b=Dgf5PXqterLlP/QtfP+LSSnNFJ5ipjjKw+87qp2Rfv4lzuVhtgEIt1O/JclRnJWdqB
	Zhv7lGs9HSNT8ZjBc5k3QAiIncK2aAx2+AvapwYRZOa9Gl6y0Ps62fn+wq7a500XEZY+
	rv2f+eGvNUeuhIyIxlbIXI63d21bUZCZITgN1JRFJXPemQlVSH7CODeUgP1ArDIrpWY0
	g4sdG3zmgjAm9pl4mqaXUmhx3pxfmH0MfjgovwrEySy0766uEe3fN8Fcf2BGIHj3pFEj
	rvxZuILaJPuSVSeV78/WTsGJUdd+b+jOoXolIttJCVj5fP+CJF1D4psmnYzG2vbsYfbw
	9yGg==
X-Gm-Message-State: ALQs6tA+E3wEUasT7tOjbwBWuE4AUw4ZsSu9i3ij3qD5YMrXa1xz1UFL
	FBySQWgTFv1CBEYoRQFc5yOfpkpc
X-Google-Smtp-Source: AIpwx4/NpyMxE2SJen92oDHmBLMOtq8vIY/pe1FKXy+XxMZHKQOJOaDd9MjiRsYNDrK+/0bCAX5Hzw==
X-Received: by 2002:a24:39c8:: with SMTP id
	l191-v6mr1985225ita.81.1523413333791; 
	Tue, 10 Apr 2018 19:22:13 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:56 -0500
Message-Id: <20180411022200.22277-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 3/7] icecc-create-env: Fix library interpreter usage
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:13 -0000

Shared libraries sometimes (frequently?) don't have a program
interpreter specified. The previous code would fail to find the library
dependencies in these cases because no interpreter could be found.
Commonly, this meant that if a library depends on another library, it
might not be included toolchain because dependency scanning stops with
the first one.

Instead, capture the program interpreter from the program or library
that starts the dependency chain and use that interpreter to get all of
the dependencies in the chain, recursively.

Additionally, if no interpreter can be found, fallback to using ldd

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env              | 112 ++++++++++++++-------
 1 file changed, 77 insertions(+), 35 deletions(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 3015f4e2155..b88c53a424b 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -99,48 +99,90 @@ normalize_path ()
     echo $path
 }
 
-add_file ()
+add_file_common()
+{
+    local p="$1"
+    local path="$2"
+    local alias="$3"
+
+    add_alias "$path" "$p"
+    if test -n "$alias"; then
+        add_alias "$path" "$alias"
+    fi
+
+    add_path "$path" || return 1
+    print_debug "Adding file '$path'"
+
+    return 0
+}
+
+add_deps()
+{
+    local path="$1"
+    local interp="$2"
+
+    if test -n "$interp" && test -x "$interp"; then
+        # Use the dynamic loaders --list argument to list the
+        # dependencies. The program may have a different program
+        # interpreter (typical when using uninative tarballs), which is
+        # why we can't just call ldd.
+        deps="`$interp --list "$path"`"
+    else
+        deps="`ldd "$path"`"
+    fi
+
+    print_debug "Dependencies are:"
+    print_debug "$deps"
+    if test -n "$deps"; then
+        for lib in $deps; do
+            # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl
+            # based glibc this regexp parse the outputs like:
+            # ldd /usr/bin/gcc
+            #         linux-gate.so.1 =>  (0xffffe000)
+            #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
+            #         /lib/ld-linux.so.2 (0xb7fe8000)
+            # covering both situations ( with => and without )
+            lib="`echo "$lib" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`"
+
+            test -f "$lib" || continue
+            # Check whether the same library also exists in the parent
+            # directory, and prefer that on the assumption that it is a
+            # more generic one.
+            local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
+            test -f "$baselib" && lib=$baselib
+            add_dependency "$lib" "$interp"
+        done
+    fi
+}
+
+add_dependency()
 {
     local p=`normalize_path $1`
     # readlink is required for Yocto, so we can use it
     local path=`readlink -f "$p"`
+    local interp="$2"
 
-    add_alias "$path" "$p"
-    if test -n "$2"; then
-        add_alias "$path" "$2"
+    add_file_common "$p" "$path" || return
+
+    if test -x "$path" && is_dynamic_elf "$path"; then
+        add_deps "$path" "$interp"
     fi
+}
 
-    add_path "$path" || return
-
-    if test -x "$path"; then
-        # Only call ldd when it makes sense
-        if is_dynamic_elf "$path"; then
-            # Request the program interpeter (dynamic loader)
-            interp=`readelf -w -l "$path" | grep "Requesting program interpreter:" | sed "s/\s*\[Requesting program interpreter:\s*\(.*\)\]/\1/g"`
-
-            if test -n "$interp" && test -x "$interp"; then
-                # Use the dynamic loaders --list argument to list the
-                # depenencies. The program may have a a different program
-                # interpeter (typical when using uninative tarballs), which is
-                # why we can't just call ldd.
-                #
-                # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
-                # this regexp parse the outputs like:
-                # ldd /usr/bin/gcc
-                #         linux-gate.so.1 =>  (0xffffe000)
-                #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
-                #         /lib/ld-linux.so.2 (0xb7fe8000)
-                # covering both situations ( with => and without )
-                for lib in `$interp --list "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
-                    test -f "$lib" || continue
-                    # Check wether the same library also exists in the parent directory,
-                    # and prefer that on the assumption that it is a more generic one.
-                    local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
-                    test -f "$baselib" && lib=$baselib
-                    add_file "$lib"
-                done
-            fi
-        fi
+add_file ()
+{
+    local p=`normalize_path $1`
+    # readlink is required for Yocto, so we can use it
+    local path=`readlink -f "$p"`
+
+    add_file_common "$p" "$path" "$2" || return
+
+    if test -x "$path" && is_dynamic_elf "$path"; then
+        # Request the program interpeter (dynamic loader)
+        interp=`readelf -W -l "$path" | grep "Requesting program interpreter:" | sed "s/\s*\[Requesting program interpreter:\s*\(.*\)\]/\1/g"`
+        print_debug "Interpreter is '$interp'"
+
+        add_deps "$path" "$interp"
     fi
 }
 
-- 
2.14.3


