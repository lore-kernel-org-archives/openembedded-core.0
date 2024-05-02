Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F88C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 09:29:14 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.1117.1714642147754401565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 02:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g35MSL/N;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e1fa2ff499so2257921fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714642145; x=1715246945; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SkaCD3gOk5LbFfLrTICjs6WdD+rqzJ9xuntG+QdaO7U=;
        b=g35MSL/NDGUFoZ7eiqzTB63AVkqijAZ80WnbD5e4gwTW5jtuCyN9J9lEi3BfkOvsmy
         eUYc/GIF+lXVXzy2tdI4DOCxmPTJfAHZ2DCth3SXmcRQhod06u3CP+EOGhOLqkVRO3he
         yGeyCvaEgo/8wd2rh9KEhCfym0KaIAB/D1xKUgryGpTSvpYRvxl/G7NTyKEAz5Bsnc7D
         W+RkfloGSGNKJdlkXMLO9xlhNM4j56ZtSsQa4HQjChzd+TA0RxL9UG/bI7oA2lzQA3ih
         rlD4pUfBu6cCiUTVVMtWaClbcXu9wP+fOh4/Alr3ZrhLyc/+DACR4mBlA1Fr4eeRaq/e
         qDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714642145; x=1715246945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkaCD3gOk5LbFfLrTICjs6WdD+rqzJ9xuntG+QdaO7U=;
        b=KRvO6FBqVoHOs4rhX88qFVTFHnZfgmYlaU/Jn/g0CBHzPihviV8UF3/BWICc9LfcEO
         gIqn/YUs6XbDy31L3yhVDttIExD+mxQmalF7u7GYQZXEhAKsXjKLZnI4ShW3QIokwDUI
         pYHmF2sbg5Ti1/e+oOONIdijecX3pXBrvN9EUSDlanOCFUTtRheKsw1xRv/4u/5IRd8n
         efKumcBHxo3OvDwXORC3WoatODUHMI3/AFOHxFQ+w7ZlVDCsQCeh7FjtfXhB6hDuQi9B
         6u+aiEJOeYeM2C3YXMXc/Y/0ivOD6pymvMOTbjFJ/qI1sk4fJEhDmNRbC3oh2gfU8KHx
         eXlg==
X-Forwarded-Encrypted: i=1; AJvYcCXpQaevuiuiRBr96xYEn3ZsCnnZgaYmaO9XQol7rYQLsOwkZ2VKTrC6yztl9MMMj2vHNRBXi0/b07XHSy1mxkHZfNtk5jNULYFyxTyBlKiYvuW1EiiOn5ji
X-Gm-Message-State: AOJu0YzhV4RZt0KAKtodReHrAY1ahIj9OldfeBKW0pt8+a4XaiQ+Fg+F
	S9hwNt5T2//AbUmBSUe5XyqxM1xLAEk4U0HxwNMDMaupVY9I7Z3AZfevmoVT1sGFs6ZHMcjhB3w
	5a5NwsKD9dddYcPAZEWmqqxFX05U=
X-Google-Smtp-Source: AGHT+IHcLmCt3UwfHWIiAyKAFEGJhhPFw7bmnnb7J+3+mMTh6d4qNxaxMI3evHKVVmhLYjWcepUcgCLJ/kkiEmy7jHk=
X-Received: by 2002:a2e:a1c6:0:b0:2df:8e58:d05c with SMTP id
 c6-20020a2ea1c6000000b002df8e58d05cmr538991ljm.15.1714642145210; Thu, 02 May
 2024 02:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com> <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com> <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 11:28:54 +0200
Message-ID: <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
To: patrick@stwcx.xyz
Cc: Lean Sheng Tan <sheng.tan@9elements.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 09:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198906

On Wed, 1 May 2024 at 23:27, Patrick Williams via
lists.openembedded.org <patrick=stwcx.xyz@lists.openembedded.org>
wrote:
> What is going on here?  Well, this:
>
> ```
> meta-phosphor/conf/distro/include/phosphor-pkg-tweaks.inc
> 6:# Disable python from btrfs-tools
> 7:PACKAGECONFIG:remove:pn-btrfs-tools = "python"
> ```
>
> We explicitly remove `python` from the _target_ btrfs-tools
> `PACKAGECONFIG`, because we don't want it on-device (since that pulls
> python itself as a side-effect).  If I remove this _target_ setting
> everything works fine for the native package:

It's not a target setting. PACKAGECONFIG without qualifier overrides
applies to all variants.

Alex

