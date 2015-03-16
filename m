Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 981F76013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:54:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 02:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,407,1422950400"; d="scan'208";a="467808708"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2015 02:47:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 16 Mar 2015 09:54:18 +0000
Message-ID: <1560666.CFdVa8e3ff@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-100.fc20.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1426480377-32757-1-git-send-email-sgw@linux.intel.com>
References: <1426480377-32757-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_manager: Create variable for install_dir_name
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
X-List-Received-Date: Mon, 16 Mar 2015 09:54:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saul,

A couple of minor things:

On Sunday 15 March 2015 22:32:57 Saul Wold wrote:
> This patch creates a variable for the install_dir name so it can be
> something other than /install, also by doing this we can correctly
> clean up the empty directories (/install/tmp) during the clean-up
> phase. The new default is /oe_install so as to not conflict with other
> possible packages that might use /install to place files.
> 
> [YOCTO #7353]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/lib/oe/package_manager.py | 15 ++++++++-------
>  meta/lib/oe/rootfs.py          |  5 ++++-
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 69bef1d..63bce27 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -578,7 +578,8 @@ class RpmPM(PackageManager):
>          self.fullpkglist = list()
>          self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM', True)
>          self.etcrpm_dir = os.path.join(self.target_rootfs, "etc/rpm")
> -        self.install_dir = os.path.join(self.target_rootfs, "install")
> +        self.install_dir_name = os.path.join("oe_install")

You aren't joining anything, best to just set the variable outright surely?

> +        self.install_dir_path = os.path.join(self.target_rootfs,
> self.install_dir_name) self.rpm_cmd = bb.utils.which(os.getenv('PATH'),
> "rpm")
>          self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
>          self.smart_opt = "--quiet --data-dir=" +
> os.path.join(target_rootfs, @@ -749,9 +750,9 @@ class
> RpmPM(PackageManager):
>          bb.utils.mkdirhier(self.etcrpm_dir)
> 
>          # Setup temporary directory -- install...
> -        if os.path.exists(self.install_dir):
> -            bb.utils.remove(self.install_dir, True)
> -        bb.utils.mkdirhier(os.path.join(self.install_dir, 'tmp'))
> +        if os.path.exists(self.install_dir_path):
> +            bb.utils.remove(self.install_dir_path, True)
> +        bb.utils.mkdirhier(os.path.join(self.install_dir_path, 'tmp'))
> 
>          channel_priority = 5
>          platform_dir = os.path.join(self.etcrpm_dir, "platform")
> @@ -838,7 +839,7 @@ class RpmPM(PackageManager):
>          self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
>          self._invoke_smart('config --set rpm-extra-macros._var=%s' %
>                             self.d.getVar('localstatedir', True))
> -        cmd = 'config --set rpm-extra-macros._tmppath=/install/tmp'
> +        cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" %
> (self.install_dir_name)
> 
>          prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH', True)
>          if prefer_color:
> @@ -992,7 +993,7 @@ class RpmPM(PackageManager):
>              cmd += "--dbpath=/var/lib/rpm "
>              cmd += "--define='_cross_scriptlet_wrapper %s' " % \
>                     self.scriptlet_wrapper
> -            cmd += "--define='_tmppath /install/tmp' %s" % ' '.join(pkgs)
> +            cmd += "--define='_tmppath /%s/tmp' %s" %
> (self.install_dir_name, ' '.join(pkgs)) else:
>              # for pkg in pkgs:
>              #   bb.note('Debug: What required: %s' % pkg)
> @@ -1027,7 +1028,7 @@ class RpmPM(PackageManager):
>          bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/opkg'),
> True)
> 
>          # remove temp directory
> -        bb.utils.remove(self.d.expand('${IMAGE_ROOTFS}/install'), True)
> +        bb.utils.remove(self.d.expand('${IMAGE_ROOTFS}/%s' %
> (self.install_dir_name)), True)

Obviously you're just following existing code, but shouldn't we just use 
self.install_dir_path here?

> 
>      def backup_packaging_data(self):
>          # Save the rpmlib for increment rpm image generation
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index dd7aa44..9493d22b 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -409,7 +409,10 @@ class RpmRootfs(Rootfs):
>          # __db.00* (Berkeley DB files that hold locks, rpm specific
> environment # settings, etc.), that should not get into the final rootfs
> self.pm.unlock_rpm_db()
> -        bb.utils.remove(self.image_rootfs + "/install", True)
> +        if os.path.isdir(self.pm.install_dir_path + "/tmp") and not
> os.listdir(self.pm.install_dir_path + "/tmp"): +          
> bb.utils.remove(self.pm.install_dir_path + "/tmp", True) +        if
> os.path.isdir(self.pm.install_dir_path) and not
> os.listdir(self.pm.install_dir_path): +          
> bb.utils.remove(self.pm.install_dir_path, True)
> 
> 
>  class DpkgRootfs(Rootfs):


Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

