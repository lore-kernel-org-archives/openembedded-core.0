Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id E8F35745D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 19:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 577C09C1C9C;
	Mon, 28 May 2018 15:48:10 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id g6j9BePwsVyA; Mon, 28 May 2018 15:48:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 235489C1CED;
	Mon, 28 May 2018 15:48:09 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 4WCxIDDieT-I; Mon, 28 May 2018 15:48:09 -0400 (EDT)
Received: from workotop.mtl.sfl (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id F378B9C1BD3;
	Mon, 28 May 2018 15:48:08 -0400 (EDT)
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 15:47:44 -0400
Message-Id: <20180528194744.32247-1-damien.riegel@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [rocko][PATCH] npm.bbclass: Fix building node modules with npm@5
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
X-List-Received-Date: Mon, 28 May 2018 19:48:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>

npm cache clear throws an error with npm@5 and suggests to
use npm cache verify instead. But our cache is actually empty,
so use npm cache clear --force.

npm install in the source directory creates symlinks with npm@5.

Use a combination of npm pack and npm install module-version.tgz
that works the same way with older and new npm versions and is
guaranteed to create actual copies instead of directory symlinks.

This change allows using nodejs 8.x LTS, tested with 8.9.4.

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@pr.hu>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
I'm sending a request to include this patch in the rocko branch, as the
version of NodeJS included in rocko version of meta-oe is 8.4.0, so it
can definitely benefit from this patch.

 meta/classes/npm.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index a69bedbb28..898a54eb50 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -31,7 +31,7 @@ npm_do_compile() {
 	fi
 	npm set cache ${WORKDIR}/npm_cache
 	# clear cache before every build
-	npm cache clear
+	npm cache clear --force
 	# Install pkg into ${S} without going to the registry
 	if [  "${NPM_INSTALL_DEV}" =3D "1" ]; then
 		npm --arch=3D${NPM_ARCH} --target_arch=3D${NPM_ARCH} --no-registry ins=
tall
@@ -45,7 +45,8 @@ npm_do_install() {
 	# be created in this directory
 	export HOME=3D${WORKDIR}
 	mkdir -p ${NPM_INSTALLDIR}/
-	npm install --prefix ${D}${prefix} -g --arch=3D${NPM_ARCH} --target_arc=
h=3D${NPM_ARCH} --production --no-registry
+	npm pack .
+	npm install --prefix ${D}${prefix} -g --arch=3D${NPM_ARCH} --target_arc=
h=3D${NPM_ARCH} --production --no-registry ${PN}-${PV}.tgz
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
--=20
2.17.0


