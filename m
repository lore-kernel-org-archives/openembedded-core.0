Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9907C60638
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 14:21:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 6so10124815wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cGLIxhJoqFpTa+9OvW+d1mTKWjHtytPfWyaHiWIDq1o=;
	b=X+zxqsq+d/LU8hF2kncZhK8nhuxGpLSENinYpTylJthvRrFcie0Qb+7sEsA7ao54jG
	Ebw2Hrf8DmBBH1YSVFH2CMV1mwe9NVH8IJl9/kQY2/OYy+0r37/ZOTSolPpXHP/HGh5s
	TvUfQ5bcFCOyzKWAFRFg74zxYTqKffyjbWgfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cGLIxhJoqFpTa+9OvW+d1mTKWjHtytPfWyaHiWIDq1o=;
	b=JX9v1Ro5+0n3f4My6uoS/8jfIDak0OFmfMOn60lScRWzfwJT0zUMW63Jg2IWkzw3oN
	C9F+tFXLr0Nr+X25aQHzqTI+rLTEwhwIt3QxOZiEKvO1nIABcfaIgq9CwT661rXwjHaM
	V5pPMd4cVxJlbL9hqxBHlC1NTRR/xSMhkogc9R6tDW0pLtQRAcOtAm708n+IaAeZ/dLt
	SaE+uvUNoUmsTAX1dPNaARrrhHcyIfBlyLDauXdKQrDkNODMp0G3EGXYhKkeZg2LfeaE
	1mowUyodvQziKb5d0ipvdSKnKdeQ6xNk5qa1TcMTtGTroQOJl6gqxtdJ+yvYpJta3Gsq
	fNKw==
X-Gm-Message-State: ANhLgQ1Stzn5cgrLiril2TqPcJ75kzOcCV2R6ZUENH6irqqSAPAtcKDq
	m0S/5pIPNAwKcYxAXB2aPi+RIWqHMbRX4FRV
X-Google-Smtp-Source: ADFU+vu0/Zw/nHXzsV8KmFzwmQnzxQ2BWvw3y9Hn0LGDdpCCq2AN+R3HBaGZwYhkigfjcaJG3UO/rw==
X-Received: by 2002:a1c:156:: with SMTP id 83mr20984681wmb.151.1583763710479; 
	Mon, 09 Mar 2020 07:21:50 -0700 (PDT)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	z10sm25780577wmk.31.2020.03.09.07.21.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 07:21:49 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 14:21:35 +0000
Message-Id: <20200309142139.15741-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309142139.15741-1-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] archiver.bbclass: Handle gitsm URLs in the mirror archiver
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
X-List-Received-Date: Mon, 09 Mar 2020 14:21:50 -0000
Content-Transfer-Encoding: 8bit

To fully archive a `gitsm://` entry in SRC_URI we need to also capture
the submodules recursively. If shallow mirror tarballs are found, they
must be temporarily extracted so that the submodules can be determined.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/archiver.bbclass | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 013195df7d..fef7ad4f62 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -306,7 +306,7 @@ python do_ar_configured() {
 }
 
 python do_ar_mirror() {
-    import subprocess
+    import shutil, subprocess, tempfile
 
     src_uri = (d.getVar('SRC_URI') or '').split()
     if len(src_uri) == 0:
@@ -337,12 +337,10 @@ python do_ar_mirror() {
 
     bb.utils.mkdirhier(destdir)
 
-    fetcher = bb.fetch2.Fetch(src_uri, d)
-
-    for url in fetcher.urls:
+    def archive_url(fetcher, url):
         if is_excluded(url):
             bb.note('Skipping excluded url: %s' % (url))
-            continue
+            return
 
         bb.note('Archiving url: %s' % (url))
         ud = fetcher.ud[url]
@@ -376,6 +374,29 @@ python do_ar_mirror() {
         bb.note('Copying source mirror')
         cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
         subprocess.check_call(cmd, shell=True)
+
+        if url.startswith('gitsm://'):
+            def archive_submodule(ud, url, module, modpath, workdir, d):
+                url += ";bareclone=1;nobranch=1"
+                newfetch = bb.fetch2.Fetch([url], d, cache=False)
+
+                for url in newfetch.urls:
+                    archive_url(newfetch, url)
+
+            # If we're using a shallow mirror tarball it needs to be unpacked
+            # temporarily so that we can examine the .gitmodules file
+            if ud.shallow and os.path.exists(ud.fullshallow) and ud.method.need_update(ud, d):
+                tmpdir = tempfile.mkdtemp(dir=d.getVar("DL_DIR"))
+                subprocess.check_call("tar -xzf %s" % ud.fullshallow, cwd=tmpdir, shell=True)
+                ud.method.process_submodules(ud, tmpdir, archive_submodule, d)
+                shutil.rmtree(tmpdir)
+            else:
+                ud.method.process_submodules(ud, ud.clonedir, archive_submodule, d)
+
+    fetcher = bb.fetch2.Fetch(src_uri, d, cache=False)
+
+    for url in fetcher.urls:
+        archive_url(fetcher, url)
 }
 
 def exclude_useless_paths(tarinfo):
-- 
2.20.1


