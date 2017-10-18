Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 235887198A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 21:07:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 14:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,398,1503385200"; d="scan'208";a="162077667"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2017 14:07:42 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 14:07:36 -0700
Message-Id: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 0/4] Restructure python2 and python3 packaging system
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
X-List-Received-Date: Wed, 18 Oct 2017 21:07:42 -0000

The reason we have a manifest file for python is that our goal is to
keep python-core as small as posible and add other python packages only
when the user needs them, hence why we split upstream python into several
packages.

There are many problems with our current implementation of the manifest file,
this patch tries to deal with all of them along with adding several other
features.

This patch adds a new task to python recipes, which is meant to create a new
manifest file every release.

$ bitbake python -c create_manifest  

In a very simplistic way what this does is:                                                                                                      
Launch python and see specifically what is required for it to run at a minimum                                                                   
                                                                                                                                                 
Go through the python-manifest file and launch a separate task for every single                                                                  
one of the files on each package, this task will check what was required for that                                                                
specific module to run, these modules will be called dependencies.                                                                               
The output of such task will be a list of the modules or dependencies that were                                                                  
found for that file.                                                                                                                             
                                                                                                                                                 
Such output will be parsed by this script, we will look for each dependency on the                                                               
manifest and if we find that another package already includes it, then we will add                                                               
that package as an RDEPENDS to the package we are currently checking; in case we dont                                                            
find the current dependency on any other package we will add it to the current package                                                           
as part of FILES.                                                                                                                                
                                                                                                                                                 
This way we will create a new manifest from the data structure that was built during                                                             
this process, ont this new manifest each package will contain specifically only                                                                  
what it needs to run, providing us with finer granularity.

There are some caveats which we try to deal with, such as repeated files on different                                                            
packages, packages that include folders, wildcards, and special packages.                                                                        
Its also important to note that this method only works for python files, and shared                                                              
libraries. Static libraries, header files and binaries need to be dealt with manually.


Using this script a new package can easily be added like this:
 - If a user wants to add a new package all that has to be done is
   modify the python2-manifest.json file, and add the required file(s)
   to the FILES list, the script should handle all the rest.
   Real example:
   "webbrowser": {
       "files": ["${libdir}/python2.7/lib-dynload/webbrowser.py"],
       "rdepends": [],
       "summary": "Python Web browser support"}

 Run bitbake python -c create_manifest and the resulting manifest
 should  be completed after a few seconds, showing something like:
   "webbrowser": {
      "files": ["${libdir}/python2.7/webbrowser.py"],
      "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
      "summary": "Python Web browser support"}

It also fixes several errors we didnt even know we had:
 - Fixes python-core for dependencies, e.g.
   When python is run on an image, it TRIES to import everything it needs,
   but it doesnt necessarily fails when it doesnt find something, so even if
   we didnt know, we had errors like (trimmed on purpose):
   # trying /usr/lib/python2.7/_locale.so
   # trying /usr/lib/python2.7/lib-dynload/_locale.so
   # trying /usr/lib/python2.7/_sysconfigdata.so

   while it didnt complain about _locale it should have imported it,
   after creating a new manifest with the automated script we get:

   # trying /usr/lib/python2.7/lib-dynload/_locale.so
   dlopen("/usr/lib/python2.7/lib-dynload/_locale.so", 2);
   import _locale # dynamically loaded from /usr/lib/python2.7/lib-dynload/_locale.so

The python2 and python3 versions differ on its core functionality in some bits:
 - Python3 handles precompiled bytecode files  (*.pyc) differently.
   for this reason and since we are cross compiling, wildcards couldnt be
   avoided on python3 (See PEP #3147 [1]).
   Both the manifest and the manifest creation script handle this
   differently, the manifest for python3 has an extra field for cached
   files, which is how it lets the user install the cached files or not
   via : INCLUDE_PYCS = "1" on their local.conf.
 - Shared libs nomenclature also changed on python3, so again, we use
   wildcards to deal with this issue ( See PEP #3149 [2]):
 - Fixes python3 manifest, python3-core should be base and everything
   should depend on it, hence several packages were deleted:
   python3-enum, re, gdbm, subprocess, signal, readline.


 - Rebased for 2.5 M1.

The following changes since commit 800b2856cf57d5d216d1403643d0b9f22c97bc90:

  mdadm: Fix build with gcc < 7 (2017-10-17 17:25:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib aehs29/pypack_rebase
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=aehs29/pypack_rebase

Alejandro Hernandez (4):
  python: Restructure python packaging and replace it with autopackaging
  python3: Restructure python3 packaging and replace it with
    autopackaging
  python3: fix RDEPENDS on several recipes, due to non-existent python3
    packages
  hwlatdetect: fix RDEPENDS to avoid QA failures

 meta/recipes-core/libxml/libxml2_2.9.5.bb          |    2 +-
 .../bootchart2/bootchart2_0.14.8.bb                |    2 +-
 meta/recipes-devtools/dnf/dnf_2.6.3.bb             |   26 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    4 +-
 .../opkg-utils/opkg-utils_0.3.5.bb                 |    2 +-
 .../python-numpy/python3-numpy_1.13.3.bb           |    2 -
 .../python/python-2.7-manifest.inc                 |  287 -----
 .../python/python-3.5-manifest.inc                 |  283 -----
 .../python/python-native-3.5-manifest.inc          |   10 -
 .../python/python-native_2.7.13.bb                 |   24 +-
 .../python/python/create_manifest2.py              |  277 +++++
 .../python/python/get_module_deps2.py              |  112 ++
 .../python/python/python2-manifest.json            | 1033 ++++++++++++++++++
 .../python/python/sitecustomize.py                 |    8 -
 .../recipes-devtools/python/python3-async_0.6.2.bb |    2 +-
 meta/recipes-devtools/python/python3-git_2.1.7.bb  |    2 +-
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb |    2 +-
 .../python/python3-native_3.5.3.bb                 |   30 +-
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  |    1 -
 .../python/python3-pygobject_3.26.0.bb             |    2 +-
 .../python/python3-setuptools_36.5.0.bb            |    3 -
 .../recipes-devtools/python/python3-smmap_0.9.0.bb |    2 +-
 .../python/python3/create_manifest3.py             |  321 ++++++
 .../python/python3/get_module_deps3.py             |  146 +++
 .../python/python3/python3-manifest.json           | 1098 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |   84 +-
 meta/recipes-devtools/python/python_2.7.13.bb      |   80 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb              |    2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |    4 +-
 meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb        |    2 +-
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb           |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |  421 --------
 scripts/contrib/python/generate-manifest-3.5.py    |  433 --------
 33 files changed, 3228 insertions(+), 1481 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-2.7-manifest.inc
 delete mode 100644 meta/recipes-devtools/python/python-3.5-manifest.inc
 delete mode 100644 meta/recipes-devtools/python/python-native-3.5-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python/create_manifest2.py
 create mode 100644 meta/recipes-devtools/python/python/get_module_deps2.py
 create mode 100644 meta/recipes-devtools/python/python/python2-manifest.json
 create mode 100644 meta/recipes-devtools/python/python3/create_manifest3.py
 create mode 100644 meta/recipes-devtools/python/python3/get_module_deps3.py
 create mode 100644 meta/recipes-devtools/python/python3/python3-manifest.json
 delete mode 100755 scripts/contrib/python/generate-manifest-2.7.py
 delete mode 100755 scripts/contrib/python/generate-manifest-3.5.py

-- 
2.12.3


