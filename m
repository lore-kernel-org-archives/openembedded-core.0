Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 099647F815
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 402CC9C0391;
	Wed, 20 Nov 2019 04:34:21 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id DHJWi4GN_RY0; Wed, 20 Nov 2019 04:34:20 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7B14B9C03AF;
	Wed, 20 Nov 2019 04:34:20 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id iOKG715J1021; Wed, 20 Nov 2019 04:34:20 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2486F9C0391;
	Wed, 20 Nov 2019 04:34:19 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:52 +0100
Message-Id: <20191120093358.11622-12-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 11/17] npm.bbclass: restrict the build to be offline
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:20 -0000
Content-Transfer-Encoding: quoted-printable

After the do_fetch task, every other tasks must not access the network.
In order to ensure this point every npm command must use the '--offline'
argument. In addition, setting an invalid proxy is used as a safety.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index e2a258afe1..b13dca7eb8 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -97,7 +97,7 @@ npm_do_compile() {
     local NPM_SHRINKWRAP_INSTALLED=3D$(npm_install_shrinkwrap)
=20
     # Then create a tarball from a npm package whose sources must be in =
${S}.
-    local NPM_PACK_FILE=3D$(cd ${WORKDIR} && npm pack ${S}/)
+    local NPM_PACK_FILE=3D$(cd ${WORKDIR} && npm pack ${S}/ --offline --=
proxy=3Dhttp://invalid.org)
=20
     # Clean source tree.
     rm -f ${NPM_SHRINKWRAP_INSTALLED}
@@ -106,6 +106,8 @@ npm_do_compile() {
     rm -rf ${B}
=20
     # Finally install and build the tarball package in ${B}.
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --offline"
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --proxy=3Dhttp://inval=
id.org"
     local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --cache=3D${NPM_CACHE_=
DIR}"
     local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --loglevel=3Dsilly"
     local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --prefix=3D${B}"
--=20
2.20.1


