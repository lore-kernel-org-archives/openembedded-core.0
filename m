Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4493C76D96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:04 +0000 (UTC)
Received: by qgx61 with SMTP id 61so96624256qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fHzlXFUAhB+g956bNBVszr+nz8IY6OfY9xH+qURO9JE=;
	b=kR4hsBmoX/X3/EEehMy7jHOnkXsWcrZ/o+6GJiZFoyIMDWWms6kQXjNYDIcCyFfJKf
	Ld9e71QfMIFqOsAJqhIrWPTnUZUdR645SYw4fS6YduyXVZMIYcx2AU0FOcozlE0W3HfB
	6VofnilKkldNxZrm8J/s0lLVAz1GZpamP5AwbYqL4jz3+NH3SQO9F7fM0xbyWTL7WCf5
	MGJiFnTlzxhb2WCiM+NKPrqjdzQZSp79xylSKHcc7okH1j0XIqNJJ8D65VOctSsI78kd
	aQ33hZ7hs+7zcVeb3qCtOV+F4i4COFpOFOpIXA83efxq2LzhA5myJ7XWhXNyEY1jtDAl
	biAQ==
X-Received: by 10.140.145.75 with SMTP id 72mr33152978qhr.81.1441753683970;
	Tue, 08 Sep 2015 16:08:03 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:43 +0000
Message-Id: <712e2a5a84664ec47fc0bc4d240ba6d90d1ada69.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 03/16] sudo: Include sys/types.h for id_t definition
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:05 -0000

This is exposed by musl, on glibc sys/types.h comes as indirect include
from other include myriad.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Include-sys-types.h-for-id_t-definition.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch

diff --git a/meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch b/meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch
new file mode 100644
index 0000000..eb36cd4
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch
@@ -0,0 +1,34 @@
+From 386e2c2fa2ab2e02ef71c268a57205139be329ab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 07:07:49 +0000
+Subject: [PATCH] Include sys/types.h for id_t definition
+
+/sudo_util.h:219:14: error: unknown type name 'id_t'
+ __dso_public id_t sudo_strtoid_v1(const char *str, const char *sep,
+ char **endp, const char **errstr);
+               ^
+	       make[1]: *** [preserve_fds.o] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/sudo_util.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/sudo_util.h b/include/sudo_util.h
+index 89c9f89..ac0855a 100644
+--- a/include/sudo_util.h
++++ b/include/sudo_util.h
+@@ -17,6 +17,8 @@
+ #ifndef SUDO_UTIL_H
+ #define SUDO_UTIL_H
+ 
++#include <sys/types.h>
++
+ #ifdef HAVE_STDBOOL_H
+ # include <stdbool.h>
+ #else
+-- 
+2.5.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
index ea37aaf..93b9bb4 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch \
+           file://0001-Include-sys-types.h-for-id_t-definition.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.5.1


