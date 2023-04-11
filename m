Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17E0C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 12:28:31 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.12144.1681216104501566223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 05:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PPzOY+ut;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEC46100011;
	Tue, 11 Apr 2023 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681216101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEKqGXCItX7dRG5LNOiUmXTvXF83jb08FQ8co+ZDKJA=;
	b=PPzOY+utXxaXIEXatmUzG0bFFMSYzEoHKlYaDAHRxxIq+eHVEN8RB+BwKt9VqfvHag1CTS
	JgXfh/42yooTJUNBVpGbMg7zqYjiMpOjGqu9nY7T2T1jQkQKGZlNctmnjO1oUrwpkuHkIW
	xk7JgzTXtuEp7OvV6Y5rI3j9GntzWAwufsE0U7XO0Gsj17zr8F4csiEf7SxihZ/SffGnz/
	4ezDlS1WZRsP6Ta48bfFIZ+NNTTNzLGyrT1YAoy3RxBZodx8vukZlxp+UNf/sLt56SWbIs
	q5uhFKQXGXaSLGPRpsD259JKM6mRwO9ZPEzSYxAgC3OTmjE9L2hX8K7Vg/i9ZQ==
Date: Tue, 11 Apr 2023 14:28:19 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Martin Jansa" <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa: print stderr in the AssertionError
 as well
Message-ID: <20230411142819.0f58a868@booty>
In-Reply-To: <20230411090348.2434686-3-Martin.Jansa@gmail.com>
References: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
	<20230411090348.2434686-3-Martin.Jansa@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 12:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179918

Hello Martin,

On Tue, 11 Apr 2023 11:03:48 +0200
"Martin Jansa" <Martin.Jansa@gmail.com> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oeqa/utils/commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
> index c1f533802e..7b2f6ec124 100644
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -209,7 +209,7 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
>                  exc_output = "\n... (last %d lines of output)\n" % limit_exc_output + \
>                               '\n'.join(split[-limit_exc_output:])
>          if assert_error:
> -            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> +            raise AssertionError("Command '%s' returned non-zero exit status %d:\nstderr: %s\nstdout:\n%s" % (command, result.status, result.error, exc_output))

Testing with this series produces errors on the selftest builds:

---------------------------------8<---------------------------------

AssertionError: Command 'echo foobar >&2; false' returned non-zero exit status 1:
stderr: 
stdout:
foobar

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/runcmd.py", line 61, in test_result_assertion
    self.assertRaisesRegexp(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
  File "/usr/lib/python3.9/unittest/case.py", line 1329, in deprecated_func
    return original_func(*args, **kwargs)
  File "/usr/lib/python3.9/unittest/case.py", line 1276, in assertRaisesRegex
    return context.handle('assertRaisesRegex', args, kwargs)
  File "/usr/lib/python3.9/unittest/case.py", line 201, in handle
    callable_obj(*args, **kwargs)
  File "/usr/lib/python3.9/unittest/case.py", line 239, in __exit__
    self._raiseFailure('"{}" does not match "{}"'.format(
  File "/usr/lib/python3.9/unittest/case.py", line 163, in _raiseFailure
    raise self.test_case.failureException(msg)
AssertionError: "Command 'echo .* false' returned non-zero exit status 1:
foobar" does not match "Command 'echo foobar >&2; false' returned non-zero exit status 1:
stderr: 
stdout:
foobar"

---------------------------------8<---------------------------------

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5002/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5044/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5053/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5083/steps/15/logs/stdio


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

