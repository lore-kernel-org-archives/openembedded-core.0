Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA7CE83834
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 20:53:04 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3764.1771275184353668405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 12:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUFG7b74;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89464760408so23139486d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 12:53:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771275183; cv=none;
        d=google.com; s=arc-20240605;
        b=ESqPiwbbWZ1jRX3eBG1yvhofWSGgH4IZa0LHpTv41SoNIydtWmp+X5FKlEHFU8siS3
         uxLJRH+N1fKNhXh7qSNy759FhJkQ5bI6un3/+foMbYIvwllTAfHPpNd1cIoA7LDLLnep
         bE7CKAkv8Abjgb88un5JD3OcY0lSv6HyfCzM4vJuMuEihdtfkaX6SJnW4mQePymXp1zQ
         Q20bwFmLNMQNrlnwYmQa1u058YRR7weCy+cu/1Fw30FRWLWAD6q0Ambx1C1SlVrjJjnj
         6MEndIsz0PEmK4OnfnKikRPCdDGEONJfsyLQGPWi1GSdK27Evv2fGzCYTeCDzCHU88p+
         wkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZvlpUgCJY0uy1qygh4JRt3/kQQF6BnIPLK3db+6r4V0=;
        fh=3khGjI1wQSHwv9R3+cP0OqJg67/H3YR9su4pPT8ucIU=;
        b=a8IFCxd3iVoo/riq4r19ME4qUF+Zt1LS3UoqdI2JJA9kMXq7gOUMtrU0al9WlrJzI7
         Bb4p4sFa4Q2kV9fkSkSS6G2K6MMtjboWEufratkyDNsbSDIfFa65r42gCjEjP1Cv/hfJ
         99RrZpsFftr9djFHf2qqgtcouHWoCCkbSUaysbUOybmvK2bgxiX02v14YJcQDqIhN7oK
         SH4NOkZ6h1sOFZ5dqyHbGOeQa/q/lJc9FETODH08iChlPHGMevchqotAWWT/3ztTeI5g
         /iooZvjSQL3fJXDrjZM0zd5BO8m7VjXEica1TD9OCkkBDbFwoVl+OgDFTZtS7NtUGbiS
         /s6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771275183; x=1771879983; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvlpUgCJY0uy1qygh4JRt3/kQQF6BnIPLK3db+6r4V0=;
        b=KUFG7b7454FqBGkRayBEcytxD6c6nXCxTTTvpG8yPQeHuaHhYYYzSIqKnq5PW3kpGO
         dNbDb24sxaVQbmZPiH+wtuyK5S1XyLZa0p7Vmvr7MTnD8tSw+bY0VknpCcsgnjICeqzN
         +7TWpYC+PoqHKrSrsq7ycR5ABmCqM3DdR7EkNSurYvTAtzxJgDO9FCBDpRIw94gQoDd6
         JFvSJnSt3zVb8jKKMhpkStNjwTtA1QaVaPk7iiXCTtKl9UQsJ2QZqB7BNSDN3aDxxSAT
         jlACK5PMKJ2cmK0sWXI05NjaUUWX/XHRJGgF/eASinPT/Z/HMANP6TjJoPc6+DCPkzBE
         jldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771275183; x=1771879983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvlpUgCJY0uy1qygh4JRt3/kQQF6BnIPLK3db+6r4V0=;
        b=SMrqOyMama8ujsliR7Rv8i4EpEJHXWodV8jjFsFQ0WxbvP50vLg0pBme7jbqAS7xDO
         2abqXaCCg/a0575IqFUqDoYp+xbdDRUAYyuWZlx+ndUjaRegES51jUbB5FAGjLIrvY/q
         /LZTWHtYadCKcW/oxpkg0TkDQpD3/4InerA3d7Ko6+PwOzPQ1pRZ9Sw700aP+98rTwPr
         3H1Zgl3igl+AW3hfvmHe4ht0XpZ+1ba9Zr46zB3D6lVjMZAW0k9Gv4PzJ5NrVjnn94/8
         4FHgn9xaxWmo/o1CCL2+jQ9C8HmVqETahXuvRb5fYTGiykaG2aeF3B1sqTv6Uo29XcqR
         FsOw==
