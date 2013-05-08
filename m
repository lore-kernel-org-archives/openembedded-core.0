Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ua0cH-0000Ov-UQ
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 11:24:55 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4896o97005719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 02:06:50 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 02:06:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 05:06:46 -0400
Message-ID: <ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368002042.git.liezhi.yang@windriver.com>
References: <cover.1368002042.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bbclass: bb.fatal() clean up
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 09:25:01 -0000
Content-Type: text/plain

The bb.fatal() is defined as:

def fatal(*args):
    logger.critical(''.join(args))
    sys.exit(1)

So anything after bb.fatal() in the same code block doesn't have any
effect, e.g.:

    bb.fatal("%s_%s: %s" % (var, pkg, e))
    raise e

The "raise e" should be removed.

I searched all the files which use bb.fatal(), only the following 3
classes have this issues:

  insane.bbclass
  package.bbclass
  package_rpm.bbclass

[YOCTO #4461]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass      |    1 -
 meta/classes/package.bbclass     |    1 -
 meta/classes/package_rpm.bbclass |    2 --
 3 files changed, 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 336beaa..6b696b1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -715,7 +715,6 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
             rvar = bb.utils.explode_dep_versions2(localdata.getVar(var, True) or "")
         except ValueError as e:
             bb.fatal("%s_%s: %s" % (var, pkg, e))
-            raise e
         for dep in rvar:
             for v in rvar[dep]:
                 if v and not v.startswith(('< ', '= ', '> ', '<= ', '>=')):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1a8da40..a31e6bd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -375,7 +375,6 @@ python package_get_auto_pr() {
             auto_pr=prserv_get_pr_auto(d)
         except Exception as e:
             bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
-            return
         if auto_pr is None:
             if d.getVar('PRSERV_LOCKDOWN', True):
                 bb.fatal("Can NOT get PRAUTO from lockdown exported file")
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 3a29976..edd90da 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -674,12 +674,10 @@ python write_specfile () {
     pkgdest = d.getVar('PKGDEST', True)
     if not pkgdest:
         bb.fatal("No PKGDEST")
-        return
 
     outspecfile = d.getVar('OUTSPECFILE', True)
     if not outspecfile:
         bb.fatal("No OUTSPECFILE")
-        return
 
     # Construct the SPEC file...
     srcname    = strip_multilib(d.getVar('PN', True), d)
-- 
1.7.10.4



