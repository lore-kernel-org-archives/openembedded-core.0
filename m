Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB7FC7EE24
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.51337.1682788871497989364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RQ+JlQxJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1aad5245571so3749655ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788870; x=1685380870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljN7b6Dryth0zI0BqAi0iEX/Nv8EZO586zFA0R/N+jg=;
        b=RQ+JlQxJyBtpgIAl7EbOt9tDh3kiwtq+34IIJyvmcPl9CFriDB4b18UnkcQuvi3oqH
         2NqLO4kmh6b2nvwejAVToRbXfLTwvWsN7PH7yJkMmYh0L+lN3h+SAC8/sLKJvo+PK6YM
         g/9RHmukJobcgMlfla8e4fhsWqh2ZMnRyNbr72CvPIWA7F2/HeMvW83Tx+oKCLd8IOTR
         xuGVDp0xjYbAbBDvEHqZamD44T55k+hq7ls7ZeI3XG3nYHHpCa1c/snjXa84Qi/c6hPJ
         DP1xJhVZqv0kwbzLKRTJaaL25g5mnOj6ilkAXNMbiVCbzaF+xbUYd8jH9GWCq5KLn7DZ
         1XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788870; x=1685380870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljN7b6Dryth0zI0BqAi0iEX/Nv8EZO586zFA0R/N+jg=;
        b=BLSKNdsjwUEE7DAALCV8AKp2UWs+riyhIrAxJFYAEmLADpD30gXuQqiqW1lRNwjs1W
         KBDjn8Jftzir+gPTU4ikLwSerU9/1cvydv4g4ti7+uNhTH1q6/eHM9ncW0smNLUHNciC
         Kgl4mgx3q3ckiiSfO/PYxAmuGDOBT4mslGk0ojIsDEgpB7vGtqFzCzcA751uXuBwqAMk
         VRb5AYGzWYwagWM6/5x5kRGOzAtwOogdhxnZQzIHPGKI4COo/4/8tdr9UxbXrY9+9+o1
         ON1Rg3NVt5PSOAc7enDwX7UN17XwEWELVWyUJaKSS8qcQ/ighCvTT8dLGD57tbZ1cVy+
         Lchw==
X-Gm-Message-State: AC+VfDzlcOq5u2643JzWg4x8G2vOdx2nPX9PusFjFbEyzDVw8ckDn1wd
	4fcAU+rmqRFKG7KddJI8ggNjr2aHm9u/MytMsHI=
X-Google-Smtp-Source: ACHHUZ7ykwt1ubnbZyket7i9SbIdBlvNJozO89IBoWY7/1mn6GEpUhKMT/zYglbhAvbqAcowtGVZ4g==
X-Received: by 2002:a17:902:9a8e:b0:1a9:8ba4:d0d3 with SMTP id w14-20020a1709029a8e00b001a98ba4d0d3mr8329931plp.8.1682788870560;
        Sat, 29 Apr 2023 10:21:10 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:21:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] libxpm: upgrade 3.5.13 -> 3.5.15
Date: Sat, 29 Apr 2023 07:20:30 -1000
Message-Id: <a549319e5fdae685f93122627226f9b102307bc3.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180553

From: Yogita Urade <yogita.urade@windriver.com>

Upgrade libxpm 3.5.13 to 3.5.15

License-update: additional copyright holders
   f0857c0 man pages: Correct Copyright/License notices
The above commit is introduced while upgrading the libxpm 3.5.15.
which is mentioned in below changelog.
Due to this commit LIC_FILES_CHKSUM is changed.

Disable reading compressed files as that requires compress/uncompress executables.
Following the approach in oe-core/master:
   7de4084634 libxpm: upgrade 3.5.14 -> 3.5.15

Changelog:

-------------
-------------
ddd8339 libXpm 3.5.15
8178eb0 Use gzip -d instead of gunzip
c5ab17b Prevent a double free in the error code path
515294b Fix CVE-2022-4883: compression commands depend on $PATH
f80fa6a Fix CVE-2022-44617: Runaway loop with width of 0 and enormous height
f7fbbb9 test: add test cases for CVE-2022-44617 (zero-width w/enormous height)
a3a7c6d Fix CVE-2022-46285: Infinite loop on unclosed comments
f7a167a test: add test case for CVE-2022-46285 (unclosed comments)
0ff2c6a cxpm: getc/ungetc wrappers should not adjust position when c == EOF
501494c test: Add unit tests using glib framework
4841039 configure: add --disable-open-zfile instead of requiring -DNO_ZPIPE
aef0c8d man pages: Apply standard man page style/formatting
5d55a0b man pages: Replace "See Also" entries with more useful ones
392cb8f man pages: Fix typos and other minor editing
08bc174 libXpm 3.5.14
f0857c0 man pages: Correct Copyright/License notices
deb81a9 man pages: Fix typos
2d5fa4c man pages: Add missing word 'function' where needed
2b7357e man pages: Make function synopses more consistent with other pages
fb8590c man pages: Fix shadow man pages
bfaebfd man pages: Make file names consistent with their displayed names
7a138a5 gitlab CI: add a basic build test
3433f43 man: strip trailing whitespace
9612454 Fix spelling/wording issues
fa16fbd Build xz tarballs instead of bzip2
83e5427 update man pages
e48e649 add man pages based on doc/xpm.PS

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.15.bb}       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.15.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
index 4f0a5d7ba0..22e322a9eb 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
@@ -11,17 +11,19 @@ an extension of the monochrome XBM bitmap specificied in the X \
 protocol."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51f4270b012ecd4ab1a164f5f4ed6cf7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
+XORG_EXT = "tar.xz"
+EXTRA_OECONF += "--disable-open-zfile"
 
 PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
-SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
+SRC_URI[md5sum] = "b3c58c94e284fd6940d3615e660a0007"
+SRC_URI[sha256sum] = "60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


