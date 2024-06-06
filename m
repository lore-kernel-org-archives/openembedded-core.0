Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B6C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 18:09:34 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.21789.1717697369817008355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 11:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2lAhdDN7;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62a0873c6e4so13831957b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717697369; x=1718302169; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VJeH/uqB15z9d0oUXGLt/wHVmctzAfrjR/aQH3REL0=;
        b=2lAhdDN7h+ZpEFW1wd3G/wkoKE6Z/DVtWOq6zedyyyvYATK7IQpE5RkyXK6d1hip76
         aL1K7ap0o99yhd3HWec4I+8A2Al5HtUgw3kAedrVKtVgsin2oD4kgIAKDrlUYiZjY7D2
         /7eIKLBoWj25Xyv9/n7tz/22zZLILG0h7C5CFoZmu6tRBaaYWniHqUbydbdd1VGuH8Vz
         om4iRxIRSHnoUJ6gv5Hhz72qGgnu7haRmfwgP5TnNTnPkyNYL7U8xl2JtRtz80Yu9puv
         QYAfSwJ/4VQd6pwCx9FPWIzbX7mb6sw2W4idFBYUmNiCfnkwAC6uAvoXuU8NaK1i+CE3
         7thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717697369; x=1718302169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VJeH/uqB15z9d0oUXGLt/wHVmctzAfrjR/aQH3REL0=;
        b=a8EdUoaqXjq/gQSP2Pr8z5qkBaxhyqMJf1uw8DICr9gVwDq/+qjdwtfUWyGwpK7bch
         BHO97IGEZg8HZ7d5vdmPt2QCoJ53f4QMwvHeBeZCAytmhNgD9sD//M01ZV+Xz1/F/3Hk
         q8EUZRFYL9aLhekT2dguVTUEw9sG66vBrmtl43vtxwMiHubq1CRCWd+NCh99xLLRv718
         X2cQBu7R+hBofdSU+SALEJzaB5Nb8d6zkOkMqgB6hAFyy0Dy/qIZXOKjbo9+3Snn+rFA
         BsqTTlVQvoALWM6AeITt0OmLCkvcubWOz8xn0TSVOuipULGYclcZ/YpUi6OlA6Wb+6+T
         0bmQ==
X-Forwarded-Encrypted: i=1; AJvYcCULR0PfrdLAL+UN1+a44Sqd/we6l9tEXoOucbMRltyGfYL3k5Qr499Sm3mGHaMUjRbOGoVNTwJo3QbMfWFCXfgDFRvjnQXNFos/J+wFwdC4gn3/upN1YfAC
X-Gm-Message-State: AOJu0YzNO6Sl6ttRzdrGcT73PujUAbkWfikFlXE8S4cgEKBEDHw/2oSQ
	NPDwmXeBK1wKMrAlsvD5lN98wmffTLULgJtF2SuENw5G9Xu1L6l3T73AX8l1cfvkrkpZU8CHt0L
	JlxHEQnVo0GX3FtbJIjBhWGLD42in8lDiCVMUgA==
X-Google-Smtp-Source: AGHT+IHuY+VDy/pGf4uBt6DYCXlhFh/6YLajoQrraBiwcnC55sRC6lxIDdLbEo/5WRZkYnyG4sgrNHYiPKZVbAmK/tY=
X-Received: by 2002:a0d:d543:0:b0:615:22ff:b57d with SMTP id
 00721157ae682-62cd565f194mr1149577b3.42.1717697367257; Thu, 06 Jun 2024
 11:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
 <18618.1717599402117239778@lists.openembedded.org> <86ffc957-8b91-48d9-afc9-629b0e1dcaad@windriver.com>
 <CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com> <983be3d4-ab67-4736-aee0-687876b614d3@windriver.com>
In-Reply-To: <983be3d4-ab67-4736-aee0-687876b614d3@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 6 Jun 2024 11:09:16 -0700
Message-ID: <CAOSpxdY8+88nbEB8O0pHL0wY5BF3avdku_36vByd=eDU88fVMQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH V2] gcc : upgrade to v13.3
To: Deepthi H <deepthi.hemraj@windriver.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 18:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200414

On Thu, Jun 6, 2024 at 11:08=E2=80=AFAM Deepthi H <deepthi.hemraj@windriver=
.com> wrote:
>
>
> On 6/5/2024 9:19 PM, Steve Sakoman wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, Jun 5, 2024 at 8:42=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
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
>
> I had no issues applying the patch when taken from patchworks, only at
> build time when applying the CVE-2024-0151 patch:
>
> CmdError('quilt --quiltrc
> TOPDIR/tmp/work-shared/gcc-13.3.0-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2024-0151.patch
> patching file gcc/config/arm/arm.cc
> Hunk #1 succeeded at 19157 with fuzz 2 (offset -53 lines).
> Hunk #2 succeeded at 23668 with fuzz 2 (offset -8 lines).
> The next patch would create the file
> gcc/testsuite/gcc.target/arm/cmse/extend-param.c,
> which already exists!  Applying it anyway.
> patching file gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file
> gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> The next patch would create the file
> gcc/testsuite/gcc.target/arm/cmse/extend-return.c,
> which already exists!  Applying it anyway.
> patching file gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file
> gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> Patch CVE-2024-0151.patch can be reverse-applied
>
> So I suspect that V3 of the patch needs to also remove
> CVE-2024-0151.patch, since the version bump seems to include the fix.
>
> Steve
>
> Hi Steve,
>
> I was able to reproduce the issue. since the patch CVE-2024-0151.patch wa=
s added yesterday after I had committed the changes, the above issue was ca=
used
> I will send a V3 tomorrow.

Sounds good, I'll watch for it tomorrow!

Steve

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

