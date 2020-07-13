Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.20242.1594649875426737200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ovLyS06E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id i14so6050412pfu.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/kvPDYM7KefcAlA4zSCCrO/LQxouFA2JAAfXwVevfUM=;
        b=ovLyS06EnTupDY5+o6o94932ADBN9xMoWLEYBY6kTrZkXropTUUo4jBPgPKvj3wJqk
         8Bgo27ltCyBKCv+r9C7zAl8VyGi19s39q27uivlehIRitMQLnWSnakN47NlOAGZ4icMl
         aXU5x5nEYYvRKWnzmUvfOGHD3NfNjXXcDwlp3ssa2NAhm4wrR/1aIS3sQpdvaOZPTGLS
         eZHTKaCEBoA2rkFNGT7qxkNyjg3c0KEcKKMfwS/UI2ufwXlWxLK9dGIzIEL+mzcbpnvR
         2NgaAVxuwfra//WRJBp8kQ0U/s00UA2Z7xwiaVr5A1KXjDLcxy3af4cNi6SjgCWROgRG
         fv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/kvPDYM7KefcAlA4zSCCrO/LQxouFA2JAAfXwVevfUM=;
        b=tdD4yVGaICEGiV21gFVUHtKtg23SadAT6QJ4XLseccRYj5icATv9WxUpS+BzNWP7r4
         ZWv610w6QZQ06y9eRMgQj6JiUlrujdJUzdrdj6jNKGhiW7C3f3JHkEGRkI/FSi+sbnXX
         sHM+r7z+2RppbAs9YhpyuYB+UB/mjZ40pAEfJMiMCeuE+Wpv7QKVo8HU4Nci4kY7F1Vz
         yqVIxkmfhP/CuAYHeocgpofWqj/uij/kgOmZPl7TlJEmZz77WZHdzsxJn3Zm530PljC1
         PJ42JegNk3s/2yBw90aui1cJohqjUwevVfmAhPIbkpvT1YYnLoEhZK6yBDyxmI3YD46U
         fh/Q==
X-Gm-Message-State: AOAM532ybDGuAByK4N+43pMP2EiDJS9DxrMady2Y3VKWXU1wCWZlEaAj
	qPolXq18S5j1KRTPaSaa61/ZjYg3MyogOg==
X-Google-Smtp-Source: ABdhPJzmNUFPZjHl6zgaV97QLJX88A7HdhLpOPw2RyOLXu+UaN9hvSedI2pn61IhLD6fDxlN4lsKiw==
X-Received: by 2002:a05:6a00:1586:: with SMTP id u6mr84271pfk.147.1594649874485;
        Mon, 13 Jul 2020 07:17:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/15] coreutils: don't split stdbuf to own package with single-binary
Date: Mon, 13 Jul 2020 04:17:03 -1000
Message-Id: <6ed2371742bd27aad0fc8cc3f6060685329892c3.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Commit 992cec44 (coreutils: Move stdbuf into an own package
coreutils-stdbuf) breaks package-qa when the single-binary
PACKAGECONFIG is used:

ERROR: coreutils-8.32-r0 do_package_qa: QA Issue: /usr/bin/stdbuf contained in package coreutils-stdbuf requires /usr/bin/coreutils, but no providers found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
ERROR: coreutils-8.32-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

With that PACKAGECONFIG, /usr/bin/stdbuf is just a simple "script"
containing the single line

  #!/usr/bin/coreutils --coreutils-prog-shebang=stdbuf

Since there's no point splitting stdbuf to its own package when all
the functionality is in the single big coreutils binary anyway, fix
this by not creating the separate stdbuf package for the single-binary
case. But also make sure that the coreutils-stdbuf item always exists
so recipes can always RDEPEND on coreutils-stdbuf.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74d24b5b895198898944260136d05e991a203c11)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 2b196b7512..0c8452da98 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -59,9 +59,20 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill l
 
 sbindir_progs= "chroot"
 
-PACKAGE_BEFORE_PN_class-target += "coreutils-stdbuf"
+# Split stdbuf into its own package, so one can include
+# coreutils-stdbuf without getting the rest of coreutils, but make
+# coreutils itself pull in stdbuf, so IMAGE_INSTALL += "coreutils"
+# always provides all coreutils
+PACKAGE_BEFORE_PN_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
 FILES_coreutils-stdbuf = "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf.so"
-RDEPENDS_coreutils_class-target += "coreutils-stdbuf"
+RDEPENDS_coreutils_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
+
+# However, when the single-binary PACKAGECONFIG is used, stdbuf
+# functionality is built into the single coreutils binary, so there's
+# no point splitting /usr/bin/stdbuf to its own package. Instead, add
+# an RPROVIDE so that rdepending on coreutils-stdbuf will work
+# regardless of whether single-binary is in effect.
+RPROVIDES_coreutils += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'coreutils-stdbuf', '', d)}"
 
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
-- 
2.17.1

