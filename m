Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXuDh-0005yi-5R
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 13:34:01 +0100
Received: by eaac1 with SMTP id c1so1490344eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 04:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=w1LLPGRJtBEBTJd+xks4iVV46m6ptLZXiHm8V0033V8=;
	b=sZKNzyC0ishoZuzHq5EYGKa7asYTpWaDmheXVaE1QvNgpZRB5SOd33nMPMLEKvzuAA
	Z2UKnGHOpbe54BmvUs8RDnu+mj8OLMC9yoxundWWm1IVKZQ4+vaZ6Igbv5EKr2GRbkDN
	suE28EVtIdvjkic+BlRifIvoQsnABAIqX6ycs=
Received: by 10.213.23.9 with SMTP id p9mr2422980ebb.147.1323174433725;
	Tue, 06 Dec 2011 04:27:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm65911774eet.11.2011.12.06.04.27.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 04:27:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 13:27:10 +0100
Message-Id: <1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
References: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
Subject: [PATCH] ppl: fix libgmp paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 12:34:01 -0000

* before this patch:
configure:10139: checking how to link with libgmp
configure:10612: result: /usr/lib/libgmp.so
configure:10654: checking how to link with libgmpxx
configure:11127: result: /usr/lib/libgmpxx.so /usr/lib/libgmp.so
...
ac_cv_libgmp_cppflags=
ac_cv_libgmp_libs=/usr/lib/libgmp.so
ac_cv_libgmp_ltlibs='-L/usr/lib -lgmp'
ac_cv_libgmp_prefix=/usr
ac_cv_libgmpxx_cppflags=
ac_cv_libgmpxx_libs='/usr/lib/libgmpxx.so /usr/lib/libgmp.so'
ac_cv_libgmpxx_ltlibs='-L/usr/lib -lgmpxx -L/usr/lib -lgmp'
ac_cv_libgmpxx_prefix=/usr

* after this patch
configure:10139: checking how to link with libgmp
configure:10612: result: -lgmp
configure:10654: checking how to link with libgmpxx
configure:11127: result: -lgmpxx -lgmp
...
ac_cv_libgmp_cppflags=
ac_cv_libgmp_libs=-lgmp
ac_cv_libgmp_ltlibs=-lgmp
ac_cv_libgmp_prefix=
ac_cv_libgmpxx_cppflags=
ac_cv_libgmpxx_libs='-lgmpxx -lgmp'
ac_cv_libgmpxx_ltlibs='-lgmpxx -lgmp'
ac_cv_libgmpxx_prefix=

* but for ppl-native it worked before as well as after this patch like this:
configure:10139: checking how to link with libgmp
configure:10612: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmp.so -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib
configure:10654: checking how to link with libgmpxx
configure:11127: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmpxx.so /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmp.so -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/ppl/ppl_0.11.2.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/ppl/ppl_0.11.2.bb b/meta/recipes-support/ppl/ppl_0.11.2.bb
index 7536364..b31fc4d 100644
--- a/meta/recipes-support/ppl/ppl_0.11.2.bb
+++ b/meta/recipes-support/ppl/ppl_0.11.2.bb
@@ -11,6 +11,10 @@ SRC_URI[sha256sum] = "e3fbd1c19ef44c6f020951807cdb6fc6a8153cd3a5c53b0ab9cf4c4f6e
 S = "${WORKDIR}/ppl-${PV}"
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OECONF = "--enable-watchdog --disable-debugging --disable-assertions --disable-ppl_lcdd --disable-ppl_lpsol --disable-ppl_pips --enable-interfaces='c cxx'"
+# do we have something shorter then this? or can native.bbclass overwrite STAGING_DIR_HOST like nativesdk does?
+GMP_PREFIX = "${STAGING_DIR_HOST}"
+GMP_PREFIX_virtclass-native = "${STAGING_DIR_NATIVE}"
+
+EXTRA_OECONF = "--with-gmp-prefix=${GMP_PREFIX} --enable-watchdog --disable-debugging --disable-assertions --disable-ppl_lcdd --disable-ppl_lpsol --disable-ppl_pips --enable-interfaces='c cxx'"
 
 acpaths = "-I m4"
-- 
1.7.8



