Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AE1C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:32:48 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47151.1790555558403126061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQNxbKtR;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3425f2b24a4so1012007eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790555558; x=1791160358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpJANWZB0nFtG0ebsEubzp5TFjyYeD9B9IOOL/K2GVU=;
        b=LQNxbKtR9lQmR6FsCC1WGmwjlrILsIrDHfL7K9WlbpCH1yqwlB1wKq91czLT0j72sR
         vOqtb9wl05ghvGO0mB3YVcnXEa2P87D+SZX3qOLwXIY75ejDijckbrPJ605MlkyjB0Q2
         hyZC9/N5Bynnz6MpQJWFmjInKOo5OpbHehSq0Lf2oYBCUgKupQLDmRVIMKTFIL9LsFiQ
         VPWDENIOV4XmFAshCITJa6j0p9LV4KMAv0JTPmuF0c6funZg4wSBATKvz7WAX1380yhj
         GQ9/7O8+o5Hh9mZT3+1/Nisu2tV65Gd8QFjSi/9lPQyhLEBKxrGiBComcqzxKG3qMwFO
         JPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790555558; x=1791160358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpJANWZB0nFtG0ebsEubzp5TFjyYeD9B9IOOL/K2GVU=;
        b=N4fJo5pz7/dlED/F0ramGgHgmeENQOw980k1oU/VNnvvcFedDKTHB9PBzuGhj5nun2
         Oj7H9Tsd9bRcjnGrPN+tOHY90pYgEXBEHCVdVPlbbNwDu5aCoNRRtTocVUO4m0EG/YCi
         7kkw2kNaBMIUmXkw/TYBSdN57qQQiNbAKxIlYkQSJ2w2j4uCYUDVYmKJRVv953mYZpCe
         CipmElMJ/0TdoYUi5/b/+cDZCQmcP4uyjr7TOUibo24wMR+fFoMHa+7ttYvK1/tTJ+65
         7PnTM4Pp7mF5tdj7S8+IjllU4roMb4UFVIvEazFlJ+Eo9V7KukMuLM1ajBx46gZABFhg
         lLMg==
X-Gm-Message-State: AFuF++nTQeSO0gxZxs75PPUAaMtLHNQu4ojDMyNfzpKr3qeSaTkaloXk
	640vg3ZmSx8hys3D2MTmRbD1HYzv4sAJJSUOoCFNG+bTYeYW/ee6/+bTP7RNGi21
X-Gm-Gg: AYBFou0aFtjSpQYgeGGI7vjyW30ZpCdieZkQAkmOJJ7NAbCva/PfEWnW4xCmgdEhisn
	U26o7cGpcHT5qlnIqTSkmqMxGQp7S0p4srDezjv9SWHilbfoQRGRnJQ7/YxN5Z7Zyy+RA8MyKIx
	oktc/JYx6Lr+RpVC9P0uYbCM6hrBywpMMVNb209txeZk/gjg8QOo8NhvpOu/hyl3SOJnH3etoFR
	8A8WR/deIEcRudrQrkdfw8vewJ3u2fhFQGRIs3L/WkRYLDXYI6Zo33e3+mWQNOLm/azodhybTd2
	AFLDzOSUAfHQ4fTbPPC1AsoGNv1JqoPov2/jN5k3cWrT+epFyc4hi+ntcip9eM5X93wNszcPMIE
	xqvapH0J8QMx7TLIcBlWF+r2MwkC9erWHV9yVYvrUnf1+vvC+CL3lagk96zfzMTjoRh/niiAZuW
	MXZ1TXBdyCoMd2HbYMhVoXhX6xZZa7gKUIlafO5jruOs9BsSASefkkufcotmW57Hqcvebgl9s7i
	olrCNQTtj8rrjDxXZCNQmHkO9xm493B2ygOsOHsSLalbkIDI1J1fXw0LKxt+ymQ/QSsKajVPadh
	N7Z7v+qUwTRqSEv6n7bQOMtMPhSA45PilfYfnsK640PYkbVZit3aOBlyb7IlVqqtMR0Elutqhj7
	Oc9hpLB4SQgphzgrEFbf6Sxc/T7QcZ//ADtPODKfeWLpfupdVmSBHPNjcRBW/I4M+myd5+NPSNG
	j0c5XxZ0O4k7BIsoMoWYNtc5Fldr8A0fxv+el0EQ==
X-Received: by 2002:a05:701b:4289:10b0:144:e4c3:7f0f with SMTP id a92af1059eb24-146ce96696cmr7548702c88.7.1790555557439;
        Sun, 27 Sep 2026 17:32:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acd3d8eesm19439530c88.8.2026.09.27.17.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:32:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] musl: Fall back to VERSION when git describe finds nothing
Date: Sun, 27 Sep 2026 17:32:33 -0700
Message-ID: <20260928003234.858683-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 00:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246716

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-fall-back-to-VERSION-when-git-descr.patch | 43 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch

diff --git a/meta/recipes-core/musl/musl/0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch b/meta/recipes-core/musl/musl/0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch
new file mode 100644
index 0000000000..d77b29179e
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch
@@ -0,0 +1,43 @@
+From 97bb653022ed04c076040ebe899c89d19ddab6bd Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 27 Sep 2026 17:15:34 -0700
+Subject: [PATCH] tools/version.sh: fall back to VERSION when git describe
+ finds nothing
+
+When building from a git checkout, version.sh uses "git describe" and
+only falls back to the VERSION file when git itself is missing. In a
+clone that has no tags, such as the one a build system fetches at a
+fixed revision, git describe prints nothing and libc is built with an
+empty VERSION, so the dynamic linker reports just "Version ". Tools
+that identify musl by that string, e.g. Python's packaging (musllinux
+platform tags), then no longer recognise the system as musl.
+
+Use VERSION, suffixed with -git as before, whenever git describe gives
+no result.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/09/28/1]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/version.sh | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/tools/version.sh b/tools/version.sh
+index f1cc594..578ff46 100644
+--- a/tools/version.sh
++++ b/tools/version.sh
+@@ -2,8 +2,13 @@
+
+ if test -d .git ; then
+ if type git >/dev/null 2>&1 ; then
+-git describe --tags --match 'v[0-9]*' 2>/dev/null \
+-| sed -e 's/^v//' -e 's/-/-git-/'
++v=$(git describe --tags --match 'v[0-9]*' 2>/dev/null \
++| sed -e 's/^v//' -e 's/-/-git-/')
++fi
++# git describe finds nothing in a clone without tags (e.g. a build
++# system checkout); fall back to the VERSION file then too.
++if test -n "$v" ; then
++echo "$v"
+ else
+ sed 's/$/-git/' < VERSION
+ fi
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 057113bf16..849b9e46ee 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -13,6 +13,7 @@ PV = "${BASEVER}+git"
 SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"

