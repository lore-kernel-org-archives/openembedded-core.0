Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827A2C3271E
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 06:37:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.5929.1720679830329008323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 23:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=et+dwe/c;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso5859651fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 23:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720679828; x=1721284628; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CVoP1AknLdi+Kul/PJio5O9xIIq4drRO6iQBwOIY2E=;
        b=et+dwe/cWwsUbBp44jPUs3l0W7j/huMMvu9J2J6VOF994G9ocmVwFgcQrTpxz0bTiI
         +w55m2UcXPWn4pJcnl/ND2UVmkJmTrOJylo+EbPMiAE4weDixN6MTDhExrbaZOYfJqeA
         mbl/H14QEUQkG4EEI+wmHe3wV7+RsOf+lbstRzlp3EoUZSavZxdQfGNOVKN4ax8wEK8p
         JTQgpKdfHpB42Cq/z/ULS6OpFNqyepUqdL1W+YjH/F3yBJ7QI05NUvxB49TVRKZ3wdB1
         hEkz2kcMeBWiqkx8hyCQU/rcgKfZ1/U4te6nfkAPcm2qzqbnDbr3F3hPzdj53dxkHqzH
         9Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720679828; x=1721284628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CVoP1AknLdi+Kul/PJio5O9xIIq4drRO6iQBwOIY2E=;
        b=OogEilBbjylWzXOCdw3VzRgUf2rLG1VgQ351YPfjtpj0hRce9bUCaapbVFgh7I9+ij
         EjSzO/RCJtn/hOJ5cV7b0bXfAZD1YIIMZuTc0haf6GGBaOD5KVbG82uSKOjrvLAir+ka
         BDLE0XsYVxJhVxvYEY0h2ONtxtine9anKDbrZ30EYk/iXdVuUSKoJytwPIXx++8uuI3S
         au9Br0DtnNiBdLM8b+QiuCgmbWHWjZ7kIJvgasphgFag8YD57UwyCgXhZRxt6mLIssQj
         y1KaR1mYkjYjJvmt/KhIb0kZThZMIpIynjPrYF6yNTvU6Vv615t1zqbmXiJcAgmj6ian
         bdRg==
X-Gm-Message-State: AOJu0YxURhgLrLhJoQIAU4F0c9gME5+0BOQVeGwQ3yFJ7T5z243krlMP
	joth2bXX3JRej6x8Qs2RpWx768+WymnpAvdoUPkBzQlEIlmUbWm1vfEdz74y64e5ylRZMYI8opg
	LJ+XHX5zCu52LSsmGRc+dLEvJ1wg=
X-Google-Smtp-Source: AGHT+IFplT58TAqS92SEh7Lg00Y1yQ7+91S7gsyYKq/HFk2RxPlJ+QoxWhDaYwfsjxZir4wnalZHMeU9cK5G38qA+jQ=
X-Received: by 2002:a2e:b0e4:0:b0:2ee:5ec1:182f with SMTP id
 38308e7fff4ca-2eeb30bba98mr45728911fa.6.1720679827918; Wed, 10 Jul 2024
 23:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240710193743.3686800-1-jeremi.graveline@gmail.com>
 <CANNYZj8BmMQPjfVTh_x80ssbYaaxLzsw-ZpxVJFuZT_9WiJ9EA@mail.gmail.com> <CABGZR5rATZYeLP5c1TudH-2ky48X2MOaWOuXXuMEhka6eimMSA@mail.gmail.com>
In-Reply-To: <CABGZR5rATZYeLP5c1TudH-2ky48X2MOaWOuXXuMEhka6eimMSA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jul 2024 08:36:56 +0200
Message-ID: <CANNYZj-VViSDw68wJBpQKqBicxUDOCBH6r1BchzR-BikEiR8Lg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Use override style
 append so generated code passes oelint-adv.
To: =?UTF-8?B?SsOpcsOpbWkgR3JhdmVsaW5l?= <jeremigraveline@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 06:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201762

On Wed, 10 Jul 2024 at 22:29, J=C3=A9r=C3=A9mi Graveline
<jeremigraveline@gmail.com> wrote:
> I understand, it is true it doesn't really happen in real recipes. Is the=
 new version of the class bad though? I cannot find a way to suppress the e=
rror from the recipe itself and wish not to edit the generated include file=
.

If I remember right, oelint's default set of checks isn't necessarily
'sensible', and it is expected that users disable the checks that
aren't helping or otherwise get in the way. You can also file a ticket
there, or send a patch.

Alex

