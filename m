Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6F4CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7024.1782378157446033568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hX72XhO4;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137dd4cc208so931227c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378157; x=1782982957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vhqSJLD+tcIL9R8mGXu+Qbv4HvsJLv6hlSGMY4DWR8=;
        b=hX72XhO4Fmw64fTlRFaFIjDNz0einla8U/BlXP73H05onYfsnk5F9un3oOnmvAfsbA
         L7kDfgTfe4jpZna3WHOM9JSEuycMAAOjinCwQOrLtKAFtPhG+PVcYbCxQyKEfJeJ7wbN
         IBgNBSwgUI2/ko0DKrOgQPjUgZnV0Kf+YKnMp7W3mfQRldNTamtSaEFsau9Z0aPPpS/5
         tewQhuydnKHDtypleGVPKvgPBkJVyWhCi/MHY7x5OiiXKWVz47wPh85lBJ5X4zvV0alV
         VdlIIbfZVoaBjpOc2xMr+V4Dy21ER5Bv5dHDe0iqCGdkReGOxoiil1AsriUuXytZCnR3
         TqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378157; x=1782982957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vhqSJLD+tcIL9R8mGXu+Qbv4HvsJLv6hlSGMY4DWR8=;
        b=U45ISruv6WQXmb0qcPRmJ7+ka5sRIvicq5UakoQuqIZSUr8Byxn8QOLG/1jeb/9q7R
         YwKe+ReM/7UJVP9Gm2IeniA99IW6cgtvl3opOfO3z6Gf1KIQ95Oq006kSDuHKUSrcbM1
         yoialA8mGN3lB39nycSzscq0sl0YAsOasA0ibulp1FuhHJVdxTWoQkE040gfcttRYFvR
         pk0A2f94Hzs5jabgjS9K021RjIe5Dz39UYhYp22mLuYs01F0CY0JPdnzMzxKDTU6xKXl
         aRQkwHyFoc5xtwX1gxDWLUaNdL3+bColh7QCTgTc9KXMsrULtk6pGQHw4GWwu3Cm9mmm
         gVLQ==
X-Gm-Message-State: AOJu0Yz+g8d0h5lqtEo5qnG+x9z1C7KXFTVahbhsjO0AK26x+YCGNxei
	sJ8w8T/b3g5o9ns0KR69vDCsB8z9g+VLIv5qJ/7XQ+GMIzageIZRaCtNHldpxslwUUw=
X-Gm-Gg: AfdE7clrqaFtnGPeKC+8E5Vd5CxjfXSDxuogXTroK4B9lqKaxbcQ+nSk+y8aZBYNPCc
	mEg2EErZuB4OVKKNOoGUfgGFfznsnBaEli84QJTTzrwKRKlHjjFm8rq8tS8qCEtjKtxU4hINZ6i
	Pu5GD1rh/H9Xcht1EXGNgm5oUj06MHPiDQznqgyYQtJCWliKmcURCXbUwFw61tmZt11WgAX3+X3
	8tz8rh2UYU056AtBQV95TgYqeozc+9ZLCKquLVe+/mg+soDBhDHuewXloRwlLDjlqfqkdYjc2/T
	THOuko5+HgRWh5b4XyB1H217ws678NK9WfZ8k2rpzxa+YmZmrDM0r+gJ+q08s5NesptqEohJy6X
	K4YYexqKPW9QfTdWZ9ErloOkaRTM7BkfOe1uCbtuRlD/xbkgGPRVhgws9Zp5Re//zP9aY3CdaFR
	7+hZYK6WxJXY6sHJH1VvZvw8VpKSN72NWW9jNSm32M1mUEn9hJhXCbVgFcbw==
X-Received: by 2002:a05:7022:130d:b0:128:d396:f2ea with SMTP id a92af1059eb24-139c3c44cc1mr5759374c88.11.1782378156383;
        Thu, 25 Jun 2026 02:02:36 -0700 (PDT)
Received: from naduvan.timesys.com ([122.178.167.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca21fsm6977632eec.6.2026.06.25.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:02:35 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>
Subject: [OE-core][PATCH v1] util-linux: backport pam_lastlog2 libpam linking fix
Date: Thu, 25 Jun 2026 14:32:31 +0530
Message-Id: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239549

pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
autotools build did not link the module against libpam. With the
linker default of --as-needed, libpam was discarded and did not end
up in the module's ELF NEEDED entries. The module then fails to load
via dlopen() in processes that do not themselves link libpam (e.g.
systemd on recent Fedora, or weston on journald-based systems without
syslog):

  PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symbol: pam_syslog
  PAM adding faulty module: /usr/lib/security/pam_lastlog2.so

Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
it is placed after the object files and retained as a NEEDED entry.
Against 2.41.3 only the LIBADD line needs changing.

[YOCTO #16320]

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
Verified by building util-linux with pam in DISTRO_FEATURES (qemux86-64):
without the patch the resulting pam_lastlog2.so has no libpam in its ELF
NEEDED entries; with the patch readelf -d reports libpam.so.0, matching
the upstream fix and resolving the dlopen() failure from the bug report.

This is also a candidate for the stable 6.0.x branch (per the bug
report), which also ships util-linux 2.41.3; the same single-hunk
backport applies.

 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...ix-libpam-linking-in-autotools-build.patch | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..3cdc1e2c0f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
            file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
+           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch \
            "
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
new file mode 100644
index 0000000000..9aaa56e7b4
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
@@ -0,0 +1,51 @@
+From c8d0af0421f6491ab1cb2301d2e197315289d34c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 19 May 2026 10:54:57 +0200
+Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
+
+The pam_lastlog2 module uses pam_syslog() and other libpam symbols but
+the autotools build did not link the module against libpam. With the
+linker default of --as-needed (and -lpam previously only in LDFLAGS,
+before the object files), libpam was discarded and did not appear in the
+module's ELF NEEDED entries.
+
+The module then fails to load with dlopen() if the calling process does
+not itself link against libpam (e.g. systemd on recent Fedora, or weston
+on journald-based systems without syslog):
+
+  PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symbol: pam_syslog
+  PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
+
+Move -lpam into pam_lastlog2_la_LIBADD so it is placed after the object
+files on the link line and is retained in the NEEDED entries. The meson
+build already links libpam correctly via cc.find_library('pam').
+
+Note for this backport: against 2.41.3 only the LIBADD line needs to
+change. The upstream commit also removes -lpam from LDFLAGS, but that
+LDFLAGS reference was added after 2.41.3 and is not present here, so the
+net change is the single LIBADD hunk below.
+
+Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2453457
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/c8d0af0421f6491ab1cb2301d2e197315289d34c]
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
+---
+ pam_lastlog2/src/Makemodule.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
+index 40d597c58..876171e9f 100644
+--- a/pam_lastlog2/src/Makemodule.am
++++ b/pam_lastlog2/src/Makemodule.am
+@@ -11,7 +11,7 @@ pam_lastlog2_la_CFLAGS = \
+ 	 $(SOLIB_CFLAGS) \
+ 	 -I$(ul_liblastlog2_incdir)
+
+-pam_lastlog2_la_LIBADD = liblastlog2.la
++pam_lastlog2_la_LIBADD = liblastlog2.la -lpam
+
+ pam_lastlog2_la_LDFLAGS = $(SOLIB_LDFLAGS) -module -avoid-version -shared
+ if HAVE_VSCRIPT
+--
+2.43.0
-- 
2.34.1


