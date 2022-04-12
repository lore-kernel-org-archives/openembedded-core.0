Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6cb8d5aa-dd1f-40ab-8f10-50449f1e8438@gmail.com>
Date: Tue, 12 Apr 2022 23:32:49 +0200
MIME-Version: 1.0
From: "Ferry Toth" <fntoth@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] apt: add apt selftest to test signed package feeds
References: <20220411205036.8298-1-fntoth@gmail.com>
 <20220411205036.8298-2-fntoth@gmail.com> <YlWJ1p+E/bTygFNo@mail.local>
In-Reply-To: <YlWJ1p+E/bTygFNo@mail.local>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>, Xavier Berger <xavier.berger@biologic.net>, Alexander Kanavin <alex@linutronix.de>

Hi

Op 12-04-2022 om 16:16 schreef Alexandre Belloni:
> Hello,
> 
> On 11/04/2022 22:50:36+0200, Ferry Toth wrote:
>> From: Ferry Toth <ftoth@exalondelft.nl>
>>
>> Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
>> Currently when building images this requirement is worked around by using [allow-insecure=yes] and
>> equivalently when performing selftest.
>>
>> Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign DEB package feeds"
>> enable signed DEB package feeds. This patch adds a runtime test for apt derived from the test_testimage_dnf
>> test. It creates a signed deb package feed, runs a qemu image to install the key and performs some package
>> management. To be able to install the key the gnupg package is added to the testimage.
>>
> 
> This went through the autobuilders and it seems this still fails:

That is disappointing.

> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3437/steps/15/logs/stdio
> 
> ERROR: package-index-1.0-r0 do_package_index: Could not get gpg version: Command '['/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/hosttools/gpg', '--agent-program=/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/hosttools/gpg-agent|--auto-expand-secmem', '--version', '--no-permission-warning']' returned non-zero exit status 2.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/work/core2-64-poky-linux/package-index/1.0-r0/temp/log.do_package_index.53841
> NOTE: recipe package-index-1.0-r0: task do_package_index: Failed

In fact package_index is failing, which is outside this patch code.

> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/meta/package-index.bb:do_package_index) failed with exit code '1'
> 
> This was ubuntu 16.04 so maybe gpg on the distro is too old (1.4.20) but
> I'm not sure as I think you are using gnupg-native.

I would have expected gnupg-native, but the log line above shows 
hosttools is being used. But the same would happen for signed rpm and 
ipk feeds right?

Did we get the correct one tested? I see 55173d in next and then 
reverted by Richard. But that was v2.

>> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
>> ---
>>   meta/lib/oeqa/runtime/cases/apt.py           | 38 ++++++++++++++++----
>>   meta/lib/oeqa/selftest/cases/runtime_test.py | 38 ++++++++++++++++++++
>>   2 files changed, 69 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
>> index 53745df93f..574a34f148 100644
>> --- a/meta/lib/oeqa/runtime/cases/apt.py
>> +++ b/meta/lib/oeqa/runtime/cases/apt.py
>> @@ -21,7 +21,7 @@ class AptRepoTest(AptTest):
>>   
>>       @classmethod
>>       def setUpClass(cls):
>> -        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all')
>> +        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], '')
>>           cls.repo_server = HTTPService(service_repo,
>>                                         '0.0.0.0', port=cls.tc.target.server_port,
>>                                         logger=cls.tc.logger)
>> @@ -34,20 +34,44 @@ class AptRepoTest(AptTest):
>>       def setup_source_config_for_package_install(self):
>>           apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
>>           apt_get_sourceslist_dir = '/etc/apt/'
>> -        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
>> +        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s/all ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
>> +
>> +    def setup_source_config_for_package_install_signed(self):
>> +        apt_get_source_server = 'http:\/\/%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
>> +        apt_get_sourceslist_dir = '/etc/apt/'
>> +        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's/\[trusted=yes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
>>   
>>       def cleanup_source_config_for_package_install(self):
>>           apt_get_sourceslist_dir = '/etc/apt/'
>>           self.target.run('cd %s; rm sources.list' % (apt_get_sourceslist_dir))
>>   
>> +    def cleanup_source_config_for_package_install_signed(self):
>> +        apt_get_sourceslist_dir = '/etc/apt/'
>> +        self.target.run('cd %s; mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
>> +
>> +    def setup_key(self):
>> +        # the key is found on the target /etc/pki/packagefeed-gpg/
>> +        # named PACKAGEFEED-GPG-KEY-poky-branch
>> +        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
>> +
>>       @skipIfNotFeature('package-management',
>>                         'Test requires package-management to be in IMAGE_FEATURES')
>>       @skipIfNotDataVar('IMAGE_PKGTYPE', 'deb',
>>                         'DEB is not the primary package manager')
>>       @OEHasPackage(['apt'])
>>       def test_apt_install_from_repo(self):
>> -        self.setup_source_config_for_package_install()
>> -        self.pkg('update')
>> -        self.pkg('remove --yes run-postinsts-dev')
>> -        self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
>> -        self.cleanup_source_config_for_package_install()
>> +        if not self.tc.td.get('PACKAGE_FEED_GPG_NAME'):
>> +            self.setup_source_config_for_package_install()
>> +            self.pkg('update')
>> +            self.pkg('remove --yes run-postinsts-dev')
>> +            self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
>> +            self.cleanup_source_config_for_package_install()
>> +        else:
>> +            # when we are here a key has been set to sign the package feed and
>> +            # public key and gnupg installed on the image by test_testimage_apt
>> +            self.setup_source_config_for_package_install_signed()
>> +            self.setup_key()
>> +            self.pkg('update')
>> +            self.pkg('install --yes run-postinsts-dev')
>> +            self.pkg('remove --yes run-postinsts-dev')
>> +            self.cleanup_source_config_for_package_install_signed()
>> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
>> index 2ad89490fc..3ece617cb0 100644
>> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
>> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
>> @@ -162,6 +162,44 @@ class TestImage(OESelftestTestCase):
>>           bitbake('core-image-full-cmdline socat')
>>           bitbake('-c testimage core-image-full-cmdline')
>>   
>> +    def test_testimage_apt(self):
>> +        """
>> +        Summary: Check package feeds functionality for apt
>> +        Expected: 1. Check that remote package feeds can be accessed
>> +        Product: oe-core
>> +        Author: Ferry Toth <fntoth@gmail.com>
>> +        """
>> +        if get_bb_var('DISTRO') == 'poky-tiny':
>> +            self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
>> +
>> +        features = 'INHERIT += "testimage"\n'
>> +        features += 'TEST_SUITES = "ping ssh apt.AptRepoTest.test_apt_install_from_repo"\n'
>> +        # We don't yet know what the server ip and port will be - they will be patched
>> +        # in at the start of the on-image test
>> +        features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
>> +        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
>> +        features += 'PACKAGE_CLASSES = "package_deb"\n'
>> +        # We need  gnupg on the target to install keys
>> +        features += 'IMAGE_INSTALL:append:pn-core-image-full-cmdline = " gnupg"\n'
>> +
>> +        bitbake('gnupg-native -c addto_recipe_sysroot')
>> +
>> +        # Enable package feed signing
>> +        self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
>> +        self.track_for_cleanup(self.gpg_home)
>> +        signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
>> +        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --homedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"), shell=True)
>> +        features += 'INHERIT += "sign_package_feed"\n'
>> +        features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
>> +        features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
>> +        features += 'GPG_PATH = "%s"\n' % self.gpg_home
>> +        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
>> +        self.write_config(features)
>> +
>> +        # Build core-image-sato and testimage
>> +        bitbake('core-image-full-cmdline socat')
>> +        bitbake('-c testimage core-image-full-cmdline')
>> +
>>       def test_testimage_virgl_gtk_sdl(self):
>>           """
>>           Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk and SDL frontends
>> -- 
>> 2.32.0
>>
> 
>>
>> 
>>
> 
> 
