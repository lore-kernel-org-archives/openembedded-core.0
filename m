Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99D2C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:11:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.8600.1720095062857757612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=Jzwm2Y+J;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.215.173, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7163489149eso380871a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1720095062; x=1720699862; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2aUsi4DcwTOFYFVdXKtz5OW24ESNCGl61t9uTCKKW2U=;
        b=Jzwm2Y+J1+H0KKRVbqZnBLDoi4VVRyUXWe36psuYNPey3PeA6e/h0crGe30EzfKulE
         8HdXu2p8OCvLuUIAM/dcVetJ4IL+ShM/zROZkNgf8YYM10+8uLXr0/x7+5Lw3N5GAJO0
         s4HUQfYenjzCOG2GvziLx47+K0zRiSALARNxTvkSydsxKJ74ReHS/RnGYbycNqZykweY
         5L4kFVDATtfK3jeWTraJyo7SHJ/xc/erDGH/bGoMYeTRAXeB1hrpv1FMz+QKzCJONlSR
         /iK4olnRU13PyiwbNaQNJhguypxgumgeQM5M33Tug3D+1//LRzmNbpMJ5gYdz7QQGZWn
         fdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720095062; x=1720699862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aUsi4DcwTOFYFVdXKtz5OW24ESNCGl61t9uTCKKW2U=;
        b=Pd+lOZPZAGdDq4yIr+PltC89sSnt1ttzE/zM1z9fA5+RT8fpzYII4yIsS6zDK2bfl5
         J9ZlUVdPnzwvbyhUJySEPRwqRCn/CJ2gfdnWudLrRHSAJfBg4IGmfcZryNV2ujc+eyYy
         /eeAw1T4kkrX9dHLwIU6LojioEUkOJYpzqywvNWuGS7LMFnEQPsVWcQxwPgO+TFcepUq
         pavoHBfpBW3H8KMwOLvF+n+6RbPGtcIpc2Jplz25Xn9N94tWr5q5Ht3YG/X95Tkzupkc
         lPebTXY/VpQKiTRHrfq0GnW6zy4eTxFV9RCvQVHF+HNuk2F7kU5tOA3M+bLJ33Rbajub
         XgsA==
X-Gm-Message-State: AOJu0YziY/Y8f0Nt5jUtbb9uJky+EPbOty/fXyiUyZty1R85xXwnzA5z
	yutCJ8V1GUTqQjm65qMlnHlo9Djf+WEIS+zZi4b4fR2BIPXWeAqojkJyk1sSrjIy+J9eBveVux4
	UbcyW+EQ2SjEipiZiHk2qFef5s7noTMraJIrcXA==
X-Google-Smtp-Source: AGHT+IEApM0Mxk30mqonCap8pB3d7eorFB4qXXNtvLb3rXeFydHcRDJ9MRl/nSI4NBy2fpIArZ6g+s3JbZxaNmfZMNI=
X-Received: by 2002:a05:6a20:7f9c:b0:1bd:2a21:fc1c with SMTP id
 adf61e73a8af0-1c0cc90bde6mr1450130637.50.1720095062102; Thu, 04 Jul 2024
 05:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240704114148.3218721-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240704114148.3218721-1-richard.purdie@linuxfoundation.org>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 4 Jul 2024 13:10:50 +0100
Message-ID: <CALqELGxkf6xyBN+uFBB8SQ=Y3=4vBbmGXBe-kE+2=K8zniCUSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/ssh: In case of failure, show exit
 code and handle -15
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201542

On Thu, 4 Jul 2024 at 12:41, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> Ensure we show the failing exit code in case of failures.
>
> We're seeing autobuilder failures with -15 which is probably from slow
> boot/init. Retry in these cases for now.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/runtime/cases/ssh.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
> index ae92bb34cd9..9295ed14787 100644
> --- a/meta/lib/oeqa/runtime/cases/ssh.py
> +++ b/meta/lib/oeqa/runtime/cases/ssh.py
> @@ -19,16 +19,18 @@ class SSHTest(OERuntimeTestCase):
>            status, output = self.target.run("uname -a", timeout=5)
>            if status == 0:
>                break
> -          elif status == 255:
> +          elif status == 255 or status == -15:

According to subprocess.returncode documentation, negative values here
indicate that the process was killed by a signal. Thus, this is likely
a SIGTERM. If so, you could add clarity here by using -signals.SIGTERM
or similar.

>                # ssh returns 255 only if a ssh error occurs.  This could
>                # be an issue with "Connection refused" because the port
>                # isn't open yet, and this could check explicitly for that
>                # here.  However, let's keep it simple and just retry for
>                # all errors a limited amount of times with a sleep to
>                # give it time for the port to open.
> +              # We sometimes see -15 on slow emulation machines too, likely
> +              # from boot/init not being 100% complete, retry for these too.

I was curious to understand why you get a SIGTERM, but your comment
here seems reasonable.

>                time.sleep(5)
>                continue
>            else:
> -              self.fail("uname failed with \"%s\"" %output)
> +              self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
>          if status == 255:
>              self.fail("ssh error %s" %output)
>

-15 or SIGTERM, feel free to add by:

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Thanks,

Andrew Murray

