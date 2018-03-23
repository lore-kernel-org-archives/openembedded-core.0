Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 75CC9788A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 20:48:30 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n11so5017324pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cubZeYtJA0LxfDrWlwmD1rNM5+GiSIbaciRcAtTgXII=;
	b=am8O6+lIGXAPuIam0v5JnUdoxFcbe2hINcCuLRLpa151p0iD/b+G/icBlAqPaCBi+0
	zdfuUe9vF/KHDGEgrKAzb9mQwpg9dgq2JBTsymlPJIuN4Q/uMR/H1svjyyA9s+tWVBig
	7Sxhaqgpj1s8Xh716wi9+diTr6wB/EffCfk1C2hLB0Wtb2zkwrFi8paHnFgfwuoUi/p7
	Y63KN2adMb01gg5n76HYfBpJB9Hgw0fFpWY7Pr4CES8bkmDqL9XUietbzAIJK6Q8XTIN
	b+TQ9PaLvmU+7qKmYr0A/sg7QrgiJurt/F0C9y1GTX3Fn62X9lsOxIxPiYsjwLgCEhg9
	4Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cubZeYtJA0LxfDrWlwmD1rNM5+GiSIbaciRcAtTgXII=;
	b=o9RWOEihM/K0h6ylDQ6K4qs9kEqVAMy2je19pYD6/l0H0IjpreICuCY0lRqNXd+Asf
	me4dfhlwiSkgSxLQfQElZKPM0w19NzNPW/f9Jxj4uwePvJcBmt/6xhCHkMdl1cM/p3Np
	VLI0xrZPs/7jrSe8jWMqvfqTj+RrfN7OahnB3tYK/LhDWNk7FaRCLtLKrN/wErx4DJIg
	qtyJ8lTLogA6QrnjcHhgqvr8aoSJeNGv+pKebh/DQ+XYA6nvsYZbRmcOsqCR0fdQSj3E
	qzmphJsTI5FDffqiG48/RgEfer333reze8Rzf+D6vh7JnDaMt/cSccwkR3nxrdOFh4Un
	gBUA==
X-Gm-Message-State: AElRT7HZfqAWoiQ2Tai94MbLiG7MXbFjapc9JHGj5vz7ooJBEMNT5tM7
	EXKkPX4dZ5Q++yZnj8NxxV/eKw==
X-Google-Smtp-Source: AG47ELuf6Fuum2oocPqTTL/IpFML+EVOdkxQti/1/s4rNaAdR00H6YdqMnMQAPAUHela1D6ng3pDhg==
X-Received: by 10.99.37.70 with SMTP id l67mr18144925pgl.106.1521838111457;
	Fri, 23 Mar 2018 13:48:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	g85sm13706369pfd.109.2018.03.23.13.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 13:48:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 13:48:23 -0700
Message-Id: <20180323204823.4634-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH V2 2/3] glibc: Replace strncpy with memccpy to fix -Wstringop-truncation.
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
X-List-Received-Date: Fri, 23 Mar 2018 20:48:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Add Sign-off field

 ...ncpy-with-memccpy-to-fix-Wstringop-trunca.patch | 40 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch b/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
new file mode 100644
index 0000000000..fa29f4165b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
@@ -0,0 +1,40 @@
+From 113e0516fbd3ce18253f0423762416d4c4b38fb0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Mar 2018 17:57:37 -0700
+Subject: [PATCH 29/29] Replace strncpy with memccpy to fix
+ -Wstringop-truncation.
+
+	* nis/nss_nisplus/nisplus-parser.c: Replace strncpy with memcpy to
+	avoid -Wstringop-truncation.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2018-03/msg00531.html]
+
+ nis/nss_nisplus/nisplus-parser.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nis/nss_nisplus/nisplus-parser.c b/nis/nss_nisplus/nisplus-parser.c
+index 8dc021e73d..b53284f889 100644
+--- a/nis/nss_nisplus/nisplus-parser.c
++++ b/nis/nss_nisplus/nisplus-parser.c
+@@ -87,7 +87,7 @@ _nss_nisplus_parse_pwent (nis_result *result, struct passwd *pw,
+       if (len >= room_left)
+ 	goto no_more_room;
+ 
+-      strncpy (first_unused, numstr, len);
++      memcpy (first_unused, numstr, len);
+       first_unused[len] = '\0';
+       numstr = first_unused;
+     }
+@@ -103,7 +103,7 @@ _nss_nisplus_parse_pwent (nis_result *result, struct passwd *pw,
+       if (len >= room_left)
+ 	goto no_more_room;
+ 
+-      strncpy (first_unused, numstr, len);
++      memcpy (first_unused, numstr, len);
+       first_unused[len] = '\0';
+       numstr = first_unused;
+     }
+-- 
+2.16.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index 4f6f58ccb1..4a461ab283 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-reset-dl_load_write_lock-after-forking.patch \
            file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
+           file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.16.2


