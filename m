Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62B9977301
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:13:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Jan 2017 02:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,294,1477983600"; d="scan'208";a="36227290"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 02:13:31 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 12:13:21 +0200
Message-Id: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH RFC 00/10] python3: support profile-optimized build
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
X-List-Received-Date: Fri, 27 Jan 2017 10:13:32 -0000

This patchset implements profile-guided-optimization (PGO) for Python 3. The
implementation is very similar to my previous patchset for Python 2.7.

PGO for python3-native is one simple patch. PGO for target python3 is more
complicated and follows the lines of Python 2.7:
1. add new python-profile-opt3 recipe that is a special version of python3
   with profile instrumentation enabled
2. add new do_profile3 in python-pgo-image for running the python3 profile task
   in the target
3. enable usage of profile data in python3 do_compile

Configration variables for controlling the feature are:
PYTHON3_PROFILE_OPT          - set to "1" to enable PGO on python3
PYTHON3_PROFILE_TASK         - profile task to run for python3
PYTHON3_NATIVE_PROFILE_OPT   - set to "1" to enable PGO on python3-native
PYTHON3_NATIVE_PROFILE_TASK  - profile task to run for python3-native

Benchmark results from my i7-3770K are found below.
python3-native:
  pystone:          118288 -> 138026 pystones/s     (+17%)
  pybench avg:      3428   -> 3118 ms               (-9%)
  regrtest time:    598    -> 550 s                 (-8%)

python3 (target):
  pystone:          1531   -> 1616 pystones/s       (+5.5%)
  pybench avg:      215901 -> 207498 ms             (-3.9%)
  regrtest time:    8355   -> 8157                  (-2.4%)

Again, these are just ballpark figures from few test runs.


The following changes since commit ccf50ba2e045b7b690a10633710872845a63943f:

  python-pgo-image: enable sstate for do_profile (2017-01-24 15:23:49 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338-py3
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338-py3


Markus Lehtonen (10):
  python3-native: support profile optimized build
  python3: fix depends of python-tests
  python3: add python-profile-opt3 recipe
  python-pgo-image: profiling for python3
  python3: remove two setup.py cross-compile hacks
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python-pgo-image: exclude tests from the python3 profile target
  python3: add python3-tools subpackage
  python-pgo-image: change python3 profile target to pybench

 meta/recipes-devtools/images/python-pgo-image.bb   |  61 +++++++++--
 .../python/python-3.5-manifest.inc                 |  10 +-
 meta/recipes-devtools/python/python-profile-opt3   |   1 +
 .../python/python-profile-opt3_3.5.2.bb            |  15 +++
 .../python/python3-native_3.5.2.bb                 |   9 ++
 .../python/python3/000-cross-compile.patch         |   9 --
 ...efile-add-install_generate_profile-target.patch |  25 +++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch |  56 +++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    |  33 ------
 ...name-libpython3-to-libpython-profile-opt3.patch | 111 +++++++++++++++++++++
 .../setup.py-find-libraries-in-staging-dirs.patch  |  30 ------
 meta/recipes-devtools/python/python3_3.5.2.bb      |  74 ++++++++++----
 12 files changed, 325 insertions(+), 109 deletions(-)
 create mode 120000 meta/recipes-devtools/python/python-profile-opt3
 create mode 100644 meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.10.2


