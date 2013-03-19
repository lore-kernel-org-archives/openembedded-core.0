Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHs6t-0007yd-SQ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 09:41:52 +0100
Received: by mail-ea0-f177.google.com with SMTP id r16so84166ead.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 01:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Uvv98FcZ1d1gTlEMx+yeLdDjJgVbpH2YIuiA/8JMtjY=;
	b=B2dM2HNKBdDhtKi8pyxEzh5aBwMNjNA+pSiLAJ++38yd078CNAINmuCo8M7OXz8UW4
	8A1lGUz9XeJPmkn5ptxHKgM4RK51Yf6MmXnBtmnMa18qTtqn1P17TBLc+fgRIRKBzVkK
	5xxsEOX+5Xu9QvqLBmkoC8vsmHzFqraJB3edbJyqbICg+3CKHZPEpE1s18PBGKXaaq4C
	Y2GGGp8p7EUhiq8iSp4LmLEqR0lQb7CRaVcMCSO65nr3UovlOufyobkgVG101/KTsgQL
	SQTA14H9HuQavhfxnRPZtuZqGiEnInE08NfFc617Ns6z7yL/Q3z/K8hOM7DF7lw6A50v
	F3PA==
X-Received: by 10.14.209.131 with SMTP id s3mr57714212eeo.26.1363681482689;
	Tue, 19 Mar 2013 01:24:42 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id h5sm31584048eem.1.2013.03.19.01.24.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 01:24:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 09:24:33 +0100
Message-Id: <1363681473-26243-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQm+FqYsxrxWGbLPIGMJFHQCKgbxSI6CBzLroRP2t/wuCMvNp0buU25NFUEkqm36BJvS90bh
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] python: fix on-target use of distutils/setuptools by removing references to buildpaths
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
X-List-Received-Date: Tue, 19 Mar 2013 08:41:58 -0000

Running 'python setup.py build' would fail due to the python Makefile having

CC=             i586-angstrom-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/home/koen/v2012.12/build/tmp-angstrom_v2012_12-eglibc/sysroots/fri2
CXX=            i586-angstrom-linux-g++  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/home/koen/v2012.12/build/tmp-angstrom_v2012_12-eglibc/sysroots/fri2
'--with-libtool-sysroot=/home/koen/v2012.12/build/tmp-angstrom_v2012_12-eglibc/sysroots/fri2'

And more

Multiple users have reported this problem:

http://hipstercircuits.com/?p=499
http://www.gigamegablog.com/2012/09/09/beaglebone-coding-101-spi-output/

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index c181933..6b127a0 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -109,11 +109,17 @@ do_install() {
 
 	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 
+	# Remove references to buildmachine paths in target Makefile
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
+	       -e 's:${STAGING_DIR_TARGET}::g'\
+	       ${D}${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+
 	if [ -e ${WORKDIR}/sitecustomize.py ]; then
 		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
 	fi
 
 	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
1.8.1.4



