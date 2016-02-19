Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD3C76E70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:49:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2016 01:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="916471146"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2016 01:49:25 -0800
Message-ID: <1455875364.2298.4.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 11:49:24 +0200
In-Reply-To: <1455809929-37425-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1455809929-37425-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH] signing-keys: Make signing keys the only publisher of keys
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
X-List-Received-Date: Fri, 19 Feb 2016 09:49:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Randy,

On Thu, 2016-02-18 at 07:38 -0800, Randy Witt wrote:
> Previously the keys were put into the os-release package. The package
> indexing code was also deploying the keys rather than only using the
> keys.
> 
> This change makes signing-keys.bb the only publisher of the keys and
> also
> uses standard tasks that already have sstate.
> 
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/classes/sign_package_feed.bbclass     | 11 ++++--
>  meta/classes/sign_rpm.bbclass              | 11 ++++--
>  meta/lib/oe/package_manager.py             | 10 -----
>  meta/recipes-core/meta/signing-keys.bb     | 61
> +++++++++++++++++++++---------
>  meta/recipes-core/os-release/os-release.bb | 11 ------
>  5 files changed, 57 insertions(+), 47 deletions(-)
> 
> diff --git a/meta/classes/sign_package_feed.bbclass
> b/meta/classes/sign_package_feed.bbclass
> index 63ca02f..d6d1603 100644
> --- a/meta/classes/sign_package_feed.bbclass
> +++ b/meta/classes/sign_package_feed.bbclass
> @@ -30,9 +30,12 @@ python () {
>  
>      # Set expected location of the public key
>      d.setVar('PACKAGE_FEED_GPG_PUBKEY',
> -             os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
> -                                   'PACKAGE-FEED-GPG-PUBKEY'))
> +             os.path.join(d.getVar('STAGING_DIR_TARGET', False),
> +                          d.getVar('sysconfdir', False),
> +                          'pki',
> +                          'packagefeed-gpg',
> +                          'PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}'))
>  }
>  
> -do_package_index[depends] += "signing-keys:do_export_public_keys"
> -do_rootfs[depends] += "signing-keys:do_export_public_keys"
> +do_package_index[depends] += "signing-keys:do_deploy"
> +do_rootfs[depends] += "signing-keys:do_populate_sysroot"
> diff --git a/meta/classes/sign_rpm.bbclass
> b/meta/classes/sign_rpm.bbclass
> index 8bcabee..d3e2b38 100644
> --- a/meta/classes/sign_rpm.bbclass
> +++ b/meta/classes/sign_rpm.bbclass
> @@ -28,8 +28,11 @@ python () {
>              raise_sanity_error("You need to define %s in the config"
> % var, d)
>  
>      # Set the expected location of the public key
> -    d.setVar('RPM_GPG_PUBKEY',
> os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
> -                                            'RPM-GPG-PUBKEY'))
> +    d.setVar('RPM_GPG_PUBKEY',
> os.path.join(d.getVar('STAGING_DIR_TARGET', False),
> +                                            d.getVar('sysconfdir',
> False),
> +                                            'pki',
> +                                            'rpm-gpg',
> +                                            'RPM-GPG-KEY
> -${DISTRO_VERSION}'))
>  }
>  
>  python sign_rpm () {
> @@ -45,5 +48,5 @@ python sign_rpm () {
>      signer.sign_rpms(rpms)
>  }
>  
> -do_package_index[depends] += "signing-keys:do_export_public_keys"
> -do_rootfs[depends] += "signing-keys:do_export_public_keys"
> +do_package_index[depends] += "signing-keys:do_deploy"
> +do_rootfs[depends] += "signing-keys:do_populate_sysroot"
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index 26f6466..340f104 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -145,16 +145,6 @@ class RpmIndexer(Indexer):
>          if signer:
>              for repomd in repomd_files:
>                  signer.detach_sign(repomd)
> -        # Copy pubkey(s) to repo
> -        distro_version = self.d.getVar('DISTRO_VERSION', True) or
> "oe.0"
> -        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
> -            shutil.copy2(self.d.getVar('RPM_GPG_PUBKEY', True),
> -                         os.path.join(self.deploy_dir,
> -                                      'RPM-GPG-KEY-%s' %
> distro_version))
> -        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
> -            shutil.copy2(self.d.getVar('PACKAGE_FEED_GPG_PUBKEY',
> True),
> -                         os.path.join(self.deploy_dir,
> -                                      'REPODATA-GPG-KEY-%s' %
> distro_version))
>  
>  
>  class OpkgIndexer(Indexer):
> diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes
> -core/meta/signing-keys.bb
> index d7aa79d..2f190c3 100644
> --- a/meta/recipes-core/meta/signing-keys.bb
> +++ b/meta/recipes-core/meta/signing-keys.bb
> @@ -3,25 +3,21 @@
>  
>  DESCRIPTION = "Make public keys of the signing keys available"
>  LICENSE = "MIT"
> -PACKAGES = ""
> -
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> -do_install[noexec] = "1"
> -do_package[noexec] = "1"
> -do_packagedata[noexec] = "1"
> -do_package_write_ipk[noexec] = "1"
> -do_package_write_rpm[noexec] = "1"
> -do_package_write_deb[noexec] = "1"
> -do_populate_sysroot[noexec] = "1"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
> +                   
>  file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de2
> 0420"
> +
> +
> +inherit allarch deploy
>  
>  EXCLUDE_FROM_WORLD = "1"
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +PACKAGES =+ "${PN}-rpm ${PN}-packagefeed"
>  
> +FILES_${PN}-rpm = "${sysconfdir}/pki/rpm-gpg"
> +FILES_${PN}-packagefeed = "${sysconfdir}/pki/packagefeed-gpg"
>  
> -python do_export_public_keys () {
> +python do_get_public_keys () {
>      from oe.gpg_sign import get_signer
>  
>      if d.getVar("RPM_SIGN_PACKAGES", True):
> @@ -30,7 +26,7 @@ python do_export_public_keys () {
>                              d.getVar('RPM_GPG_BACKEND', True),
>                              d.getVar('RPM_GPG_NAME', True),
>                              d.getVar('RPM_GPG_PASSPHRASE_FILE',
> True))
> -        signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True))
> +        signer.export_pubkey(os.path.join(d.expand('${B}'), 'rpm
> -key'))
>  
>      if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>          # Export public key of the feed signing key
> @@ -38,6 +34,35 @@ python do_export_public_keys () {
>                              d.getVar('PACKAGE_FEED_GPG_BACKEND',
> True),
>                              d.getVar('PACKAGE_FEED_GPG_NAME', True),
>                             
>  d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
> -        signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY',
> True))
> +        signer.export_pubkey(os.path.join(d.expand('${B}'), 'pf
> -key'))
> +}
> +do_get_public_keys[cleandirs] = "${B}"
> +addtask get_public_keys before do_install
> +
> +do_install () {
> +    if [ -f "${B}/rpm-key" ]; then
> +        install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm
> -gpg/RPM-GPG-KEY-${DISTRO_VERSION}"
> +    fi
> +    if [ -f "${B}/pf-key" ]; then
> +        install -D -m 0644 "${B}/pf-key"
> "${D}${sysconfdir}/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY
> -${DISTRO_VERSION}"
> +    fi
> +}
> +
> +sysroot_stage_all_append () {
> +    sysroot_stage_dir ${D}${sysconfdir}/pki
> ${SYSROOT_DESTDIR}${sysconfdir}/pki
> +}
> +
> +do_deploy () {
> +    if [ -f "${B}/rpm-key" ]; then
> +        install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY
> -${DISTRO_VERSION}"
> +    fi
> +    if [ -f "${B}/pf-key" ]; then
> +        install -D -m 0644 "${B}/pf-key" "${DEPLOYDIR}/PACKAGEFEED
> -GPG-KEY-${DISTRO_VERSION}"
> +    fi
>  }
> -addtask do_export_public_keys before do_build
> +do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
> +# cleandirs should possibly be in deploy.bbclass but we need it
> +do_deploy[cleandirs] = "${DEPLOYDIR}"
> +# clear stamp-extra-info since MACHINE is normally put there by
> deploy.bbclass
> +do_deploy[stamp-extra-info] = ""
> +addtask deploy after do_get_public_keys
> diff --git a/meta/recipes-core/os-release/os-release.bb
> b/meta/recipes-core/os-release/os-release.bb
> index df19ca2..58364ea 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -30,21 +30,10 @@ python do_compile () {
>              value = d.getVar(field, True)
>              if value:
>                  f.write('{0}="{1}"\n'.format(field, value))
> -    if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
> -        rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
> -        bb.utils.mkdirhier('${B}/rpm-gpg')
> -        distro_version = d.getVar('DISTRO_VERSION', True) or "oe.0"
> -        shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/rpm-gpg/RPM-GPG
> -KEY-%s' % distro_version))
>  }
>  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
> -do_compile[depends] += "signing-keys:do_export_public_keys"
>  
>  do_install () {
>      install -d ${D}${sysconfdir}
>      install -m 0644 os-release ${D}${sysconfdir}/
> -
> -    if [ -d "rpm-gpg" ]; then
> -        install -d "${D}${sysconfdir}/pki"
> -        cp -r "rpm-gpg" "${D}${sysconfdir}/pki/"
> -    fi
>  }

This looks very good to me! But, it doesn't apply cleanly on top of the
latest master.

Also, you could ditch the PACKAGE_FEED_GPG_PUBKEY variable as it's not
used anywhere anymore.

It would be nice to get rid of RPM_GPG_PUBKEY, too. But, it would need
minor further changes in oe.package_manager that can be done later in a
separate patch.


Thanks,
  Markus








