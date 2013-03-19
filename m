Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHsoV-0000y1-Gc
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 10:26:38 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so109294eei.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 02:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=jl/VxZxLDnBUtuiCA6vRcguHE5N6rsyAiKMq7hYrLsU=;
	b=DElwNdebi5e9jEW5A+zJksYv42OpK4Ii+N1H+go+EHnfgLFQBW3GAmSY7IDqapSlQD
	cjhVfnPzdNBMPg/BmG62pwtvN7O7CHqYO3Y55x43AacPYTjhtsvoFiA86S0NceYHUJEB
	S26gb5vA67mmgwMhCiazbWVq8voy8AzkACnuEpsOz2oZQt48Jj8CvouTMsdf3AxvYoxe
	3OtSAk4OoBAHv+54IMkkwQCIG1uneGxF3/iCmoYNfLfnAZd6UJD+XAGnYYs5fazV4XPX
	B89Kz5qeS5/7uf4nRx7Zq51LtTuyIDTRCf2I46ilnOg5HfAVFCQlye1eUgB+isJ6V11s
	vq3A==
X-Received: by 10.14.0.135 with SMTP id 7mr58050964eeb.5.1363684186240;
	Tue, 19 Mar 2013 02:09:46 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k7sm31781362een.8.2013.03.19.02.09.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 02:09:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 10:09:38 +0100
Message-Id: <1363684178-28081-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkt1DVB/1jBJn/nEtBrSLxxpjFDD0CcNLiPVvbVrCo5ehpkNuC/4aE8H0cc8lkDMlJSm1q/
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] python: fix on-target use of distutils/setuptools by removing references to buildpaths
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
X-List-Received-Date: Tue, 19 Mar 2013 09:26:41 -0000

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
 meta/recipes-devtools/python/python_2.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 1968629..65faa80 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -141,6 +141,9 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
 	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+
+	# Remove references to buildmachine paths in target Makefile
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
1.8.1.4



