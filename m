Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id F11116A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:24 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q10so1918940pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XQo0+PNHREKzl/K2joranfjpX7+njl0kMLPOG54zzZ0=;
	b=UkpHWjDo/UhwSLQ9OXupBhHhlmETA1i867vuapoOk3HOj6GuXlokDN3IR4pB2/XURz
	Tzj6rcGNbwBll1h0B/YuSsZOg3LNyX8fmeHynT4Mz9FFkgO2efDGFagt4ZDshNW/yjYy
	hqMa4TXfsAw/UsXypoMGCFWAyF6ocwsYnbjM4Dq2HQKXsJ5catdu3gesErbn5lIoaSKP
	YmxhDBn5cfsVQ79GmqmSfqUoW3mqQqxNyczccnYNNvWxX6GpcuzBkOUF1G8T9AX2ibnV
	dTT2KsHSshzQyml+39+ADPGqema3r2+z2fzmDEYZHvxd5RoJBN+Eam4m18/PczytaBkK
	qa8A==
X-Received: by 10.66.160.1 with SMTP id xg1mr15753385pab.25.1370897186401;
	Mon, 10 Jun 2013 13:46:26 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	ix3sm11541082pbc.37.2013.06.10.13.46.24 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:25 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:23 -0700
Message-Id: <694bdc11ba7066ca142d101c4dba08987fbfcb9c.1370896970.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] sstate.bbclass: fetch archive+siginfo in a single pstaging_fetch
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

This avoids unnecessary duplication of setup. The only visible change in
behavior will be the case if siginfo exists and the archive does not, in which
case it'll redownload both, but this doesn't seem unresasonable to me,
particularly since the archive is downloaded first, making this case
particularly unlikely.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sstate.bbclass | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3aa4371..28dc312 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -224,8 +224,6 @@ def sstate_installpkg(ss, d):
 
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, sstatepkg, d)
-    if not os.path.exists(sstatepkg + ".siginfo"):
-        pstaging_fetch(sstatefetch + ".siginfo", sstatepkg + ".siginfo", d)
 
     if not os.path.isfile(sstatepkg):
         bb.note("Staging package %s does not exist" % sstatepkg)
@@ -504,30 +502,30 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     bb.data.update_data(localdata)
 
     dldir = localdata.expand("${SSTATE_DIR}")
-    srcuri = "file://" + sstatefetch
-
     bb.mkdirhier(dldir)
 
     localdata.delVar('MIRRORS')
     localdata.delVar('FILESPATH')
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
-    localdata.setVar('SRC_URI', srcuri)
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
-    try:
-        fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-        fetcher.download()        
-
-        # Need to optimise this, if using file:// urls, the fetcher just changes the local path
-        # For now work around by symlinking
-        localpath = bb.data.expand(fetcher.localpath(srcuri), localdata)
-        if localpath != sstatepkg and os.path.exists(localpath) and not os.path.exists(sstatepkg):
-            os.symlink(localpath, sstatepkg)
-
-    except bb.fetch2.BBFetchException:
-        pass
+    for srcuri in ['file://{0}'.format(sstatefetch),
+                   'file://{0}.siginfo'.format(sstatefetch)]:
+        localdata.setVar('SRC_URI', srcuri)
+        try:
+            fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+            fetcher.download()
+
+            # Need to optimise this, if using file:// urls, the fetcher just changes the local path
+            # For now work around by symlinking
+            localpath = bb.data.expand(fetcher.localpath(srcuri), localdata)
+            if localpath != sstatepkg and os.path.exists(localpath) and not os.path.exists(sstatepkg):
+                os.symlink(localpath, sstatepkg)
+
+        except bb.fetch2.BBFetchException:
+            break
 
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
-- 
1.8.3


