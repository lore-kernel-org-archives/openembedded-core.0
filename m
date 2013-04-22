Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUI81-0007JT-3r
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 16:54:02 +0200
Received: by mail-wi0-f180.google.com with SMTP id h11so4505209wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 07:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XJgelJ32qWUKKaI5Z+v4PBlsjIJ+3hHyRPsKvCTXxeE=;
	b=dfDODzzmTQxO1DN3DiowEh9sH/xhfIKXJVF6QNZaTmimqhyqq7RQTn7kIJIdOU2ENp
	YCy5RQfhzO2CyXoEBKAGqUSjkA+KXBKBY9Jum9yqq/d3cJUiNNw3ROZWIZ6zHchrlsr2
	OeNvqDkCw79tvuCgRZSAGG1if9SbyZl49eB7Vw9GLhDbIUO/EF0AIVf9HpraTYwPd9M/
	NkwrcCjC96wU88fumsodddt+fwBYT76PU8PymPVj5MuwEj1/29UI6YQXH5eUVeILYlTF
	SrxNEGyydiuAOUnrjtMHROcqbuNEy8NPnTZXkGaPmSCnGIAzvDDqvlwVZvYw5N14h6fX
	jIKw==
X-Received: by 10.180.182.110 with SMTP id ed14mr50329294wic.6.1366641378962; 
	Mon, 22 Apr 2013 07:36:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fz3sm22540081wib.0.2013.04.22.07.36.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 07:36:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 15:33:25 +0100
Message-Id: <1366641205-3891-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlsUq7GpjHvMfYzN4E/xrSaRfo9aVssIsnbyEX4bX1xrir0T5KILZpLb96Tgdq1o6NbuqLL
Subject: [PATCH] glib-2.0: disable tests for native builds, and respect ptest for LSB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 14:54:02 -0000

Without disabling the tests in the native build, glib-2.0-native will need
libdbus-native to be present.  As we don't run the tests, disable them so we
don't have build failures due to missing dependencies.

Also, the LSB override was missing PTEST_CONF so the same problem could happen.
After adding PTEST_CONF the LSB override is identical to the non-overridden
EXTRA_OECONF, so remove it.

Finally, to be explicit, put --enable-module-tests in PTEST_CONF.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cb391a2..42c34c3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -27,10 +27,9 @@ S = "${WORKDIR}/glib-${PV}"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
 
-PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '', '--disable-modular-tests', d)}"
+PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-modular-tests', '--disable-modular-tests', d)}"
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
-EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
-EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
+EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux --disable-modular-tests"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
                ${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
-- 
1.7.10.4



