Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 52610774DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:15:42 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2017 08:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,378,1496127600"; d="scan'208";a="126501351"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 18 Jul 2017 08:15:42 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
	<bbbcf15fe2ed5348c7548b4fcf7a5dbfa2325b0d.1500327589.git.anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <0847843a-cce6-3543-68a4-b7513fde0ace@linux.intel.com>
Date: Tue, 18 Jul 2017 10:16:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <bbbcf15fe2ed5348c7548b4fcf7a5dbfa2325b0d.1500327589.git.anibal.limon@linux.intel.com>
Cc: joshua.g.lock@intel.com
Subject: Re: [PATCHv3 11/30] oeqa/selftest/{case, context}: Add builddir by test class and context
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
X-List-Received-Date: Tue, 18 Jul 2017 15:15:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/17/2017 04:45 PM, Aníbal Limón wrote:
> The build directory by Test class will enable to use several instances
> of bitbake in parallel to enable oe-selftest threaded runs.
> 
> [YOCTO #11429]
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/case.py    | 97 ++++++++++++++++++++++++++++-----------
>  meta/lib/oeqa/selftest/context.py |  4 ++
>  2 files changed, 74 insertions(+), 27 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
> index 871009c568b..dd24e366abd 100644
> --- a/meta/lib/oeqa/selftest/case.py
> +++ b/meta/lib/oeqa/selftest/case.py
> @@ -13,28 +13,73 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var
>  from oeqa.core.case import OETestCase
>  
>  class OESelftestTestCase(OETestCase):
> +    _use_own_builddir = False
> +    _main_thread = True
> +    _end_thread = False
> +
>      def __init__(self, methodName="runTest"):
>          self._extra_tear_down_commands = []
>          super(OESelftestTestCase, self).__init__(methodName)
>  
>      @classmethod
> +    def _setUpBuildDir(cls):
> +        if cls._use_own_builddir:
> +            cls.builddir = os.path.join(cls.tc.config_paths['base_builddir'],
> +                    cls.__module__, cls.__name__)
> +
> +            cls.localconf_path = os.path.join(cls.builddir, "conf/local.conf")
> +            cls.localconf_backup = os.path.join(cls.builddir,
> +                    "conf/local.conf.bk")
> +            cls.local_bblayers_path = os.path.join(cls.builddir,
> +                    "conf/bblayers.conf")
> +            cls.local_bblayers_backup = os.path.join(cls.builddir,
> +                    "conf/bblayers.conf.bk")
> +        else:
> +            cls.builddir = cls.tc.config_paths['builddir']
> +            cls.localconf_path = cls.tc.config_paths['localconf']
> +            cls.localconf_backup = cls.tc.config_paths['localconf_class_backup']
> +            cls.local_bblayers_path = cls.tc.config_paths['bblayers']
> +            cls.local_bblayers_backup = \
> +                    cls.tc.config_paths['bblayers_class_backup']
> +
> +        cls.testinc_path = os.path.join(cls.builddir, "conf/selftest.inc")
> +        cls.testinc_bblayers_path = os.path.join(cls.builddir,
> +                "conf/bblayers.inc")
> +        cls.machineinc_path = os.path.join(cls.builddir, "conf/machine.inc")
> +
> +        # creates a custom build directory for every test class
> +        if not os.path.exists(cls.builddir):
> +            os.makedirs(cls.builddir)
> +
> +            builddir_conf = os.path.join(cls.builddir, 'conf')
> +            origdir_conf = os.path.join(cls.tc.config_paths['builddir'], 'conf')
> +            shutil.copytree(origdir_conf, builddir_conf)
> +
> +            ftools.append_file(cls.localconf_path, "# added by oe-selftest base class")
> +
> +            # shares original sstate_dir across build directories to speed up
> +            sstate_line = "SSTATE_DIR=\"%s\"" % cls.td['SSTATE_DIR']
> +            ftools.append_file(cls.localconf_path, sstate_line)
> +
> +            # shares original dl_dir across build directories to avoid additional
> +            # network usage
> +            dldir_line = "DL_DIR=\"%s\"" % cls.td['DL_DIR']
> +            ftools.append_file(cls.localconf_path, dldir_line)

I sent a bad version of this patch, the DL_DIR and SSTATE_DIR needs to
be set as ?= to don't interfere with certain tests that set the same
variables.

The integration branch has the good one,

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/oe_selftest_threaded

Cheers,
Anibal

> +
> +            # use the same value of threads for BB_NUMBER_THREADS/PARALLEL_MAKE
> +            # to avoid ran out resources (cpu/memory)
> +            if hasattr(cls.tc.loader, 'process_num'):
> +                ftools.append_file(cls.localconf_path, "BB_NUMBER_THREADS?=\"%d\"" %
> +                        cls.tc.loader.process_num)
> +                ftools.append_file(cls.localconf_path, "PARALLEL_MAKE?=\"-j %d\"" %
> +                        cls.tc.loader.process_num)
> +
> +    @classmethod
>      def setUpClass(cls):
>          super(OESelftestTestCase, cls).setUpClass()
>  
>          cls.testlayer_path = cls.tc.config_paths['testlayer_path']
> -        cls.builddir = cls.tc.config_paths['builddir']
> -
> -        cls.localconf_path = cls.tc.config_paths['localconf']
> -        cls.localconf_backup = cls.tc.config_paths['localconf_class_backup']
> -        cls.local_bblayers_path = cls.tc.config_paths['bblayers']
> -        cls.local_bblayers_backup = cls.tc.config_paths['bblayers_class_backup']
> -
> -        cls.testinc_path = os.path.join(cls.tc.config_paths['builddir'],
> -                "conf/selftest.inc")
> -        cls.testinc_bblayers_path = os.path.join(cls.tc.config_paths['builddir'],
> -                "conf/bblayers.inc")
> -        cls.machineinc_path = os.path.join(cls.tc.config_paths['builddir'],
> -                "conf/machine.inc")
> +        cls._setUpBuildDir()
>  
>          cls._track_for_cleanup = [
>              cls.testinc_path, cls.testinc_bblayers_path,
> @@ -52,35 +97,31 @@ class OESelftestTestCase(OETestCase):
>      @classmethod
>      def add_include(cls):
>          if "#include added by oe-selftest" \
> -            not in ftools.read_file(os.path.join(cls.builddir, "conf/local.conf")):
> -                cls.logger.info("Adding: \"include selftest.inc\" in %s" % os.path.join(cls.builddir, "conf/local.conf"))
> -                ftools.append_file(os.path.join(cls.builddir, "conf/local.conf"), \
> +            not in ftools.read_file(cls.localconf_path):
> +                ftools.append_file(cls.localconf_path, \
>                          "\n#include added by oe-selftest\ninclude machine.inc\ninclude selftest.inc")
>  
>          if "#include added by oe-selftest" \
> -            not in ftools.read_file(os.path.join(cls.builddir, "conf/bblayers.conf")):
> -                cls.logger.info("Adding: \"include bblayers.inc\" in bblayers.conf")
> -                ftools.append_file(os.path.join(cls.builddir, "conf/bblayers.conf"), \
> +            not in ftools.read_file(cls.local_bblayers_path):
> +                ftools.append_file(cls.local_bblayers_path, \
>                          "\n#include added by oe-selftest\ninclude bblayers.inc")
>  
>      @classmethod
>      def remove_include(cls):
>          if "#include added by oe-selftest.py" \
> -            in ftools.read_file(os.path.join(cls.builddir, "conf/local.conf")):
> -                cls.logger.info("Removing the include from local.conf")
> -                ftools.remove_from_file(os.path.join(cls.builddir, "conf/local.conf"), \
> +            in ftools.read_file(cls.localconf_path):
> +                ftools.remove_from_file(cls.localconf_path, \
>                          "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
>  
>          if "#include added by oe-selftest.py" \
> -            in ftools.read_file(os.path.join(cls.builddir, "conf/bblayers.conf")):
> -                cls.logger.info("Removing the include from bblayers.conf")
> -                ftools.remove_from_file(os.path.join(cls.builddir, "conf/bblayers.conf"), \
> +            in ftools.read_file(cls.local_bblayers_path):
> +                ftools.remove_from_file(cls.local_bblayers_path, \
>                          "\n#include added by oe-selftest.py\ninclude bblayers.inc")
>  
>      @classmethod
>      def remove_inc_files(cls):
>          try:
> -            os.remove(os.path.join(cls.builddir, "conf/selftest.inc"))
> +            os.remove(cls.testinc_path)
>              for root, _, files in os.walk(cls.testlayer_path):
>                  for f in files:
>                      if f == 'test_recipe.inc':
> @@ -96,7 +137,7 @@ class OESelftestTestCase(OETestCase):
>  
>      def setUp(self):
>          super(OESelftestTestCase, self).setUp()
> -        os.chdir(self.builddir)
> +
>          # Check if local.conf or bblayers.conf files backup exists
>          # from a previous failed test and restore them
>          if os.path.isfile(self.localconf_backup) or os.path.isfile(
> @@ -239,6 +280,7 @@ to ensure accurate results.")
>          except OSError as e:
>              if e.errno != errno.ENOENT:
>                  raise
> +
>      def write_bblayers_config(self, data):
>          """Write to <builddir>/conf/bblayers.inc"""
>          self.logger.debug("Writing to: %s\n%s\n" % (self.testinc_bblayers_path, data))
> @@ -269,4 +311,5 @@ to ensure accurate results.")
>      def assertNotExists(self, expr, msg=None):
>          if os.path.exists(expr):
>              msg = self._formatMessage(msg, "%s exists when it should not" % safe_repr(expr))
> +
>              raise self.failureException(msg)
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
> index 4575a0537fb..697ea0b4933 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -8,6 +8,7 @@ import sys
>  import imp
>  import signal
>  from shutil import copyfile
> +import tempfile
>  from random import choice
>  
>  import oeqa
> @@ -133,6 +134,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>          copyfile(self.tc_kwargs['init']['config_paths']['bblayers'], 
>                  self.tc_kwargs['init']['config_paths']['bblayers_backup'])
>  
> +        self.tc_kwargs['init']['config_paths']['base_builddir'] = \
> +                tempfile.mkdtemp(prefix='build-selftest-', dir=builddir)
> +
>      def _pre_run(self):
>          def _check_required_env_variables(vars):
>              for var in vars:
> 

