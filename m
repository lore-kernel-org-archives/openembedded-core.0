Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyG-0003op-FU
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:23 +0200
Received: by pwj9 with SMTP id 9so1388561pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=yiJ0oc2xJSNj3kWKx5ccDDqoPlQyat2K6Hkys38dzNs=;
	b=TaHHLe3miw7clyPPldYBUwwuO6aX9sjxBmQI1aBn5Qw5emko9sYonujwK0z8Kgf4Sx
	zt1rHVl2kVd419HGeJmoeLi/uha5YVhJ9SjrqpTDpUIqV+yPQm/80e5Z31taBlsX3VGi
	8ahluZgB1LRaU+fQCnDS63ZyA/WiWxb09GpIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AML3gPkOdfJ4mIq5DI6XaNEQd6tz/nQZMBUACY3G4mPt39kko97AzJXs2mNSQNCSiO
	/csy0T7HeDf9R7jMfUDs7k7R9WHmyNbQ9PbPD7qC1ICjuMkMEeQW14odGUAfs9iNEUgp
	G0yJhSdHASOM7gDC0l+xsCcMizPT81v5gRjh8=
Received: by 10.142.78.12 with SMTP id a12mr2716203wfb.268.1303757691154;
	Mon, 25 Apr 2011 11:54:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p40sm8089799wfc.19.2011.04.25.11.54.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:46 -0700
Message-Id: <632cadd81383669f24f7a5ad81c5038f7e95ce94.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 06/17] gettext: Divide packaging into gettext-runtime and rest
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:23 -0000

This helps in footprint on space constrained systems e.g.
uclibc based systems where packaging full gettext just for
libintl can be waste of space.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.17.bb |   35 +++++++++++++++++++++++++---
 1 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.17.bb b/meta/recipes-core/gettext/gettext_0.17.bb
index b9c4e1c..bfcb5ea 100644
--- a/meta/recipes-core/gettext/gettext_0.17.bb
+++ b/meta/recipes-core/gettext/gettext_0.17.bb
@@ -53,9 +53,36 @@ acpaths = '-I ${S}/autoconf-lib-link/m4/ \
 # 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
 # 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
+PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
-PACKAGES =+ "libgettextlib libgettextsrc"
-FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
-FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
-
+FILES_gettext-runtime = "${bindir}/gettext \
+                         ${bindir}/ngettext \
+                         ${bindir}/envsubst \
+                         ${bindir}/gettext.sh \
+                         ${libdir}/libasprintf.so* \
+                         ${libdir}/GNU.Gettext.dll \
+                        "
+FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
+                                             ${libdir}/charset.alias \
+                                           "
+FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
+                      ${includedir}/autosprintf.h \
+                     "
+FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
+                                                 ${includedir}/libintl.h \
+                                               "
+FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
+                             ${mandir}/man1/ngettext.* \
+                             ${mandir}/man1/envsubst.* \
+                             ${mandir}/man1/.* \
+                             ${mandir}/man3/* \
+                             ${docdir}/gettext/gettext.* \
+                             ${docdir}/gettext/ngettext.* \
+                             ${docdir}/gettext/envsubst.* \
+                             ${docdir}/gettext/*.3.html \
+                             ${datadir}/gettext/ABOUT-NLS \
+                             ${docdir}/gettext/csharpdoc/* \
+                             ${docdir}/libasprintf/autosprintf.html \
+                             ${infodir}/autosprintf.info \
+                            "
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.4.1



