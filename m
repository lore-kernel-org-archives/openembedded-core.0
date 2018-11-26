Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 905136C632
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 03:15:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAQ3FMar001064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:15:32 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 25 Nov 2018 19:15:11 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 25 Nov 2018 22:14:54 -0500
Message-ID: <707b74f53961600af62daa87c3f999fb5aed6a91.1543198247.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1543198247.git.kai.kang@windriver.com>
References: <cover.1543198247.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib_script: fix packages split
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
X-List-Received-Date: Mon, 26 Nov 2018 03:15:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

In multilib_script.bbclass it renames script file which listed in
MULTILIB_SCRIPTS. It may mix up packages split. Take package curl as
example, ${bindir}/curl-config is packaged to curl-dev originally. But
it is renamed to curl-config-${MULTILIB_SUFFIX} and packaged to curl
when multilib is enabled.

And expand 'pkg' to fix QA warning:

| WARNING: Variable key FILES_${PN}-dev (
| ${bindir}/curl-config-${MULTILIB_SUFFIX}) replaces original key
| FILES_curl-dev (${includedir} ${FILES_SOLIBSDEV} ... ${bindir}/*-config)

Insert a necessary space to the argument 'value' of d.appendVar() as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/multilib_script.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
index 51c9fcc12c..dc166d06c1 100644
--- a/meta/classes/multilib_script.bbclass
+++ b/meta/classes/multilib_script.bbclass
@@ -24,9 +24,11 @@ python () {
 
     for entry in (d.getVar("MULTILIB_SCRIPTS", False) or "").split():
        pkg, script = entry.split(":")
+       epkg = d.expand(pkg)
        scriptname = os.path.basename(script)
-       d.appendVar("ALTERNATIVE_" + pkg, scriptname + " ")
+       d.appendVar("ALTERNATIVE_" + epkg, " " + scriptname + " ")
        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
+       d.appendVar("FILES_" + epkg, " " + script + "-${MULTILIB_SUFFIX}")
 }
-- 
2.19.0.rc2


