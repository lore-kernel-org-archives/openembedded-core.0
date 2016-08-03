Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1771B73163
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 08:37:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u738btZe023253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2016 01:37:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Aug 2016 01:37:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 01:37:53 -0700
Message-ID: <6141d2a658da395913a3b7b6fbf9a5ddf012c2a3.1470213435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1470213435.git.liezhi.yang@windriver.com>
References: <cover.1470213435.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: remove unneeded chmod() and chown()
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
X-List-Received-Date: Wed, 03 Aug 2016 08:37:55 -0000
Content-Type: text/plain

* The mode and owner info are saved in inode, hardlink won't change them,
so remove unneeded chmod() and chown().

* This can avoid the problem that when do_package re-run, the file's mode
maybe different if it is 0444 (changed to 0644 when re-run), this is
caused by pseudo adds 'w' on real file, and doesn't track linked source
when hard link, Peter and Mark may fix pseudo, but the removed code is not
needed, which can avoid the problem.

* To reproduce the problem, for example, version.c from gzip's ${B}:
1) bitbake gzip
2) Edit rpm-native or package.bbclass to make do_package re-run.
3) bitbake gzip
After the first build, build/version.c in gzip-dbg is 0444, but after
the second build, it will be 0644, this because do_package does:
$ ln ${B}/version.c gzip-dbg/version.c,
$ chmod 0444 gzip-dbg/version.c (it runs chmod 0644 on the real filesystem)
And in the second build, the gzip-dbg/version.c will be removed and
created again, so that stat() can't get 0444 but 0644 since
${B}/version.c is not tracked by pseudo.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d6204cf..81acc10 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1152,9 +1152,6 @@ python populate_packages () {
             fpath = os.path.join(root,file)
             if not cpath.islink(file):
                 os.link(file, fpath)
-                fstat = cpath.stat(file)
-                os.chmod(fpath, fstat.st_mode)
-                os.chown(fpath, fstat.st_uid, fstat.st_gid)
                 continue
             ret = bb.utils.copyfile(file, fpath)
             if ret is False or ret == 0:
-- 
2.9.0


