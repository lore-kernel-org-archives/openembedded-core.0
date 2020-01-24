Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 046E37FDA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 081E09C02BF;
	Fri, 24 Jan 2020 12:07:57 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id f1TddKifO7Ty; Fri, 24 Jan 2020 12:07:56 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 462E59C02BE;
	Fri, 24 Jan 2020 12:07:56 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id W-6ht1I4dnY3; Fri, 24 Jan 2020 12:07:56 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id BB7C79C02BF;
	Fri, 24 Jan 2020 12:07:54 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 18:07:33 +0100
Message-Id: <20200124170743.20463-4-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v6 03/13] classes/npm: use the local node headers
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
X-List-Received-Date: Fri, 24 Jan 2020 17:07:56 -0000
Content-Transfer-Encoding: quoted-printable

When building addons, the node headers are needed to be able to compile
properly. Usually they are downloaded by npm but network access in the
do_compile task are unauthorized. Hopefully the local node headers are
available in the native sysroot so lets use them.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index cf2c12047e..88d8de91e9 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -233,6 +233,9 @@ python npm_do_compile() {
         # Add node-gyp configuration
         configs.append(("arch", d.getVar("NPM_ARCH")))
         configs.append(("release", "true"))
+        sysroot =3D d.getVar("RECIPE_SYSROOT_NATIVE")
+        nodedir =3D os.path.join(sysroot, d.getVar("prefix_native").stri=
p("/"))
+        configs.append(("nodedir", nodedir))
=20
         # Pack and install the main package
         tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
--=20
2.20.1


