Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <694f4b0519a5365015c7eb561767b27f3a07e975.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 3/3] apt: add apt selftest to test signed package feeds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 04 Apr 2022 14:58:07 +0100
In-Reply-To: <20220403195046.7060-5-fntoth@gmail.com>
References: <20220403195046.7060-1-fntoth@gmail.com>
	 <20220403195046.7060-5-fntoth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>, Alexander Kanavin <alex@linutronix.de>, Ferry Toth <ftoth@exalondelft.nl>

On Sun, 2022-04-03 at 21:50 +0200, Ferry Toth wrote:
> From: Ferry Toth <ftoth@exalondelft.nl>
> 
> Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
> Currently when building images this requirement is worked around by using [allow-insecure=yes] and
> equivalently when performing selftest.
> 
> Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign DEB package feeds"
> enable signed DEB package feeds. This patch adds a runtime test for apt derived from the test_testimage_dnf
> test. It creates a signed deb package feed, runs a qemu image to install the key and performs some package
> management. To be able to install the key the gnupg package is added to the testimage.
> 
> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
> ---
>  meta/lib/oeqa/runtime/cases/apt.py           | 16 ++++++---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 38 ++++++++++++++++++++
>  2 files changed, 49 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
> index 53745df93f..49f8714730 100644
> --- a/meta/lib/oeqa/runtime/cases/apt.py
> +++ b/meta/lib/oeqa/runtime/cases/apt.py
> @@ -21,7 +21,7 @@ class AptRepoTest(AptTest):
>  
>      @classmethod
>      def setUpClass(cls):
> -        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all')
> +        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], '')
>          cls.repo_server = HTTPService(service_repo,
>                                        '0.0.0.0', port=cls.tc.target.server_port,
>                                        logger=cls.tc.logger)
> @@ -32,13 +32,18 @@ class AptRepoTest(AptTest):
>          cls.repo_server.stop()
>  
>      def setup_source_config_for_package_install(self):
> -        apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
> +        apt_get_source_server = 'http:\/\/%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
>          apt_get_sourceslist_dir = '/etc/apt/'
> -        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
> +        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's/\[trusted=yes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
>  
>      def cleanup_source_config_for_package_install(self):
>          apt_get_sourceslist_dir = '/etc/apt/'
> -        self.target.run('cd %s; rm sources.list' % (apt_get_sourceslist_dir))
> +        self.target.run('cd %s; mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
> +
> +    def setup_key(self):
> +        # the key is found on the target /etc/pki/packagefeed-gpg/
> +        # named PACKAGEFEED-GPG-KEY-poky-branch
> +        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
>  
>      @skipIfNotFeature('package-management',
>                        'Test requires package-management to be in IMAGE_FEATURES')
> @@ -47,7 +52,8 @@ class AptRepoTest(AptTest):
>      @OEHasPackage(['apt'])
>      def test_apt_install_from_repo(self):
>          self.setup_source_config_for_package_install()
> +        self.setup_key()
>          self.pkg('update')
>          self.pkg('remove --yes run-postinsts-dev')
> -        self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
> +        self.pkg('install --yes run-postinsts-dev')
>          self.cleanup_source_config_for_package_install()
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index 642f0eb637..7a75b95a99 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -162,6 +162,44 @@ class TestImage(OESelftestTestCase):
>          bitbake('core-image-full-cmdline socat')
>          bitbake('-c testimage core-image-full-cmdline')
>  
> +    def test_testimage_apt(self):
> +        """
> +        Summary: Check package feeds functionality for apt
> +        Expected: 1. Check that remote package feeds can be accessed
> +        Product: oe-core
> +        Author: Ferry Toth <fntoth@gmail.com>
> +        """
> +        if get_bb_var('DISTRO') == 'poky-tiny':
> +            self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
> +
> +        features = 'INHERIT += "testimage"\n'
> +        features += 'TEST_SUITES = "ping ssh apt.AptRepoTest.test_apt_install_from_repo"\n'
> +        # We don't yet know what the server ip and port will be - they will be patched
> +        # in at the start of the on-image test
> +        features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
> +        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
> +        features += 'PACKAGE_CLASSES = "package_deb"\n'
> +        # We need  gnupg on the target to install keys
> +        features += 'IMAGE_INSTALL:append:pn-core-image-full-cmdline = " gnupg"\n'
> +
> +        bitbake('gnupg-native -c addto_recipe_sysroot')
> +
> +        # Enable package feed signing
> +        self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
> +        self.track_for_cleanup(self.gpg_home)
> +        signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
> +        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --homedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"), shell=True)
> +        features += 'INHERIT += "sign_package_feed"\n'
> +        features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
> +        features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
> +        features += 'GPG_PATH = "%s"\n' % self.gpg_home
> +        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
> +        self.write_config(features)
> +
> +        # Build core-image-sato and testimage
> +        bitbake('core-image-full-cmdline socat')
> +        bitbake('-c testimage core-image-full-cmdline')
> +
>      def test_testimage_virgl_gtk_sdl(self):
>          """
>          Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk and SDL frontends

Thanks for working on this!

Looking at the patches I wondered if this would break testimage and
unfortunately it does:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5013/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4975

however hopefully these shouldn't be too hard to fix?

The rest of the build is still running.

Cheers,

Richard

