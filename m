Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 146867F7E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4938A9C03F6;
	Wed, 20 Nov 2019 04:34:22 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id qYzBlE3yfKyG; Wed, 20 Nov 2019 04:34:21 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B7AED9C03AF;
	Wed, 20 Nov 2019 04:34:21 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id p9kLgeOYIDEY; Wed, 20 Nov 2019 04:34:21 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 75DEB9C02F8;
	Wed, 20 Nov 2019 04:34:20 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:53 +0100
Message-Id: <20191120093358.11622-13-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 12/17] npm.bbclass: use the local node headers
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:21 -0000
Content-Transfer-Encoding: quoted-printable

When building addons, the node headers are needed to be able to compile
properly. Usually they are downloaded by npm but network access in the
do_compile task are unauthorized. Hopefully the local node headers are
available in the native sysroot so lets use them.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index b13dca7eb8..63b1d9f624 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -121,6 +121,7 @@ npm_do_compile() {
     local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --arch=3D${NPM=
_ARCH}"
     local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --target_arch=3D=
${NPM_ARCH}"
     local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --release"
+    local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --nodedir=3D${=
RECIPE_SYSROOT_NATIVE}${prefix_native}"
=20
     cd ${WORKDIR} && npm install ${NPM_PACK_FILE} \
         ${NPM_INSTALL_GYP_ARGS} \
--=20
2.20.1


