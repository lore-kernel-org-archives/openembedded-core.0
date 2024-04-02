Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4B8C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 19:32:54 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.4930.1712086369576102388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 12:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aKEDkCyn;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so74693601fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712086368; x=1712691168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=687SzrfhS6jo50hTiKiO1mE7i9tI0ikxURhql6TMxC4=;
        b=aKEDkCyng2vQ+R34v6VmwG/b1i6TjYZRmcMVnX5rgDmNjuCwD0McFtqrlD2ySgPpgX
         Jz3wWvTy1CAY1stoPtOMTZrjGkYAUDJ4+6bUrs+9luRpU/JC746JSzr3a8lQOAMwNuX1
         wL/5ylwFjO6QrgehjqqyeRXOimGKuNVn6hIhPVR+E04uIJxzKtoJtera1TutZ9QeCNVw
         0CGN0K6zohxTjIqVOeEhuNIcPk8wwChmDjmuUM23a/fWrJ2JvwpybqAFTEjmNowmMiff
         L8eA2iLKJEYXjom8Nl+XCD1XC56iKZnn80h7cAUwGMRp0I2kB8aHbCYLBN9QfSL2jcPQ
         NfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712086368; x=1712691168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=687SzrfhS6jo50hTiKiO1mE7i9tI0ikxURhql6TMxC4=;
        b=JqUCSJvmJwzulNFvxle8CmebBCbuSuVJWKXuuoyaBTKbQ407EKQynPkN0PvbycsuDS
         ZycEvp9O/hcr81qfpse4coc1J+Z9V5xkRL6sx/LfMUnaW+HcAZWMgEY9XFk0GL6tHSt+
         uMo9iUBFoyQWA5uT5/gMEZnTh5IlBvunTwi59p+8tS1VwLDaO2Emyzf+FHq9+DDnXAwd
         /xLL1kA2dJT/AvBH9yMMZgckORi25u1iFtmx51sauV8wbW5UOt2qvFBkdWRo4ILQExfH
         kQPRauKwBpOqLCiWuxgebMUVhw05bKE9TtG+bN6kuFecBtAHetsNC2VGfgpjEh+/92Mz
         VeHw==
X-Gm-Message-State: AOJu0YxE2THGEXZFBVixq+YWu+09hFjvuMPnnqyvPpvLtKs57twgp1LQ
	Y1h8DquFnRU/v2QWfTFTbylrgrON812bX9C6xTIphbKZyhJZsKMJAwPhl9cp+bg7AUzQSRPkdDB
	nfc6ycFLQEhDqnbbnddiI/G9gWg4=
X-Google-Smtp-Source: AGHT+IFZO/K5AjDrynvq6AdBb/LsPClhc9TMJJdYZji+mt+yTv0YSEegjxEMDwuhFnUd3tYMs491kNBhFs8rmMA4Mb8=
X-Received: by 2002:a2e:99c9:0:b0:2d6:c630:c2bb with SMTP id
 l9-20020a2e99c9000000b002d6c630c2bbmr8712069ljj.35.1712086367478; Tue, 02 Apr
 2024 12:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240401071355.1702280-1-cordlandwehr@kde.org>
 <CANNYZj_JJku5DvQXL3njGkR9h1SoBFA2W+b7yooMR9cXPNaiKw@mail.gmail.com> <13796333.uLZWGnKmhe@rhuidean>
In-Reply-To: <13796333.uLZWGnKmhe@rhuidean>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Apr 2024 21:32:36 +0200
Message-ID: <CANNYZj93eNQMhSmTEQoWAv+dKvJeJj6A9HPG_0p9Uh_Vr+YM_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-good: Provide Qt6
 option for qmlgl
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 19:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197880

On Tue, 2 Apr 2024 at 21:20, Andreas Cord-Landwehr <cordlandwehr@kde.org> wrote:
> https://github.com/mesonbuild/meson/issues/13018
>
> Regarding the way meson finds native binaries, do you have an example how this
> is done in Yocto specifically how meson is pointed to the recipe-sysroot-
> native? All I could find was pkg-config but that has a special native pc file as
> far as I see.

Slightly wrong upstream, I think. Meson already has 'native' keyword
in various functions, for example dependency():
https://mesonbuild.com/Reference-manual_functions.html#dependency
Setting that to true will result in meson calling native pkg-config
for obtaining information, and that would point to the native sysroot.

So gstreamer needs to be fixed to use native: true for finding
binaries it needs to execute. Did you look into how it looks for them
in its meson.build files?

Alex

