Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 855186DE07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:24:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2014 06:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="489262948"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2014 06:24:04 -0800
Date: Thu, 27 Feb 2014 16:24:04 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Message-ID: <20140227142404.GB3534@lpalcu-linux>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
In-Reply-To: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Thu, 27 Feb 2014 14:24:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi David,

My comments/questions below.

laurentiu

On Thu, Feb 27, 2014 at 02:28:21PM +0100, David Nyström wrote:
> local.conf defines 
> PACKAGE_FEED_URIS = "http://www.feed_repo.org/repo/"
> 
> should we do it this way or some other way ?
> 
> [Bug 5407]
> 
> 
> 
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>  meta/lib/oe/package_manager.py | 76 +++++++++++++++++++++++++++++++++++++++++-
>  meta/lib/oe/rootfs.py          | 15 +++++++--
>  2 files changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index d29adac..d4050c6 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -223,6 +223,7 @@ class PackageManager(object):
>          self.d = d
>          self.deploy_dir = None
>          self.deploy_lock = None
> +        self.feed_uris = None
I guess you can do:
           self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True) or ""
since we're using the same variable for all backends.

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
> @@ -339,6 +344,7 @@ class RpmPM(PackageManager):
>          self.providename = providename
>          self.fullpkglist = list()
>          self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM', True)
> +        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True)
can be removed, see above.

>          self.etcrpm_dir = os.path.join(self.target_rootfs, "etc/rpm")
>          self.install_dir = os.path.join(self.target_rootfs, "install")
>          self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
> @@ -358,6 +364,41 @@ class RpmPM(PackageManager):
>  
>          self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
>  
> +
> +    def insert_feeds_uris(self):
shouldn't we check that self.feed_uris != "" before continuing?

> +        # List must be prefered to least preferred order
> +        channel_priority = 5
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
> +                channel_priority += 5
> +
> +        platform_extra = platform_extra.union(default_platform_extra)
> +
> +        for uri in self.feed_uris.split():
> +            channel_priority *= 2
> +            uri_iterator = 0
> +            for canonical_arch in platform_extra:
> +                arch = canonical_arch.split('-')[0]
> +                if arch == "noarch" or arch == "any":
> +                    continue
> +
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
> @@ -944,7 +985,7 @@ class OpkgPM(PackageManager):
>  
>          self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
>          self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
> -
> +        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True)
can be removed, see above.

>          self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg-cl")
>          self.opkg_args = "-f %s -o %s " % (self.config_file, target_rootfs)
>          self.opkg_args += self.d.getVar("OPKG_ARGS", True)
> @@ -1050,6 +1091,24 @@ class OpkgPM(PackageManager):
>                      config_file.write("src oe-%s file:%s\n" %
>                                        (arch, pkgs_dir))
>  
> +    def insert_feeds_uris(self):
check self.feed_uris != "" here?

> +        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
> +                                  % self.target_rootfs)
> +
> +        with open(rootfs_config, "w+") as config_file:
> +            priority = 5
apparently this is not used at all in the code below, can be removed.

> +            uri_iterator = 0
> +            for uri in self.feed_uris.split():
> +                config_file.write("src/gz url-%d %s/ipk\n" %
> +                                  (uri_iterator, uri))
> +
> +                for arch in self.pkg_archs.split():
> +                    if arch == "noarch" or arch == "any":
> +                        continue
> +                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
> +                                      (arch, uri_iterator, uri, arch))
> +                uri_iterator += 1
> +
>      def update(self):
>          self.deploy_dir_lock()
>  
> @@ -1250,6 +1309,7 @@ class DpkgPM(PackageManager):
>      def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
>          super(DpkgPM, self).__init__(d)
>          self.target_rootfs = target_rootfs
> +        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True)
can be removed, see above.

>          self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB', True)
>          if apt_conf_dir is None:
>              self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
> @@ -1410,6 +1470,20 @@ class DpkgPM(PackageManager):
>          if result is not None:
>              bb.fatal(result)
>  
> +    def insert_feeds_uris(self):
check self.feed_uris != "" here?

> +        sources_conf = os.path.join("%s/etc/apt/sources.list"
> +                                    % self.target_rootfs)
> +        arch_list = []
> +        archs = self.d.getVar('PACKAGE_ARCHS', True)
> +        arch_list = archs.split()
> +        with open(sources_conf, "w+") as sources_file:
> +            for uri in self.feed_uris.split():
> +                for arch in arch_list:
> +                    if arch == "noarch" or arch == "any":
> +                        continue
> +                    sources_file.write("deb %s/deb/%s ./\n" %
> +                                       (uri, arch))
> +
>      def _create_configs(self, archs, base_archs):
>          base_archs = re.sub("_", "-", base_archs)
>  
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index be0afa6..7be2a18 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -350,7 +350,10 @@ class RpmRootfs(Rootfs):
>                      bb.fatal(message)
>  
>      def _insert_feed_uris(self):
> -        pass
> +        if base_contains("IMAGE_FEATURES", "package-management",
> +                         False, True, self.d):
> +            return
> +        self.pm.insert_feeds_uris()
For the sake of code clarity, I would suggest:

        if base_contains("IMAGE_FEATURES", "package-management",
                         True, False, self.d):
            self.pm.insert_feeds_uris()

>  
>      def _handle_intercept_failure(self, registered_pkgs):
>          rpm_postinsts_dir = self.image_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
> @@ -433,7 +436,10 @@ class DpkgRootfs(Rootfs):
>          pass
>  
>      def _insert_feed_uris(self):
> -        pass
> +        if base_contains("IMAGE_FEATURES", "package-management",
> +                         False, True, self.d):
> +            return
> +        self.pm.insert_feeds_uris()
same here.

>  
>  
>  class OpkgRootfs(Rootfs):
> @@ -699,8 +705,11 @@ class OpkgRootfs(Rootfs):
>          pass
>  
>      def _insert_feed_uris(self):
> -        pass
> +        if base_contains("IMAGE_FEATURES", "package-management",
> +                         False, True, self.d):
> +            return
>  
> +        self.pm.insert_feeds_uris()
same here.

>  
>  def create_rootfs(d, manifest_dir=None):
>      env_bkp = os.environ.copy()
> -- 
> 1.8.3.2
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

