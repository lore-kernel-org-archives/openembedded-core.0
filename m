Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F22F6A4F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:21:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4T9L3b8017711
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 02:21:03 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 29 May 2013 02:21:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 05:21:00 -0400
Message-ID: <91d93ee101631a24b966f166c3a4ad1b0328d563.1369818931.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369818931.git.jackie.huang@windriver.com>
References: <cover.1369818931.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: fixup extra hardcoded paths
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
X-List-Received-Date: Wed, 29 May 2013 09:21:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

sstate has a logic to fixup hardcoded paths in scripts,
but it misses in some specific cases, so add
EXTRA_STAGING_FIXMES to the fixup hardcoded paths
mechanism, so that we can specify what hardcoded paths
need to be fixed in a recipe, e.g.
EXTRA_STAGING_FIXMES = "STAGING_BINDIR_TOOLCHAIN"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/sstate.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9a76a6b..950be55 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -32,6 +32,7 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATEPREINSTFUNCS ?= ""
 SSTATEPOSTINSTFUNCS ?= ""
+EXTRA_STAGING_FIXMES ?= ""
 
 # Specify dirs in which the shell function is executed and don't use ${B}
 # as default dirs to avoid possible race about ${B} with other task.
@@ -258,6 +259,11 @@ def sstate_installpkg(ss, d):
         else:
             sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
 
+        extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES', True) or ''
+        for fixmevar in extra_staging_fixmes.split():
+            fixme_path = d.getVar(fixmevar, True)
+            sstate_sed_cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
+
         # Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
         sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)
 
@@ -392,6 +398,11 @@ def sstate_hardcode_path(d):
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
         sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
 
+    extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES', True) or ''
+    for fixmevar in extra_staging_fixmes.split():
+        fixme_path = d.getVar(fixmevar, True)
+        sstate_sed_cmd += " -e 's:%s:FIXME_%s:g'" % (fixme_path, fixmevar)
+
     fixmefn =  sstate_builddir + "fixmepath"
 
     sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
-- 
1.7.9.5


