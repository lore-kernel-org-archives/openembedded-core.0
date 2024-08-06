Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0EEC52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 20:48:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17909.1722977290091478759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 13:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tl7+seVc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428fb103724so1242605e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722977288; x=1723582088; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xVEiEoqw+mhA+WFZMN8z2jDmaWHNBMKtxffBNGFmDQ4=;
        b=Tl7+seVccb4FY0UISiscT+2bkUpyz5gYdSkf+liXpwvv1FOPc+tNMkYLbskpaj7oM2
         A7Y0/eebuo9ict5dt9kdOkvxkjFy83fiV3Gi17Cg/n2dd+Sl8n9Gn0Ykz0ZvZLEVycd7
         2K21g+WHRG+n2o28EcgZZhTW/jUCOsMGFRkgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722977288; x=1723582088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVEiEoqw+mhA+WFZMN8z2jDmaWHNBMKtxffBNGFmDQ4=;
        b=fHrYD9ZrUL8CxfIEnsO7fID+bggK0Gpz/gZNB6Wh4tbubtNZTYsLPtiQ2KrgNwnzlX
         t6/WpZ/UEg7c8EiDomyKoptWAqHSIeqjr74EnfGQN16ftjJ/jJu1Wwo0Ymwsb1QZpHPI
         KT8rB0rZ6ICR68TiaLy+Pw+KXL5GTigBWkayunTEYWjyiu4q0QgrwRcNCV3j3w5pM4Ob
         XfG74EMaAelUl97iq0twEoQ6Oe8I8woZcwYlsN5ML5HuxTKK6Dn3ysyzqtX5AISMhOPb
         g9KZc5iHu3rEU0YKjdLtWOv4duNXGyopDmPvRWQWwzR8YL17497/KPDhZOIoRQYUw6Kz
         esDA==
X-Forwarded-Encrypted: i=1; AJvYcCWRTWlNAyTfcc7Bl9IB17Xf610wfpoCTEj2IbXPr/c73jpmFk4u0qLSjLpEXEjpEKZGmCH9IFGpqG3iUlKAq2HHRU9VFVglTQV7/o5XbiXy4KirP5PWpkcB
X-Gm-Message-State: AOJu0Yyacb4nN4i75V9lhCG76Qh30bKigXm+eHsXIm+YXLdKabPuSKCM
	uiSegYpPPt2cJDhjSNYe6sEV1aQDAhcIvQkczQ7GABpknJMG9UBcmo4XHIkej8o=
X-Google-Smtp-Source: AGHT+IE1GfscefMatzCxZaBC7KDwhsAXIMFvITRn2UlaBmt9ac8ZnIDb0srsQLNBqiTJVnTyAlleqw==
X-Received: by 2002:a05:600c:3ca6:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-429050ab889mr336755e9.3.1722977288359;
        Tue, 06 Aug 2024 13:48:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93? ([2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905085e2dsm599505e9.43.2024.08.06.13.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 13:48:08 -0700 (PDT)
Message-ID: <4924816c47e998d2437588aca5061b18dd60f82e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Pedro Ferreira <pmi183@gmail.com>
Date: Tue, 06 Aug 2024 21:48:07 +0100
In-Reply-To: <AM8P193MB0900232A2583C0EDB8A17334C7BF2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
	<20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
	 <6185d36c7da8c96430a9a1c51d83ed9afedeee1e.camel@linuxfoundation.org>
	 <AM8P193MB0900B95FF9A6569D089C600DC7BE2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
	 <2c9b758a87799f4307164a24a7cecb2bb3e710c4.camel@linuxfoundation.org>
	 <AM8P193MB0900232A2583C0EDB8A17334C7BF2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 20:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203050

On Tue, 2024-08-06 at 15:54 +0000, Pedro Silva Ferreira wrote:
> Yes I can see the issue using poky[master] on commit
> `db87ca070c5a4790dcdb9601bcb35037603f6d7f`.
> For each package inside recipe_package I can only see latest and
> latest.pkg_postinst/preinst if applicable. There should be a files-
> in-package.txt for each package, but as I mentioned, the
> `recipe_package` folder exists but not `recipe_package/package`
> folder during `package` task and only on the next task which is
> creating `latest` file, this folder are created(ex: base-passwd-dbg,
> base-passwd-dev,...).
> FYI: I updated the patches, Signed-off-by was pointing to the wrong
> email.

I was having some trouble understanding the issue from the commit
messages but I was finally able to reproduce it. The key information
is to start from a clean buildhistory and sstate, then run the recipe.
The files-in-package files are then missing.

I've queued the patch for testing with an updated commit message to try
and better explain the race issue between do_package and
do_packagedata.

Cheers,

Richard

