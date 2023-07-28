Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55167C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:02:07 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.33074.1690552917535013860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mT1QzpHJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9c66e2e36so21085121fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690552915; x=1691157715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTmv8Cx66HJ+7gUrfiD2n6sJDQS48yItFlOCgRTHy9k=;
        b=mT1QzpHJ44Ej3W3pPuWTa/IXFyiCCRgygA+gSSv5nefT7vencxhK4h7Y/DoDrvsceC
         ZdX5s5ayicwD6TEm1IY5aYziGOSWntCODyVfLpcbtvKb2/hbnNX6C9Zo99rhSi1vFmn6
         CPZYUEfvaGGbCv5y8SQRylU43Rg8bsMMr7Wgl7V4arAMNS6Po0khJfnCdo0V5czTZOI+
         hturWu26dAIpyk6Vc8SeEHPND166FtwvdML2dH0AFnRzXWUXCV+/5nspaHZA542cvFH4
         VeAHbwdWHNk2hHFhD7lvm5KN1QPtHoG2ICVxXnLjVKbk3wKT+cEQ/QyMxoCDo6zAKHge
         tKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690552915; x=1691157715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTmv8Cx66HJ+7gUrfiD2n6sJDQS48yItFlOCgRTHy9k=;
        b=AFWk407lmq8Gg2Ee5XZA2Upygf3sDsz8b7bKj3qBk92eat4s9v/rkd7C6sb7bTPIn2
         S/Ms8KH6ZPU2Gnj7d+qXD56v+YTTRwxZ2VcPRK80MyKihjqZmfeOkErlPdXKHKCoIOGt
         zcWnbfJAqc08RxgxGsEWC6ZPBIfSc0cScc8V9amWTwLF1CRTO8IGFR1+nQHD4FvKQFtE
         5rbP/1Lk+B2Bh8iYoCuvQ4W6vWLM8xI1BmW3tu/PrG7BuiHPTwjTYhbdv7sr26gcsbPq
         f10qA3Q7SDEpjzdQvjlVjY9wdOTrHBhwvaD/92/LAk524gezwRk2L/7uJvfRB4DP6In0
         w/5A==
X-Gm-Message-State: ABy/qLbAmlMVov2SgCnMkG42QKOjJe7OJAcroW2Im4Ua3tO76tQVQlLh
	9b8MD3iOxA8zEgUJWBdbHQQeW4GoVc1ZrtEHRQI=
X-Google-Smtp-Source: APBJJlHOWHPIjAm5d/oVz/93Trh67KsG70Q8PrHl+wJNPhx3zzVmfNL7NTQM3HbBmATVvLxCzioAMVABCPf0PO/ga3M=
X-Received: by 2002:a2e:8507:0:b0:2b6:c3f9:b86b with SMTP id
 j7-20020a2e8507000000b002b6c3f9b86bmr1036996lji.15.1690552915218; Fri, 28 Jul
 2023 07:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org> <20230728111311.1665976-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230728111311.1665976-4-richard.purdie@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 28 Jul 2023 08:01:43 -0600
Message-ID: <CAJdd5Gb8yjOct61J4nc+Q8WzwXrL2au2HJM0oidm_At2SbRgVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] target/ssh: Ensure exit code set for commands
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 14:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185032

On Fri, Jul 28, 2023 at 5:13=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> As spotted by Joshua Watt, the returncode isn't set until .poll() or .wai=
t()
> is called so we need to call this after the .kill() call.
>
> This fixes return code reporting so that timeouts for example now return =
an
> exit code when they didn't before.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/core/target/ssh.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
> index 243e45dd99e..72ed1adbf89 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -265,6 +265,7 @@ def SSHCall(command, logger, timeout=3DNone, **opts):
>                  time.sleep(5)
>                  try:
>                      process.kill()
> +                    process.wait()

I think this can still result in a orphaned process; if the
process.terminate() on the line above is successful, the process will
exit and then process.kill() here will raise an exception and will
call wait. This is true generally everywhere; wait() must be called
regardless of if kill() successed, because kill() will fail if the
process is already dead. It's a little tricky because
process.commuinicate() calls wait(), so you can't unconditionally call
wait(), but my solution was to remove all the kill() and wait() calls
that already exist and add:

 try:
     run()
 except:
     logger.debug(....)
     raise
 finally:
     if process.returncode is None:
         try:
             process.wait(timeout=3D5)
         except TimeoutExpired:
             try:
                 process.kill()
             except OSError:
                 pass
             process.wait()

>                  except OSError:
>                      logger.debug('OSError when killing process')
>                      pass
> @@ -287,6 +288,7 @@ def SSHCall(command, logger, timeout=3DNone, **opts):
>              except TimeoutExpired:
>                  try:
>                      process.kill()
> +                    process.wait()
>                  except OSError:
>                      logger.debug('OSError')
>                      pass
> @@ -316,6 +318,7 @@ def SSHCall(command, logger, timeout=3DNone, **opts):
>          # whilst running and ensure we don't leave a process behind.
>          if process.poll() is None:
>              process.kill()
> +            process.wait()
>          logger.debug('Something went wrong, killing SSH process')
>          raise
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185024): https://lists.openembedded.org/g/openembedde=
d-core/message/185024
> Mute This Topic: https://lists.openembedded.org/mt/100408183/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

