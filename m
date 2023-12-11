Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DFBC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:28:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.4638.1702286922009312155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 01:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YhoKysJD;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50be10acaf9so4167373e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 01:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702286920; x=1702891720; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zvrFz/LTnblPfiy6NoT2kSy9gL2GrPH4py4iRKtRA04=;
        b=YhoKysJDW7hPjHFkQM1gPdKV7ZlKaBESZWbaLJpC/wE77WO4kBpaNwKskovX6LQEEk
         EGD2w8Gjb7j5Vj/08obe1/KSR0erNKlxUzVqJTjkXsmHhFCWnp/kuvUMn3sglI7Ih+Kc
         LSwpDn/Er1O17Uh1NzXVr9nRWy0zJSVkLkHEGYP7gC5sLxA/FQ5Rbd5UFXndlje9MiQO
         RmGvzQN6LzMw3iz8eK52oRSjp4o5TmU6FanIKYm41J2F+tYEpgUm9hqpHuGUFilWKZoO
         RUKyzLHpAuSVzdHE8W7zCJcMCfrM2mGE+IWlz0dFkx+g86cj0z5MhV83m6MNCTQfkN79
         gbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286920; x=1702891720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvrFz/LTnblPfiy6NoT2kSy9gL2GrPH4py4iRKtRA04=;
        b=ZJ81AP6K6BQ8ZG01SICsqCvwxke5utGVF6GPk5uWxxUaPTlAnlMI2BtgyQZrc40rIk
         oDOyoYfz8AIrlAoJlzj5uOFQ5lUvw+roQw76k62SYxOM3jGpTmmIEh3itxz9L/J9ckac
         ihNL7vmJMtKlwdjHk7PumgtdmH+qwHnweq3XjtQMkrEl0e5fcw8Fk370+lU7bSlNUFb2
         wpS/fu8TKU8hiI5L1ghqZqvIy+zM1bxek4N2lkVKfpknKx80/Cac2YqTVP0c2Exu842x
         A5Pg+X++F5z52xrzQNtsc9AwX+HWGoe/1ObfaMDH4rrBp+FSQOK81ZMYCtAvp2OMS0vj
         U+QA==
X-Gm-Message-State: AOJu0YzmjvnK41Cp5XhVubhQUCTuqqtm1H9XDagsmS/LL5+oMMwiJmgl
	jtjU5nwmUM85FplO1FMNpicsPn/j2M8xQmu3Ud4=
X-Google-Smtp-Source: AGHT+IEssdtSNfFqWlk/JNp1cdA154CqNZxrsD+HvZJi/jV+z2exSKqmko/bDCJTcbpAHhgFw28Ok4yFcOuQBuM+37M=
X-Received: by 2002:a19:6417:0:b0:50b:c6c8:4cfc with SMTP id
 y23-20020a196417000000b0050bc6c84cfcmr1874781lfb.23.1702286919683; Mon, 11
 Dec 2023 01:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com> <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
 <CAO5Uq5SPRKNTSACY6X7+8FcswTNMkg2JEL5ub7oBJfSWoNCDow@mail.gmail.com>
In-Reply-To: <CAO5Uq5SPRKNTSACY6X7+8FcswTNMkg2JEL5ub7oBJfSWoNCDow@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Dec 2023 10:28:27 +0100
Message-ID: <CANNYZj_6KHT0=WDhcUqL7tEY0kZmhkU4wvRKGRp_cHcgN-Q=QA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192150

On Mon, 11 Dec 2023 at 10:09, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> In a single project there are (potentially) multiple Cargo.toml, but
> just one Cargo.lock. If there's multiple Cargo.lock files in a repo,
> that implies multiple projects which I don't think we've any way of
> building from a single recipe.

I'm thinking of projects like librsvg, python3-bcrypt or
python3-cryptography where the build is orchestrated by meson,
autoconf or setuptools, and where we don't run cargo directly and
leave it to those tools. They may have single Cargo.lock now, but will
that hold? Also, that Cargo.lock is not necessarily in the root of
${S}, so you'd have to set the location manually, instead of not
having to worry about it. Is CARGO_LOCK_PATH or its parent variables
already set correctly for all of them? I see this is not done from
python3-cryptography; shouldn't the build error out, if
cargo_common_do_patch_paths requires the location? Something doesn't
compute fully here.

Alex

