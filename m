Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCAE76703
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:54:41 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so23372347igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ddfOfDQw1gOQhn36pDbj4nqq7KU0mpNtJeCwThu11rA=;
	b=sMIyrMrKEbL9++aX/X+Ef5ScLQ9A2YZwqsURmclqZmj+FycELTUu7eUy/8qjU5kLlc
	oXOww2Qdu9xCZTRqUN5PohuOycfGH8iR8VQO2NE+x1LNrLgKhBeakZDGOG27zGGVOmGm
	gH2Dam3nyTTT0YQojHfB/mFsfRoI7z+vAjzE0+5edLFwLh30vCBnWz71G1by1ihu3JqP
	Xjr1ks6P+kE+2aqhy7mqS1piboXHlG3z4WYn3/iMsMHjlivojgu6xcDM0g91aeQmPG25
	8bcWF7SBvbfY/xsBhq+rsMhj00ke7GOV6E6z2XpwNQApEzzHAUekiaM0WpLTNcKrlu99
	h8OQ==
X-Received: by 10.50.102.98 with SMTP id fn2mr836965igb.55.1438912481785;
	Thu, 06 Aug 2015 18:54:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j3sm2740140ige.0.2015.08.06.18.54.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 18:54:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:54:19 -0700
Message-Id: <1438912459-7242-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
References: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] security_flags.inc: clear SECURITY_CFLAGS for uclibc
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
X-List-Received-Date: Fri, 07 Aug 2015 01:54:41 -0000

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


