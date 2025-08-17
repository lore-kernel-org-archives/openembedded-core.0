Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F073BCA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:50:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.60835.1755463841197089381
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3kPo8fY;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so1836910f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755463839; x=1756068639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0pW4TgGSeMfcuV5u2HrtlOPQ5t4lhqr2hTjplKfbtQ=;
        b=K3kPo8fY0HiwxFZ1InRyQQH66rjweIWoiqL/7CPeScqoFRieUYEx+HTBRG8muWkyA7
         yMs5ULJILcm+I+cQ/kb3rMqP80dBG1aU/2fUGDto5KE54gAURA6477Ym89GmKKCpCWP4
         SZQzG51L377NAIwKEkZD+AILIHkzXDr4odTnID34UujwO10h+bcT0A/8OvVMvZeRPwz8
         2/okjH99Yvnnh07gsorqIDbiZwZYDJbSc0+6qKVOENDXUOS5si8C8hI6kLG4H4/0XreS
         jsg5N1/7cdcXPM+k3Ks2DrXmrT6mTGenKXDXGIcFlymYm+7XNWHDwNfM4fOcSoIZyg3S
         Bb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463839; x=1756068639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0pW4TgGSeMfcuV5u2HrtlOPQ5t4lhqr2hTjplKfbtQ=;
        b=qGW7xogthVcHVBpHtyDfJsMXhgZnlSlwNtpolrYWf4R0U1y8oPzGCjtpAG38Gskgee
         E2lKfjDfc8Ta36t9pZj4h1X6YJZv0WrBn37Ppgt6efduPAx+CJg6ONxvooHFNfOeriZn
         M65yLc9NljgTmQG045EWoHMpwSe39Lv9xiZB1iQdHF+5ycN7ZLlw+YyHjsXnh1iZPNIv
         05jYLw23lyI0gAZ5/BMTr4B54h54O+4SpLwTalJM85N4kwskMv6CwqHwFdK18YApXQKN
         FWIYT+h1IxbgWDVi1xEe/qagdReBsKbb2HJuXwRn0Ey1N773EmSNI7loEZIfXK2U7l5f
         mBGg==
X-Gm-Message-State: AOJu0Yy/EgG4zCNnp/Swq+gLNT1023XmWrypqIg94xWRN2kl/g4I10+Y
	xkHtzKPAy2g8XLdzWKHciPZUHsSIgrmFv0g3Q4a93YzFmnYL5+qwlfmsQtrE7A==
X-Gm-Gg: ASbGncvVQFVimQ+PSVu0Jzj+woFaT0KnX8LreyyM9VdfzvA1/ERfqI78lDmr9VS0A1x
	1eQq3azLvsKK5//Hvz5rdFVmU6Pk8vm+UFE7w4GQ2+r1aW97NQclDwJWQyy9KE/lXlswBo4mFgO
	BsVL5ky7KW4RWoJ0bwY5w141ruLVz3d/qWBcK/piCmYuy6MIfN6+F7+xzxCrgPNKr/V2uBqCHrQ
	ZFNW254eUtMXr7xvvcnnxungbXzPbpFU8ZYagrEefKSE5bNBGBbnjOHM+M0xARkZ9UPd9r82OSM
	O9HBrxw0DNAXhLspAW/Ei2cOZtnZAAd/XHoIONWHuMPuRN020Xap1ZeHSWkVsdzUqBRXcoXFKsf
	03Aw3aKkHwtijt4ImhIr8RbeSsw==
X-Google-Smtp-Source: AGHT+IE4nsjCSf4tVzolVmteoEABIvD8QCIz5eNSZE9SSjd4fgcUG1nzYE0C76QL3TCpQaZDZtj7uw==
X-Received: by 2002:a05:6000:4287:b0:3b9:1636:c443 with SMTP id ffacd0b85a97d-3bb694af47cmr7712615f8f.52.1755463839416;
        Sun, 17 Aug 2025 13:50:39 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb5d089e07sm10365066f8f.0.2025.08.17.13.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:50:38 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 2/3] parted: Fix build with GCC 15
Date: Sun, 17 Aug 2025 22:50:32 +0200
Message-ID: <20250817205033.3845672-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250817205033.3845672-1-martin.jansa@gmail.com>
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222019

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...CH-parted-fix-do_version-declaration.patch | 40 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.6.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch

diff --git a/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
new file mode 100644
index 0000000000..a8ea7ec4f7
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
@@ -0,0 +1,40 @@
+From eb6bb2e8dfc78ca1a187d07ea29b23a805c61794 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 12:22:22 +0000
+Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
+
+With gcc 15-20241117 compile fails with the below error, update the
+do_version declaration to match the header in command.h
+
+../../parted/parted.c: In function '_init_commands':
+../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
+ 2469 |         do_version,
+      |         ^~~~~~~~~~
+      |         |
+      |         int (*)(void)
+In file included from ../../parted/parted.c:28:
+../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
+   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
+      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ parted/parted.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parted/parted.c b/parted/parted.c
+index 3abb52f..fc2aeba 100644
+--- a/parted/parted.c
++++ b/parted/parted.c
+@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
+ }
+ 
+ static int
+-do_version ()
++do_version (PedDevice** dev, PedDisk** diskp)
+ {
+     printf ("\n%s\n%s",
+             prog_name,
diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-extended/parted/parted_3.6.bb
index a537ef74db..0e79a2e837 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch \
            file://autoconf-2.73.patch \
+           file://0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch \
            file://run-ptest \
            "
 

