Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6056BC77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 17:37:50 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.726.1683308263227398106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 10:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aQy32lfE;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4efe9a98736so2394123e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683308261; x=1685900261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMsx9v/pympETrMsVg/4PqIbzqEjZ/KWeO0OfRXdjhA=;
        b=aQy32lfEh240orD5oLtYwc8F6ENagsXGoQ7Z/ZMjhWkW1LxYPNGM/Z3Y/b8QvbJZbZ
         gUYuVTEA6cHUnXI+gYY653jPmRtQKoQ8fppjo25pU8iMBav97d509w96NU+lKsD9gZsm
         f16aNuhpTIezL9v4zufZgbgt9DwNf4ZHt9zUSsKrtpFhRV6xAQxbUnJh6R2LgkfhJGnp
         I7plTiVKaZupmnOYSN6ieCo3WIKbJ4ELokxyEPEMYPIdLRGv9eJhveM06bqwwlx8YtHZ
         Pdl5qljAQyBr3EupZ77E4qpPnkNJSt0rBYNzW/FXTjFK3qC4Pd+P9xVbJE2VYJK4dR/W
         YkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683308261; x=1685900261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMsx9v/pympETrMsVg/4PqIbzqEjZ/KWeO0OfRXdjhA=;
        b=SkPMvnZotA3ANJqgccrKtXDSYMkKLEuir6kS3XYTA8t7MKQtRyWAVf/fD4vA2SycU6
         ZmQe6y3n6Ken9CjF7RSMckhOHLCMSF47imdPT/JCSK1VcoJa50RoC2V0WHPm64JnDPSP
         2xNa0Y4wBju1wKEe9dOxjoMJjBd9rxJ1zOdWU0TZdf6ykhQHjk9pM+iwy3PTdSDwwOym
         kpg5W26gksybye79w0msDLrbiN2UUca45MgND/pFdboQFkRl8pxAPZasGc0cghmpz2iM
         4lgI+xbyW1XClC691TC3T0EvvGlBdRcSSMwt+A8MAUIryHOBW+/U71fvff4yxkMkic/G
         QbOA==
X-Gm-Message-State: AC+VfDyKllV+ZiSFZvCqUPdMUVAlR9aJ97z2XfCQiQnxGbVZCwjY/SgZ
	5AdIDynpQ7wL7B5mHz0KeFLWBE9faGbJffYtoJ4=
X-Google-Smtp-Source: ACHHUZ5PvO52AqOP2+fGV2OUUpGv8gxCxLqcFKyKC1U2M3u/0qI0+rOhZYtfIhjc2fzX60J9peUmTddQ5CQeA7l52rQ=
X-Received: by 2002:a19:5207:0:b0:4f0:81c:73e5 with SMTP id
 m7-20020a195207000000b004f0081c73e5mr663427lfb.40.1683308261323; Fri, 05 May
 2023 10:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
In-Reply-To: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 May 2023 19:37:29 +0200
Message-ID: <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 17:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180962

There is
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
and some additional pages linked from it:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide

The wiki is not great, and needs improvements, but the problem is it's
difficult to write an authoritative and comprehensive answer to the
questions you ask because there's just so many possible things one
could check with any change to yocto. If you touch a recipe, you
should of course check that 'bitbake recipe' still completes without
an error. But that's obvious, isn't it? Beyond that... it depends. And
requires a bit of intuition and experience, or advice from someone who
knows the specific item better.

We generally don't expect people to learn 'the rules' upfront - just
write some code, and if you're not certain how to test it properly or
whether it even makes sense, submit the patch as RFC and ask to take a
look. If it fails in integration testing, you'll hear about it too,
and that's normal and expected for anything more complex than a typo
fix. My patches appear 'perfect' only because I pre-test them myself
on the autobuilder :)

Where we would *greatly* appreciate help is a special bot called
patchtest that used to check mailing list submissions for common
problems. That fell into disrepair due to lack of maintenance. Fixing
that would be fantastic - and people could run it locally too. That
could act as both a repository of rules-as-code, and a way to check
them automatically. It could also offer hints for testing, depending
on what the change touches. All sorts of nice things, if there is a
person looking after it.

Alex

On Fri, 5 May 2023 at 19:17, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello list
>
> I'm wondering if there are documentations on how contribution are managed=
 for the project.
>
> I try to find some but didn't manage to. There are easily reachable doc a=
bout how to contribute of course (how to make patches, fixe your identity, =
send mail via git... etc) but I didn't find what I usually find on other op=
en source project (CONTRIBUTING.md file most of the time) like
>   - what are the tests do should I run before submitting (I learnt by pra=
ctice about test image or bitbake selftest for example) ?
>   - is there a specific configuration that I should test before submittin=
g (poky is ok, or should I also test another distro)?
>   - does some commit writing rules exist ? (some projects want commits to=
 begin with a prefix, usually the software component that is modified by th=
e patch for example)
>  - what are the coding rules you should follow, if any? (having common co=
ding rules helps greatly the review of patches, pylint for python code for =
example, and I saw there are some bitbake recipes linter from meta-sca laye=
r)
>
> Long story short, I really would like to know what are the different step=
s a patch should go through before being merged into master (and as a side =
question, what are the steps for a patch to be backported into one of the L=
TS branch).
>
> I'm deeply sorry if all these questions are obvious to you and have been =
already answered somewhere, in that case, please just give me the link.
>
> I recently started to contribute to yocto / oe and I think it will help m=
e to make better contributions if I know more of how it works "under the ho=
od".
>
> Best regards.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180960): https://lists.openembedded.org/g/openembedde=
d-core/message/180960
> Mute This Topic: https://lists.openembedded.org/mt/98710419/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

