Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id B59136B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:29 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so186128eek.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hxTdqBJPgNu+9b1jZ3V2kEh1r+y3S6j7xBe5SdYWEEo=;
	b=Jy2BjV/iMqlVk8fZv6Ta02FcbhQdqFZGWPx1hRt1zmuDrk8BmkQpyB4zQn2E74Vro1
	3pZkjuW7LKeDNhWP1NxjzVdQ+rktJQAw/dDS4sZvUmzvrTy0E8UHk0GnzO8hmv1FSNtk
	EoQEEWp5renIX5hEn5LUdWzrUAkWRdiuTdqHnSHlJRjoFHwzbxuTvc6+PJaFv94q/exq
	A8iD4pf8DD+ZOU42FFB9LcQ110lD8S92L5vsNvPpN4sNj2JvmL1wH+V37qVIwzOr08cd
	5VHEHr2m/Q2BFO+t9Y4U+Hs/KMwV7GyLLR7F1fNib6YocWdx99DstOTGVDMknJ7gTlrP
	GKPA==
X-Received: by 10.14.223.5 with SMTP id u5mr29152356eep.131.1374667350187;
	Wed, 24 Jul 2013 05:02:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm65589882eeh.15.2013.07.24.05.02.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:31 +0200
Message-Id: <46c0088dea643594f179f2c540213589bc02dbbf.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/18] mailx: remove support for autodetection of krb5
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:30 -0000

* it's autodetected from sysroot and makeconfig doesn't allow
  to explicitly define what's expected

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../explicitly.disable.krb5.support.patch          | 46 ++++++++++++++++++++++
 meta/recipes-extended/mailx/mailx_12.5.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch

diff --git a/meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch b/meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch
new file mode 100644
index 0000000..8c7178b
--- /dev/null
+++ b/meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch
@@ -0,0 +1,46 @@
+krb5 support is autodetected from sysroot making builds undeterministic
+feel free to improve this to support explicitly enabling/disabling it
+
+Upstream-Status: Penging
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/makeconfig	2013-07-21 15:06:11.177792334 +0200
++++ b/makeconfig	2013-07-21 15:07:20.028793994 +0200
+@@ -424,36 +424,6 @@
+ }
+ !
+ 
+-<$tmp2.c link_check gssapi 'for GSSAPI in libgss' \
+-		'#define USE_GSSAPI' '-lgss' ||
+-	<$tmp2.c link_check gssapi 'for GSSAPI in libgssapi_krb5' \
+-			'#define USE_GSSAPI' '-lgssapi_krb5' ||
+-		link_check gssapi 'for GSSAPI in libgssapi_krb5, old-style' \
+-				'#define USE_GSSAPI
+-#define GSSAPI_OLD_STYLE' '-lgssapi_krb5' <<\! || \
+-			link_check gssapi 'for GSSAPI in libgssapi' \
+-				'#define USE_GSSAPI
+-#define	GSSAPI_REG_INCLUDE' '-lgssapi' <<\%
+-#include <gssapi/gssapi.h>
+-#include <gssapi/gssapi_generic.h>
+-
+-int main(void)
+-{
+-	gss_import_name(0, 0, gss_nt_service_name, 0);
+-	gss_init_sec_context(0,0,0,0,0,0,0,0,0,0,0,0,0);
+-	return 0;
+-}
+-!
+-#include <gssapi.h>
+-
+-int main(void)
+-{
+-	gss_import_name(0, 0, GSS_C_NT_HOSTBASED_SERVICE, 0);
+-	gss_init_sec_context(0,0,0,0,0,0,0,0,0,0,0,0,0);
+-	return 0;
+-}
+-%
+-
+ cat >$tmp2.c <<\!
+ #include "config.h"
+ #ifdef HAVE_NL_LANGINFO
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 2a08113..f6734c7 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -14,6 +14,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}-1.diff.gz;name=patch \
+           file://explicitly.disable.krb5.support.patch \
           "
 
 SRC_URI[archive.md5sum] = "29a6033ef1412824d02eb9d9213cb1f2"
-- 
1.8.3.2


