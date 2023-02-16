Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75201C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 22:31:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.24640.1676586678052207574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 14:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dVw0/JCP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 880B1FF802;
	Thu, 16 Feb 2023 22:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676586675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbRQUgmqlVdZphk2zAL84Cc7zNPwLhXV+e15ARlQ/jY=;
	b=dVw0/JCPox8SehZV/oHKZdy+LPmwD8wNoWolviv2xXmFGlfukfB9qQP32LyR05/R+OZek2
	21Sp+yzzB2FUr4V/hkRumxpayul9uECbJkNlR1qcQmk8lajBSPaHBRWlqgiiDvWNd7cUKR
	t7HMGLZ/S7PQLE1fhNChrnxXd5j0eNgOYwWaO5quEFGw096x6DkbFPlJaungpE49vM0ec7
	nuXdinB2R4DKZ01GN2+tkLSxqwCDz/ZZuoBbl/vB6O4gqWVSm/5tB8qruJStGvWDB7pGDF
	evIo3cwZtbuH4bvR2QE243dLn1W23etWP9i4n10RzzWtejtBI8RK9Wl+s/c0hQ==
Date: Thu, 16 Feb 2023 23:31:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Rannou <lrannou@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, khilman@baylibre.com
Subject: Re: [OE-core] [PATCH 1/2] oeqa/utils/qemurunner: change the serial
 runner usage
Message-ID: <Y+6us8B+8xBZxSBC@mail.local>
References: <20230216095440.1990542-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216095440.1990542-1-lrannou@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177299

I applied just this one, as the other one doesn't apply and most of the
builds failed with an error similar to this one;

2023-02-16 09:14:29,678 - oe-selftest - INFO - ======================================================================
2023-02-16 09:14:29,678 - oe-selftest - INFO - ERROR: overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_original (subunit.RemotedTestCase)
2023-02-16 09:14:29,679 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-02-16 09:14:29,679 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 380, in test_sbin_init_original
    self.run_sbin_init(True)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 415, in run_sbin_init
    status, output = qemu.run_serial("touch " + testFile)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/targetcontrol.py", line 211, in run_serial
    return self.runner.run_serial(command, timeout=timeout)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/qemurunner.py", line 642, in run_serial
    (status, output) = self.run_serial_socket(command, raw, timeout)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/qemurunner.py", line 693, in run_serial_socket
    raise Exception('serial run failed: no result')
Exception: serial run failed: no result



On 16/02/2023 10:54:39+0100, Louis Rannou wrote:
> [YOCTO #15021]
> 
> Create a new runner run_serial_socket which usage matches the traditional ssh
> runner. Its return status is 0 when the command succeeded or 0 when it
> failed. If an error is encountered, it raises an Exception.
> 
> The previous serial runner is maintained and marked as deprecated.
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
>  meta/lib/oeqa/targetcontrol.py    |  3 +++
>  meta/lib/oeqa/utils/qemurunner.py | 42 ++++++++++++++++++++-----------
>  2 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
> index 1fdff82889..99fbcb5879 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -210,6 +210,9 @@ class QemuTarget(BaseTarget):
>      def run_serial(self, command, timeout=60):
>          return self.runner.run_serial(command, timeout=timeout)
>  
> +    def run_serial_socket(self, command, timeout=60):
> +        return self.runner.run_serial_socket(command, timeout=timeout)
> +
>  
>  class SimpleRemoteTarget(BaseTarget):
>  
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index c19164e6e7..c8fffd8fd1 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -618,7 +618,13 @@ class QemuRunner:
>                  return self.qmp.cmd(command)
>  
>      def run_serial(self, command, raw=False, timeout=60):
> +        # Deprecated
>          # Returns (status, output) where status is 1 on success and 0 on error
> +        (status, output) = self.run_serial_socket(command, raw, timeout)
> +        return (0 if status else 1, output)
> +
> +    def run_serial_socket(self, command, raw=False, timeout=60):
> +        # Returns (status, output) where status is 0 on success and a negative value on error.
>  
>          # We assume target system have echo to get command status
>          if not raw:
> @@ -632,7 +638,7 @@ class QemuRunner:
>          while True:
>              now = time.time()
>              if now >= end:
> -                data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
> +                data += "<<< run_serial_socket(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
>                  break
>              try:
>                  sread, _, _ = select.select([self.server_socket],[],[], end - now)
> @@ -650,21 +656,27 @@ class QemuRunner:
>                          return (1, "")
>                      raise Exception("No data on serial console socket, connection closed?")
>  
> -        if data:
> -            if raw:
> -                status = 1
> +        if not data:
> +            self.logger.error("serial run returned no data")
> +            raise subprocess.SubprocessError('serial run failed: no data')
> +
> +        if raw:
> +            status = 0
> +        else:
> +            # Remove first line (command line) and last line (prompt)
> +            data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
> +            index = data.rfind('\r\n')
> +            if index == -1:
> +                data = ""
> +                self.logger.error("serial run returned no result")
> +                raise Exception('serial run failed: no result')
>              else:
> -                # Remove first line (command line) and last line (prompt)
> -                data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
> -                index = data.rfind('\r\n')
> -                if index == -1:
> -                    status_cmd = data
> -                    data = ""
> -                else:
> -                    status_cmd = data[index+2:]
> -                    data = data[:index]
> -                if (status_cmd == "0"):
> -                    status = 1
> +                status_cmd = data[index+2:]
> +                data = data[:index]
> +                try:
> +                    status = int(status_cmd)
> +                except ValueError as e:
> +                    raise Exception('Could not convert to integer: {}'.format(str(e)))
>          return (status, str(data))
>  
>  
> -- 
> 2.39.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177280): https://lists.openembedded.org/g/openembedded-core/message/177280
> Mute This Topic: https://lists.openembedded.org/mt/97002779/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

