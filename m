Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C67D37E4E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:40:06 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13109.1768405197235783790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YanWSxbX;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a2f2e5445so106225136d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405196; x=1769009996; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O2F3VRBHtR9fGh9OR4LP6uuWvvDr/E/kVAVseiC2eRY=;
        b=YanWSxbXGUm4RzDR3fF4adWfu3iCUkYUNBHli2XiNIg4rL1A0krOnCPrI8zUuTbdD/
         0iqqb0gY4RQ6a5rrsbj4jC0CaPQRB476zfiVGj12IPdZh0gui9eIdXkhKUDlpFZbY2QD
         lk5Klhv9LjRmsmanoHEQFsdDzPydvd9Ziuh+Yhf30IoXKWU2U3tj5YI8I/uYBAh6Q856
         m1MIvNNn7o6h2bk12J69k6zFXhdefhIkpOet7FkGeifBNgvFvQ6yOoTAgDHr62SuyYvP
         NOE8yXYF017ydTdTEKx3NZAZm1rlYHpYmFIZXiu7k2qMQXlIMy+x6m3GurSm7r3/soHw
         R6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405196; x=1769009996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2F3VRBHtR9fGh9OR4LP6uuWvvDr/E/kVAVseiC2eRY=;
        b=UksF8B0IAqoSy0nZq3o3GKy/E+hHnHG/8iyfCD6KzAZXOHqrrR/0UyKClan481d6He
         RBVU0AESdfhZRpYZLFfjQvsj0211gw1H9pJPxuGs1EDAcM6lBgyzt0cSnivTn1YhauDc
         4yAszJ8aQUMsjV+0mVjxk1ogakdUoxS4Logg2NlDvUHcLGa7DXThpoSra7Ms8neWbKp/
         R4m/oNDmbYA3E9ZbfqWoO274utE3AHGM0kU9M8GWJUL33HzCRjrdwAHnMNSq7bFiVALr
         ktiDjRYOCwVswDLDnV0tdgBtavsvjclb5bHsOfU2p2ctl4/W0QLJ26b83JD26PsKYn7n
         /msw==
X-Forwarded-Encrypted: i=1; AJvYcCXbQr7A0BNqT9AKl0oWqlATWo/HYrAmfviYgc8rEW1NyAoDoI+Hp3sk+yeB/UHx+F7ekEdyTM60i+h7tVofuqpJDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJahZ6kPHnH8Kg8WvW29LFMLxiaDH2LHAC76YZIf/DCzjoMas3
	y+YVpGStOaAFkS+p3cwhkNp19KMRG7Wk+w/9JFprnMmf8RGwnq8SnxtYHZUohofjOdEA2fpDAGO
	DCoBakTw4kKECFuqWneAGeOzVYTSG53k=
X-Gm-Gg: AY/fxX6i+cvzKeMGKoTtNngUKF+4MvUn4wS5E6zosKuBitGaUAwTXkSenr5cj/FDCVr
	Tgx6UHib9s6hhhOzdzoYlYJOUmTv4JJt0gSwOc1wQfkTT/fQufYqHvezBEUs5jZwAWLeY4cftYE
	BRU9NvciPN85nLLu/zofLjis61evTNOd4R5RkInCW+Na7l7OwbWUtLoBqqKtFte1firdgV7rnZr
	oUy31HX3VP+PScq1MLBjG+9Rt8qocqOscyTt8wr7vVDm9ZeRXWBa1wZpg0A4ZKQO8qq4j+y
X-Received: by 2002:a05:6214:c45:b0:890:4e98:ebfa with SMTP id
 6a1803df08f44-8927440824fmr35017166d6.57.1768405196211; Wed, 14 Jan 2026
 07:39:56 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKowQqn-VuqaT1w3cXCWGfBeMtG2rHR9HXBFqxSfttAk4Q@mail.gmail.com>
 <DFOEW0JK0R5M.RI0FHSXWERO2@bootlin.com>
In-Reply-To: <DFOEW0JK0R5M.RI0FHSXWERO2@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Jan 2026 16:39:44 +0100
X-Gm-Features: AZwV_Qim3NyWSbbjyaJ1qLbVWISJF52WFJdYQ39L6EdKzwqiLTvmXs97pZmq8W0
Message-ID: <CANNYZj-YDD6-K=6W5mvEXRgQwm3XmbqAhhByTzD_givkDjxzmQ@mail.gmail.com>
Subject: Re: [bitbake-devel] [RFC] bitbake-setup: Documentation terminology
 and tooling suggestions
To: antonin.godard@bootlin.com
Cc: otavio.salvador@ossystems.com.br, bitbake-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229335

On Wed, 14 Jan 2026 at 16:19, Antonin Godard via
lists.openembedded.org
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
> I like the Template/Instance suggestion, but I'm not sure about removing the
> word "configuration" out of these terms. We are speaking about the
> _configuration_ of a Setup after all, and "BitBake Setup Instance" could be
> misinterpreted as a running bitbake-setup execution.
>
> So maybe:
>
>   Bitbake Setup Configuration Template
>   Bitbake Setup Configuration Instance
>
> or simply:
>
>   Configuration Template
>   Configuration Instance
>
> Would be enough. Having "BitBake Setup" prefixing every occurrence of this term
> is going to be too much otherwise?
>
> What do you think?

I was going to write this exact response, but you got there first :)

I agree: should be 'configuration template/instance' when the context
is clear, or prefixed with 'bitbake-setup ...' when it isn't clear
that it's about that tool and its data.

> > 2. Allow Empty Variants in Templates
> >
> > Currently, bitbake-setup init requires the user to select a variant when
> > one is defined in the template. There is no option to skip this selection.
>
> I believe this is already achievable with the --skip-selection option?
>
> > Allowing templates without variants (or making variant selection optional)
> > would reduce the number of questions during setup, making the process
> > faster and more approachable for newcomers.
>
> Instead of no variants, maybe we just want to instruct the user to run:
>
>   bitbake-setup init --non-interactive choice1 choice2 ...
>
> Another idea would be to make it possible to define default choices
> in an existing template? The documentation would then instruct the user to
> simply execute:
>
>   bitbake-setup init --non-interactive
>
> which, with no choices passed on the command-line, would provide the user with
> the default variant (the Poky Setup). The default choices would still have to be
> printed on the console to make it clear to the user what was selected.

It would really help to provide an example config template, and use
that to illustrate usability issues, and proposed improvements. I'm
afraid I simply am confused by the point 2, and I don't understand the
issue reported in it, or the suggested solution.

If there are no choices to be made (e.g. only one variant),
bitbake-setup will pick that without asking. There's also
--skip-selection option, but it is expressly *not* for newcomers as it
will result in an incomplete bitbake config. If one wants less
questions, then they should remove variants from the configuration
template, otherwise bitbake-setup needs to pick something from several
choices one way or another.

The other points I'll address separately.

Thanks,
Alex

