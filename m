Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B28C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 09:35:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.117489.1699522510064546032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 01:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i4SwbkrX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5449560011;
	Thu,  9 Nov 2023 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699522507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OI2UEhYk04NVHJ2HkZegPlCTvp0K06F1MwPwDeaIWjw=;
	b=i4SwbkrXHwxguOT7Y/I/g3EJCee4tnTQOQ9K/27CsGRC1NEWY35It32tXfRNqHc503/+6g
	13zTe5a6L9ZSkrsuz7H8Mb6I0KFrwIqZpy9B5FHOol7squozxgA/5EqAH37IrjbZ2YWUFi
	/xfl2d0XwVbyt2QM9l2NuzETtY5loEOkCuIGAzkttfvPfiwaDUoVGqhSo6WZNPEVuK8OlS
	rdRrV7zUz6lW0ZZzYgQi4/lI6FrW4MUbBDEewaNaBEm8I3T47jxRnlfmhqCg7uWXc+P64d
	zSja6SMtShO1ESDeQ8RtJLuBIlDFJ4Npe2c7CF/7j6zBJtm/UjerBilpNUSwLg==
Date: Thu, 9 Nov 2023 10:35:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: luca fancellu <luca.fancellu@arm.com>
Cc: openembedded-core@lists.openembedded.org, diego.sueiro@arm.com,
	rahul.singh@arm.com
Subject: Re: [OE-core] [PATCH] oeqa,ssh: Handle SSHCall timeout error code
Message-ID: <20231109093506c1313530@mail.local>
References: <20231108112547.3599563-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108112547.3599563-1-luca.fancellu@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 09:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190378

On 08/11/2023 11:25:47+0000, luca fancellu wrote:
> The current code in ssh.py is terminating the ssh process that
> does not finish its computation in a given timeout (when timeout
> is passed), the SSHCall function is returning the process error
> code.
> 
> The Openssl ssh before version 8.6_p1 is returning 0 when it is
> terminated, from commit 8a9520836e71830f4fccca066dba73fea3d16bda
> onwards (version >= 8.6_p1) ssh is returning 255 instead.
> 
> So for version of ssh older than 8.6_p1 when the SSHCall time out,
> the return code will be 0, meaning success, which is wrong.
> 
> Fix this issue checking if the process has timeout (hence it's been
> terminated) and checking if the returned code is 0, in that case
> set it to 255 to advertise that an error occurred.
> 
> Add a test case exercising the timeout in the SSHTest, test_ssh
> test function.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  meta/lib/oeqa/core/target/ssh.py   | 21 ++++++++++++++++++++-
>  meta/lib/oeqa/runtime/cases/ssh.py |  3 +++
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index f22836d390ac..4fe763aaefba 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -224,6 +224,11 @@ class OESSHTarget(OETarget):
>                  remoteDir = os.path.join(remotePath, tmpDir.lstrip("/"))
>                  self.deleteDir(remoteDir)
>  
> +
> +class SSHCallTimeout(Exception):
> +    pass
> +
> +
>  def SSHCall(command, logger, timeout=None, **opts):
>  
>      def run():
> @@ -232,9 +237,9 @@ def SSHCall(command, logger, timeout=None, **opts):
>          output_raw = b''
>          starttime = time.time()
>          process = subprocess.Popen(command, **options)
> +        eof = False
>          if timeout:
>              endtime = starttime + timeout
> -            eof = False
>              os.set_blocking(process.stdout.fileno(), False)
>              while time.time() < endtime and not eof:
>                  try:
> @@ -293,6 +298,11 @@ def SSHCall(command, logger, timeout=None, **opts):
>                      pass
>                  process.wait()
>  
> +        # Process has timed out, raise exception here so that the process at
> +        # this point is already terminated/killed
> +        if not eof:
> +            raise SSHCallTimeout
> +
>      options = {
>          "stdout": subprocess.PIPE,
>          "stderr": subprocess.STDOUT,
> @@ -313,6 +323,15 @@ def SSHCall(command, logger, timeout=None, **opts):
>  
>      try:
>          run()
> +    except SSHCallTimeout:
> +        # Version of openssh before 8.6_p1 returns error code 0 when killed by
> +        # a signal, when the timeout occurs we will receive a 0 error code
> +        # because the process is been terminated and it's wrong because that
> +        # value means success, but the process timed out.
> +        # Afterwards, from version 8.6_p1 onwards, the returned code is 255.
> +        # Fix this behaviour by checking the return code
> +        if process.returncode == 0:
> +            process.returncode = 255

This breaks most of our tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8103/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8054/steps/21/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6037/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8106/steps/15/logs/stdio

and more...

>      except:
>          # Need to guard against a SystemExit or other exception ocurring
>          # whilst running and ensure we don't leave a process behind.
> diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
> index 13aac5439698..cdbef595008c 100644
> --- a/meta/lib/oeqa/runtime/cases/ssh.py
> +++ b/meta/lib/oeqa/runtime/cases/ssh.py
> @@ -13,6 +13,9 @@ class SSHTest(OERuntimeTestCase):
>      @OETestDepends(['ping.PingTest.test_ping'])
>      @OEHasPackage(['dropbear', 'openssh-sshd'])
>      def test_ssh(self):
> +        (status, output) = self.target.run('sleep 20', timeout=2)
> +        msg='run() timed out but return code was zero.'
> +        self.assertNotEqual(status, 0, msg=msg)
>          (status, output) = self.target.run('uname -a')
>          self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
>          (status, output) = self.target.run('cat /etc/controllerimage')
> 
> base-commit: 6806bd23499aa66942c2b6b8fbc52dbec8ff8483
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190319): https://lists.openembedded.org/g/openembedded-core/message/190319
> Mute This Topic: https://lists.openembedded.org/mt/102461629/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

