Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03420C4708B
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web12.7878.1649172233912303124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 08:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 16F1C24096;
	Tue,  5 Apr 2022 17:23:52 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------RIwhK037tqn5zL7NryrGKrMH"
Message-ID: <9c8771c5-1b2a-0d6f-0658-ba08dd9ad5fa@gmail.com>
Date: Tue, 5 Apr 2022 17:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] apt: add apt selftest to test signed package feeds
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>,
 Alexander Kanavin <alex@linutronix.de>, Ferry Toth <ftoth@exalondelft.nl>
References: <20220403195046.7060-1-fntoth@gmail.com>
 <20220403195046.7060-5-fntoth@gmail.com>
 <694f4b0519a5365015c7eb561767b27f3a07e975.camel@linuxfoundation.org>
 <369e2108-34a9-dbfc-eb09-817a1eee4604@gmail.com>
 <add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164046

This is a multi-part message in MIME format.
--------------RIwhK037tqn5zL7NryrGKrMH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Op 04-04-2022 om 22:39 schreef Richard Purdie:
> On Mon, 2022-04-04 at 19:35 +0200, Ferry Toth wrote:
>> Hi,
>>
>> Op 04-04-2022 om 15:58 schreef Richard Purdie:
>>> On Sun, 2022-04-03 at 21:50 +0200, Ferry Toth wrote:
>>>> From: Ferry Toth<ftoth@exalondelft.nl>
>>>>
>>>> Since Gatesgarth apt (1.8.2) has become more strict and doesn=E2=80=99=
t allow unsigned repositories by default.
>>>> Currently when building images this requirement is worked around by =
using [allow-insecure=3Dyes] and
>>>> equivalently when performing selftest.
>>>>
>>>> Patches "gpg-sign: Add parameters to gpg signature function" and "pa=
ckage_manager: sign DEB package feeds"
>>>> enable signed DEB package feeds. This patch adds a runtime test for =
apt derived from the test_testimage_dnf
>>>> test. It creates a signed deb package feed, runs a qemu image to ins=
tall the key and performs some package
>>>> management. To be able to install the key the gnupg package is added=
 to the testimage.
