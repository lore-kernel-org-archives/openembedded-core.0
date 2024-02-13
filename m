Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AE5C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 18:21:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.20341.1707848512986521250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 10:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1iwedm9;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51183b02564so1577427e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707848511; x=1708453311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dxTp9hSJVjlwWqCWVsagRb732N5mtgnPLF6Dr5XdsPo=;
        b=A1iwedm9jwAuruNFCOOXVMRHluAKnBGavLuFbeIRr0gzUXXNpduUtpB8k93xAib3hg
         dblVMVxv4N49PyuaFIeuuI77v6myCw4pvPciIMPt9anPQlccgoglxJVpxAbAy/GWNfVw
         XIL8u87Q/FDa6oL7f7u8GSlJPtv4ogeDpWJR2sUp5C+/662kLb6Vm6r6wDpsBDO6GYnb
         I7LD8R+yII/FoyUun1EhuyF/OHbcuRShqjMwBT49uL6bTJJTVK/qXjM7eG7QyiQVO7Sl
         FsmUFPlhE/RC+wZ1t8lyGEb0R89DzbvPfUNm0nCzQOgINrxTsTFRDR8bw/YeenQFN1xd
         9NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707848511; x=1708453311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxTp9hSJVjlwWqCWVsagRb732N5mtgnPLF6Dr5XdsPo=;
        b=mUBtPct9QAnugsithKZ7zbKgOYEMgO4A/lfYM/Wi/vAUoK9z/xIxo6/NRTXjHmRZVO
         nMPWfrhnDS3ph4zvyRrT4V5s66pRabigNkqIWHv4AoUfnW1eyx/kfTyj0uXRzVk3BdBi
         nhqvQnkqDgkIr6RUkxfzxMTSpfJt2B078ixwPAVpgHijBDljlR9OfuUJPuL+vlXRKL8W
         frfhmaNtOaXlZPANaFq8TaS+avkAOJTyz6rDacbqQrJXYQGMs1cbkbSDUdjPExVLQj6o
         BOpB5ySUTL1cLI8d97Ya4aP3w+Gwjm2F4NgNUEVd730k34yQujUDEm3CfaJTqUX9hdRN
         tx/A==
X-Forwarded-Encrypted: i=1; AJvYcCVFWJB5D3sxOWqGFnZnwwAmdppas5Sg+CUZj9e9xW5s9CIgdUROa0howNRUk40rmS64YYs8BECicneVtWE87Cmv6WJRcJWCaIjF12VsFkl75O0NIACXXblJ
X-Gm-Message-State: AOJu0Yylpi2M9M6uLIY2hSHyd/rwpOMB7XC3bhNu5qubKGPkW+xDoehF
	KByx6oL/BnjpCxUNUKnRaSevlMOMuYQOkGOAqXQwvndymPXsotX0y1egy//dcLFu1671A7OQocZ
	iRbTUZukq1iLoHGCLRn1lJYAhVz0=
X-Google-Smtp-Source: AGHT+IE/KVrADcN7TIdxkElGbjUTc2Exgd/e4iM8MoHGcqCsiGvzR2WABuAVyRpeWV6mY9aSMdHjwb7uA+W1mgO+obI=
X-Received: by 2002:a05:6512:1382:b0:511:81da:87d with SMTP id
 fc2-20020a056512138200b0051181da087dmr289001lfb.39.1707848510744; Tue, 13 Feb
 2024 10:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20240213130404.3285564-1-Yash.Shinde@windriver.com> <0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com>
In-Reply-To: <0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Feb 2024 19:21:39 +0100
Message-ID: <CANNYZj8bSQCrF5c09mfYQWNKuQKwyEJqjZo6J3H2C79d7GgLSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Oe-selftest error log on console when it fails.
To: randy.macleod@windriver.com
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Joshua Watt <JPEWhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 18:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195425

It's not difficult to see that runCmd() captures and returns both
stdout and stderr in an object, so rather than redirecting things to a
file, the code should actually assign the return value to a variable
and do useful things with it.

Alex

On Tue, 13 Feb 2024 at 19:12, Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
>
> On 2024-02-13 8:04 a.m., Yash.Shinde@windriver.com wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> The rust oe-selftest output error log doesn't show any information on console when it fails.
> The following changes emit stderr logs in terminal along with re-directing stdout and stderr to "summary.txt" file.
>
> Changes made::
> - cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
> + cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddir, testargs, targetsys)
>
> summary.txt:                  Redirects the standard output (stdout) of the command to a file 'summary.txt'
>
> 2> >(tee summary.txt >&2):      Redirects stderr & stdout to summary.txt & writes stderr on terminal
>
> The overall effect is that both stdout and stderr are captured in the summary.txt file, while stderr still being displayed in the terminal.
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> index 164ad11ecd..07f1b5706c 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -213,7 +213,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>              cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
>              # Trigger testing.
>              cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
> -            cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
> +            cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddir, testargs, targetsys)
>              runCmd(cmd)
>              end_time = time.time()
>
>
> Hi Yash,
>
> We talked about this change and decided that it's just too odd a shell pipeline to merge!
>
> Also, it depends on the bash shell as you can tell by pasting:
>
>    #!/bin/sh
>    python3 src/bootstrap/bootstrap.py test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);
>
> into https://www.shellcheck.net/ . You'll see the following log and error:
>
> $ shellcheck myscript
>
> Line 2:
> python3 src/bootstrap/bootstrap.py test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);
>                                                           ^-- SC2094 (info): Make sure not to read and write the same file in the same pipeline.
> >>                                                                       ^-- SC3001 (warning): In POSIX sh, process substitution is undefined.
> >>                                                                             ^-- SC2094 (info): Make sure not to read and write the same file in the same pipeline.
>
>
> The YP goal / requirement is to avoid bash dependencies since user may be using dash or some other shell for /bin/sh.
>
>
> I think that the command is being run locally (not on target), and we are already in a python context so
> it seems that we would have a simpler solution if we handle the IO redirection from python.
>
> Perhaps Richard or Joshua can recommend some code that you can reference when making this change.
>
> Did you have time to look at the log file handling in runCmd()
>
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n168
>
> Please do some analysis and reply here every day or so as  you learn things or have questions.
>
>
> Thanks,
>
> ../Randy
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195424): https://lists.openembedded.org/g/openembedded-core/message/195424
> Mute This Topic: https://lists.openembedded.org/mt/104331501/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

