Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328E3C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 15:49:58 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.19201.1717602595737324658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 08:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JxtJCsDd;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62a2424ecb8so29067717b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717602595; x=1718207395; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHTdgMV1O6FwG+LIfWVmKEyuexTeZc7cXresZtF9AjU=;
        b=JxtJCsDd+EArR6icEDe32Ty3OgTT3QrJ19xudmGC08qByGIndo/KQiY/8kOhJibWzh
         tE4R57yODrpxtN1eBAATITGmjXFCte9bFjk74tA0PlSPa66VFU4xYMlEzcIK6GGFgLgc
         WZGjG2ILyt+4p9yRaGG6l+2U2kJp9pE7f7gT1eRC6ZivehavGLOTgAtjuEtT48zLQCHs
         B1f/Sos3cmuAfqIse9iQrwRZD+uBnx2hoB+8ymFOfdC75TbB4g6as1/nB0vb12hzfmCs
         PBZm6ql3gSwDJ0Xfy89atPQjp4PWifjBEtxxtMB+6BFvlSKW84GxwC5M3+1L3Seg9+7w
         HyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717602595; x=1718207395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHTdgMV1O6FwG+LIfWVmKEyuexTeZc7cXresZtF9AjU=;
        b=KbuDXh/qMyFBBVV1ZaxQAjjyGSr0AiRkk0/Wh5D49zFgDb0cBGDpp/EZ6N6zijNt+U
         h2nopVPUl5c/cV/7bkP/1opaNyl9UJ+zOKSjrwfCWqxqO9WHRmgggXpc1UZ947Sc2omM
         RbVlkrQc7rmbt2YWtGQhZ9MvIlO7O47z+ANH2w4PoqcPND/gbGET0ZCJ/bId8pZz4GGk
         XF0Tm/CqR7+NfLS5vmtamVYCObWtou4sCoVqqaWQNl8cRaVvKfW3aIIopR3ARK5jR7RQ
         22pdfIwM/T7Udi3Qx/AMGIc40y5WYVo94AL2rJLKVZX4B0h10euqIarpq2n4ZzIusSsL
         r1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVOjca5jmkAL4CxbJNM4LbfjdeYkTO+lm3j3rlbUmSCQ5EBRHSAgaNwXeyELGwvi0N/8lQ6GNhlIxwE7dVbEuOgFXF6xAMXutVphmWIzHahZkDvUgJFNWmp
X-Gm-Message-State: AOJu0Yz+/fYt7HTcs5iQ32koIrYMilHHkDY7d1M+D5ilfUfQ1zDqm9da
	ujyzGNNfq9maIw3TP4fr3UE7RCgBCLwLo0L6J1q+gEA34fqgW+PgSBCtheLMGNOZUjIHZYYSQM4
	5nlnoQ3+UPqA005djBl6EzNrnEQAWupByd2vDeo4konhxsGASP9o=
X-Google-Smtp-Source: AGHT+IF3m0Efor9NNNZrf2548X4D8IPEcEWbIMPlbdOqybQqsDbj4KcyKe59/AV2PftegQ7dWo8FFXbCuIDCSNbxSHM=
X-Received: by 2002:a0d:de87:0:b0:61a:b066:3525 with SMTP id
 00721157ae682-62cbb4ff91bmr28530497b3.23.1717602593275; Wed, 05 Jun 2024
 08:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
 <18618.1717599402117239778@lists.openembedded.org> <86ffc957-8b91-48d9-afc9-629b0e1dcaad@windriver.com>
In-Reply-To: <86ffc957-8b91-48d9-afc9-629b0e1dcaad@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 5 Jun 2024 08:49:42 -0700
Message-ID: <CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH V2] gcc : upgrade to v13.3
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 15:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200373

