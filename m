Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id C3FD57F7EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 040CA9C0301;
	Wed, 20 Nov 2019 04:34:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id G_O5dsJGo55G; Wed, 20 Nov 2019 04:34:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 595799C02F8;
	Wed, 20 Nov 2019 04:34:16 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id CbV2opKguDcZ; Wed, 20 Nov 2019 04:34:16 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 04B1A9C0301;
	Wed, 20 Nov 2019 04:34:14 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:49 +0100
Message-Id: <20191120093358.11622-9-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 08/17] npm.bbclass: split the do_compile task
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:16 -0000
Content-Transfer-Encoding: quoted-printable

The do_compile task must be split in order to fit the yocto workflow.
The dependencies are fetched in the do_fetch task and cached in the
do_unpack task.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index b3f73d9b67..e2a258afe1 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -48,6 +48,25 @@ NPM_CACHE_DIR ?=3D "${WORKDIR}/npm_cache"
=20
 B =3D "${WORKDIR}/build"
=20
+python do_fetch_append() {
+    """
+        Fetch all dependencies tarball to DL_DIR.
+    """
+    bb.fetch2.npm.fetch_dependencies(d)
+}
+
+python do_unpack_append() {
+    """
+        Unpack all dependencies tarball to the 'node_modules' directory =
and add
+        them to the npm cache. The dependencies needs to be unpacked to =
have
+        access to the licenses files checksum feature (LIC_FILES_CHKSUM)=
. They
+        also have to be in the cache to properly execute the 'npm instal=
l'.
+    """
+    bb.fetch2.npm.unpack_dependencies(d)
+}
+
+do_unpack[depends] =3D "nodejs-native:do_populate_sysroot"
+
 npm_install_shrinkwrap() {
     # This function ensures that there is a shrinkwrap file in the speci=
fied
     # directory. A shrinkwrap file is mandatory to have reproducible bui=
lds.
--=20
2.20.1


