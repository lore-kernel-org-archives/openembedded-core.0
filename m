Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C961270A7F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="585500986"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2014 15:06:48 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:47 -0500
Message-Id: <01a1d1d35163a0187912be6f027cc86a4600b4dd.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 22/35] wic: Clean up Creator
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:53 -0000

wic doesn't use a lot of Creator, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/creator.py | 176 ++-------------------------------------------
 1 file changed, 6 insertions(+), 170 deletions(-)

diff --git a/scripts/lib/mic/creator.py b/scripts/lib/mic/creator.py
index 267928f..7c9ca6f 100644
--- a/scripts/lib/mic/creator.py
+++ b/scripts/lib/mic/creator.py
@@ -44,7 +44,7 @@ class Creator(cmdln.Cmdln):
         # mix-in do_subcmd interface
         for subcmd, klass in pluginmgr.get_plugins('imager').iteritems():
             if not hasattr(klass, 'do_create'):
-                msger.warning("Unsurpport subcmd: %s" % subcmd)
+                msger.warning("Unsupported subcmd: %s" % subcmd)
                 continue
 
             func = getattr(klass, 'do_create')
@@ -65,59 +65,12 @@ class Creator(cmdln.Cmdln):
         optparser.add_option('-c', '--config', type='string', dest='config',
                              default=None,
                              help='Specify config file for mic')
-        optparser.add_option('-k', '--cachedir', type='string', action='store',
-                             dest='cachedir', default=None,
-                             help='Cache directory to store the downloaded')
         optparser.add_option('-o', '--outdir', type='string', action='store',
                              dest='outdir', default=None,
                              help='Output directory')
-        optparser.add_option('-A', '--arch', type='string', dest='arch',
-                             default=None,
-                             help='Specify repo architecture')
-        optparser.add_option('', '--release', type='string', dest='release',
-                             default=None, metavar='RID',
-                             help='Generate a release of RID with all necessary'
-                                  ' files, when @BUILD_ID@ is contained in '
-                                  'kickstart file, it will be replaced by RID')
-        optparser.add_option("", "--record-pkgs", type="string",
-                             dest="record_pkgs", default=None,
-                             help='Record the info of installed packages, '
-                                  'multiple values can be specified which '
-                                  'joined by ",", valid values: "name", '
-                                  '"content", "license", "vcs"')
-        optparser.add_option('', '--pkgmgr', type='string', dest='pkgmgr',
-                             default=None,
-                             help='Specify backend package manager')
-        optparser.add_option('', '--local-pkgs-path', type='string',
-                             dest='local_pkgs_path', default=None,
-                             help='Path for local pkgs(rpms) to be installed')
-        optparser.add_option('', '--runtime', type='string',
-                             dest='runtime', default=None,
-                             help='Specify  runtime mode, avaiable: bootstrap, native')
-        # --taring-to is alias to --pack-to
-        optparser.add_option('', '--taring-to', type='string',
-                             dest='pack_to', default=None,
-                             help=SUPPRESS_HELP)
-        optparser.add_option('', '--pack-to', type='string',
-                             dest='pack_to', default=None,
-                             help='Pack the images together into the specified'
-                                  ' achive, extension supported: .zip, .tar, '
-                                  '.tar.gz, .tar.bz2, etc. by default, .tar '
-                                  'will be used')
-        optparser.add_option('', '--copy-kernel', action='store_true',
-                             dest='copy_kernel',
-                             help='Copy kernel files from image /boot directory'
-                                  ' to the image output directory.')
-        optparser.add_option('', '--install-pkgs', type='string', action='store',
-                             dest='install_pkgs', default=None,
-                             help='Specify what type of packages to be installed,'
-                                  ' valid: source, debuginfo, debugsource')
         optparser.add_option('', '--tmpfs', action='store_true', dest='enabletmpfs',
                              help='Setup tmpdir as tmpfs to accelerate, experimental'
                                   ' feature, use it if you have more than 4G memory')
-        optparser.add_option('', '--repourl', action='append',
-                             dest='repourl', default=[],
-                             help=SUPPRESS_HELP)
         return optparser
 
     def preoptparse(self, argv):
@@ -183,78 +136,16 @@ class Creator(cmdln.Cmdln):
 
         if self.options.outdir is not None:
             configmgr.create['outdir'] = abspath(self.options.outdir)
