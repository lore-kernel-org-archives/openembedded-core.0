Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 260656FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 23:58:10 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q126so201809155iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E8M82gZEjAjky3LYsQn89V8JvOtBz5s90He1gXe/+GQ=;
	b=Y7I2e5xcL3fR12j/jS2nudp73FpfKGvYmFSbEvxpYFhqkxFWcFxFI7NTs4MdT+D8qw
	PfRyDmVb7Ogds+m58F38YZgRACP3Ztyz+iGeiB5J3u7TsA4S9zR/nRkvRqaSXr+MkFEx
	1JAn/sa79mqzlgDhAYKy4sVO65DWzpvPT8Mv4P0QF/ci/TvizQfxujcKufqfYNbAHZcn
	A6KxOtA5YX2P6B81otBu936YUH4GgSrf7fLeRELRiGN2YtSy9JmFJLdAZ8m44plkazuR
	gWB+GdAwBFL1a3pRTIoLRySrzMoKwZSA4QabwTZs4yjj5bUvn2TnRI0/Y20Z3E26BdZv
	hlMg==
X-Received: by 10.107.47.195 with SMTP id v64mr28124504iov.193.1450828691578; 
	Tue, 22 Dec 2015 15:58:11 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 4sm10079020igz.2.2015.12.22.15.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 15:58:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:57:58 -0800
Message-Id: <1450828680-662-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
References: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] security_flags.inc: disable -fstack-protector-XXX for valgrind
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
X-List-Received-Date: Tue, 22 Dec 2015 23:58:11 -0000

Valgrind (v3.11.0) expects to build with stack protection disabled
and includes -fno-stack-protector in its default CFLAGS. However, the
CFLAGS provided by OE are included on the compiler command line after
the defaults so any -fstack-protector-all / -fstack-protector-strong
option provided by security_flags.inc will cause problems.

 | .../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind/m_mallocfree.c:892: undefined reference to `__stack_chk_guard'
 | .../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind/m_mallocfree.c:947: undefined reference to `__stack_chk_fail'

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 14ac0bf..1795750 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -84,7 +84,7 @@ SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-valgrind = ""
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # These 2 have text relco errors with the pie options enabled
-- 
1.9.1


