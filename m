Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56A5B615A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 16:59:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Oct 2013 09:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="417838747"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2013 09:59:20 -0700
Message-ID: <525EC5E8.3090404@linux.intel.com>
Date: Wed, 16 Oct 2013 09:59:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 00/13] Add python 3 support
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
X-List-Received-Date: Wed, 16 Oct 2013 16:59:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Khem,

I am still seeing some WARNING when we build with world

WARNING: The recipe python3 is trying to install files into a shared 
area when those files already exist. Those files and their manifest 
location are:
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/python3.3m/pyconfig.h
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so.1.0
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python3.3/config/Makefile
Please verify which package should provide the above files.

WARNING: The recipe python-setuptools is trying to install files into a 
shared area when those files already exist. Those files and their 
manifest location are:
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/setuptools.pth
    Matched in manifest-qemux86-64-python-distribute
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.pyc
    Matched in manifest-qemux86-64-python-distribute
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.py
    Matched in manifest-qemux86-64-python-distribute


Thanks
	Sau!

On 09/04/2013 09:15 PM, Khem Raj wrote:
> in V5
>
> squash all python and python-native recipe changes into original commit
> as highlighted in feedback from Ross
>
> The following changes since commit 22c0668d9e0a22c095d78bab7b45ef4f803dd0d1:
>
>    scripts/runqemu: Fix MACHINE regex (2013-09-04 14:17:23 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/python3
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/python3
>
> Khem Raj (13):
>    generate-manifest-3.3.py: Add script to generate python 3.3 manifests
>    python-3.3-manifest: Add python3 manifest file
>    python3native.bbclass: Add python3 abstraction class
>    package_rpm.bbclass: Trigger the regexp on exact keyword match
>    classes/distutils: Introduce PYTHON_PN
>    classes: Add distutils for python3
>    distutils: Introduce PYTHON_ABI variable
>    distutils3: Do build_ext as separate step during compile
>    python3: Add target and native recipes
>    python_2.7.3.bb: Inherit python-dir
>    python-distribute: Add recipes for python2 and python3
>    distutils3.bbclass: Fix typo and use proper values for target sysroot
>    distutils3.bbclass: Use MACHINE for sysroot when not building for
>      build host
>
>   meta/classes/distutils-base.bbclass                |   5 +-
>   meta/classes/distutils-native-base.bbclass         |   4 +-
>   meta/classes/distutils-tools.bbclass               |  77 +++++
>   meta/classes/distutils.bbclass                     |  23 +-
>   meta/classes/distutils3-base.bbclass               |   8 +
>   meta/classes/distutils3-native-base.bbclass        |   4 +
>   meta/classes/distutils3.bbclass                    |  98 ++++++
>   meta/classes/package_rpm.bbclass                   |   2 +-
>   meta/classes/python-dir.bbclass                    |   2 +
>   meta/classes/python3native.bbclass                 |   7 +
>   meta/classes/pythonnative.bbclass                  |   9 +-
>   meta/classes/setuptools.bbclass                    |   3 +-
>   meta/classes/setuptools3.bbclass                   |   8 +
>   .../python/python-3.3-manifest.inc                 | 260 ++++++++++++++
>   .../python/python-distribute_0.6.32.bb             |  47 +++
>   .../python/python3-distribute_0.6.32.bb            |  47 +++
>   .../python/python3-native_3.3.2.bb                 |  70 ++++
>   .../python/python3/000-cross-compile.patch         |  83 +++++
>   ...sue-13032-where-it-fails-with-UnicodeDeco.patch |  37 ++
>   .../python3/020-dont-compile-python-files.patch    |  37 ++
>   .../python/python3/03-fix-tkinter-detection.patch  |  42 +++
>   .../python/python3/030-fixup-include-dirs.patch    |  33 ++
>   .../python/python3/04-default-is-optimized.patch   |  58 ++++
>   .../python3/06-ctypes-libffi-fix-configure.patch   |  44 +++
>   .../python3/070-dont-clean-ipkg-install.patch      |  36 ++
>   .../python3/080-distutils-dont_adjust_files.patch  |  92 +++++
>   .../python/python3/110-enable-zlib.patch           |  21 ++
>   ...2-distutils-prefix-is-inside-staging-area.patch |  78 +++++
>   .../python/python3/130-readline-setup.patch        |  55 +++
>   .../python/python3/150-fix-setupterm.patch         |  17 +
>   .../python3/avoid_warning_about_tkinter.patch      |  25 ++
>   meta/recipes-devtools/python/python3/cgi_py.patch  |  23 ++
>   .../python3/fix_for_using_different_libdir.patch   |  54 +++
>   .../python3/host_include_contamination.patch       |  28 ++
>   .../python/python3/python-3.3-multilib.patch       | 336 ++++++++++++++++++
>   .../python/python3/remove_sqlite_rpath.patch       |  19 ++
>   .../python/python3/setuptweaks.patch               |  57 ++++
>   .../python/python3/shutil-follow-symlink-fix.patch |  17 +
>   .../python/python3/sitecustomize.py                |  37 ++
>   .../sys_platform_is_now_always_linux2.patch        |  29 ++
>   .../python/python3/sysroot-include-headers.patch   |  35 ++
>   .../python/python3/unixccompiler.patch             |  33 ++
>   meta/recipes-devtools/python/python3_3.3.2.bb      | 205 +++++++++++
>   meta/recipes-devtools/python/python_2.7.3.bb       |   2 +-
>   scripts/contrib/python/generate-manifest-3.3.py    | 376 +++++++++++++++++++++
>   45 files changed, 2560 insertions(+), 23 deletions(-)
>   create mode 100644 meta/classes/distutils-tools.bbclass
>   create mode 100644 meta/classes/distutils3-base.bbclass
>   create mode 100644 meta/classes/distutils3-native-base.bbclass
>   create mode 100644 meta/classes/distutils3.bbclass
>   create mode 100644 meta/classes/python3native.bbclass
>   create mode 100644 meta/classes/setuptools3.bbclass
>   create mode 100644 meta/recipes-devtools/python/python-3.3-manifest.inc
>   create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
>   create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb
>   create mode 100644 meta/recipes-devtools/python/python3-native_3.3.2.bb
>   create mode 100644 meta/recipes-devtools/python/python3/000-cross-compile.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
>   create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
>   create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
>   create mode 100644 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
>   create mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch
>   create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
>   create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
>   create mode 100644 meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
>   create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
>   create mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
>   create mode 100644 meta/recipes-devtools/python/python3/130-readline-setup.patch
>   create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
>   create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
>   create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
>   create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
>   create mode 100644 meta/recipes-devtools/python/python3/host_include_contamination.patch
>   create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multilib.patch
>   create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
>   create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
>   create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
>   create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
>   create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
>   create mode 100644 meta/recipes-devtools/python/python3/sysroot-include-headers.patch
>   create mode 100644 meta/recipes-devtools/python/python3/unixccompiler.patch
>   create mode 100644 meta/recipes-devtools/python/python3_3.3.2.bb
>   create mode 100755 scripts/contrib/python/generate-manifest-3.3.py
>

