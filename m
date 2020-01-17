Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 14D717FA16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5110B9C047E;
	Fri, 17 Jan 2020 11:46:25 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id gqD2Tv-T3ilS; Fri, 17 Jan 2020 11:46:24 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BB6229C047D;
	Fri, 17 Jan 2020 11:46:24 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id EU1AN1dRmPDm; Fri, 17 Jan 2020 11:46:24 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2143B9C047A;
	Fri, 17 Jan 2020 11:46:23 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:46:01 +0100
Message-Id: <20200117164609.28400-6-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v4 05/13] classes/npm: force to rebuild the prebuild addons
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
X-List-Received-Date: Fri, 17 Jan 2020 16:46:24 -0000
Content-Transfer-Encoding: quoted-printable

This commit forces to rebuild the prebuild addons which are using
node-gyp-build.

  https://www.npmjs.com/package/node-gyp-build

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 76321eab06..115c409020 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -213,6 +213,7 @@ python npm_do_compile() {
     dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
=20
     with tempfile.TemporaryDirectory() as tmpdir:
+        args =3D []
         configs =3D []
=20
         if dev:
@@ -237,9 +238,13 @@ python npm_do_compile() {
         pythondir =3D os.path.join(bindir, "python-native", "python")
         configs.append(("python", pythondir))
=20
+        # Add node-pre-gyp configuration
+        args.append(("target_arch", d.getVar("NPM_ARCH")))
+        args.append(("build-from-source", "true"))
+
         # Pack and install the main package
         tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
-        env.run("npm install '%s'" % tarball, configs=3Dconfigs)
+        env.run("npm install '%s'" % tarball, args=3Dargs, configs=3Dcon=
figs)
 }
=20
 npm_do_install() {
--=20
2.20.1


