Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2B8B6DB40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 07:29:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2014 23:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,560,1389772800"; d="scan'208";a="463935229"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 23:29:45 -0800
Date: Fri, 28 Feb 2014 09:29:45 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Message-ID: <20140228072944.GE3534@lpalcu-linux>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Fri, 28 Feb 2014 07:29:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

On Thu, Feb 27, 2014 at 09:20:37PM +0100, David Nyström wrote:
> Adding a common interface to add predefined package manager
> channels to prebuilt rootfs:es.
> 
> Adding PACKAGE_FEED_URIS = "http://myre.po/repo/, will
> assume repo directories named (rpm,ipk,deb) as subdirectories
> and statically add them to the rootfs, using the same PKG_ARCHs
> as the build which produced the images.
> 
> Tested with RPM, IPK and DEB.
> 
> deb feed functionality seem broken, is anyone using this ?
> 
> Signed-off-by: David Nyström <david.c.nystrom@gmail.com>
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>  meta/lib/oe/package_manager.py | 89 +++++++++++++++++++++++++++++++++++++++++-
>  meta/lib/oe/rootfs.py          | 16 ++------
>  2 files changed, 92 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index ff4f1de..c930572 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -223,6 +223,7 @@ class PackageManager(object):
>          self.d = d
>          self.deploy_dir = None
>          self.deploy_lock = None
> +        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True) or ""
>  
>      """
>      Update the package manager package database.
> @@ -262,6 +263,10 @@ class PackageManager(object):
>      def list_installed(self, format=None):
>          pass
>  
> +    @abstractmethod
> +    def insert_feeds_uris(self):
> +        pass
> +
>      """
>      Install complementary packages based upon the list of currently installed
>      packages e.g. locales, *-dev, *-dbg, etc. This will only attempt to install
> @@ -358,6 +363,46 @@ class RpmPM(PackageManager):
>  
>          self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
>  
> +
> +    def insert_feeds_uris(self):
> +        if self.feed_uris == "":
> +            return
> +
> +        # List must be prefered to least preferred order
> +        default_platform_extra = set()
> +        platform_extra = set()
> +        bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
> +        for mlib in self.ml_os_list:
> +            for arch in self.ml_prefix_list[mlib]:
> +                plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
> +                if mlib == bbextendvariant:
> +                        default_platform_extra.add(plt)
> +                else:
> +                        platform_extra.add(plt)
> +
> +        platform_extra = platform_extra.union(default_platform_extra)
> +
> +        arch_list = []
> +        for canonical_arch in platform_extra:
> +            arch = canonical_arch.split('-')[0]
> +            if not os.path.exists(os.path.join(self.deploy_dir, arch)):
> +                continue
> +            arch_list.append(arch)
> +
> +        uri_iterator = 0
> +        channel_priority = 10 + 5 * len(self.feed_uris.split()) * len(arch_list)
> +
> +        for uri in self.feed_uris.split():
> +            for arch in arch_list:
> +                bb.note('Note: adding Smart channel url%d%s (%s)' %
> +                        (uri_iterator, arch, channel_priority))
> +                self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/rpm/%s -y'
> +                                   % (uri_iterator, arch, uri, arch))
> +                self._invoke_smart('channel --set url%d-%s priority=%d' %
> +                                   (uri_iterator, arch, channel_priority))
> +                channel_priority -= 5
> +            uri_iterator += 1
> +
>      '''
>      Create configs for rpm and smart, and multilib is supported
>      '''
> @@ -944,7 +989,6 @@ class OpkgPM(PackageManager):
>  
>          self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
>          self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
> -
>          self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg-cl")
>          self.opkg_args = "-f %s -o %s " % (self.config_file, target_rootfs)
>          self.opkg_args += self.d.getVar("OPKG_ARGS", True)
> @@ -1050,6 +1094,29 @@ class OpkgPM(PackageManager):
>                      config_file.write("src oe-%s file:%s\n" %
>                                        (arch, pkgs_dir))
>  
> +    def insert_feeds_uris(self):
> +        if self.feed_uris == "":
> +            return
> +
> +        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
> +                                  % self.target_rootfs)
> +
> +        with open(rootfs_config, "w+") as config_file:
> +            uri_iterator = 0
> +            for uri in self.feed_uris.split():
> +                config_file.write("src/gz url-%d %s/ipk\n" %
> +                                  (uri_iterator, uri))
> +
> +                for arch in self.pkg_archs.split():
> +                    if not os.path.exists(os.path.join(self.deploy_dir, arch)):
> +                        continue
> +                    bb.note('Note: adding opkg channel url-%s-%d (%s)' %
> +                        (arch, uri_iterator, uri))
> +
> +                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
> +                                      (arch, uri_iterator, uri, arch))
> +                uri_iterator += 1
> +
>      def update(self):
>          self.deploy_dir_lock()
>  
> @@ -1410,6 +1477,26 @@ class DpkgPM(PackageManager):
>          if result is not None:
>              bb.fatal(result)
>  
> +    def insert_feeds_uris(self):
> +        if self.feed_uris == "":
> +            return
> +
> +        sources_conf = os.path.join("%s/etc/apt/sources.list"
> +                                    % self.target_rootfs)
> +        arch_list = []
> +        archs = self.d.getVar('PACKAGE_ARCHS', True)
> +        for arch in archs.split():
> +            if not os.path.exists(os.path.join(self.deploy_dir, arch)):
> +                continue
> +            arch_list.append(arch)
> +
> +        with open(sources_conf, "w+") as sources_file:
> +            for uri in self.feed_uris.split():
> +                for arch in arch_list:
> +                    bb.note('Note: adding dpkg channel at (%s)' % uri)
> +                    sources_file.write("deb %s/deb/%s ./\n" %
> +                                       (uri, arch))
> +
>      def _create_configs(self, archs, base_archs):
>          base_archs = re.sub("_", "-", base_archs)
>  
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index be0afa6..cb0a739 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -41,9 +41,10 @@ class Rootfs(object):
>      def _log_check(self):
>          pass
>  
> -    @abstractmethod
>      def _insert_feed_uris(self):
> -        pass
> +        if base_contains("IMAGE_FEATURES", "package-management",
> +                         True, False, self.d):
> +            self.pm.insert_feeds_uris()
>  
>      @abstractmethod
>      def _handle_intercept_failure(self, failed_script):
> @@ -349,9 +350,6 @@ class RpmRootfs(Rootfs):
>                  if found_error == 6:
>                      bb.fatal(message)
>  
> -    def _insert_feed_uris(self):
> -        pass
> -
>      def _handle_intercept_failure(self, registered_pkgs):
>          rpm_postinsts_dir = self.image_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
>          bb.utils.mkdirhier(rpm_postinsts_dir)
> @@ -372,6 +370,7 @@ class DpkgRootfs(Rootfs):
>                           d.getVar('PACKAGE_ARCHS', True),
>                           d.getVar('DPKG_ARCH', True))
>  
> +
>      def _create(self):
>          pkgs_to_install = self.manifest.parse_initial_manifest()
>  
> @@ -432,9 +431,6 @@ class DpkgRootfs(Rootfs):
>      def _log_check(self):
>          pass
>  
> -    def _insert_feed_uris(self):
> -        pass
> -
>  
>  class OpkgRootfs(Rootfs):
>      def __init__(self, d, manifest_dir):
> @@ -698,10 +694,6 @@ class OpkgRootfs(Rootfs):
>      def _log_check(self):
>          pass
>  
> -    def _insert_feed_uris(self):
> -        pass
> -
> -
>  def create_rootfs(d, manifest_dir=None):
>      env_bkp = os.environ.copy()
>  
> -- 
> 1.8.3.2
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

