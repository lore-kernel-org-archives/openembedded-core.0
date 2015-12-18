Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 90527731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:35:38 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 186so75949210iow.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E8M82gZEjAjky3LYsQn89V8JvOtBz5s90He1gXe/+GQ=;
	b=BPHDm/t687AnqqqAkc+cMdPApQshs8dCcJ0wPsiu/rvTnWAcejWQMKmPk2wwIMif90
	Fwkgdkn6C/vfCS0WbCmoodaeyvuqKeQAGxiIGFHqbLzwN0C2pdQAvy7H6ynUgX4KkMOJ
	b3afrC7mHdlmOXxXENxoFg8bELntZVf9w4C+0LdeTdf2jKabkkY2KcCrFHjaCeDCE0+J
	p2m4MS9P7ieLc01gPQ+4ptq7M5QY9uVJZElkVLSPxeEwP2vWJ3wZGad8YoGgm9q/rDBx
	9+5wY0m6CYyZJbslw6X2X2Z/Q3DBs3I6+bi1fxGm0zIOIh3v3gxd6QAXDM1h48Ld7XS6
	wswg==
X-Received: by 10.107.16.213 with SMTP id 82mr1947564ioq.119.1450402539035;
	Thu, 17 Dec 2015 17:35:39 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id w8sm1745659igl.0.2015.12.17.17.35.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:35:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:35:23 -0800
Message-Id: <1450402525-11430-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
References: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4 v2] security_flags.inc: disable -fstack-protector-XXX for valgrind
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
X-List-Received-Date: Fri, 18 Dec 2015 01:35:39 -0000

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


