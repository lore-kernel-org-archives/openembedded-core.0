Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id A26777F82A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DCDD09C03F7;
	Wed, 20 Nov 2019 04:34:24 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id sx4skYqzGfP1; Wed, 20 Nov 2019 04:34:24 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6162F9C03AF;
	Wed, 20 Nov 2019 04:34:24 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id gL5wnA_I0sSY; Wed, 20 Nov 2019 04:34:24 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2019C9C03F7;
	Wed, 20 Nov 2019 04:34:23 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:55 +0100
Message-Id: <20191120093358.11622-15-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 14/17] npm.bbclass: force to rebuild the prebuild addons
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:23 -0000
Content-Transfer-Encoding: quoted-printable

This commit forces to rebuild the prebuild addons which are using
node-gyp-build.

  https://www.npmjs.com/package/node-gyp-build

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 63b1d9f624..13f6b2b158 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -123,7 +123,10 @@ npm_do_compile() {
     local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --release"
     local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --nodedir=3D${=
RECIPE_SYSROOT_NATIVE}${prefix_native}"
=20
+    local NPM_INSTALL_GYP_BUILD_ARGS=3D"${NPM_INSTALL_GYP_BUILD_ARGS} --=
build-from-source"
+
     cd ${WORKDIR} && npm install ${NPM_PACK_FILE} \
+        ${NPM_INSTALL_GYP_BUILD_ARGS} \
         ${NPM_INSTALL_GYP_ARGS} \
         ${NPM_INSTALL_ARGS}
 }
--=20
2.20.1


