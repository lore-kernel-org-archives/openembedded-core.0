Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B6CECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.51891.1661624771184284628
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=guANZS/q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so9623842pjq.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=0PPsPT3O4fXG+wpVfS3F98GjkqOJhHQEYxmXDF6hjHQ=;
        b=guANZS/qmuBHyyL6px9GUyklcPPlR3CKYryNrPQ6lkLis3TRGxIZOPIVVReqfNseFy
         0yCQgsUpiJh2oBnV4EKltGJ9NseKLhLLOHxlvv6ol0d/UKssiOKOSfiTn0VvoAp1SIPD
         aSzj9JUj/2bE8hQNiOXiNgEqQCcYQAcvn8RhSzM2t2YFKVj2tp5q4f/yHFAWnwo6hnkB
         tTsH4TRI9ZwdabHAMIRkBae8CqgGScCC09xbDeS1+Jj+5jvDH7fzSRP8FJ7VDd3NU8Sk
         23WdonDMrZYRIjP5hLbaI3fHmcoTqwUXpUQVqnItz3cyS6f/d/oaTVnQ+mrRtCO1LYbT
         phwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=0PPsPT3O4fXG+wpVfS3F98GjkqOJhHQEYxmXDF6hjHQ=;
        b=hhuCurtYySJ7ctFWizIJ2psMkZ04MNgMHS5XRnuYRJ9ZzRww1XfJs7dnc+Nffr1Lbs
         HDSh3sV3eAikuhKusKPkvhCceC4O5LY2xZBeYlGIy3LMp/KfhkpImaqk7ul/tNTjfHvu
         Zq+6eEOEVU07dz7+Kv1BYZcxRGUg/w9uoxGx8JkOGlL8S9JeX68kZr/RCB86tTy5HUry
         +xWzgcT7qj/ao3OYeMNpx/PApflrmId7kK4AsBU6n5pj2Muz6jcSb8aosgkmv/U5g8kf
         OUtyDAfijaenjf8UIbCa2hcktbhvA9x2YXg+dilyl+nPJ8xADr4Y8CWGZ7qcIuGCahW+
         mxSA==
X-Gm-Message-State: ACgBeo3snie6I3ZDSXZ0Q6iBPgXIqaU1TnZJ+Ea5xM61QL07f38oJaOg
	PqGJ1CdOXhyI6uyrfJSsDamqR+A3sxxJNmSD
X-Google-Smtp-Source: 
 AA6agR4nySgKn2c8mszLG3+CJY6n4F2Uu28nrN3aNRSbaFZgDGJ0WLGRidPqo9brcg9o3yKEHxnzFQ==
X-Received: by 2002:a17:90a:4d8d:b0:1fa:9cc6:3408 with SMTP id
 m13-20020a17090a4d8d00b001fa9cc63408mr10044549pjh.245.1661624770053;
        Sat, 27 Aug 2022 11:26:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/24] xz: update 5.2.5 -> 5.2.6
Date: Sat, 27 Aug 2022 08:25:27 -1000
Message-Id: 
 <a2a89c73ca7f775c351439cc1b626e96b3bd5c3b.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169944

From: Alexander Kanavin <alex.kanavin@gmail.com>