On Wed, Jun 5, 2024 at 8:42=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-06-05 10:56 a.m., Hemraj, Deepthi via lists.openembedded.org wrot=
e:
>
> Regression testing was done and below are the test results:
> After update (v13.3)
>
> =3D=3D=3D gcc Summary =3D=3D=3D
>
> # of expected passes            248620
> # of unexpected failures        9
> # of expected failures          2484
> # of unresolved testcases    25028
> # of unsupported tests         4145
>
> Before update (v13.2)
>
> =3D=3D=3D gcc Summary =3D=3D=3D
>
> # of expected passes            148304
> # of unexpected failures        15
> # of expected failures          1420
> # of unresolved testcases     25136
> # of unsupported tests          2688
>
> Here are the computed differences for each category:
>
> Expected Passes: +100316
> Unexpected Failures: -6
> Expected Failures: +1064
> Unresolved Testcases: -108
> Unsupported Tests: +1457
>
> (Thanks to ChatGPT 4o !  Please do present the differences next time to s=
ave me, ChatGPT, and others from the task. )
>
>
> Can you explain the huge increase expected passes?
> i.e. did upstream really add ~100316 new tests?
>
> Ah, you have a typo, and expected passes for 13.3 should be 148620, based=
 on:
>    https://lists.openembedded.org/g/openembedded-core/message/200008
>
> The number of unexpected failures has decreased so that's good.
>
>
> Also, did you check on the build problems that Steve reported?
>
> That should be discussed in a cover letter for v2, v3, ...
>
> Please learn how to write a v2 cover letter and send that with git:
> $ git send-email -1 --cover-letter
>
> Also, I saved your v2 patch and tried to apply it to scarthgap HEAD and t=
hat failed with:

I had no issues applying the patch when taken from patchworks, only at
build time when applying the CVE-2024-0151 patch:

CmdError('quilt --quiltrc
TOPDIR/tmp/work-shared/gcc-13.3.0-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2024-0151.patch
patching file gcc/config/arm/arm.cc
Hunk #1 succeeded at 19157 with fuzz 2 (offset -53 lines).
Hunk #2 succeeded at 23668 with fuzz 2 (offset -8 lines).
The next patch would create the file
gcc/testsuite/gcc.target/arm/cmse/extend-param.c,
which already exists!  Applying it anyway.
patching file gcc/testsuite/gcc.target/arm/cmse/extend-param.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
gcc/testsuite/gcc.target/arm/cmse/extend-param.c
The next patch would create the file
gcc/testsuite/gcc.target/arm/cmse/extend-return.c,
which already exists!  Applying it anyway.
patching file gcc/testsuite/gcc.target/arm/cmse/extend-return.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
gcc/testsuite/gcc.target/arm/cmse/extend-return.c
Patch CVE-2024-0151.patch can be reverse-applied

So I suspect that V3 of the patch needs to also remove
CVE-2024-0151.patch, since the version bump seems to include the fix.

Steve

>
> $ git status
> On branch scarthgap
> Your branch is up to date with 'origin/scarthgap'.
>
> $ git am /tmp/gcc-13.3-v2.eml
> Applying: gcc : upgrade to v13.3
> .git/rebase-apply/patch:121: trailing whitespace.
> @@ -31,16 +31,16 @@
> error: patch failed: meta/recipes-devtools/gcc/gcc-13.2.inc:65
> error: meta/recipes-devtools/gcc/gcc-13.2.inc: patch does not apply
> Patch failed at 0001 gcc : upgrade to v13.3
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> Looking at the diff between v1 and v2, it seems that you have some line w=
rap issues
> and perhaps more. Please test for this by using git send-email to send to=
 yourself or
> someone who is using a sane (non-MS Outlook) email client and save the pa=
tch and apply it
> to an unpatched poky repo.
>
>
> Thanks,
>
> ../Randy
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200370): https://lists.openembedded.org/g/openembedde=
d-core/message/200370
> Mute This Topic: https://lists.openembedded.org/mt/106504365/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

