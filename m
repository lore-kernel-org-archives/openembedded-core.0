Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 79B2370609
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 12:40:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6ICefrj010898 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 13:40:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S8odD8sqtpNq
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 13:40:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6ICeagC010893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 13:40:37 +0100
Message-ID: <1405687231.26348.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jul 2014 13:40:31 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] subversion: Disable make install parallelism
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
X-List-Received-Date: Fri, 18 Jul 2014 12:40:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Makefile generation for subversion is horrible, I can't figure out
where the dependencies are missing, it looks like they might be missing
everywhere. Give up and disable parallel make install.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/subversion/subversion_1.8.9.bb b/meta/re=
cipes-devtools/subversion/subversion_1.8.9.bb
index a6ef3d4..d134a53 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.9.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
@@ -40,3 +40,10 @@ do_configure_prepend () {
 	rm -f ${S}/aclocal.m4
 	sed -i -e 's:with_sasl=3D"/usr/local":with_sasl=3D"${STAGING_DIR}":' ${S}=
/build/ac-macros/sasl.m4
 }
+
+#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/sub=
version-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.=
la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86=
_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion=
-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not b=
een installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa=
-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: can=
not find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-l=
ibtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8=
.9-r0/build/subversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been insta=
lled in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotat=
e/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: ins=
tall: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-l=
ogrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build=
/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/b=
uild/tmp/sysroots/x86_64-linux/usr/lib'
+#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with=
 the above command before installing it
+#| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/=
libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linu=
x/usr/lib'
+#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/bui=
ld/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/=
build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
+#| make: *** [install-serf-lib] Error 1
+PARALLEL_MAKEINST =3D ""



