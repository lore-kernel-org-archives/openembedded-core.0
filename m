Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6892B6B903
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:20 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so180525eek.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=hxTdqBJPgNu+9b1jZ3V2kEh1r+y3S6j7xBe5SdYWEEo=;
	b=efT8BE6W586G4M6ZL3tbP8dYNUUj77welgg3EwDkkzCtmYnzyZZBrwvfUNq4+HHoaO
	7xB5ROtWMbSIN8bRveGohb1QiO7Cbn5Rb/3ZflKRe9qZSJM3zanQdE5Ggdu5xgCxdQsO
	gDjnVQC7KwfkFW60IGe6xTzkG+uvDFTFbzQqYWdDmcUxgtkeVcsEs6UWKtPT7EnSXA1y
	lARYVCqc1rwp7YjJlG5BlOkuGtqFC0noeRn05eNhwF8VRLg8W9tHsZiqbGZhnTDNaEG5
	Kr0Q4TAT4AyR+4QCIwfrPVRBbi8erkJ58j4UzRxtb9qhACG3/pMvM+jq+RVJ2oPiqHzQ
	gENg==
X-Received: by 10.15.91.3 with SMTP id r3mr20858493eez.4.1376551400863;
	Thu, 15 Aug 2013 00:23:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm81982916eeg.13.2013.08.15.00.23.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:33 +0200
Message-Id: <3582e95085c2f118415320305fd878e3fa618284.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 22/33] mailx: remove support for autodetection of krb5
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:20 -0000

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


