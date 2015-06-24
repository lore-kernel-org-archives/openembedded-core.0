Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id DA4CC75ABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 14:22:49 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so22452995qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 07:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OsOWcRf5c69BQS6nkgxHObYV6EwbyKRt9nAB2gZc6UY=;
	b=fng/cbpnA7T5sBnbNnWmPY5R/zgCGY+Hifj3isW6f41hKZq+5j/6nPkgfKOHdV5krL
	zoBRcIEnOvBTFpIpMI48Wkd98swqZeRkrrNNTO2rMPSOV/MsPFAsKbOzxtBecIACamGa
	BsySMXm/z4r5ashM4CHNzBU8IYm7H73/Muj8XW1YSN4voeJj6jdavVkXVtcjAfqXUvw9
	yldFAmv01PRWnJMfgD92zQOmBbWMUo/2w+OTZ32djYKBY1lTHgZr6XqRevChHRjcQXKw
	6DYblq6hxfz+Spq3XQ4QbLEGSOKgpRkcqQWY47M7+VxR2Qiv1sUSuojaw3CXrmrXGKGh
	i3Mw==
X-Gm-Message-State: ALoCoQlyVqQLIwfP1uygp01SBNMZCAjqAf3+myK4PRN2xs+hYJiYNgcIy83B7tafvlm2obo1gVub
X-Received: by 10.140.133.199 with SMTP id 190mr55225693qhf.17.1435155770405; 
	Wed, 24 Jun 2015 07:22:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 24 Jun 2015 07:22:30 -0700 (PDT)
In-Reply-To: <1434965322-16583-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1434965322-16583-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jun 2015 15:22:30 +0100
Message-ID: <CAJTo0LYi=SU2VGzDYW-K=RxuR0r6uc1mH=hPT_iYWxS7D2DFsA@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oeqa/selftest: Added 3 new selftest testcases.
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
X-List-Received-Date: Wed, 24 Jun 2015 14:22:51 -0000
Content-Type: multipart/alternative; boundary=001a11353390e48def0519443dd4

--001a11353390e48def0519443dd4
Content-Type: text/plain; charset=UTF-8

Instead of expecting a future developer to read the patch to see what
happened, please explain what the new test cases are in the commit log.

Ross

