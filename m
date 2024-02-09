Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEF3C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:32:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.12655.1707489146392717245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ba81oLN9;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d066b532f0so14346271fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707489144; x=1708093944; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hgj+wYoAI23CjPKfsbF7adjXtZ9Qck7WPvgeSOkQzRY=;
        b=Ba81oLN9kKK2aRXiRuMvcMyGDGBUpoebgP08VDvp5Q/Rs2n92nZLa8ukMKhRzEMjQ7
         spoP/9tPu7LfwkHJjsCEkD00p3odaD7WoCEkO6W0OqnHQyf43rywWDlPfwa6CUEh35/U
         WZPXso4Rw71d5Jdtd6O85g4YDiKiTkxvrXwaWV9p9d5oi1Z9DsHCievNTEe7b/K1H7zT
         4fqy2vLMwROoJit0R2ewOfOiVCDvcVtfLP1do60P0ECSklHFIa0Zg0HmuAuFaZJGO6By
         RD59z0Pmew7CzwGJl3t0wwYl1lSddnpN+6JCvljUig5d0jCH5o7ziBVvELcTedj9OpSi
         XrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707489144; x=1708093944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgj+wYoAI23CjPKfsbF7adjXtZ9Qck7WPvgeSOkQzRY=;
        b=kM9LR4Lu/uZp7MxXJh0uRA9okiJWwlbr/2Xrjv1SuxT6M9VTLpn1asjMfon8gbpYDV
         N4TFNI+6ZCzsgq0b1lOx2dhkgp6BdK/CUzujUqQu7B+5C4aPm6FGGm8/MeaDIvin9tg8
         sMp+LxrhXxUp6LWy2ckWQSbKf+KP+rnJvUJ0jMbppCS+J95JrZbXGuCsc0r9ej3gsOX6
         DGmyMnpqoV7tnxLPAt+fqE9jl0F3sEINkyfgzE3jisPsqrkDdHoCD3gYN/0OKz7YmA+c
         3LZJppvVVH/aMieHuATedNdYyKBt6V061sGOQaUA/75ywScu2FO+a8xQfaSuaJHA6nN2
         FXeQ==
X-Gm-Message-State: AOJu0Yx4JhWTvO8fDQFT+KwMpdM0FR+ba9sDQt7K3p6y2Ji42P7c1ctF
	HMtLYS6/p3ZpGpWws2FiPQvqvCcon3rSsQwrhXNoAtHEXWeXGSvykWp9zSU1efNvShIwjwuLh5o
	gARnvlYGiAxwiVbV20pXK/0brwn4=
X-Google-Smtp-Source: AGHT+IHzbLbRsWaqeWFdlpYGzkO3albfXq3TsonEvOf06fkBZSuazXRaAMFRFnAIB93ZTbOyryj8JJqICj23wJiF89Y=
X-Received: by 2002:a05:651c:381:b0:2d0:b0f9:26db with SMTP id
 e1-20020a05651c038100b002d0b0f926dbmr1319941ljp.37.1707489144041; Fri, 09 Feb
 2024 06:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20240209143041.1688862-1-tgamblin@baylibre.com>
In-Reply-To: <20240209143041.1688862-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Feb 2024 15:32:12 +0100
Message-ID: <CANNYZj97v=L+SJeKKfdxcf8HxFa+LV7Poo5Y+8gzsLMht=qmmw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] patchtest-send-results: Add 'References' header
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195221

I'm also seeing in google mail web client that patchtest responses
aren't threaded with the original patch; will this address it?

Alex

On Fri, 9 Feb 2024 at 15:30, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> Based on https://www.rfc-editor.org/rfc/rfc2822#section-3.6.4, to get
> proper threading there should be a 'References' field defined in
> Patchtest's response headers if its replies are going to thread properly
> on Patchwork. This wasn't there before, hence why were were seeing the
> responses in the right place on the mailing list but not Patchwork.
>
> Since we only want Patchtest to reply directly to the tested patch,
> the 'References' field should only need to contain the same ID as the
> 'In-Reply-To' one.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  scripts/patchtest-send-results | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
> index 075b60d8f7d..9fd24c9b959 100755
> --- a/scripts/patchtest-send-results
> +++ b/scripts/patchtest-send-results
> @@ -81,9 +81,14 @@ if has_a_failed_test(testresult):
>          reply_contents = greeting + testresult + suggestions
>
>      ses_client = boto3.client('ses', region_name='us-west-2')
> +
> +    # Construct the headers for the email. We only want to reply
> +    # directly to the tested patch, so make In-Reply-To and References
> +    # the same value.
>      raw_data = 'From: ' + from_address + '\nTo: ' + reply_address + \
>          '\nCC: ' + cc_address + '\nSubject:' + subject_line + \
>          '\nIn-Reply-To:' + in_reply_to + \
> +        '\nReferences:' + in_reply_to + \
>          '\nMIME-Version: 1.0" + \
>          "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
>          reply_contents + '\n\n--NextPart'
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195220): https://lists.openembedded.org/g/openembedded-core/message/195220
> Mute This Topic: https://lists.openembedded.org/mt/104259219/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

