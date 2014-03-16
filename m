Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5B72C6F5B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:09 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id fp1so4235819pdb.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9Nn83Vl24ufOIrk0YupLKYuxSGRFY7cYUHvY2s7AtXw=;
	b=X8R6Ek6yFPpeev5uqJBlX9Ac2DV3pxHp+pm0fKBI9fHYlHKSMLS49I1SBCVZcC05hz
	w7FpLLTlLxxmLSggajQ0yiKFriMwhtiTiq+F46o3yN0/AhTQmslwG4maTKPNwoHwg2VM
	YuooYX8z+dPQlak+zdxfd4i8h4uCHVkc63rs90+ZCEqdOtcsUzlM7B9TY8F3AiVM2HS3
	C6U0zu0uyGLuQjG0D8yhQeOVaC9Q460PHqE/EiYyGvhwPYazf1QeufUw0j6Fw3h502xP
	fi4Gn2aoW70W5jVxCSAmWLv2EYYlPa6xuQUWL+spqgVYSrTXMRECEUWm9KhqowByi/BD
	0/Cg==
X-Received: by 10.68.136.133 with SMTP id qa5mr18330446pbb.63.1394948471141;
	Sat, 15 Mar 2014 22:41:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:30 -0700
Message-Id: <a856ac4a0c03a5374e8e2f3567a213f09f33c10b.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
References: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:10 -0000

This patch actually makes sense for uclibc more than glibc
since if we did not cache scanf_cv_alloc_modifier configure
test will determine it correctly for glibc but the test does
not do proper job when uclibc is involved the reason is it
depends on define __GLIBC_ and uclibc unfortunately poses as
glibc and defines this variable.

%m is implemented in uclibc as well and we enable it so caching value of
'ms' specifier is going to work across all libcs

This fixes mounting errors we see with util-linux/mount on
uclibc/systemd

Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: /proc/self/mountinfo: parse error: ignore entry at line 21.
Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: /proc/self/mountinfo: parse error: ignore entry at line 22.
Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: can't find / in /etc/fstab

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.24.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
index b08d68d..aa98b65 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
@@ -17,7 +17,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
 SRC_URI[md5sum] = "88d46ae23ca599ac5af9cf96b531590f"
 SRC_URI[sha256sum] = "835eb6232cfab0118ef2e4fd649de0ba9f5bd1b8cbf9a7d4d84594541dec8410"
 
-CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
+CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
+
 EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
                              --disable-fallocate --disable-use-tty-group \
 "
-- 
1.9.0


