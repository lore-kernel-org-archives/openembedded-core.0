Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DFDC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:28:08 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.85553.1738582078394827291
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZYovkH6N;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-305f529a987so32420031fa.2
        for <Openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738582076; x=1739186876; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kr6iNXUDdVVQrjdsiRuGMccdfniuscuMsLuHEwzGqSc=;
        b=ZYovkH6NDArR0+AkZWQtJvIfgA9eHv6gUE4JawXy58hTkOKRTwx6vOIcjHBqD0a54v
         cUu3sHnhcEXSC6diKOeijUuhHm2KjAoAhC3kYy8JFWRgeG/I6IsQA1hb8gCqrLFtJdJD
         t2OL5ggiIFfytSLmvD0ixbHzLx6fcqTn6YJe+zZSTyNOmUE9TNRUMiJhc+6FuewBwPwU
         34G/KWJTziMRBJzWBQlwSxg9aC7Klhj54hw3HYfAaGsQYNCxIYGXcv9Ow8RpTnTbNGsl
         qZZ7xl/jxuqiKA/IB2Cj7zbBYXPcX6gYLh9H4ngWKCunAfhuD9XG8/hpHrJ119iW0GKQ
         usdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582076; x=1739186876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr6iNXUDdVVQrjdsiRuGMccdfniuscuMsLuHEwzGqSc=;
        b=CcE64IbZ06AolO2wZ+O40CJcdOhimmyqQ9MVQz9CRtzRv5gGg+Kn0KH/Y5Gc5KpU8q
         kwcBQ5U3sfoZ+x0bglfD4WQp6Zxqv80rQLjHADwo10SMcmC5i1AYMyrNgK4liFejJVN4
         FkNzkEnCSk8UoYSdtmraM1IqRRz00t4kTItFITVVjacOocS5YjlXDZsgHm5SXIEoXx8i
         4emIMdGyyrQa1i46XYAQthHidZER08tUppMx+eOeLySVmX9xVp6Qhznx/rhPNzbl5GyM
         uVGg1RZ0b5uy5cvQba0jxAOo8PCQLa/MsPFoJbLGXGSexwlgLf3h1mD5lBmsZjg0kvTW
         GTlA==
X-Forwarded-Encrypted: i=1; AJvYcCUenfF4hmcI4ss3Ur3F4N50qM8L7415uAEVmA2smfrxWfu2aM1GoNWepCwxT8ysYXvZuE1ZKPgbZtNjyhcNP8BlJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6f1+H18/ErEPvfNfiCaRvG+cTYAdIXplcEnVw4jtXzZhOYYr9
	PmBu1Ys0j34d0JjxObgRL0z/hqfkwUFmtXqD9AMkk06jUpEmR9oTS5tXUgXvk8s=
X-Gm-Gg: ASbGncvFX+OgmHGlY/BbxOy0hmVYGSVAowy74C4fobsKOKj5KBQ+7Tyfm3opreacIdt
	ePC2CQ170ioSxXy1QmPpvRpyMOb3iLPg6VqvcIxsi6XQyd3546UAPREJscFaAYTvw43edQsQuSy
	xMedcYhH3v847v/mhrtOGuaHjD3JvTPo7WNfe0ETN2pW9SCwWHh8t7fKppJBw1Ka5xzX0cZ2kh1
	rQynaIj4ICHhawZcuxDi5LQ0z5LIL454NitOczBuya7ubVAZQtA560Y55+R667qqdC7r1WXE13Q
	7+VBx0OS2j8lupDEu0rfVa4olrNi1tuzTH18gkG1
X-Google-Smtp-Source: AGHT+IHHqXBX0jQnK5+/CrBXbIoBqCqLWjYLm8YeS0bwp4LUV7bYvhTx27JOTeq2TXt2V84S4X4Xxw==
X-Received: by 2002:a2e:a908:0:b0:300:2a48:fb63 with SMTP id 38308e7fff4ca-307968c0939mr62381291fa.6.1738582075635;
        Mon, 03 Feb 2025 03:27:55 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a30a5223sm14340301fa.63.2025.02.03.03.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:27:53 -0800 (PST)
Date: Mon, 3 Feb 2025 13:27:50 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
Message-ID: <Z6CoNsKRvAibY0D9@nuoska>
References: <20250202200319.82231-1-uvv.mail@gmail.com>
 <20250202200319.82231-3-uvv.mail@gmail.com>
 <Z6B2HKSlI6k9wNXO@nuoska>
 <CANNYZj9xjYqke8RvU3atSfwk2V=OC4Np8ZdXSO5hapCOnO75Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9xjYqke8RvU3atSfwk2V=OC4Np8ZdXSO5hapCOnO75Dg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210645

Hi,

On Mon, Feb 03, 2025 at 12:07:20PM +0100, Alexander Kanavin wrote:
> On Mon, 3 Feb 2025 at 08:54, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > Could you elaborate why? Some usecase or feature not supported by the python
> > wrapper? Which one?
> 
> You got this backwards Mikko. It's you who should elaborate why we
> should continue using a custom replacement.
> 
> As long as this change passes the autobuilder, it works as intended,
> and needs no further justification.

So changes without justification are fine then? I'm not against this change,
I would just like to understand why it's needed or proposed right now. A reason
could be just to reduce custom patches in oe-core. That would tell me that no
actual usecase is currently broken, apart from ukify.py and secureboot for which
I've sent a patch separately and which was seen in meta-arm side testing.

Cheers,

-Mikko

