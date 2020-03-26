Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.39686.1585236392545696760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 08:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: stefan.ghinea@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02QFQVeR025593
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 08:26:31 -0700 (PDT)
Received: from localhost.localdomain (128.224.15.159) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Mar 2020 08:26:30 -0700
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
Date: Thu, 26 Mar 2020 17:26:29 +0200
Message-ID: <20200326152629.29272-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Catalin Enache <catalin.enache@windriver.com>

When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
since the Thumb frame pointer in r7 clashes with pulseaudio's use of inline
asm to make syscalls (where r7 is used for the syscall NR).

In most cases, frame pointers will be disabled automatically due to
the optimisation level, but appending an explicit -fomit-frame-pointer
to CFLAGS handles cases where optimisation is set to -O0 or frame
pointers have been enabled by -fno-omit-frame-pointer earlier in
CFLAGS, etc.

References:
https://www.openwall.com/lists/musl/2017/10/09/2

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4e32b27087..c7f3e67022 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -63,6 +63,14 @@ DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
 inherit autotools bash-completion pkgconfig useradd gettext perlnative systemd manpages gsettings
 
+# When compiling for Thumb or Thumb2, frame pointers _must_ be disabled since the
+# Thumb frame pointer in r7 clashes with pulseaudio's use of inline asm to make syscalls
+# (where r7 is used for the syscall NR). In most cases, frame pointers will be
+# disabled automatically due to the optimisation level, but append an explicit
+# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
+# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
+CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
 USE_NLS = "yes"
-- 
2.17.1

