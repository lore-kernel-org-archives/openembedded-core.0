Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71968C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 05:42:19 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.12431.1706938934140819665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 21:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bmimj4+n;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d731314e67so20618105ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 21:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706938933; x=1707543733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=As231KcACqVydhBoppru2623O611kZYpMrOv8vJJWOI=;
        b=bmimj4+nIvnPg00sNcLXlI2rzNc49kshgMhdgKkq0cnRCYwmpEN/yNpgI/dR7GQeB6
         nEYTHN1cEszq6liev6XuMQn0tn4usl0msPYcSdWdBKQr0G4TlWwHARCzajLTPaixrUV/
         c076PXkKR/KP5vLA0htetqRWyDDAWUItw9tPkX7tfBUnbeRskEs2V99oRQrA5Bne6xU3
         wIVrKlH+vx+hcJbiXw8HnwKJPtzn4HZq+tZACJRS+GFqVBHwqDXgVdXBQbQ5f9fLXf1V
         BDHBadWCFlFRE6DH6kzEEWjKK6vxg8eLPR+4i46y9MOip+THbuALuQ+0YTp5XBaNO3f7
         2xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706938933; x=1707543733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=As231KcACqVydhBoppru2623O611kZYpMrOv8vJJWOI=;
        b=saqV6qL3VHaOlmDGSs19YK8Wp47Uh4IdBbHk6ltywrK/VUA4ZPbemFhXo8bpGljZc2
         NOpziWCTrfZPTge61n9XTOf57uEFWeXNXCqYZ7xpjA6q9pUf9MJIKT23tSz/ds0IdCzM
         o6ZRB4ASuiBYAoIpfOkaOjyyPXz++tIo6D7KrKIDrzKlr0rAVbyPXkVpdVMEsrvqS3Zb
         3fDSltkZ3Axh76bM0QoGCqXEo5+HMfx1nHlBznUbk8F3lJPVxc20acoqEeAZrabW/bEm
         gVTP2dh5QGzeDR9zkeB8JxLoq0s4myzQ+1hVXUUUYSze37x19Z0R3GV0GY2zgG8IaCOl
         t0wA==
X-Gm-Message-State: AOJu0YxUlcXZtNZIR6Ak4ZTdc60sTeVOhoHXNSbof8h90LENPDcaerV7
	VASruhHCxQFNVMyRuGr0KG1q5zVx/ZWGPXRjx42dODOBcCbt+y4igiIBDxd2
X-Google-Smtp-Source: AGHT+IHoqMeXGhz9HxN5OUfLQ86tEO5yWZnxXSZ/7p9WbWJBofC34XubT9M0hfAIiLqp5ooZE9oJoQ==
X-Received: by 2002:a17:902:cf4c:b0:1d9:8820:f413 with SMTP id e12-20020a170902cf4c00b001d98820f413mr1727108plg.38.1706938933027;
        Fri, 02 Feb 2024 21:42:13 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:a920:de11:73dd:f99e])
        by smtp.gmail.com with ESMTPSA id lc7-20020a170902fa8700b001d95a6afbc2sm2506831plb.244.2024.02.02.21.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 21:42:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] libxml-parser-perl: upgrade 2.46 -> 2.47
Date: Fri,  2 Feb 2024 21:38:49 -0800
Message-Id: <20240203053848.64405-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 05:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194828

* Drop CheckLib.pm patch; no longer applies
* Change to CPAN_MIRROR for SRC_URI
* Drop SRC_URI[md5sum]
* Drop redundant ptest-perl/run-ptest; ptest-perl inherit does this
* Drop sed for Expat/Makefile; no longer shipped
* Inherit pkgconfig to find expat lib
* Patch Makefile.PL to not try to load host expat

License-Update: Use LICENSE file; change to Artistic-2.0

