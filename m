Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0365E7F7D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3EDA49C032F;
	Wed, 20 Nov 2019 04:34:18 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id pyQpwom7E765; Wed, 20 Nov 2019 04:34:17 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9B9159C02F8;
	Wed, 20 Nov 2019 04:34:17 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id XKe9_gu8EaNc; Wed, 20 Nov 2019 04:34:17 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5759B9C01C2;
	Wed, 20 Nov 2019 04:34:16 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:50 +0100
Message-Id: <20191120093358.11622-10-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 09/17] devtool/standard.py: npm: exclude the node_modules directory
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:17 -0000
Content-Transfer-Encoding: quoted-printable

If 'devtool add' was executed without the '--no-git' option a git
repository have been initialized in the source directory in order to
check if the sources stay unchanged after the 'devtool build' command.
The 'devtool finish' command will fail if any modification is found.

As the node_modules directory is added to the source tree in order to
manage the dependency license, it needs to be explicitly excluded from
this git repository.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/devtool/standard.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 2604b79be3..31f0c44b20 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -262,7 +262,14 @@ def add(args, config, basepath, workspace):
                 f.write('}\n')
=20
             if bb.data.inherits_class('npm', rd):
+                f.write('exclude_git() {\n')
+                f.write('    local exclude=3D"${S}/.git/info/exclude"\n'=
)
+                f.write('    if [ -f "${exclude}" ] && ! grep -q "${1}" =
"${exclude}" ; then\n')
+                f.write('        echo "${1}" >> "${exclude}"\n')
+                f.write('    fi\n')
+                f.write('}\n')
                 f.write('do_compile_append() {\n')
+                f.write('    exclude_git "/node_modules"\n')
                 f.write('    rm -rf ${B}/lib/node_modules/*/.git\n')
                 f.write('    rm -rf ${B}/lib/node_modules/@*/*/.git\n')
                 f.write('    rm -f ${B}/lib/node_modules/*/singletask.lo=
ck\n')
--=20
2.20.1


