Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426C5F01828
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 11:47:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67336.1772797659451481389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 03:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Kw/gWNlj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8F3D21A2D2D
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 11:47:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 651925FF92;
	Fri,  6 Mar 2026 11:47:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02BEC10369925;
	Fri,  6 Mar 2026 12:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772797657; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IDBtbrX+d+LOT29+K8l3ImVqvHz9Nxw67XP+GjETNCk=;
	b=Kw/gWNljVRZ+sX0HKkSZewzYuvpMInUaydTpEGXFFe5DlH+aTEnNM/qfEFbVuCgmmVVzHJ
	MUUXIhsOKe2MxXCrXbrkWNkTkIC15/WY8HK+LtHJpt6IlVusW7XSBkabADgd5/xvE8mOJQ
	AyqNgOj/cDpUCthu6OJqymT7nghyjdNm10cBXTUviHkXImg8JXVHhhUDWFbQ3b76bbQjeb
	o/Y+2O+s0UAbOrkgh0fK6BJ3A+pytcO/UWjrQ+1OmRVghCSdyfyLu3oTm8Xb9mjNko1GaU
	jpCB2VFYXHXYT53BUtaMRCDIFxhTzBB5oLve6XjOhgzXGC1Ej8em9mmaCeK0VA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 12:47:35 +0100
Message-Id: <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/runtime/ptest: Use a timeout with
 command, remove disabling
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 11:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232564

On Wed Mar 4, 2026 at 7:41 PM CET, Richard Purdie via lists.openembedded.or=
g wrote:
> A simple 'which' call doesn't need the timeout disabling. This was likely
> a copy and paste error and can be removed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime=
/cases/ptest.py
> index 1a0782374d0..2887e136719 100644
> --- a/meta/lib/oeqa/runtime/cases/ptest.py
> +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> @@ -35,7 +35,7 @@ class PtestRunnerTest(OERuntimeTestCase):
>          self.do_ptestrunner()
> =20
>      def do_ptestrunner(self):
> -        status, output =3D self.target.run('which ptest-runner', 0)
> +        status, output =3D self.target.run('which ptest-runner')
>          if status !=3D 0:
>              self.skipTest("No -ptest packages are installed in the image=
")
> =20

Hi Richard,

I believe this is causing some ptest failures on riscv64:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunn=
er_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 63, in do_ptestrunner
    status, output =3D self.target.run('ptest-runner -t {} -d \"{}\"'.forma=
t(ptest_timeout, ' '.join(ptest_dirs)), timeout=3Dint(ptest_timeout)+30)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/target/ssh.py", line 98, in run
    status, output =3D self._run(sshCmd, processTimeout, ignore_status, raw=
, ignore_ssh_fails)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/target/ssh.py", line 70, in _run
    raise AssertionError("ssh exited with status '255' for command "
AssertionError: ssh exited with status '255' for command '['ssh', '-l', 'ro=
ot', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '-o=
', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', '-=
o', 'LogLevel=3DERROR', '192.168.7.14', 'export PATH=3D/usr/sbin:/sbin:/usr=
/bin:/bin; ptest-runner -t 450 -d "/usr/lib"']': this is likely an SSH fail=
ure

Process killed - no output for 480 seconds. Total running time: 485 seconds=
.

Cannot run ptests without @expectedFailure as ptests are expected to fail
WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve artifa=
cts from test target: Error while fetching compressed artifacts

And similar errors:

WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not retrieve a=
rtifacts from test target: Error while fetching compressed artifacts
Cannot run ptests without @expectedFailure as ptests are expected to fail

WARNING: core-image-ptest-gettext-1.0-r0 do_testimage: Can not retrieve art=
ifacts from test target: Error while fetching compressed artifacts
Cannot run ptests without @expectedFailure as ptests are expected to fail

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1182

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


