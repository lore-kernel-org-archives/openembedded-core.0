Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79B86766F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 19:41:47 +0000 (UTC)
Received: by pawu10 with SMTP id u10so69916230paw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ddfOfDQw1gOQhn36pDbj4nqq7KU0mpNtJeCwThu11rA=;
	b=zFLtcwFR/C/lZWNuhrp20RGw5FIfcpIH7AsNcFL0Nq62ScnUSxrAUPUvIFWAY6g9mo
	Wa+9lstZUYIWZIg2l/r4hlsvCqnWJRtfV0nXShrkW96oBQTIg1tAdJMnHxx5aqQSRYbg
	LmAdm5LpijQPDzuI6DAIVV3wpv9+efqFMpNLWGtLvbTlUTEupIrVSEpgFhBblT47nCvv
	kRw90Cx6XuIyLBWDxPu37fKm0F9An7gXnG67nZWaq18cTcuLJWeXnEXhv42u+Pkwhmur
	8xz40ZAGS7DiWhTPr28bUaIBA/CTL4aQmEZOcCJkt6o0Wz+2zs7Ar78NfLGKnn9RLc2R
	M2Ig==
X-Received: by 10.66.138.40 with SMTP id qn8mr6545352pab.19.1438890107610;
	Thu, 06 Aug 2015 12:41:47 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	aw16sm7491315pac.29.2015.08.06.12.41.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 12:41:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:41:25 -0700
Message-Id: <1438890086-2710-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] security_flags.inc: clear SECURITY_CFLAGS for uclibc
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
X-List-Received-Date: Thu, 06 Aug 2015 19:41:49 -0000

uclibc fails to build when security_flags.inc is used.

 | i686-rdk-linux-uclibc-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/build-vbox32/tmp/sysroots/vbox32-tcbootstrap  -Wl,-EL -Wl,--sort-common -Wl,--sort-section=alignment -m32 -shared -Wl,--warn-common -Wl,--warn-once -Wl,-z,combreloc -Wl,-z,relro -Wl,-z,now -Wl,--hash-style=gnu -Wl,-z,defs   -Wl,-init,__uClibc_init  -Wl,-soname=libc.so.0 -nostdlib -o lib/libuClibc-0.9.34-git.so  -Wl,--whole-archive libc/libc_so.a -Wl,--no-whole-archive ./lib/interp.os ./lib/ld-uClibc.so.0 ./lib/uclibc_nonshared.a /build-vbox32/tmp/sysroots/vbox32-tcbootstrap/usr/lib/i686-rdk-linux-uclibc/4.9.3/libgcc.a
 | libc/libc_so.a(sigaction.os): In function `__libc_sigaction':
 | /build-vbox32/tmp/work/core2-32-rdk-linux-uclibc/uclibc/0.9.33+gitAUTOINC+48a0006012-r9/git/libc/sysdeps/linux/i386/sigaction.c:37: undefined reference to `__stack_chk_guard'
 | /build-vbox32/tmp/work/core2-32-rdk-linux-uclibc/uclibc/0.9.33+gitAUTOINC+48a0006012-r9/git/libc/sysdeps/linux/i386/sigaction.c:49: undefined reference to `__stack_chk_fail_local'
 | collect2: error: ld returned 1 exit status
 | make: *** [lib/libc.so] Error 1

Clearing SECURITY_CFLAGS completely may not be the best approach, but
it's the approach taken for glibc, so try it for uclibc too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 3724972..a107657 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -84,6 +84,8 @@ SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-uclibc = ""
+SECURITY_CFLAGS_pn-uclibc-initial = ""
 SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-webkit-gtk = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.9.1