5.2.6 (2022-08-12)

    * xz:

        - The --keep option now accepts symlinks, hardlinks, and
          setuid, setgid, and sticky files. Previously this required
          using --force.

        - When copying metadata from the source file to the destination
          file, don't try to set the group (GID) if it is already set
          correctly. This avoids a failure on OpenBSD (and possibly on
          a few other OSes) where files may get created so that their
          group doesn't belong to the user, and fchown(2) can fail even
          if it needs to do nothing.

        - Cap --memlimit-compress to 2000 MiB instead of 4020 MiB on
          MIPS32 because on MIPS32 userspace processes are limited
          to 2 GiB of address space.

    * liblzma:

        - Fixed a missing error-check in the threaded encoder. If a
          small memory allocation fails, a .xz file with an invalid
          Index field would be created. Decompressing such a file would
          produce the correct output but result in an error at the end.
          Thus this is a "mild" data corruption bug. Note that while
          a failed memory allocation can trigger the bug, it cannot
          cause invalid memory access.

        - The decoder for .lzma files now supports files that have
          uncompressed size stored in the header and still use the
          end of payload marker (end of stream marker) at the end
          of the LZMA stream. Such files are rare but, according to
          the documentation in LZMA SDK, they are valid.
          doc/lzma-file-format.txt was updated too.

        - Improved 32-bit x86 assembly files:
            * Support Intel Control-flow Enforcement Technology (CET)
            * Use non-executable stack on FreeBSD.

        - Visual Studio: Use non-standard _MSVC_LANG to detect C++
          standard version in the lzma.h API header. It's used to
          detect when "noexcept" can be used.

    * xzgrep:

        - Fixed arbitrary command injection via a malicious filename
          (CVE-2022-1271, ZDI-CAN-16587). A standalone patch for
          this was released to the public on 2022-04-07. A slight
          robustness improvement has been made since then and, if
          using GNU or *BSD grep, a new faster method is now used
          that doesn't use the old sed-based construct at all. This
          also fixes bad output with GNU grep >= 3.5 (2020-09-27)
          when xzgrepping binary files.

          This vulnerability was discovered by:
          cleemy desu wayo working with Trend Micro Zero Day Initiative

        - Fixed detection of corrupt .bz2 files.

        - Improved error handling to fix exit status in some situations
          and to fix handling of signals: in some situations a signal
          didn't make xzgrep exit when it clearly should have. It's
          possible that the signal handling still isn't quite perfect
          but hopefully it's good enough.

        - Documented exit statuses on the man page.

        - xzegrep and xzfgrep now use "grep -E" and "grep -F" instead
          of the deprecated egrep and fgrep commands.

        - Fixed parsing of the options -E, -F, -G, -P, and -X. The
          problem occurred when multiple options were specied in
          a single argument, for example,

              echo foo | xzgrep -Fe foo

          treated foo as a filename because -Fe wasn't correctly
          split into -F -e.

        - Added zstd support.

    * xzdiff/xzcmp:

        - Fixed wrong exit status. Exit status could be 2 when the
          correct value is 1.

        - Documented on the man page that exit status of 2 is used
          for decompression errors.

        - Added zstd support.

    * xzless:

        - Fix less(1) version detection. It failed if the version number
          from "less -V" contained a dot.

    * Translations:

        - Added new translations: Catalan, Croatian, Esperanto,
          Korean, Portuguese, Romanian, Serbian, Spanish, Swedish,
          and Ukrainian

        - Updated the Brazilian Portuguese translation.

        - Added French man page translation. This and the existing
          German translation aren't complete anymore because the
          English man pages got a few updates and the translators
          weren't reached so that they could update their work.

    * Build systems:

        - Windows: Fix building of resource files when config.h isn't
          used. CMake + Visual Studio can now build liblzma.dll.

        - Various fixes to the CMake support. Building static or shared
          liblzma should work fine in most cases. In contrast, building
          the command line tools with CMake is still clearly incomplete
          and experimental and should be used for testing only.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e3782f4d66973cb7ab922d4bbc6ef6241756ed2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xz/xz/CVE-2022-1271.patch                 | 96 -------------------
 .../xz/{xz_5.2.5.bb => xz_5.2.6.bb}           |  7 +-
 2 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch
 rename meta/recipes-extended/xz/{xz_5.2.5.bb => xz_5.2.6.bb} (88%)