https://metacpan.org/dist/XML-Parser/changes
2.47 2023-12-28 (by Todd Rinaldo)
    - #84 use $fh instead of $foo
	- #85 Fix typo in documentation
	- #89 Devel::CheckLib to from 0.99 -> 1.14
	- Devel::CheckLibn 1.16
	- #91 POD fix for verbatim text
	- #97 Add a LICENSE file
	- #94 Don't ship Expat/Makefile
	- Various github workflow improvements. Windows is still not working.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ot-attempt-to-run-a-cross-executable.patch | 24 ---------------
 ...ile.PL-make-check_lib-cross-friendly.patch | 28 +++++++++++++++++
 ...erl_2.46.bb => libxml-parser-perl_2.47.bb} | 30 +++++--------------
 3 files changed, 35 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.46.bb => libxml-parser-perl_2.47.bb} (51%)

diff --git a/meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch b/meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch
deleted file mode 100644
index c5bbe7888ed..00000000000
--- a/meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a033c9ece12b6eead48eed63f106ccdec6159b0c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 16:26:55 +0100
-Subject: [PATCH] CheckLib.pm: do not attempt to run a cross executable
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- inc/Devel/CheckLib.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/inc/Devel/CheckLib.pm b/inc/Devel/CheckLib.pm
-index 36a451a..b04acc1 100644
---- a/inc/Devel/CheckLib.pm
-+++ b/inc/Devel/CheckLib.pm
-@@ -330,7 +330,7 @@ sub assert_lib {
-         push @missing, $lib if $rv != 0 || !-x $exefile;
-         my $absexefile = File::Spec->rel2abs($exefile);
-         $absexefile = '"' . $absexefile . '"' if $absexefile =~ m/\s/;
--        push @wrongresult, $lib if $rv == 0 && -x $exefile && system($absexefile) != 0;
-+        push @wrongresult, $lib if $rv == 0 && -x $exefile && 0 != 0;
-         unlink $ofile if -e $ofile;
-         _cleanup_exe($exefile);
-     }
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch b/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch
new file mode 100644
index 00000000000..457fb773843
--- /dev/null
+++ b/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch
@@ -0,0 +1,28 @@
+From bd9b0e10843da72276982bd1394ade734fea0289 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 2 Feb 2024 21:15:34 -0800
+Subject: [PATCH] Makefile.PL: make check_lib cross friendly
+
+lib => qw(expat) does not seem to respect EXPATLIBPATH and
+EXPATINCPATH when we are cross-compiling.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ Makefile.PL | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.PL b/Makefile.PL
+index 505d1df..19f428b 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -30,7 +30,7 @@ foreach (@ARGV) {
+ 
+ unless (
+     check_lib(    # fill in what you prompted the user for here
+-        lib     => [qw(expat)],
++        #lib     => [qw(expat)],
+         header  => ['expat.h'],
+         incpath => $expat_incpath,
+         ( $expat_libpath ? ( libpath => $expat_libpath ) : () ),
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
similarity index 51%
rename from meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index 6cd40bd2929..f4f5ee8f953 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -1,39 +1,23 @@
 SUMMARY = "XML::Parser - A perl module for parsing XML documents"
 HOMEPAGE = "https://libexpat.github.io/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://Parser.pm;beginline=1;endline=7;md5=d12cc778c80fc4c518f0e5dee29fd5fb"
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4342f85bf14a1fdd6a751573f1e61c03"
 
 DEPENDS += "expat"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
            file://ptest-perl/run-ptest \
-           file://0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch \
+           file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
            "
-SRC_URI[md5sum] = "80bb18a8e6240fcf7ec2f7b57601c170"
-SRC_URI[sha256sum] = "d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d"
+
+SRC_URI[sha256sum] = "ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC='${CC}' LD='${CCLD}' FULL_AR='${AR}'"
 
-inherit cpan ptest-perl
-
-# fix up sub MakeMaker project as arguments don't get propagated though
-# see https://rt.cpan.org/Public/Bug/Display.html?id=28632
-do_configure:append:class-target() {
-	sed -E \
-	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' \
-	    -i Makefile Expat/Makefile
-}
-
-do_configure:append() {
-	sed -e 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' \
-	    -i Makefile Expat/Makefile
-	sed 's:^FULL_AR = .*:FULL_AR = ${AR}:g' -i Expat/Makefile
-	# make sure these two do not build in parallel
-	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i Expat/Makefile
-}
+inherit cpan pkgconfig ptest-perl
 
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-- 
2.34.1


