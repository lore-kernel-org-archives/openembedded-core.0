Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24972C04FDE
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 12:10:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.11582.1670587804680600836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 04:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aGiyjEqr;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id x28so6707281lfn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 04:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IEdbpIwBvI+B6yEL1eg7r6dDxSC8cYIOJ7r9o1sBAIg=;
        b=aGiyjEqrUrq35QMSfEv7qaVIeMJqw8Z1UcYyXPLQNuwElo35lwgBfkzy6R9lNF55F8
         8AGq9Lc9i/VMzKxKr+VY1+3+928Rv7timOW18bB7SsRkbYdp0S7QidYyLuD8iuhNCV35
         CfIhe0s8rbSP7YaVg4yK9tzbpzy7c406Tpoim2RYgTS2cohVPu3WlIb96X4/Z4DRVuBf
         Yfbzcm0R8BQ1UIrwnBe1bGcHUVpIyys57wEPZuMga+2b5Wqh5gnVIadL4gsNLeugiGmR
         Xcil5hDW7O7e57Aw1do4D1IG13FJR6mBJRXvOVutSnyBvhaWnKFROxyfVYgKckwPv8Wf
         bG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEdbpIwBvI+B6yEL1eg7r6dDxSC8cYIOJ7r9o1sBAIg=;
        b=HPQM/bAIPxhXWAL1n4ToOIAWEoVibM32UmZPbpCauKAONe/BdOuWTZSpAGS49ggPRE
         94IBSUi9g5gzVIr2tIeUjTJPOsahazpRyysYFAAO1tnlKWNJ/a6VJmQ4Sl3DE3pTO6iQ
         MAnJQeEeIXgEYAO+XY2wPd7FI9yvEznsptmy67/pNQDZwlUisB/dsMlZUgGgItBGApw6
         MZtgP0ZAGoi2Wz21boZA/nxVqk65Wc5gSv4vjJUA3teZ2Qg/EYn8/m705oHJimbw4N2N
         Au8AZ7F+jsCL0yfqSsgCD1GcnJN5kzE/sT5/I+2XJSGNPGM6tAzfPJym51Q6vktZpdJs
         5rug==
X-Gm-Message-State: ANoB5plTAjjn/kx2tkr8kliLoqHCvnbHE14eeDtYvlm7HYwlaw2T9f0b
	Vh6CTaUZrrbj9thoKBc0ipBsZYwMbmWn/Z4Zu1s=
X-Google-Smtp-Source: AA0mqf5u4a+1HpZMmWXi+GHmrd5pJnV2Vry4bQQIktylgBTeGCCx5BEy8YRXeYUzLma8O4+6yMctqOyh+nC0v98v+xk=
X-Received: by 2002:ac2:5391:0:b0:4b5:4502:1323 with SMTP id
 g17-20020ac25391000000b004b545021323mr9974916lfh.345.1670587802748; Fri, 09
 Dec 2022 04:10:02 -0800 (PST)
MIME-Version: 1.0
References: <20221031114719.2725967-1-alex@linutronix.de> <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su> <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com> <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
 <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com>
In-Reply-To: <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Dec 2022 13:09:51 +0100
Message-ID: <CANNYZj9uXz1PV40B4zBReLzVimYaXoBjVr3Kbn5KnV9qxG=Yrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 12:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174447

On Fri, 9 Dec 2022 at 11:39, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> Sorry for the harsh tone but you ignore existing tools and add just another tool to oe-core without mention any reason or document it.

The reason to add the class was to be able to update existing
rust-based recipes without having to manually update long lists of
crates in those recipes, which is a rather urgent issue, more urgent
than having rust support in recipetool. The class does not replace
recipetool, in fact it can, and should be used by devtool/recipetool
once someone finds time and motivation to sit down and add (currently
missing) rust support to it (class functionality can be executed from
those tools via tinfoil.build_targets()). I do not have that time, and
I am not getting paid for doing that either. Oh, and we do not have a
maintainer for those tools. Would you like to volunteer for that?

Documentation is handled in a separate repository, and is typically
decoupled from actual code. I'll get to it, but you should know that
some things are actually higher priority. Such as keeping core
updated, so that you can have a secure stack in the products you sell,
and doing paid customer work, so that I can pay my bills. I'd
appreciate if you reflect on the fact that none of my upstream work is
recognized, or supported by your company, even though without it you
would not have a product to sell - which in turn pays your bills.

Alex