>>>>
>>>> Signed-off-by: Ferry Toth<ftoth@exalondelft.nl>
>>>> ---
>>>>    meta/lib/oeqa/runtime/cases/apt.py           | 16 ++++++---
>>>>    meta/lib/oeqa/selftest/cases/runtime_test.py | 38 +++++++++++++++=
+++++
>>>>    2 files changed, 49 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runt=
ime/cases/apt.py
>>>> index 53745df93f..49f8714730 100644
>>>> --- a/meta/lib/oeqa/runtime/cases/apt.py
>>>> +++ b/meta/lib/oeqa/runtime/cases/apt.py
>>>> @@ -21,7 +21,7 @@ class AptRepoTest(AptTest):
>>>>   =20
>>>>        @classmethod
>>>>        def setUpClass(cls):
>>>> -        service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], =
'all')
>>>> +        service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], =
'')
>>>>            cls.repo_server =3D HTTPService(service_repo,
>>>>                                          '0.0.0.0', port=3Dcls.tc.ta=
rget.server_port,
>>>>                                          logger=3Dcls.tc.logger)
>>>> @@ -32,13 +32,18 @@ class AptRepoTest(AptTest):
>>>>            cls.repo_server.stop()
>>>>   =20
>>>>        def setup_source_config_for_package_install(self):
>>>> -        apt_get_source_server =3D 'http://%s:%s/' % (self.tc.target=
.server_ip, self.repo_server.port)
>>>> +        apt_get_source_server =3D 'http:\/\/%s:%s' % (self.tc.targe=
t.server_ip, self.repo_server.port)
>>>>            apt_get_sourceslist_dir =3D '/etc/apt/'
>>>> -        self.target.run('cd %s; echo deb [ allow-insecure=3Dyes ] %=
s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
>>>> +        self.target.run("cd %s; cp sources.list sources.list.bak; s=
ed -i 's/\[trusted=3Dyes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.lis=
t" % (apt_get_sourceslist_dir, apt_get_source_server))
>>>>   =20
>>>>        def cleanup_source_config_for_package_install(self):
>>>>            apt_get_sourceslist_dir =3D '/etc/apt/'
>>>> -        self.target.run('cd %s; rm sources.list' % (apt_get_sources=
list_dir))
>>>> +        self.target.run('cd %s; mv sources.list.bak sources.list' %=
 (apt_get_sourceslist_dir))
>>>> +
>>>> +    def setup_key(self):
>>>> +        # the key is found on the target /etc/pki/packagefeed-gpg/
>>>> +        # named PACKAGEFEED-GPG-KEY-poky-branch
>>>> +        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packag=
efeed-gpg'))
>>>>   =20
>>>>        @skipIfNotFeature('package-management',
>>>>                          'Test requires package-management to be in =
IMAGE_FEATURES')
>>>> @@ -47,7 +52,8 @@ class AptRepoTest(AptTest):
>>>>        @OEHasPackage(['apt'])
>>>>        def test_apt_install_from_repo(self):
>>>>            self.setup_source_config_for_package_install()
>>>> +        self.setup_key()
>>>>            self.pkg('update')
>>>>            self.pkg('remove --yes run-postinsts-dev')
>>>> -        self.pkg('install --yes --allow-unauthenticated run-postins=
ts-dev')
>>>> +        self.pkg('install --yes run-postinsts-dev')
>>>>            self.cleanup_source_config_for_package_install()
>>>> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib=
/oeqa/selftest/cases/runtime_test.py
>>>> index 642f0eb637..7a75b95a99 100644
>>>> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
>>>> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
>>>> @@ -162,6 +162,44 @@ class TestImage(OESelftestTestCase):
>>>>            bitbake('core-image-full-cmdline socat')
>>>>            bitbake('-c testimage core-image-full-cmdline')
>>>>   =20
>>>> +    def test_testimage_apt(self):
>>>> +        """
>>>> +        Summary: Check package feeds functionality for apt
>>>> +        Expected: 1. Check that remote package feeds can be accesse=
d
>>>> +        Product: oe-core
>>>> +        Author: Ferry Toth<fntoth@gmail.com>
>>>> +        """
>>>> +        if get_bb_var('DISTRO') =3D=3D 'poky-tiny':
>>>> +            self.skipTest('core-image-full-cmdline not buildable fo=
r poky-tiny')
>>>> +
>>>> +        features =3D 'INHERIT +=3D "testimage"\n'
>>>> +        features +=3D 'TEST_SUITES =3D "ping ssh apt.AptRepoTest.te=
st_apt_install_from_repo"\n'
>>>> +        # We don't yet know what the server ip and port will be - t=
hey will be patched
>>>> +        # in at the start of the on-image test
>>>> +        features +=3D 'PACKAGE_FEED_URIS =3D "http://bogus_ip:bogus=
_port"\n'
>>>> +        features +=3D 'EXTRA_IMAGE_FEATURES +=3D "package-managemen=
t"\n'
>>>> +        features +=3D 'PACKAGE_CLASSES =3D "package_deb"\n'
>>>> +        # We need  gnupg on the target to install keys
>>>> +        features +=3D 'IMAGE_INSTALL:append:pn-core-image-full-cmdl=
ine =3D " gnupg"\n'
>>>> +
>>>> +        bitbake('gnupg-native -c addto_recipe_sysroot')
>>>> +
>>>> +        # Enable package feed signing
>>>> +        self.gpg_home =3D tempfile.mkdtemp(prefix=3D"oeqa-feed-sign=
-")
>>>> +        self.track_for_cleanup(self.gpg_home)
>>>> +        signing_key_dir =3D os.path.join(self.testlayer_path, 'file=
s', 'signing')
>>>> +        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --=
homedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(sig=
ning_key_dir, 'key.secret')), native_sysroot=3Dget_bb_var("RECIPE_SYSROOT=
_NATIVE", "gnupg-native"), shell=3DTrue)
>>>> +        features +=3D 'INHERIT +=3D "sign_package_feed"\n'
>>>> +        features +=3D 'PACKAGE_FEED_GPG_NAME =3D "testuser"\n'
>>>> +        features +=3D 'PACKAGE_FEED_GPG_PASSPHRASE_FILE =3D "%s"\n'=
 % os.path.join(signing_key_dir, 'key.passphrase')
>>>> +        features +=3D 'GPG_PATH =3D "%s"\n' % self.gpg_home
>>>> +        features +=3D 'PSEUDO_IGNORE_PATHS .=3D ",%s"\n' % self.gpg=
_home
>>>> +        self.write_config(features)
>>>> +
>>>> +        # Build core-image-sato and testimage
>>>> +        bitbake('core-image-full-cmdline socat')
>>>> +        bitbake('-c testimage core-image-full-cmdline')
>>>> +
>>>>        def test_testimage_virgl_gtk_sdl(self):
>>>>            """
>>>>            Summary: Check host-assisted accelerate OpenGL functional=
ity in qemu with gtk and SDL frontends
>>> Thanks for working on this!
>>>
>>> Looking at the patches I wondered if this would break testimage and
>>> unfortunately it does:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/501=
3/steps/12/logs/stdio
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/497=
5
>> That is weird, do I understand correctly that it fails on:
>>    apt-get remove --yes run-postinsts-dev
>> Reading package lists...
>> Building dependency tree...
>> E: Unable to locate package run-postinsts-dev
>>
>> That is actually *) one line I didn't touch. I did note while testing
>> that I saw this exact message, however that was not counted as a fail.
>>
>> What could cause this? Because the complaint is it can't remove the
>> package because it was not installed.
>>
>> It would be trivial to remove the line
>>
>> *) self.pkg('remove --yes run-postinsts-dev')
>>
>> but how could it have passed the test before?
>
> I think the issue is you edited testimage which is a different set of t=
ests
> which aren't just called by oe-selftest but by things like

That would be my first thought too, but...

because the failure seems to be on the line self.pkg('remove --yes=20
run-postinsts-dev'),=C2=A0 that would mean the line self.pkg('update') pa=
ssed.

And that should only pass if it finds a signed repository and has the=20
key installed (and believe me, I saw a log of that in the last week).

So, there may be a second thing wrong?

Do you know where I can find the log files referred to:

<..>tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/temp/log.do_testim=
age.35553

<..>tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0-r0/temp/log.do_te=
stimage.35362

or could we do a 'quick' check by changing

         self.pkg('update')
         self.pkg('remove --yes run-postinsts-dev')
         self.pkg('install --yes run-postinsts-dev')
to
         self.pkg('update')
         self.pkg('install --yes run-postinsts-dev')
         self.pkg('remove --yes run-postinsts-dev')
?

>
> "bitbake core-image-sato -c testimage"
>
> as well. I'd suggest making the changes in testimage conditional on sig=
ning
> being configured.

Yes, regardless the above, we need to either make signing always enabled=20
in all test cases or detect whether signing is used.

Do you have a hint if there is a variable to test in class AptRepoTest=20
if PACKAGE_FEED_GPG_NAME has been set?

Otherwise I could just duplicate code and create=20
apt.AptRepoTest.test_apt_install_from_repo_signed.

What would you prefer?

> Cheers,
>
> Richard
>
>
--------------RIwhK037tqn5zL7NryrGKrMH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Noto Sans">Hi,</font><br>
    </p>
    <div class=3D"moz-cite-prefix">Op 04-04-2022 om 22:39 schreef Richard
      Purdie:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 2022-04-04 at 19:35 =
+0200, Ferry Toth wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

Op 04-04-2022 om 15:58 schreef Richard Purdie:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Sun, 2022-04-03 at 21=
:50 +0200, Ferry Toth wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">From: Ferry Toth <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:ftoth@exalondelft.nl">&lt;ft=
oth@exalondelft.nl&gt;</a>

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
                                        '0.0.0.0', port=3Dcls.tc.target.s=
erver_port,
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
                        'Test requires package-management to be in IMAGE_=
FEATURES')
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
          Summary: Check host-assisted accelerate OpenGL functionality in=
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
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
That is weird, do I understand correctly that it fails on:
  apt-get remove --yes run-postinsts-dev
Reading package lists...
Building dependency tree...
E: Unable to locate package run-postinsts-dev

That is actually *) one line I didn't touch. I did note while testing=20
that I saw this exact message, however that was not counted as a fail.

What could cause this? Because the complaint is it can't remove the=20
package because it was not installed.

It would be trivial to remove the line

*) self.pkg('remove --yes run-postinsts-dev')

but how could it have passed the test before?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

I think the issue is you edited testimage which is a different set of tes=
ts
which aren't just called by oe-selftest but by things like=C2=A0</pre>
    </blockquote>
    <p>That would be my first thought too, but...</p>
    <p>because the failure seems to be on the line self.pkg('remove
      --yes run-postinsts-dev'),=C2=A0 that would mean the line
      self.pkg('update') passed.</p>
    <p>And that should only pass if it finds a signed repository and has
      the key installed (and believe me, I saw a log of that in the last
      week).</p>
    <p>So, there may be a second thing wrong?</p>
    <p>Do you know where I can find the log files referred to:</p>
    <p>&lt;..&gt;tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/temp/=
log.do_testimage.35553</p>
    <p>&lt;..&gt;tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0-r0/t=
emp/log.do_testimage.35362</p>
    <p>or could we do a 'quick' check by changing</p>
    <pre class=3D"moz-quote-pre" wrap=3D"">        self.pkg('update')
        self.pkg('remove --yes run-postinsts-dev')
        self.pkg('install --yes run-postinsts-dev')
to=20
        self.pkg('update')
        self.pkg('install --yes run-postinsts-dev')
        self.pkg('remove --yes run-postinsts-dev')
?
</pre>
    <blockquote type=3D"cite"
cite=3D"mid:add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">

"bitbake core-image-sato -c testimage"

as well. I'd suggest making the changes in testimage conditional on signi=
ng
being configured.
</pre>
    </blockquote>
    <p>Yes, regardless the above, we need to either make signing always
      enabled in all test cases or detect whether signing is used.</p>
    <p>Do you have a hint if there is a variable to test in class
      AptRepoTest if PACKAGE_FEED_GPG_NAME has been set?</p>
    <p>Otherwise I could just duplicate code and create
      apt.AptRepoTest.test_apt_install_from_repo_signed.</p>
    <p>What would you prefer?<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Cheers,

Richard


</pre>
    </blockquote>
  </body>
</html>

--------------RIwhK037tqn5zL7NryrGKrMH--

