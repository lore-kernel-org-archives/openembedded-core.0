Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B804760110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 06:50:35 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u6so1040138pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cXchmvoXWQnauujIjWiFafc9oRDTWp9CXSc2tmpcqXA=;
	b=aPAv81iee1zwi/k2WnEfF45OSIH3MwWKeZU63+NfCRLl+1qI2Zl1HJMgAdDSYo6iku
	Pjlu25i0IvlVl/Uu2ZIXqwV4MBTbOCYrLi61sbTvBiLXOlFppAUOAwR4HFCgryG0lYQl
	MTCvAtUK9NFe3Em2DETrYTffEgFYlsSdMbU4Y3Qo0qk5oK73khqW2E7nLh1cBy6v9DEa
	7hk0rTTDmasvJwtfX+NOtbXQvcbQWPx8nPkVX/ZHZw1jRpIZ9KEUlpxl7lruHtEPm3m7
	RwDnvrs2uqYs3IR9snceAWnVC5r1sVzKnTOlgZOiPYlgLf/i4TIYYBKcaBx2YbiP48V4
	6Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cXchmvoXWQnauujIjWiFafc9oRDTWp9CXSc2tmpcqXA=;
	b=TYnJC6uec9ieBQF3JKPa7CngK3LmKgBvhlr7dfqT8R90Umtk2guhhFK1Huq6Xm/wIH
	E+TsgsW06S9llp+SuY13OpPElovmBiwQbGGrD8ytIP8iBef9CdHN1fChT9r2PkCXOC7N
	ugj+BFQYglKJfPytApLHuxhxEXf2fCu2yc3NcEoyznSjPDy6fS0LSj5Gd4ZvQ/jdrRz1
	fCmPiTL0X6uTcE8i3D+0y7MvZe1I2jkPRWDTrA8pQnqWgn0q+iYfmR7DAJy5BXw2ykqP
	/6+yjSUKrrKc9IPZgnZa0onfxExfK+HqT9b4NrmRvFw2asubTqOF3Ilf+Y+mHvTdJBr/
	4kRQ==
X-Gm-Message-State: AJcUukeKPrqCGvQ3KrbaPo03nnnIq8F2+yt6AQDO03PbBzZBCsCwYFAG
	/vaimD3nYgpKvxM0RJq/hixEq/B+
X-Google-Smtp-Source: ALg8bN6ho35xWAbG+NxSUdzF0QeyDhOTiICTCkNvQxS/L92CNl+bXIPtdXCeXsLKmMFcJL981xOYsA==
X-Received: by 2002:a63:7c41:: with SMTP id l1mr29978011pgn.45.1548917436295; 
	Wed, 30 Jan 2019 22:50:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	o85sm1080044pfi.105.2019.01.30.22.50.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 22:50:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:50:11 -0800
Message-Id: <20190131065016.21887-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] mpeg2dec: Fix global symbol tests
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
X-List-Received-Date: Thu, 31 Jan 2019 06:50:35 -0000
Content-Transfer-Encoding: 8bit

Rewrite the public symbol check to verify the shared libraries, to check for
more things, and to avoid duplication; fixes make check on ARM

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/61_global-symbol-test.patch         | 70 +++++++++++++++++++
 .../mpeg2dec/mpeg2dec_0.5.1.bb                |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch

diff --git a/meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch b/meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch
new file mode 100644
index 0000000000..00b667d336
--- /dev/null
+++ b/meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch
@@ -0,0 +1,70 @@
+Rewrite the public symbol check to verify the shared libraries, to check for
+more things, and to avoid duplication; fixes make check on ARM
+
+Taken From
+https://sources.debian.org/src/mpeg2dec/0.5.1-8/debian/patches/61_global-symbol-test.patch/
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/globals |   42 +++++++++++++++++++++++++++---------------
+ 1 file changed, 27 insertions(+), 15 deletions(-)
+
+--- mpeg2dec.orig/test/globals
++++ mpeg2dec/test/globals
+@@ -1,4 +1,8 @@
+ #!/bin/sh
++# TODO
++# - fix checking of .a libs; problem is that "nm -g --defined-only" lists
++#   internal symbols; this can be solved by using objdump, but it's probably
++#   good enough to just run the tests on the shared lib
+ 
+ if test x"$srcdir" != x""; then
+     builddir="."	# running from make check, but it does not define that
+@@ -14,22 +18,30 @@ builddir=`cd $builddir;pwd`
+ 
+ error=0
+ 
+-bad_globals=`nm -g --defined-only $builddir/../libmpeg2/*.o |\
+-    awk '{if ($3) print $3}' | grep -v '^_\?mpeg2_'`
+-
+-if test x"$bad_globals" != x""; then
+-    echo BAD GLOBAL SYMBOLS:
+-    for s in $bad_globals; do echo $s; done
++# check_bad_public_symbols <symbol prefix> <lib file> [<lib file>...]
++#
++# checks public symbols in shared libs:
++# - allow prefix_anything
++# - reject _prefixanything
++# - allow _anything
++# - reject anything else
++#
++# NB: skips missing files
++check_bad_public_symbols() {
++    symbols_prefix="$1"
++    shift
++    lib_files=`ls "$@" 2>/dev/null`
++    [ -z "$lib_files" ] && return
++    bad_globals=`nm -g --defined-only $lib_files |
++        awk '{if ($3) print $3}' |
++        sed -n "/^${symbols_prefix}_/ d; /^_${symbols_prefix}/ { p; d }; /^_/ d; p"`
++    [ -z "$bad_globals" ] && return
+     error=1
+-fi
+-
+-bad_globals=`nm -g --defined-only $builddir/../libmpeg2/convert/*.o |\
+-    awk '{if ($3) print $3}' | grep -v '^_\?mpeg2convert_'`
++    echo BAD GLOBAL SYMBOLS in $lib_files:
++    echo "$bad_globals"
++}
+ 
+-if test x"$bad_globals" != x""; then
+-    echo BAD GLOBAL SYMBOLS:
+-    for s in $bad_globals; do echo $s; done
+-    error=1
+-fi
++check_bad_public_symbols mpeg2 $builddir/../libmpeg2/.libs/libmpeg2.so
++check_bad_public_symbols mpeg2convert $builddir/../libmpeg2/convert/.libs/libmpeg2convert.so
+ 
+ exit $error
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
index 7711c2dc10..6b59d4f681 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://libmpeg2.sourceforge.net/files/libmpeg2-${PV}.tar.gz \
            file://altivec_h_needed.patch \
            file://0001-check-for-available-arm-optimizations.patch \
            file://0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch \
+           file://61_global-symbol-test.patch \
            "
 
 S = "${WORKDIR}/libmpeg2-${PV}"
-- 
2.20.1