X-Forwarded-Encrypted: i=1; AJvYcCV4rIRZXbBzw44bP1wpyHVg3NbK9Kwh4A/jBMgemhNh1xzy51Nquv7yo1M7P8avtTXlrByjJGv7Snr3SjJrS/8lNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3XJRjke6yvMGHsX776ivd35ymOaftPD0VMN9Y4fGdjGc6sbhZ
	3H/vHLpl0+xJIxyADVk3qi1vTrcUbBSwvMo1kTt1MxlMccd+6uqPdyF+3111hQsy0DfCr3K3goa
	daIRYprREhW3Hb+42LbiWcGQxUDoQknU=
X-Gm-Gg: AZuq6aKZfzsI7pbWd/opQCdDRuPV89NuQiDrzyDz5dZMYpz4DHhRj2QMc4HEiDYPpdy
	xlk79CZU/+/6lAFzVgxaIcCMcERVZsfNY+faEVgvc6NrINhJ8xYq+VjETCFyZwnPXX/Wu9AEUOE
	oqv71SPKEOARzrYxtiWZRpZ8rsRoEoquhVSoFZiO8wzOg/MXidOmlKdc7ue2qr9BZqw2eAD24oN
	9Ia2YuxdnMyl1bdsNTvn4FezIIsSA2G5q7rFfCUdazFq7AQ9zB9NEy2qaYLhLvIsd4WghxhF01k
	3vdqkJCBoSRa7MIKUaqBy6vUr8IJzX4HYVsMe0d0mA==
X-Received: by 2002:a05:6214:e85:b0:895:4b4f:1336 with SMTP id
 6a1803df08f44-89736085179mr158485496d6.7.1771275183236; Mon, 16 Feb 2026
 12:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
 <20260213014119.3451355-2-ankur.tyagi85@gmail.com> <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
 <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com> <DGESYN3NJURK.3GU7PIXW085UT@bootlin.com>
 <CADySD0GSVCUQi+2J0nAJiwMCGjMmFMQXb5F3NdNzmcsxGkF9dQ@mail.gmail.com>
 <DGGAE8BP2YIH.1IIWA09KDYRV2@bootlin.com> <CADySD0GGZ4azL47+L9OcK9N1DeVLpiDVVg9QN5HK6BV-LiXiqQ@mail.gmail.com>
In-Reply-To: <CADySD0GGZ4azL47+L9OcK9N1DeVLpiDVVg9QN5HK6BV-LiXiqQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Feb 2026 21:52:52 +0100
X-Gm-Features: AaiRm51YJJrkcIWugMbpAiap4W1nKIU2mhA_3tfPx-wJmr9pXJqyoWGX17zduLk
Message-ID: <CANNYZj_MEE5fhBA+uvnGLivX_Bf8dB5DGX3Ff3+2MU2L1S_3vA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure during install
To: ankur.tyagi85@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 20:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231223

On Mon, 16 Feb 2026 at 20:48, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
> > > Trying to understand how come do_install() succeeded but
> > > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260214-8ytqayuf/packages/diff-html/
> > > show sed substitution failure.
> > > Can you please help point me towards the mdadm recipe logs?
> > The problem is I probably won't have the log that you are really
> > interested in: left side (A) is built using sstate-cache, only the right
> > side (B) is built locally.
> >
> > So we do not have the log of the build where the sed failed, as it comes
> > from the cache. We only have the log for the build where it succeed. I'm
> > still joining do_install logs to the mail.
> >
> > What I can do is run a few other builds, hopping that at some point the
> > sed error will happen during B build.
> I have made some improvements in the Makefile install rule and will
> soon send v2 for the test.

I have this horrible suspicion that the BINDIR item still comes from
sstate produced by a previous build via a bogus hash equivalence
entry, which is why the error never triggered. Which means, when you
send a new patch, make sure to also install something harmless into
${D} from do_install, so that the recipe output is different from any
previous build.

Alex