On 22 June 2015 at 10:28, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> ---
>  meta/lib/oeqa/selftest/imagefeatures.py | 206
> ++++++++++++++++++++++++++++++++
>  1 file changed, 206 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/imagefeatures.py
>
> diff --git a/meta/lib/oeqa/selftest/imagefeatures.py
> b/meta/lib/oeqa/selftest/imagefeatures.py
> new file mode 100644
> index 0000000..f697956
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/imagefeatures.py
> @@ -0,0 +1,206 @@
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.commands import runCmd, bitbake
> +from oeqa.utils.decorators import testcase
> +import pexpect
> +from os.path import expanduser
> +from os import system
> +
> +class ImageFeatures(oeSelfTest):
> +
> +    @testcase(1107)
> +    def test_non_root_user_can_connect_via_ssh_without_password(self):
> +        """
> +        Summary: Check if non root user can connect via ssh without
> password
> +        Expected: 1. Connection to the image via ssh using root user
> without providing a password should be allowed.
> +                  2. Connection to the image via ssh using tester user
> without providing a password should be allowed.
> +        Product: oe-core
> +        Author: Ionut Chisanovici <ionutx.chisanovici@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +
> +        test_user = 'tester'
> +        root_user = 'root'
> +        prompt = r'qemux86:\S+[$#]\s+'
> +        tap_inf_ip = '192.168.7.2'
> +
> +        features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh
> empty-root-password"\n'
> +        features += 'INHERIT += "extrausers"\n'
> +        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s
> /bin/sh {};"'.format(test_user, test_user)
> +
> +        # Append 'features' to local.conf
> +        self.append_config(features)
> +
> +        # Build a core-image-minimal
> +        ret = bitbake('core-image-minimal')
> +        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal')
> +
> +        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R
> {}'.format(expanduser('~'), tap_inf_ip)
> +        # Delete the ssh keys for 192.168.7.2 (qemu)
> +        ret = runCmd(rm_ssh_keys_cmd)
> +        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for
> qemu host.')
> +
> +        # Boot qemu image
> +        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
> +        try:
> +            proc_qemu.expect('qemux86 login:', timeout=100)
> +        except:
> +            system('pkill qemu')
> +            proc_qemu.close()
> +            self.fail('Failed to start qemu.')
> +
> +        # Attempt to ssh with each user into qemu with empty password
> +        for user in [root_user, test_user]:
> +            proc_ssh = pexpect.spawn('ssh {} -l {}'.format(tap_inf_ip,
> user))
> +            index = proc_ssh.expect(['Are you sure you want to continue
> connecting', prompt, pexpect.TIMEOUT, pexpect.EOF])
> +            if index == 0:
> +                proc_ssh.sendline('yes')
> +                try:
> +                    proc_ssh.expect(prompt)
> +                except:
> +                    system('pkill qemu')
> +                    proc_qemu.close()
> +                    proc_ssh.terminate()
> +                    self.fail('Failed to ssh with {} user into
> qemu.'.format(user))
> +            elif index == 1:
> +                # user successfully logged in with empty password
> +                pass
> +            elif index == 2:
> +                system('pkill qemu')
> +                proc_qemu.close()
> +                proc_ssh.terminate()
> +                self.fail('Failed to ssh with {} user into qemu
> (timeout).'.format(user))
> +            else:
> +                system('pkill qemu')
> +                proc_qemu.close()
> +                proc_ssh.terminate()
> +                self.fail('Failed to ssh with {} user into qemu
> (eof).'.format(user))
> +
> +        # Cleanup
> +        system('pkill qemu')
> +        proc_qemu.close()
> +        proc_ssh.terminate()
> +        ret = runCmd(rm_ssh_keys_cmd)
> +        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for
> qemu host (at cleanup).')
> +
> +    @testcase(1115)
> +    def test_all_users_can_connect_via_ssh_without_password(self):
> +        """
> +        Summary:     Check if all users can connect via ssh without
> password
> +        Expected:    1. Connection to the image via ssh using root or
> tester user without providing a password should be allowed.
> +        Product:     oe-core
> +        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +        test_user = 'tester'
> +        root_user = 'root'
> +        prompt = r'qemux86:\S+[$#]\s+'
> +        tap_inf_ip = '192.168.7.2'
> +
> +        features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh
> allow-empty-password"\n'
> +        features += 'INHERIT += "extrausers"\n'
> +        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s
> /bin/sh {};"'.format(test_user, test_user)
> +
> +        # Append 'features' to local.conf
> +        self.append_config(features)
> +
> +        # Build a core-image-minimal
> +        ret = bitbake('core-image-minimal')
> +        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal')
> +
> +        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R
> {}'.format(expanduser('~'), tap_inf_ip)
> +        # Delete the ssh keys for 192.168.7.2 (qemu)
> +        ret = runCmd(rm_ssh_keys_cmd)
> +        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for
> qemu host.')
> +
> +        # Boot qemu image
> +        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
> +        try:
> +            proc_qemu.expect('qemux86 login:', timeout=100)
> +        except:
> +            system('pkill qemu')
> +            proc_qemu.close()
> +            self.fail('Failed to start qemu.')
> +
> +        # Attempt to ssh with each user into qemu with empty password
> +        for user in [root_user, test_user]:
> +            proc_ssh = pexpect.spawn('ssh {} -l {}'.format(tap_inf_ip,
> user))
> +            index = proc_ssh.expect(['Are you sure you want to continue
> connecting', prompt, pexpect.TIMEOUT, pexpect.EOF])
> +            if index == 0:
> +                proc_ssh.sendline('yes')
> +                try:
> +                    proc_ssh.expect(prompt)
> +                except:
> +                    system('pkill qemu')
> +                    proc_qemu.close()
> +                    proc_ssh.terminate()
> +                    self.fail('Failed to ssh with {} user into
> qemu.'.format(user))
> +            elif index == 1:
> +                # user successfully logged in with empty password
> +                pass
> +            elif index == 2:
> +                system('pkill qemu')
> +                proc_qemu.close()
> +                proc_ssh.terminate()
> +                self.fail('Failed to ssh with {} user into qemu
> (timeout).'.format(user))
> +            else:
> +                system('pkill qemu')
> +                proc_qemu.close()
> +                proc_ssh.terminate()
> +                self.fail('Failed to ssh with {} user into qemu
> (eof).'.format(user))
> +
> +        # Cleanup
> +        system('pkill qemu')
> +        proc_qemu.close()
> +        proc_ssh.terminate()
> +        ret = runCmd(rm_ssh_keys_cmd)
> +        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for
> qemu host (at cleanup).')
> +
> +    @testcase(1114)
> +    def test_rpm_version_4_support_on_image(self):
> +        """
> +        Summary:     Check rpm version 4 support on image
> +        Expected:    Rpm version must be 4.11.2
> +        Product:     oe-core
> +        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +
> +        root_user = 'root'
> +        prompt = '{}@qemux86:~# '.format(root_user)
> +        rpm_version = '4.11.2'
> +        features = 'IMAGE_INSTALL_append = " rpm"\n'
> +        features += 'PREFERRED_VERSION_rpm = "{}"\n'.format(rpm_version)
> +        features += 'PREFERRED_VERSION_rpm-native =
> "{}"\n'.format(rpm_version)
> +        features += 'RPMROOTFSDEPENDS_remove =
> "rpmresolve-native:do_populate_sysroot"'
> +
> +        # Append 'features' to local.conf
> +        self.append_config(features)
> +
> +        # Build a core-image-minimal
> +        ret = bitbake('core-image-minimal')
> +        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal')
> +
> +        # Boot qemu image & get rpm version
> +        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
> +        try:
> +            proc_qemu.expect('qemux86 login:', timeout=100)
> +            proc_qemu.sendline(root_user)
> +            proc_qemu.expect(prompt)
> +            proc_qemu.sendline('rpm --version')
> +            proc_qemu.expect(prompt)
> +        except:
> +            system('pkill qemu')
> +            proc_qemu.close()
> +            self.fail('Failed to boot qemu.')
> +
> +        found_rpm_version = proc_qemu.before
> +
> +        # Make sure the retrieved rpm version is the expected one
> +        if rpm_version not in found_rpm_version:
> +            system('pkill qemu')
> +            proc_qemu.close()
> +            self.fail('RPM version is not {}, found instead
> {}.'.format(rpm_version, found_rpm_version))
> +
> +        # Cleanup (close qemu)
> +        system('pkill qemu')
> +        proc_qemu.close()
> \ No newline at end of file
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11353390e48def0519443dd4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Instead of expecting a future developer to read the patch =
to see what happened, please explain what the new test cases are in the com=
mit log.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 22 June 2015 at 10:28, Daniel Istrate <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:daniel.alexandrux.istrate@intel.com" targe=
t=3D"_blank">daniel.alexandrux.istrate@intel.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Signed-off-by: Daniel Istrate &lt;<a href=3D"=
mailto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@intel=
.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/imagefeatures.py | 206 +++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 206 insertions(+)<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/imagefeatures.py<br>
<br>
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selfte=
st/imagefeatures.py<br>
new file mode 100644<br>
index 0000000..f697956<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/imagefeatures.py<br>
@@ -0,0 +1,206 @@<br>
+from oeqa.selftest.base import oeSelfTest<br>
+from oeqa.utils.commands import runCmd, bitbake<br>
+from oeqa.utils.decorators import testcase<br>
+import pexpect<br>
+from os.path import expanduser<br>
+from os import system<br>
+<br>
+class ImageFeatures(oeSelfTest):<br>
+<br>
+=C2=A0 =C2=A0 @testcase(1107)<br>
+=C2=A0 =C2=A0 def test_non_root_user_can_connect_via_ssh_without_password(=
self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary: Check if non root user can connect vi=
a ssh without password<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected: 1. Connection to the image via ssh u=
sing root user without providing a password should be allowed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. Connecti=
on to the image via ssh using tester user without providing a password shou=
ld be allowed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product: oe-core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author: Ionut Chisanovici &lt;<a href=3D"mailt=
o:ionutx.chisanovici@intel.com">ionutx.chisanovici@intel.com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AutomatedBy: Daniel Istrate &lt;<a href=3D"mai=
lto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@intel.co=
m</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_user =3D &#39;tester&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_user =3D &#39;root&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prompt =3D r&#39;qemux86:\S+[$#]\s+&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_inf_ip =3D &#39;192.168.7.2&#39;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;EXTRA_IMAGE_FEATURES +=3D &q=
uot;ssh-server-openssh empty-root-password&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;INHERIT +=3D &quot;extrause=
rs&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;EXTRA_USERS_PARAMS =3D &quo=
t;useradd -p \&#39;\&#39; {}; usermod -s /bin/sh {};&quot;&#39;.format(test=
_user, test_user)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Append &#39;features&#39; to local.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(features)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build a core-image-minimal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bitbake(&#39;core-image-minimal&#39;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 build a core-image-minimal&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_ssh_keys_cmd =3D &#39;ssh-keygen -f &quot;{=
}/.ssh/known_hosts&quot; -R {}&#39;.format(expanduser(&#39;~&#39;), tap_inf=
_ip)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Delete the ssh keys for 192.168.7.2 (qemu)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(rm_ssh_keys_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 delete ssh keys for qemu host.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Boot qemu image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu =3D pexpect.spawn(&#39;runqemu qemux=
86 nographic&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.expect(&#39;qemux86 lo=
gin:&#39;, timeout=3D100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Failed to start q=
emu.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Attempt to ssh with each user into qemu with=
 empty password<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for user in [root_user, test_user]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh =3D pexpect.spawn(&#39;=
ssh {} -l {}&#39;.format(tap_inf_ip, user))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D proc_ssh.expect([&#39;=
Are you sure you want to continue connecting&#39;, prompt, pexpect.TIMEOUT,=
 pexpect.EOF])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if index =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.sendline(=
&#39;yes&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=
_ssh.expect(prompt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syst=
em(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=
_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=
_ssh.terminate()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.fail(&#39;Failed to ssh with {} user into qemu.&#39;.format(user))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif index =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # user successfull=
y logged in with empty password<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif index =3D=3D 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill =
qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.terminate=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Fai=
led to ssh with {} user into qemu (timeout).&#39;.format(user))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill =
qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.terminate=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Fai=
led to ssh with {} user into qemu (eof).&#39;.format(user))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cleanup<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.terminate()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(rm_ssh_keys_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 delete ssh keys for qemu host (at cleanup).&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @testcase(1115)<br>
+=C2=A0 =C2=A0 def test_all_users_can_connect_via_ssh_without_password(self=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 =C2=A0Check if all users=
 can connect via ssh without password<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 1. Connection to the im=
age via ssh using root or tester user without providing a password should b=
e allowed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 =C2=A0oe-core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0 Ionut Chisanovici =
&lt;<a href=3D"mailto:ionutx.chisanovici@intel.com">ionutx.chisanovici@inte=
l.com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AutomatedBy: Daniel Istrate &lt;<a href=3D"mai=
lto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@intel.co=
m</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_user =3D &#39;tester&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_user =3D &#39;root&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prompt =3D r&#39;qemux86:\S+[$#]\s+&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_inf_ip =3D &#39;192.168.7.2&#39;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;EXTRA_IMAGE_FEATURES +=3D &q=
uot;ssh-server-openssh allow-empty-password&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;INHERIT +=3D &quot;extrause=
rs&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;EXTRA_USERS_PARAMS =3D &quo=
t;useradd -p \&#39;\&#39; {}; usermod -s /bin/sh {};&quot;&#39;.format(test=
_user, test_user)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Append &#39;features&#39; to local.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(features)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build a core-image-minimal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bitbake(&#39;core-image-minimal&#39;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 build a core-image-minimal&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_ssh_keys_cmd =3D &#39;ssh-keygen -f &quot;{=
}/.ssh/known_hosts&quot; -R {}&#39;.format(expanduser(&#39;~&#39;), tap_inf=
_ip)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Delete the ssh keys for 192.168.7.2 (qemu)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(rm_ssh_keys_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 delete ssh keys for qemu host.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Boot qemu image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu =3D pexpect.spawn(&#39;runqemu qemux=
86 nographic&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.expect(&#39;qemux86 lo=
gin:&#39;, timeout=3D100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Failed to start q=
emu.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Attempt to ssh with each user into qemu with=
 empty password<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for user in [root_user, test_user]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh =3D pexpect.spawn(&#39;=
ssh {} -l {}&#39;.format(tap_inf_ip, user))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D proc_ssh.expect([&#39;=
Are you sure you want to continue connecting&#39;, prompt, pexpect.TIMEOUT,=
 pexpect.EOF])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if index =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.sendline(=
&#39;yes&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=
_ssh.expect(prompt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syst=
em(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=
_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=
_ssh.terminate()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.fail(&#39;Failed to ssh with {} user into qemu.&#39;.format(user))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif index =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # user successfull=
y logged in with empty password<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif index =3D=3D 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill =
qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.terminate=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Fai=
led to ssh with {} user into qemu (timeout).&#39;.format(user))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill =
qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.terminate=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Fai=
led to ssh with {} user into qemu (eof).&#39;.format(user))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cleanup<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_ssh.terminate()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(rm_ssh_keys_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 delete ssh keys for qemu host (at cleanup).&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @testcase(1114)<br>
+=C2=A0 =C2=A0 def test_rpm_version_4_support_on_image(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 =C2=A0Check rpm version =
4 support on image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 Rpm version must be 4.1=
1.2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 =C2=A0oe-core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0 Ionut Chisanovici =
&lt;<a href=3D"mailto:ionutx.chisanovici@intel.com">ionutx.chisanovici@inte=
l.com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AutomatedBy: Daniel Istrate &lt;<a href=3D"mai=
lto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@intel.co=
m</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_user =3D &#39;root&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prompt =3D &#39;{}@qemux86:~# &#39;.format(roo=
t_user)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_version =3D &#39;4.11.2&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;IMAGE_INSTALL_append =3D &qu=
ot; rpm&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;PREFERRED_VERSION_rpm =3D &=
quot;{}&quot;\n&#39;.format(rpm_version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;PREFERRED_VERSION_rpm-nativ=
e =3D &quot;{}&quot;\n&#39;.format(rpm_version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;RPMROOTFSDEPENDS_remove =3D=
 &quot;rpmresolve-native:do_populate_sysroot&quot;&#39;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Append &#39;features&#39; to local.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(features)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build a core-image-minimal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bitbake(&#39;core-image-minimal&#39;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, ret.status, &#39;Failed to=
 build a core-image-minimal&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Boot qemu image &amp; get rpm version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu =3D pexpect.spawn(&#39;runqemu qemux=
86 nographic&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.expect(&#39;qemux86 lo=
gin:&#39;, timeout=3D100)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.sendline(root_user)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.expect(prompt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.sendline(&#39;rpm --ve=
rsion&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.expect(prompt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;Failed to boot qe=
mu.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 found_rpm_version =3D proc_qemu.before<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make sure the retrieved rpm version is the e=
xpected one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rpm_version not in found_rpm_version:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;RPM version is no=
t {}, found instead {}.&#39;.format(rpm_version, found_rpm_version))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cleanup (close qemu)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 system(&#39;pkill qemu&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc_qemu.close()<br>
\ No newline at end of file<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11353390e48def0519443dd4--
