Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ED18C730BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:41:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 04:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="35260395"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2017 04:41:02 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 14:40:51 +0200
Message-Id: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH RFC 00/10] python: support profile-optimized build
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
X-List-Received-Date: Wed, 25 Jan 2017 12:41:08 -0000

This patchset makes it possible to enable profile-guided-optimization (PGO) for
Python 2.7 - both native and target recipes.

Enabling PGO for python-native is simple, one patch, basically just changing
the make target if PGO is enabled in build conf.

However, the target version requires a lot more convoluted approach because of
the cross-build environment.  Normally, (python-native in our case) PGO is done
in one go by just running "make profile-opt". It first builds python binaries
with profile instrumentation enabled. Then, a specific profile task, using that
python, is run to get the profile data. Last, a complete re-build of python is
done, feeding the compiler with the profile data obtained earlier.
Unfortunately, in our cross-build environment this is not possible as the
binaries are (cross-)built on the host machine but profiling needs to be done
on the target architecture.

The approach used in this patchset splits the PGO build of target python into
three steps:
1. build a target python binary with profile instrumentation enabled
2. build a special target image and run the profile task there,
   copying the profile data back to the build host
3. build an optimized target python binary, guided by the profile data

The first step is done by adding a new "python-profile-opt" recipe. It builds a
special version of python that has the profile instrumentation enabled. The
idea behind this is to keep "normal" python clean and isolated - not do any
intermediate builds or contaminate python with pgo instrumentation.

The second step is implemented by adding a new image recipe. This is a minimal
image that basically only contains the functionality for running the special
profile-instrumented python and obtaining the profile data. It re-uses
facilities from oeqa to communicate with the target instance over ssh. Also
here, the idea behind a separate "profiling image" is to keep it isolated and
not contaminate the main target build.

The third step is relatively straightforward, enabling the usage of profile
data in do_compile in the python recipe.

Instructions for doing a PGO build for target python are:
1. enable profile-optimized build by specifying
   PYTHON_PROFILE_OPT = "1" in local.conf
2. get profile data by running
   bitbake python-pgo-image -c profile
3. (re-)build your distro image


Benchmark results from my i7-3770K desktop machine show 8% to 20% improvement
for python-native and 3.6% to 15% improvement for python (qemux86 target).

python-native:
  pystone:          141883 -> 168168 pystones/s     (+18%)
  pybench avg:      3367   -> 2795 ms               (-20%)
  regrtest time:    270    -> 250 s                 (-8%)

python (target):
  pystone:          2045   -> 2355 pystones/s       (+15%)
  pybench avg:      181901 -> 175600 ms             (-3.6%)
  regrtest time:    4210   -> 4050 s                (-3.8%)

I've not done extensive testing to get statistically reliable results, but, the
numbers above should give a useful enough ballpark figure.


New configuration variables, related to this patchset  are:
PYTHON_PROFILE_OPT          - set to "1" to enable PGO build of python
PYTHON_PROFILE_TASK         - profile task to run for python
PYTHON_NATIVE_PROFILE_OPT   - set to "1" to enable PGO build of python-native
PYTHON_NATIVE_PROFILE_TASK  - profile task to run for python-native


I have a corresponding patchset for Python3, too, and I will send that shortly.


The following changes since commit fc97963bc61bf16112859fe1d7e460a13d34baca:

  oeqa/selftest/devtool: rewrite modify testcase (2017-01-19 22:45:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338-py2
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338-py2


Markus Lehtonen (10):
  python-native: support profile optimized build
  python: add python-profile-opt recipe
  python: remove path hack from setup.py
  python-profile-opt: rename libpython
  devtools/images: add python-pgo-image
  python: make profile-optimized build possible
  python-pgo-image: exclude tests from the default profile target
  python: add python-tools subpackage
  python-pgo-image: switch python default profile task to pybench
  python-pgo-image: enable sstate for do_profile

 meta/recipes-devtools/images/python-pgo-image.bb   | 75 +++++++++++++++++
 .../python/python-2.7-manifest.inc                 |  8 +-
 ...x-.so-loading-when-when-running-profile-t.patch | 26 ++++++
 .../python/python-native_2.7.12.bb                 | 10 +++
 .../python/python-profile-opt_2.7.12.bb            | 13 +++
 .../01-use-proper-tools-for-cross-build.patch      | 10 ---
 ...rename-libpython-to-libpython-profile-opt.patch | 94 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.12.bb      | 54 +++++++++++--
 8 files changed, 269 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 100644 meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch
 create mode 100644 meta/recipes-devtools/python/python-profile-opt_2.7.12.bb
 create mode 100644 meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch

-- 
2.10.2


