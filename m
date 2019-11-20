Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 11C997F81E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4C0199C0400;
	Wed, 20 Nov 2019 04:34:26 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 3WJUPsyqFVIE; Wed, 20 Nov 2019 04:34:25 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AF2AB9C03AF;
	Wed, 20 Nov 2019 04:34:25 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id HZFZ59b1uBXL; Wed, 20 Nov 2019 04:34:25 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 70F979C03D7;
	Wed, 20 Nov 2019 04:34:24 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:56 +0100
Message-Id: <20191120093358.11622-16-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 15/17] devtool/standard.py: npm: configure the NPM_CACHE_DIR to be persistent
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:25 -0000
Content-Transfer-Encoding: quoted-printable

When using devtool the ${WORKDIR} is not persistent as the creation
workflow is using temporary directories and external workspace. For npm
recipes the NPM_CACHE_DIR needs to be persistent to make the link
between the first do_fetch, do_unpack tasks and the do_compile task.

As the only persistent directory is the source directory, it is used to
store the npm cache. And it is also excluded from the git repository to
allow the 'devtool finish' command to succeed.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 31f0c44b20..1e68d37db9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -262,6 +262,7 @@ def add(args, config, basepath, workspace):
                 f.write('}\n')
=20
             if bb.data.inherits_class('npm', rd):
+                f.write('NPM_CACHE_DIR =3D "${S}/.npm_cache"\n')
                 f.write('exclude_git() {\n')
                 f.write('    local exclude=3D"${S}/.git/info/exclude"\n'=
)
                 f.write('    if [ -f "${exclude}" ] && ! grep -q "${1}" =
"${exclude}" ; then\n')
@@ -269,6 +270,7 @@ def add(args, config, basepath, workspace):
                 f.write('    fi\n')
                 f.write('}\n')
                 f.write('do_compile_append() {\n')
+                f.write('    exclude_git "/.npm_cache"\n')
                 f.write('    exclude_git "/node_modules"\n')
                 f.write('    rm -rf ${B}/lib/node_modules/*/.git\n')
                 f.write('    rm -rf ${B}/lib/node_modules/@*/*/.git\n')
--=20
2.20.1


