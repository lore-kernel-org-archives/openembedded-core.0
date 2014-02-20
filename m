Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3C76EC55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 15:21:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Feb 2014 07:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,512,1389772800"; d="scan'208";a="486630448"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 20 Feb 2014 07:21:12 -0800
Date: Thu, 20 Feb 2014 17:21:11 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140220152111.GA30981@lpalcu-linux>
References: <cover.1392877826.git.hongxu.jia@windriver.com>
	<754f90d6ffc10d27c5a9249837f2527f8bb44b68.1392877826.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <754f90d6ffc10d27c5a9249837f2527f8bb44b68.1392877826.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] manifest.py: add create_full for OpkgManifest class
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
X-List-Received-Date: Thu, 20 Feb 2014 15:21:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2014 at 03:06:51PM +0800, Hongxu Jia wrote:
> The function create_full creates the manifest after the package in
> initial manifest has been dummy installed. It lists all *to be
> installed* packages. There is no real installation, just a test.
> 
> [YOCTO #1894]
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/manifest.py | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
> index a4bc04b..6e40a9f 100644
> --- a/meta/lib/oe/manifest.py
> +++ b/meta/lib/oe/manifest.py
> @@ -1,6 +1,8 @@
>  from abc import ABCMeta, abstractmethod
> +from oe.package_manager import *
>  import os
>  import re
> +import bb
>  
>  
>  class Manifest(object):
> @@ -69,6 +71,7 @@ class Manifest(object):
>  
>          self.initial_manifest = os.path.join(self.manifest_dir, "%s_initial_manifest" % manifest_type)
>          self.final_manifest = os.path.join(self.manifest_dir, "%s_final_manifest" % manifest_type)
> +        self.full_manifest = os.path.join(self.manifest_dir, "%s_full_manifest" % manifest_type)
>  
>          # packages in the following vars will be split in 'must install' and
>          # 'multilib'
> @@ -128,6 +131,15 @@ class Manifest(object):
>          pass
>  
>      """
> +    This creates the manifest after the package in initial manifest has been
> +    dummy installed. It lists all *to be installed* packages. There is no real
> +    installation, just a test.
> +    """
> +    @abstractmethod
> +    def create_full(self):
> +        pass
> +
> +    """
>      The following function parses an initial manifest and returns a dictionary
>      object with the must install, attempt only, multilib and language packages.
>      """
> @@ -158,6 +170,22 @@ class Manifest(object):
>  
>          return pkgs
>  
> +    '''
> +    This following function parses a full manifest and return a list
> +    object with packages.
> +    '''
> +    def parse_full_manifest(self):
> +        installed_pkgs = list()
> +        if not os.path.exists(self.full_manifest):
> +            bb.note('full manifest not exist')
> +            return installed_pkgs
> +
> +        with open(self.full_manifest, 'r') as manifest:
> +            for pkg in manifest.read().split('\n'):
> +                installed_pkgs.append(pkg.strip())
> +
> +        return installed_pkgs
> +
>  
>  class RpmManifest(Manifest):
>      """
> @@ -202,10 +230,12 @@ class RpmManifest(Manifest):
>                  for pkg in pkgs[pkg_type].split():
>                      manifest.write("%s,%s\n" % (pkg_type, pkg))
>  
> -
>      def create_final(self):
>          pass
>  
> +    def create_full(self):
> +        pass
> +
>  
>  class OpkgManifest(Manifest):
>      """
> @@ -253,6 +283,36 @@ class OpkgManifest(Manifest):
>      def create_final(self):
>          pass
>  
> +    def create_full(self):
> +        if not os.path.exists(self.initial_manifest):
> +            self.create_initial()
> +
> +        initial_manifest = self.parse_initial_manifest()
> +        pkgs_to_install = list()
> +        for pkg_type in initial_manifest:
> +            pkgs_to_install += initial_manifest[pkg_type]
> +        if len(pkgs_to_install) == 0:
> +            return
> +
> +        image_rootfs = self.d.expand("${T}/opkg")
> +        opkg_conf = self.d.getVar("IPKGCONF_TARGET", True)
> +        pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
> +        pm = OpkgPM(self.d, image_rootfs, opkg_conf, pkg_archs)
Do we really need to instantiate another PM object here? Can't the
caller pass an instance to it? After all, dummy_install() is not
supposed to alter the metadata, am I wrong? So, in this case, I believe
the caller can safely pass an instance to PM as an argument to the
function.

> +
> +        pm.update()
> +        pm.handle_bad_recommendations()
> +        output = pm.dummy_install(pkgs_to_install)
> +
> +        with open(self.full_manifest, 'w+') as manifest:
> +            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
> +            for line in set(output.split('\n')):
> +                m = pkg_re.match(line)
> +                if m:
> +                    manifest.write(m.group(1) + '\n')
> +
> +        bb.utils.remove(image_rootfs, True)
> +        return
> +
>  
>  class DpkgManifest(Manifest):
>      def create_initial(self):
> @@ -272,6 +332,9 @@ class DpkgManifest(Manifest):
>      def create_final(self):
>          pass
>  
> +    def create_full(self):
> +        pass
> +
>  
>  def create_manifest(d, final_manifest=False, manifest_dir=None,
>                      manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
> -- 
> 1.8.1.2
> 