-        if self.options.cachedir is not None:
-            configmgr.create['cachedir'] = abspath(self.options.cachedir)
-        os.environ['ZYPP_LOCKFILE_ROOT'] = configmgr.create['cachedir']
-
-        for cdir in ('outdir', 'cachedir'):
-            if os.path.exists(configmgr.create[cdir]) \
-              and not os.path.isdir(configmgr.create[cdir]):
-                msger.error('Invalid directory specified: %s' \
-                            % configmgr.create[cdir])
-
-        if self.options.local_pkgs_path is not None:
-            if not os.path.exists(self.options.local_pkgs_path):
-                msger.error('Local pkgs directory: \'%s\' not exist' \
-                              % self.options.local_pkgs_path)
-            configmgr.create['local_pkgs_path'] = self.options.local_pkgs_path
-
-        if self.options.release:
-            configmgr.create['release'] = self.options.release.rstrip('/')
-
-        if self.options.record_pkgs:
-            configmgr.create['record_pkgs'] = []
-            for infotype in self.options.record_pkgs.split(','):
-                if infotype not in ('name', 'content', 'license', 'vcs'):
-                    raise errors.Usage('Invalid pkg recording: %s, valid ones:'
-                                       ' "name", "content", "license", "vcs"' \
-                                       % infotype)
-
-                configmgr.create['record_pkgs'].append(infotype)
-
-        if self.options.arch is not None:
-            supported_arch = sorted(rpmmisc.archPolicies.keys(), reverse=True)
-            if self.options.arch in supported_arch:
-                configmgr.create['arch'] = self.options.arch
-            else:
-                raise errors.Usage('Invalid architecture: "%s".\n'
-                                   '  Supported architectures are: \n'
-                                   '  %s' % (self.options.arch,
-                                               ', '.join(supported_arch)))
-
-        if self.options.pkgmgr is not None:
-            configmgr.create['pkgmgr'] = self.options.pkgmgr
 
-        if self.options.runtime:
-            configmgr.set_runtime(self.options.runtime)
-
-        if self.options.pack_to is not None:
-            configmgr.create['pack_to'] = self.options.pack_to
-
-        if self.options.copy_kernel:
-            configmgr.create['copy_kernel'] = self.options.copy_kernel
-
-        if self.options.install_pkgs:
-            configmgr.create['install_pkgs'] = []
-            for pkgtype in self.options.install_pkgs.split(','):
-                if pkgtype not in ('source', 'debuginfo', 'debugsource'):
-                    raise errors.Usage('Invalid parameter specified: "%s", '
-                                       'valid values: source, debuginfo, '
-                                       'debusource' % pkgtype)
-
-                configmgr.create['install_pkgs'].append(pkgtype)
+        cdir = 'outdir'
+        if os.path.exists(configmgr.create[cdir]) \
+           and not os.path.isdir(configmgr.create[cdir]):
+            msger.error('Invalid directory specified: %s' \
+                        % configmgr.create[cdir])
 
         if self.options.enabletmpfs:
             configmgr.create['enabletmpfs'] = self.options.enabletmpfs
 
-        if self.options.repourl:
-            for item in self.options.repourl:
-                try:
-                    key, val = item.split('=')
-                except:
-                    continue
-                configmgr.create['repourl'][key] = val
-
     def main(self, argv=None):
         if argv is None:
             argv = sys.argv
@@ -294,58 +185,3 @@ class Creator(cmdln.Cmdln):
             return ['help', argv[0]]
 
         return argv
-
-    def do_auto(self, subcmd, opts, *args):
-        """${cmd_name}: auto detect image type from magic header
-
-        Usage:
-            ${name} ${cmd_name} <ksfile>
-
-        ${cmd_option_list}
-        """
-        def parse_magic_line(re_str, pstr, ptype='mic'):
-            ptn = re.compile(re_str)
-            m = ptn.match(pstr)
-            if not m or not m.groups():
-                return None
-
-            inline_argv = m.group(1).strip()
-            if ptype == 'mic':
-                m2 = re.search('(?P<format>\w+)', inline_argv)
-            elif ptype == 'mic2':
-                m2 = re.search('(-f|--format(=)?)\s*(?P<format>\w+)',
-                               inline_argv)
-            else:
-                return None
-
-            if m2:
-                cmdname = m2.group('format')
-                inline_argv = inline_argv.replace(m2.group(0), '')
-                return (cmdname, inline_argv)
-
-            return None
-
-        if len(args) != 1:
-            raise errors.Usage("Extra arguments given")
-
-        if not os.path.exists(args[0]):
-            raise errors.CreatorError("Can't find the file: %s" % args[0])
-
-        with open(args[0], 'r') as rf:
-            first_line = rf.readline()
-
-        mic_re = '^#\s*-\*-mic-options-\*-\s+(.*)\s+-\*-mic-options-\*-'
-        mic2_re = '^#\s*-\*-mic2-options-\*-\s+(.*)\s+-\*-mic2-options-\*-'
-
-        result = parse_magic_line(mic_re, first_line, 'mic') \
-                 or parse_magic_line(mic2_re, first_line, 'mic2')
-        if not result:
-            raise errors.KsError("Invalid magic line in file: %s" % args[0])
-
-        if result[0] not in self._subcmds:
-            raise errors.KsError("Unsupport format '%s' in %s"
-                                 % (result[0], args[0]))
-
-        argv = ' '.join(result + args).split()
-        self.main(argv)
-
-- 
1.8.3.1


