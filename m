Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C894C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:42:13 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.4401.1705056129676771073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 02:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkKSb4m/;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ccae380df2so68571841fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705056128; x=1705660928; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvDWHUZL3n0zgTaFSY5NRFn8/5zEPo3JDu0kA1EYIYE=;
        b=bkKSb4m/T9vngF26pZChN/d8iFlNHGp05mEmj2SeoKDaqNoimG3Mj1P4jw2jNs4D48
         oRFdDnbAfLu5PbRUlI9YaVhxXlw3tQno/L3gZSZqL30ByLvVAIo1uU5bKkKOvo0YBYTz
         DT+gtvU0UFOxnQyb+4hk/zd2PVMrpqiFUV4GlBTJwVQp+jDweBHwr0m0mkSJ+xBrps5M
         FotpotDqtiBUTyagR5aV1St602Y8ht1EjB9T5JCCX9W2CuC6PUHmRXNMfA8hDCwgl6Wa
         7slWPz8l0li6B6IAgyAsuxe0z6Y6wT95zCaYRy92yUHJYhua96Hftcxyg62t/j+3yHVf
         CW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705056128; x=1705660928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvDWHUZL3n0zgTaFSY5NRFn8/5zEPo3JDu0kA1EYIYE=;
        b=nVcR6sONIBG+PIeX54D6tfCECGXWdvcJbtqvebZAl0DWt9fntIwN118KaL3aZ/hlvM
         ILMDiOpLKUFn+bfIIWcIQ9GqUYHEx16T27XYy5OF2L8qro26ER+fxDmAawWVTDCYQWJ1
         nNM3f5IG6K8Kc6cvkuKgBnd1R3r7hDDAsx//safPORc+Dklnlk4G7ZkWBE2ljg0Ng7Mf
         5VGspmo8gR0RDOEUyTDo1YUMhJKR2lw7X3K4KqyaDSwvVFUp/ZqEUBqKFdShyuA7ZnAo
         VBpsnA4K4F3PfGREz0UKe9sy1rOEV/p+URCwQ5XeieRqnOI9bcq7tGdmyR1dRysdNEwy
         6siQ==
X-Gm-Message-State: AOJu0YwI1mNLZLNPJMSyW4fVnO7P9OQdX6kefow4RMEuKkYs92bLeVd7
	FfDaaOJ9Q7q1vhaY/6h2mHxZvGBqSoqR73DUmFo=
X-Google-Smtp-Source: AGHT+IGY0lOdKEqPZpbY0IE8wMW1erzY03CXKut995eWYofIK05Z0oXTI32W6l7gzVPaB3q2erPraLzZYcqbaR2cN0g=
X-Received: by 2002:a2e:a36e:0:b0:2cd:8fe0:70ab with SMTP id
 i14-20020a2ea36e000000b002cd8fe070abmr550360ljn.16.1705056127739; Fri, 12 Jan
 2024 02:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20220606120126.3381438-1-alex@linutronix.de> <20220606120126.3381438-13-alex@linutronix.de>
 <AS1PR10MB5697FF2BB1A0A5CA22E34C68FD6F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697FF2BB1A0A5CA22E34C68FD6F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jan 2024 11:41:56 +0100
Message-ID: <CANNYZj9pKPfOp+uHe2YGvfyx89YQYWW7tOLzZNLTPsSgmi8J-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/21] alsa-utils-scripts: merge into alsa-utils
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"alex@linutronix.de" <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 10:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193577

On Fri, 12 Jan 2024 at 10:14, Marko, Peter <Peter.Marko@siemens.com> wrote:
> I'm upgrading my layer from kirkstone to scarthgap and observed that my image failed due to gpl3 license.
>
> I want to conveniently install whole alsa-utils except for parts where license forbids me to do it.
> After your path I would need to list all alsa-utils subpackages except the scripts.
> And on top of that during every core layer update I'd have to check if there is not a new one.
>
> So from this point of view, your statement
> "There is no reason to keep the recipe separate: bash dependency is not a problem until the alsa-utils-scripts package is explicitly installed into a target image."
> Is not true, it's a problem for maintenance.
>
> Would something like this be accepted when I'd submit it?
> This would return alsa-utils package installation to status before your commit, while still keeping alsa-utils single recipe.

Does a .bbappend with ALSA_UTILS_PKGS:remove = "alsa-utils-scripts"
work for you?

I would not want to exclude things that upstream installs from default
choices in oe-core, if they logically belong to a set. GPLv3 is OSI
approved, and Siemens not being able to ship it in a product is a
special case.

Alex