diff --git a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
deleted file mode 100644
index e43e73cf12..0000000000
--- a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From dc932a1e9c0d9f1db71be11a9b82496e3a72f112 Mon Sep 17 00:00:00 2001
-From: Lasse Collin <lasse.collin@tukaani.org>
-Date: Tue, 29 Mar 2022 19:19:12 +0300
-Subject: [PATCH] xzgrep: Fix escaping of malicious filenames (ZDI-CAN-16587).
-
-Malicious filenames can make xzgrep to write to arbitrary files
-or (with a GNU sed extension) lead to arbitrary code execution.
-
-xzgrep from XZ Utils versions up to and including 5.2.5 are
-affected. 5.3.1alpha and 5.3.2alpha are affected as well.
-This patch works for all of them.
-
-This bug was inherited from gzip's zgrep. gzip 1.12 includes
-a fix for zgrep.
-
-The issue with the old sed script is that with multiple newlines,
-the N-command will read the second line of input, then the
-s-commands will be skipped because it's not the end of the
-file yet, then a new sed cycle starts and the pattern space
-is printed and emptied. So only the last line or two get escaped.
-
-One way to fix this would be to read all lines into the pattern
-space first. However, the included fix is even simpler: All lines
-except the last line get a backslash appended at the end. To ensure
-that shell command substitution doesn't eat a possible trailing
-newline, a colon is appended to the filename before escaping.
-The colon is later used to separate the filename from the grep
-output so it is fine to add it here instead of a few lines later.
-
-The old code also wasn't POSIX compliant as it used \n in the
-replacement section of the s-command. Using \<newline> is the
-POSIX compatible method.
-
-LC_ALL=C was added to the two critical sed commands. POSIX sed
-manual recommends it when using sed to manipulate pathnames
-because in other locales invalid multibyte sequences might
-cause issues with some sed implementations. In case of GNU sed,
-these particular sed scripts wouldn't have such problems but some
-other scripts could have, see:
-
-    info '(sed)Locale Considerations'
-
-This vulnerability was discovered by:
-cleemy desu wayo working with Trend Micro Zero Day Initiative
-
-Thanks to Jim Meyering and Paul Eggert discussing the different
-ways to fix this and for coordinating the patch release schedule
-with gzip.
-
-Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
-CVE: CVE-2022-1271
-
-Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
----
- src/scripts/xzgrep.in | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/src/scripts/xzgrep.in b/src/scripts/xzgrep.in
-index 9db5c3a..f64dddb 100644
---- a/src/scripts/xzgrep.in
-+++ b/src/scripts/xzgrep.in
-@@ -179,22 +179,26 @@ for i; do
-          { test $# -eq 1 || test $no_filename -eq 1; }; then
-       eval "$grep"
-     else
-+      # Append a colon so that the last character will never be a newline
-+      # which would otherwise get lost in shell command substitution.
-+      i="$i:"
-+
-+      # Escape & \ | and newlines only if such characters are present
-+      # (speed optimization).
-       case $i in
-       (*'
- '* | *'&'* | *'\'* | *'|'*)
--        i=$(printf '%s\n' "$i" |
--            sed '
--              $!N
--              $s/[&\|]/\\&/g
--              $s/\n/\\n/g
--            ');;
-+        i=$(printf '%s\n' "$i" | LC_ALL=C sed 's/[&\|]/\\&/g; $!s/$/\\/');;
-       esac
--      sed_script="s|^|$i:|"
-+
-+      # $i already ends with a colon so don't add it here.
-+      sed_script="s|^|$i|"
- 
-       # Fail if grep or sed fails.
-       r=$(
-         exec 4>&1
--        (eval "$grep" 4>&-; echo $? >&4) 3>&- | sed "$sed_script" >&3 4>&-
-+        (eval "$grep" 4>&-; echo $? >&4) 3>&- |
-+            LC_ALL=C sed "$sed_script" >&3 4>&-
-       ) || r=2
-       exit $r
-     fi >&3 5>&-
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
similarity index 88%
rename from meta/recipes-extended/xz/xz_5.2.5.bb
rename to meta/recipes-extended/xz/xz_5.2.6.bb
index 720e070f4a..3482622471 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -24,11 +24,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
-           file://CVE-2022-1271.patch \
-           "
-SRC_URI[md5sum] = "0d270c997aff29708c74d53f599ef717"
-SRC_URI[sha256sum] = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI[sha256sum] = "a2105abee17bcd2ebd15ced31b4f5eda6e17efd6b10f921a01cda4a44c91b3a0"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.25.1


