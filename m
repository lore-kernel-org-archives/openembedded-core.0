Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sp3kd-0005y4-El
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 22:43:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6BKVwvP026247
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 13:31:58 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jul 2012 13:31:57 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 15:31:55 -0500
Message-ID: <e0cae0d4228e9749d9835bf16a6154eafbdcc713.1342038551.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1342038551.git.peter.seebach@windriver.com>
References: <cover.1342038551.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2012 20:43:11 -0000
Content-Type: text/plain

In the usual case, the computed path used for debugedit to fix
up path references for the target filesystem is correct. However,
prebuilt binary components, such as prebuilt toolchains, can
have debug paths that do not reflect paths within the local
build directory. Providing an override lets us continue to use
the standard debugedit logic in package.bbclass.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6856cd..f0ca443 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -190,7 +190,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
     workdir = d.getVar("WORKDIR", True)
-    workparentdir = os.path.dirname(workdir)
+    workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or os.path.dirname(workdir)
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
 
     # We ignore kernel modules, we don't generate debug info files.
-- 
1.7.0.4



