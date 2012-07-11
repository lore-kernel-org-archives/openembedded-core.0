Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SozWA-0008B2-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 18:11:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6BG0ext008529
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 09:00:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jul 2012 09:00:40 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:00:39 -0500
Message-ID: <22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1342022120.git.peter.seebach@windriver.com>
References: <cover.1342022120.git.peter.seebach@windriver.com>
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
X-List-Received-Date: Wed, 11 Jul 2012 16:11:59 -0000
Content-Type: text/plain

In the usual case, the computed path used for debugedit to fix
up path references for the target filesystem is correct. However,
prebuilt binary components, such as prebuilt toolchains, can
have debug paths that do not reflect paths within the local
build directory. Providing an override lets us continue to use
the standard debugedit logic in package.bbclass.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/package.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6856cd..1a8c7f8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -191,6 +191,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
     workdir = d.getVar("WORKDIR", True)
     workparentdir = os.path.dirname(workdir)
+    overridedir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or ""
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
 
     # We ignore kernel modules, we don't generate debug info files.
@@ -205,7 +206,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-	subprocess.call("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
+	subprocess.call("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, overridedir or workparentdir, debugsrcdir, sourcefile, file), shell=True)
 
     bb.mkdirhier(os.path.dirname(debugfile))
 
-- 
1.7.0.4



