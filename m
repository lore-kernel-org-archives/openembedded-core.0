Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7E87B76EBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:18:23 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	t8AGoYOL018549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 18:50:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1441903837;
	bh=lf3Q1N87c6FZvopvoHbcwkXytQH0jcmDsSMjY5JdId0=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=b+LDagXtwkyRs1xfBYD3fnvJselFE6lTo6zG8J2f6FtkdjEcduhSVhIy+gBrv1mKv
	8hpvxdRHBfhX+tZA+bE6vaMK2H7ovWktbQxsvTjB9vsxoMBFsp2TlmBhEoboelzCW+
	YOy+gVfgMczYwtsQpkhhzwJuxcoSpo8rzhActF6s=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t8AGoKTG026301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 10 Sep 2015 18:50:24 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.85) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Za53E-0006vT-JT; Thu, 10 Sep 2015 18:50:20 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 18:50:16 +0200
Message-Id: <1441903816-26587-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.4.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.8
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.78
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] license.bbclass: try copyfile() as fallback when link() fails
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
X-List-Received-Date: Thu, 10 Sep 2015 17:18:24 -0000

link() will fail with EXDEV when source and destination are on different mountpoints.
Unfortunately, stat().st_dev does not identify the mountpoint so that copy_license_files()
fails in bind-mount environments.

E.g.:

| # mkdir /tmp/a /tmp/b /tmp/X /tmp/X/a /tmp/X/b
| # touch /tmp/a/foo
| # mount --bind /tmp/a /tmp/X/a
| # mount --bind /tmp/b /tmp/X/b
|
| # python -c 'import os;
| print(os.stat("/tmp/X/a")).st_dev;
| print(os.stat("/tmp/X/b")).st_dev;
| os.link("/tmp/X/a/foo", "/tmp/X/b/foo")'
| 62
| 62
| Traceback (most recent call last):
|   File "<string>", line 1, in <module>
| OSError: [Errno 18] Invalid cross-device link

Patch catches errno EXDEV and tries a plain copy then.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/license.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 224d541..ba36c12 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -175,6 +175,7 @@ def add_package_and_files(d):
 
 def copy_license_files(lic_files_paths, destdir):
     import shutil
+    import errno
 
     bb.utils.mkdirhier(destdir)
     for (basename, path) in lic_files_paths:
@@ -183,8 +184,14 @@ def copy_license_files(lic_files_paths, destdir):
             dst = os.path.join(destdir, basename)
             if os.path.exists(dst):
                 os.remove(dst)
-            if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
-                os.link(src, dst)
+            if os.access(src, os.W_OK):
+                try:
+                    os.link(src, dst)
+                except OSError as e:
+                    if e.errno != errno.EXDEV:
+                        raise e
+
+                    shutil.copyfile(src, dst)
             else:
                 shutil.copyfile(src, dst)
         except Exception as e:
-- 
2.4.3


