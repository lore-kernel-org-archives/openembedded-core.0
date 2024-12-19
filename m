Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768A7E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 18:57:55 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.136392.1734634668982677189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 10:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NuVFy9f0;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467a8d2d7f1so8336341cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 10:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734634668; x=1735239468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jHWClRVjIqLQELY0zGfLSV5WmikLJd/F2GoGeQGcwkg=;
        b=NuVFy9f0UDxqcLI6eXiQ1hDo65n4dLbDzJYXWmCTTpDRINrSE67wlt2feUHx8cH3tC
         1m3mtT6L7ly7RDs/SmTjQIqmnXohzG1IW3f3I6TNBhGM1xkXrD4sFAujPymEaExR7JQx
         SlKXf7uolP9gbe1hJ5pBUOaUYoDsa5wJa4He+sQusyGlyehP3UkKLFxja8+ecX3qak85
         AGmP8mKpOU/kumRo3k8XgbcVDa0cDYFAGqw2urDpJdkryV0DtgriAWgeeAZIRoT1aFSy
         EQLeihESkQAJ0fcfAtzzkF0HMbVGQh0OTaZIRtpQcejZ/lHRpSLZzgwxNKVFXRBtpoON
         yYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634668; x=1735239468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHWClRVjIqLQELY0zGfLSV5WmikLJd/F2GoGeQGcwkg=;
        b=WIfr+Fh7r5WqI/ZyRsXIXjXelVqkH/sMwtIZPTKAXKUDuKlaJZXEJPtgLk2czoP1a2
         RgFy265xrcQ1K78FqCvTl+7XxIwXfoQ1qgWnwsLd7Hy7QYKMH3SQOhKDkrcsiyLdNt4u
         Hyrla7d7aljNkAmt11Da7l30arTY1KNgkHE2MFOMNaWjAFUWWzZIsqQkcRtn3kpFe4cy
         KynXp6ybM5qRW3tVcIA6nULFAFMcy1oiUEed19lzC/8fpyMmUldEc/04kb/CfvxMZql2
         HLGtto01kQZNj4P/33t0STCFzein2ocwvyX7GafJfoOBSQ2znU/bXO5JpoE5GwmfX683
         ozwg==
X-Gm-Message-State: AOJu0Yx8zKLpzAhMEbFBf4p/j/G/LDHgbM/tmhMqsUkctddPJuGCUPZr
	smvEGsAXQyYfn8WdPkOvRao55ni6dwHj+ya4lvhCcIO7Ndd45f/c2/P8i0tLQRB42oOokwaJOin
	CVv8ZyOjX6XfHZuXBNXFjIbFrnaQ=
X-Gm-Gg: ASbGncv5//3A6ERStFxJR1BKZQbIg4UbIHjeUhdgDgSOeL5COJe0gEWpBetTv8duQ8Z
	aMIroBIMdjP5z1kI+/7TImwpUMzI1nm7CnWKOcCbzCPTx6srsDKDKPAguz8I9QVpBge8vhATY
X-Google-Smtp-Source: AGHT+IGD9tiNjVFGvcMWGJbOl+23hAF5mirbXU0R9QazeTQEPoZ4fWAVgmBJx6RtEDpJromWaR3IFaxYMaH/v7iyAME=
X-Received: by 2002:a05:6214:5786:b0:6d8:b115:76a6 with SMTP id
 6a1803df08f44-6dd231f1e5emr839506d6.0.1734634668026; Thu, 19 Dec 2024
 10:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20241219144255.3366730-1-tgamblin@baylibre.com>
 <CANNYZj_0CBdCpCxcTfUUjRy+AHfN=gn-dxG-PvoFDpTYdnJSQg@mail.gmail.com> <edabfbc7-8c32-4765-b7d8-972b27c38127@baylibre.com>
In-Reply-To: <edabfbc7-8c32-4765-b7d8-972b27c38127@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2024 19:57:36 +0100
Message-ID: <CANNYZj_U4aOiNQnJwn6N38VahHVbb-e6QN6Rfd6EKku6SsdbXQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.0 -> 3.13.1
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 18:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208928

On Thu, 19 Dec 2024 at 18:57, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> Hmm, I see it too. Not sure why it's happening. I do see this error in
> the logs:
>
> |NOTE: Executing
> '/home/tgamblin/workspace/yocto/poky/build/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysroot-native/usr/bin/createrepo_c
> --update -q
> /home/tgamblin/workspace/yocto/poky/build/tmp/work/qemux86_64-poky-linux/core-ima
> ge-full-cmdline/1.0/oe-rootfs-repo' ...
> |NOTE: error:
> /home/tgamblin/workspace/yocto/poky/build/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysroot-native/usr/lib/rpm/macros:
> line 1183: Macro %__plugindir has empty body
>
> Unsurprisingly the build finishes OK if I switch to using deb instead of
> rpm... not the first time I've seen such a problem...

That's been there before the update too, so it's not the actual error.

dnf is written in python, and -11 return code indicates that 'dnf
repoquery' is crashing in the python executable itself.

Alex

