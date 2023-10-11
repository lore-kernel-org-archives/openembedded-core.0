Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6E0CDB473
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:00:43 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.23545.1697047235399874271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 11:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IiDGT2f7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a9f139cd94so12124466b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697047234; x=1697652034; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+MHzSb+cqnjP0y31Y4h1QaZb3MBnMWuZaU08Qo8DjU=;
        b=IiDGT2f78f6inNYsqrv+Lr3runckIAicL053NJ6aWnqyGD1bFJjgFhyAiEKrpLYFIE
         VqMf3CxkA7diwFHa238Pf7IiazwK85lOSFt6ASwvAkC+7zBAbl9ViqaPiOD93BRxUV8a
         MPyuUgGVSY6MejIDQXZxUOIl7nFe/edcWErU/JfoDCKjoU8ynxfOz3asdDZwupAAWsy3
         y7xSsiFWf/WTQRxltz+4l8hnrs7VQ7Nhyo4q2e7O1W6u/Ld2MkS3ZJwQwCd15H6jdnIk
         X+zIdMGKuhiDv3EkTxcj9Pm9Sqp3QyHwsLtklBE0aKKdQWNdJ7Or0K0k1alMGAKeo2vJ
         jjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697047234; x=1697652034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+MHzSb+cqnjP0y31Y4h1QaZb3MBnMWuZaU08Qo8DjU=;
        b=gvCzAAp5jJe5nU1F2DCxyy2ikarhLMwQwNzeeGGUTWHPDEkYi5wJhWCokbRgLr+6gz
         H7tirH+6pmoOGtCinKFU83FSsA/dgVUGKZmrimIpLpQ4L11YJMJTfbLd06auyEIwgaEs
         3oTJJANdQmLJTANcCemlbRtmvZqD7ILcRX7NzsPqyrxZZ8DLZg8HndE5nldIl67s9QJU
         hdyZ3Mx8YqVk1cr7rKUI0xSmYZuhEziZOXdBW0/CBsTKrsj3SY/FFh9mqgpnRwKoABvN
         OofYGT2lzwTVwXeJbeu1mWPFqWq+hyVGAROI/LVK/hZl4Zb+4bSE1z1llBZV5t/h8tHx
         wMJQ==
X-Gm-Message-State: AOJu0YyoBNhIeC01eLEb0ncwlLN1DbmNTgf3TH8yIHOvpCGd4PImeT5n
	Qe5o0Z/MA8v215PkzNM2/ePTOIqf+qF4W4vaIv+rJA==
X-Google-Smtp-Source: AGHT+IFhYzefdu+cBBDuO+7hEbRdcwpCv+5oCr6XVn9c0HL6il8rlevHfuZWciY840IQjsEcMaEJPygPnf1i64GUF7Q=
X-Received: by 2002:a17:907:9492:b0:9ae:793f:2010 with SMTP id
 dm18-20020a170907949200b009ae793f2010mr23711964ejc.42.1697047233791; Wed, 11
 Oct 2023 11:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696982312.git.steve@sakoman.com> <178CE4A0C639CDC9.9719@lists.openembedded.org>
In-Reply-To: <178CE4A0C639CDC9.9719@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 11 Oct 2023 08:00:23 -1000
Message-ID: <CAOSpxdb0BE5a2iRnTXABs-1Pa05ypXiQspMNTv95R9wOWSjx0A@mail.gmail.com>
Subject: Re: [OE-core][mickledore 18/20] oeqa selftest context.py: fix git
 commands and set branch name
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 18:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188969

Oops, I meant to drop this patch since it has been reverted in master.
I will remove it from the queue before merging.

Steve

On Tue, Oct 10, 2023 at 2:02=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> Check return values of each git command and set initial branch name
> to avoid this warning on every test run:
>
> NOTE: Starting bitbake server...
> hint: Using 'master' as the name for the initial branch. This default bra=
nch name
> hint: is subject to change. To configure the initial branch name to use i=
n all
> hint: of your new repositories, which will suppress this warning, call:
> hint:
> hint:   git config --global init.defaultBranch <name>
> hint:
> hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> hint: 'development'. The just-created branch can be renamed via this comm=
and:
> hint:
> hint:   git branch -m <name>
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> (cherry picked from commit 5ec557467dda29309e25102b507bb919275bedbb)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/lib/oeqa/selftest/context.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/c=
ontext.py
> index c98763735f..8d864a0368 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -97,7 +97,7 @@ class OESelftestTestContext(OETestContext):
>          oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
>          oe.path.copytree(selftestdir, newselftestdir)
>
> -        subprocess.check_output("git init; git add *; git commit -a -m '=
initial'", cwd=3Dnewselftestdir, shell=3DTrue)
> +        subprocess.check_output("git init -b main && git add * && git co=
mmit -a -m 'initial'", cwd=3Dnewselftestdir, shell=3DTrue)
>
>          # Tried to used bitbake-layers add/remove but it requires recipe=
 parsing and hence is too slow
>          subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%=
s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=3Dnewbuilddir, shel=
l=3DTrue)
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188936): https://lists.openembedded.org/g/openembedde=
d-core/message/188936
> Mute This Topic: https://lists.openembedded.org/mt/101887353/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

