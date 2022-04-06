Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B5FC3A59E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web10.10011.1649258161937054802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 08:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id B8EB124096;
	Wed,  6 Apr 2022 17:16:00 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------GvIB30t5Ye0j0p6r2glArm79"
Message-ID: <e06fb81f-cdd3-e293-2b60-711284e1d7bc@gmail.com>
Date: Wed, 6 Apr 2022 17:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH v2 3/3] apt: add apt selftest to test signed
 package feeds
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
 Xavier Berger <xavier.berger@bio-logic.net>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220403195046.7060-1-fntoth@gmail.com>
 <20220403195046.7060-5-fntoth@gmail.com>
 <694f4b0519a5365015c7eb561767b27f3a07e975.camel@linuxfoundation.org>
 <Yk1nKh7suQXNq1W6@mail.local>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <Yk1nKh7suQXNq1W6@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164085

This is a multi-part message in MIME format.
--------------GvIB30t5Ye0j0p6r2glArm79
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Op 06-04-2022 om 12:10 schreef Alexandre Belloni:
> Hello,
>
> On 04/04/2022 14:58:07+0100, Richard Purdie wrote:
>> On Sun, 2022-04-03 at 21:50 +0200, Ferry Toth wrote:
>>> From: Ferry Toth<ftoth@exalondelft.nl>
>>>
>>> Since Gatesgarth apt (1.8.2) has become more strict and doesn=E2=80=99=
t allow unsigned repositories by default.
>>> Currently when building images this requirement is worked around by u=
sing [allow-insecure=3Dyes] and
>>> equivalently when performing selftest.
>>>
>>> Patches "gpg-sign: Add parameters to gpg signature function" and "pac=
kage_manager: sign DEB package feeds"
>>> enable signed DEB package feeds. This patch adds a runtime test for a=
pt derived from the test_testimage_dnf
>>> test. It creates a signed deb package feed, runs a qemu image to inst=
all the key and performs some package
>>> management. To be able to install the key the gnupg package is added =
to the testimage.
>>>
>>> Signed-off-by: Ferry Toth<ftoth@exalondelft.nl>
>>> ---
>>>   meta/lib/oeqa/runtime/cases/apt.py           | 16 ++++++---
>>>   meta/lib/oeqa/selftest/cases/runtime_test.py | 38 +++++++++++++++++=
+++
>>>   2 files changed, 49 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runti=
me/cases/apt.py
>>> index 53745df93f..49f8714730 100644
>>> --- a/meta/lib/oeqa/runtime/cases/apt.py
>>> +++ b/meta/lib/oeqa/runtime/cases/apt.py
>>> @@ -21,7 +21,7 @@ class AptRepoTest(AptTest):
>>>  =20
>>>       @classmethod
>>>       def setUpClass(cls):
>>> -        service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], '=
all')
>>> +        service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], '=
')
>>>           cls.repo_server =3D HTTPService(service_repo,
>>>                                         '0.0.0.0', port=3Dcls.tc.targ=
et.server_port,
>>>                                         logger=3Dcls.tc.logger)
>>> @@ -32,13 +32,18 @@ class AptRepoTest(AptTest):
>>>           cls.repo_server.stop()
>>>  =20
>>>       def setup_source_config_for_package_install(self):
>>> -        apt_get_source_server =3D 'http://%s:%s/' % (self.tc.target.=
server_ip, self.repo_server.port)
>>> +        apt_get_source_server =3D 'http:\/\/%s:%s' % (self.tc.target=
.server_ip, self.repo_server.port)
>>>           apt_get_sourceslist_dir =3D '/etc/apt/'
>>> -        self.target.run('cd %s; echo deb [ allow-insecure=3Dyes ] %s=
 ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
>>> +        self.target.run("cd %s; cp sources.list sources.list.bak; se=
d -i 's/\[trusted=3Dyes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list=
" % (apt_get_sourceslist_dir, apt_get_source_server))
>>>  =20
>>>       def cleanup_source_config_for_package_install(self):
>>>           apt_get_sourceslist_dir =3D '/etc/apt/'
>>> -        self.target.run('cd %s; rm sources.list' % (apt_get_sourcesl=
ist_dir))
>>> +        self.target.run('cd %s; mv sources.list.bak sources.list' % =
(apt_get_sourceslist_dir))
>>> +
>>> +    def setup_key(self):
>>> +        # the key is found on the target /etc/pki/packagefeed-gpg/
>>> +        # named PACKAGEFEED-GPG-KEY-poky-branch
>>> +        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/package=
feed-gpg'))
>>>  =20
>>>       @skipIfNotFeature('package-management',
>>>                         'Test requires package-management to be in IM=
AGE_FEATURES')
>>> @@ -47,7 +52,8 @@ class AptRepoTest(AptTest):
>>>       @OEHasPackage(['apt'])
>>>       def test_apt_install_from_repo(self):
>>>           self.setup_source_config_for_package_install()
>>> +        self.setup_key()
>>>           self.pkg('update')
>>>           self.pkg('remove --yes run-postinsts-dev')
>>> -        self.pkg('install --yes --allow-unauthenticated run-postinst=
s-dev')
>>> +        self.pkg('install --yes run-postinsts-dev')
>>>           self.cleanup_source_config_for_package_install()
>>> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/=
oeqa/selftest/cases/runtime_test.py
>>> index 642f0eb637..7a75b95a99 100644
>>> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
>>> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
>>> @@ -162,6 +162,44 @@ class TestImage(OESelftestTestCase):
>>>           bitbake('core-image-full-cmdline socat')
>>>           bitbake('-c testimage core-image-full-cmdline')
>>>  =20
>>> +    def test_testimage_apt(self):
>>> +        """
>>> +        Summary: Check package feeds functionality for apt
>>> +        Expected: 1. Check that remote package feeds can be accessed
>>> +        Product: oe-core
>>> +        Author: Ferry Toth<fntoth@gmail.com>
>>> +        """
>>> +        if get_bb_var('DISTRO') =3D=3D 'poky-tiny':
>>> +            self.skipTest('core-image-full-cmdline not buildable for=
 poky-tiny')
>>> +
>>> +        features =3D 'INHERIT +=3D "testimage"\n'
>>> +        features +=3D 'TEST_SUITES =3D "ping ssh apt.AptRepoTest.tes=
t_apt_install_from_repo"\n'
>>> +        # We don't yet know what the server ip and port will be - th=
ey will be patched
>>> +        # in at the start of the on-image test
>>> +        features +=3D 'PACKAGE_FEED_URIS =3D "http://bogus_ip:bogus_=
port"\n'
>>> +        features +=3D 'EXTRA_IMAGE_FEATURES +=3D "package-management=
"\n'
>>> +        features +=3D 'PACKAGE_CLASSES =3D "package_deb"\n'
>>> +        # We need  gnupg on the target to install keys
>>> +        features +=3D 'IMAGE_INSTALL:append:pn-core-image-full-cmdli=
ne =3D " gnupg"\n'
>>> +
>>> +        bitbake('gnupg-native -c addto_recipe_sysroot')
>>> +
>>> +        # Enable package feed signing
>>> +        self.gpg_home =3D tempfile.mkdtemp(prefix=3D"oeqa-feed-sign-=
")
>>> +        self.track_for_cleanup(self.gpg_home)
>>> +        signing_key_dir =3D os.path.join(self.testlayer_path, 'files=
', 'signing')
>>> +        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --h=
omedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(sign=
ing_key_dir, 'key.secret')), native_sysroot=3Dget_bb_var("RECIPE_SYSROOT_=
NATIVE", "gnupg-native"), shell=3DTrue)
>>> +        features +=3D 'INHERIT +=3D "sign_package_feed"\n'
>>> +        features +=3D 'PACKAGE_FEED_GPG_NAME =3D "testuser"\n'
>>> +        features +=3D 'PACKAGE_FEED_GPG_PASSPHRASE_FILE =3D "%s"\n' =
% os.path.join(signing_key_dir, 'key.passphrase')
>>> +        features +=3D 'GPG_PATH =3D "%s"\n' % self.gpg_home
>>> +        features +=3D 'PSEUDO_IGNORE_PATHS .=3D ",%s"\n' % self.gpg_=
home
>>> +        self.write_config(features)
>>> +
>>> +        # Build core-image-sato and testimage
>>> +        bitbake('core-image-full-cmdline socat')
>>> +        bitbake('-c testimage core-image-full-cmdline')
>>> +
>>>       def test_testimage_virgl_gtk_sdl(self):
>>>           """
>>>           Summary: Check host-assisted accelerate OpenGL functionalit=
y in qemu with gtk and SDL frontends
>> Thanks for working on this!
>>
>> Looking at the patches I wondered if this would break testimage and
>> unfortunately it does:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5013=
/steps/12/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4975
>>
>> however hopefully these shouldn't be too hard to fix?
>>
>> The rest of the build is still running.
> I missed it at the time but I believe this is also the cause of:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3352/=
steps/15/logs/stdio
>
> ERROR: package-index-1.0-r0 do_package_index: GPG exited with code 2: g=
pg: can't connect to the agent: IPC connect call failed
> gpg: skipped "testuser": No secret key
> gpg: signing failed: No secret key

This seems related but not exact the same.

It seems do_package_index wants to generate a signed deb repo but no key=20
is provided. But IIUC you have PACKAGE_CLASSES =3D "package_rpm", so why=20
is runtime_test.TestImage.test_testimage_apt run?

--------------GvIB30t5Ye0j0p6r2glArm79
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Noto Sans">Hi</font><br>
    </p>
    <div class=3D"moz-cite-prefix">Op 06-04-2022 om 12:10 schreef
      Alexandre Belloni:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:Yk1nKh7suQXNq1W6@mail.local">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hello,

On 04/04/2022 14:58:07+0100, Richard Purdie wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Sun, 2022-04-03 at 21:5=
0 +0200, Ferry Toth wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Ferry Toth <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:ftoth@exalondelft.nl">&lt;ftot=
h@exalondelft.nl&gt;</a>

Since Gatesgarth apt (1.8.2) has become more strict and doesn=E2=80=99t a=
llow unsigned repositories by default.
Currently when building images this requirement is worked around by using=
 [allow-insecure=3Dyes] and
equivalently when performing selftest.

Patches "gpg-sign: Add parameters to gpg signature function" and "package=
_manager: sign DEB package feeds"
enable signed DEB package feeds. This patch adds a runtime test for apt d=
erived from the test_testimage_dnf
test. It creates a signed deb package feed, runs a qemu image to install =
the key and performs some package
management. To be able to install the key the gnupg package is added to t=
he testimage.

Signed-off-by: Ferry Toth <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ftoth@exalondelft.nl">&lt;ftoth@exalondelft.nl&gt;</a>
---
 meta/lib/oeqa/runtime/cases/apt.py           | 16 ++++++---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 38 ++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/c=
ases/apt.py
index 53745df93f..49f8714730 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -21,7 +21,7 @@ class AptRepoTest(AptTest):
=20
     @classmethod
     def setUpClass(cls):
-        service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all'=
)
+        service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], '')
         cls.repo_server =3D HTTPService(service_repo,
                                       '0.0.0.0', port=3Dcls.tc.target.se=
rver_port,
                                       logger=3Dcls.tc.logger)
@@ -32,13 +32,18 @@ class AptRepoTest(AptTest):
         cls.repo_server.stop()
=20
     def setup_source_config_for_package_install(self):
-        apt_get_source_server =3D 'http://%s:%s/' % (self.tc.target.serv=
er_ip, self.repo_server.port)
+        apt_get_source_server =3D 'http:\/\/%s:%s' % (self.tc.target.ser=
ver_ip, self.repo_server.port)
         apt_get_sourceslist_dir =3D '/etc/apt/'
-        self.target.run('cd %s; echo deb [ allow-insecure=3Dyes ] %s ./ =
&gt; sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i=
 's/\[trusted=3Dyes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % =
(apt_get_sourceslist_dir, apt_get_source_server))
=20
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir =3D '/etc/apt/'
-        self.target.run('cd %s; rm sources.list' % (apt_get_sourceslist_=
dir))
+        self.target.run('cd %s; mv sources.list.bak sources.list' % (apt=
_get_sourceslist_dir))
+
+    def setup_key(self):
+        # the key is found on the target /etc/pki/packagefeed-gpg/
+        # named PACKAGEFEED-GPG-KEY-poky-branch
+        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed=
-gpg'))
=20
     @skipIfNotFeature('package-management',
                       'Test requires package-management to be in IMAGE_F=
EATURES')
@@ -47,7 +52,8 @@ class AptRepoTest(AptTest):
     @OEHasPackage(['apt'])
     def test_apt_install_from_repo(self):
         self.setup_source_config_for_package_install()
+        self.setup_key()
         self.pkg('update')
         self.pkg('remove --yes run-postinsts-dev')
-        self.pkg('install --yes --allow-unauthenticated run-postinsts-de=
v')
+        self.pkg('install --yes run-postinsts-dev')
         self.cleanup_source_config_for_package_install()
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa=
/selftest/cases/runtime_test.py
index 642f0eb637..7a75b95a99 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -162,6 +162,44 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
=20
+    def test_testimage_apt(self):
+        """
+        Summary: Check package feeds functionality for apt
+        Expected: 1. Check that remote package feeds can be accessed
+        Product: oe-core
+        Author: Ferry Toth <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:fntoth@gmail.com">&lt;fntoth@gmail.com&gt;</a>
+        """
+        if get_bb_var('DISTRO') =3D=3D 'poky-tiny':
+            self.skipTest('core-image-full-cmdline not buildable for pok=
y-tiny')
+
+        features =3D 'INHERIT +=3D "testimage"\n'
+        features +=3D 'TEST_SUITES =3D "ping ssh apt.AptRepoTest.test_ap=
t_install_from_repo"\n'
+        # We don't yet know what the server ip and port will be - they w=
ill be patched
+        # in at the start of the on-image test
+        features +=3D 'PACKAGE_FEED_URIS =3D "http://bogus_ip:bogus_port=
"\n'
+        features +=3D 'EXTRA_IMAGE_FEATURES +=3D "package-management"\n'
+        features +=3D 'PACKAGE_CLASSES =3D "package_deb"\n'
+        # We need  gnupg on the target to install keys
+        features +=3D 'IMAGE_INSTALL:append:pn-core-image-full-cmdline =3D=
 " gnupg"\n'
+
+        bitbake('gnupg-native -c addto_recipe_sysroot')
+
+        # Enable package feed signing
+        self.gpg_home =3D tempfile.mkdtemp(prefix=3D"oeqa-feed-sign-")
+        self.track_for_cleanup(self.gpg_home)
+        signing_key_dir =3D os.path.join(self.testlayer_path, 'files', '=
signing')
+        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --homed=
ir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(signing_=
key_dir, 'key.secret')), native_sysroot=3Dget_bb_var("RECIPE_SYSROOT_NATI=
VE", "gnupg-native"), shell=3DTrue)
+        features +=3D 'INHERIT +=3D "sign_package_feed"\n'
+        features +=3D 'PACKAGE_FEED_GPG_NAME =3D "testuser"\n'
+        features +=3D 'PACKAGE_FEED_GPG_PASSPHRASE_FILE =3D "%s"\n' % os=
.path.join(signing_key_dir, 'key.passphrase')
+        features +=3D 'GPG_PATH =3D "%s"\n' % self.gpg_home
+        features +=3D 'PSEUDO_IGNORE_PATHS .=3D ",%s"\n' % self.gpg_home
+        self.write_config(features)
+
+        # Build core-image-sato and testimage
+        bitbake('core-image-full-cmdline socat')
+        bitbake('-c testimage core-image-full-cmdline')
+
     def test_testimage_virgl_gtk_sdl(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in =
qemu with gtk and SDL frontends
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Thanks for working on this!

Looking at the patches I wondered if this would break testimage and
unfortunately it does:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/5013/steps/12/logs/stdio">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/50/builds/5013/steps/12/logs=
/stdio</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/76/builds/4975">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/76/builds/4975</a>

however hopefully these shouldn't be too hard to fix?

The rest of the build is still running.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I missed it at the time but I believe this is also the cause of:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/80/builds/3352/steps/15/logs/stdio">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/80/builds/3352/steps/15/logs=
/stdio</a>

ERROR: package-index-1.0-r0 do_package_index: GPG exited with code 2: gpg=
: can't connect to the agent: IPC connect call failed
gpg: skipped "testuser": No secret key
gpg: signing failed: No secret key
</pre>
    </blockquote>
    <p>This seems related but not exact the same. <br>
    </p>
    <p>It seems do_package_index wants to generate a signed deb repo but
      no key is provided. But IIUC you have PACKAGE_CLASSES =3D
      "package_rpm", so why is runtime_test.TestImage.test_testimage_apt
      run?<br>
    </p>
    <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
  </body>
</html>

--------------GvIB30t5Ye0j0p6r2glArm79--

