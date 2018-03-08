Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8135A7886F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053629"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:26 +0200
Message-Id: <20180308181804.31261-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/42] serf: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:47 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/serf/serf/norpath.patch | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/serf/serf/norpath.patch b/meta/recipes-support/serf/serf/norpath.patch
index 380f5d00d2d..c392444f7b3 100644
--- a/meta/recipes-support/serf/serf/norpath.patch
+++ b/meta/recipes-support/serf/serf/norpath.patch
@@ -5,11 +5,11 @@ Upstream-Status: Inappropriate
 
 RP 2014/7/17
 
-Index: serf-1.3.6/SConstruct
+Index: serf-1.3.9/SConstruct
 ===================================================================
---- serf-1.3.6.orig/SConstruct	2014-07-17 19:57:57.724389150 +0000
-+++ serf-1.3.6/SConstruct	2014-07-17 20:04:21.784399616 +0000
-@@ -218,8 +218,7 @@
+--- serf-1.3.9.orig/SConstruct
++++ serf-1.3.9/SConstruct
+@@ -224,8 +224,7 @@ if sys.platform != 'win32':
  else:
    LIBNAMESTATIC = 'serf-${MAJOR}'
  
@@ -17,9 +17,9 @@ Index: serf-1.3.6/SConstruct
 -           PDB='${TARGET.filebase}.pdb')
 +env.Append(PDB='${TARGET.filebase}.pdb')
  
- #for i in env:
- #    print(str(env[i]))
-@@ -371,12 +370,6 @@
+ if sys.platform == 'darwin':
+ #  linkflags.append('-Wl,-install_name,@executable_path/%s.dylib' % (LIBNAME,))
+@@ -385,12 +384,6 @@ if gssapi and CALLOUT_OKAY:
  if sys.platform == 'win32':
    env.Append(CPPDEFINES=['SERF_HAVE_SSPI'])
  
@@ -32,8 +32,8 @@ Index: serf-1.3.6/SConstruct
  # Set up the construction of serf-*.pc
  pkgconfig = env.Textfile('serf-%d.pc' % (MAJOR,),
                           env.File('build/serf.pc.in'),
-@@ -446,7 +439,6 @@
-                           ENV={'PATH' : os.environ['PATH']}))
+@@ -461,7 +454,6 @@ else:
+   TEST_EXES = [ os.path.join('test', '%s' % (prog)) for prog in TEST_PROGRAMS ]
  
  # Find the (dynamic) library in this directory
 -tenv.Replace(RPATH=thisdir)
-- 
2.16.1


