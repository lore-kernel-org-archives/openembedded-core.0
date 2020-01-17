Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id A35AF7FA10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9BDCB9C047C;
	Fri, 17 Jan 2020 11:46:23 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id E6IoyRUIOJnS; Fri, 17 Jan 2020 11:46:23 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0F0259C0477;
	Fri, 17 Jan 2020 11:46:23 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id RlcGyCGKFJIf; Fri, 17 Jan 2020 11:46:22 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 6724E9C047A;
	Fri, 17 Jan 2020 11:46:21 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:46:00 +0100
Message-Id: <20200117164609.28400-5-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v4 04/13] classes/npm: use the native python
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
X-List-Received-Date: Fri, 17 Jan 2020 16:46:22 -0000
Content-Transfer-Encoding: quoted-printable

When building addons, the node-gyp build tool is looking for python. It
is available in the native directory but not directly in the PATH.

This commit configures npm to use the native python executable.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index edeef51033..76321eab06 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -233,6 +233,9 @@ python npm_do_compile() {
         sysroot =3D d.getVar("RECIPE_SYSROOT_NATIVE")
         nodedir =3D os.path.join(sysroot, d.getVar("prefix_native").stri=
p("/"))
         configs.append(("nodedir", nodedir))
+        bindir =3D os.path.join(sysroot, d.getVar("bindir_native").strip=
("/"))
+        pythondir =3D os.path.join(bindir, "python-native", "python")
+        configs.append(("python", pythondir))
=20
         # Pack and install the main package
         tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
--=20
2.20.1


