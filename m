Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADF2C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 07:48:56 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.2422.1742456936018624232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 00:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a8m0503G;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feaedb4085so274290b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742456935; x=1743061735; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBqnol1b1U07MdPTBArBjwy+SqNB5QKILDiy5yFFkkk=;
        b=a8m0503GvxBlQ+CddaDpbiu7t6DA31iQUS8Pv5EYu//XfIhESPIW8y9CbkdqC0jtMb
         sQDdspQpnDWsMaDpIumQ5K4f7bvwOVgBSAALSGPhbhN2bQ+CYQcAduu/1xSetN6WDRNv
         4d6iaIPCEFPnuf28nBvwAWVckDjResKJqOWYwuPUCQtPhx/G+v/amj+PoG2axUGik4ex
         Q8hH9BVZ6q7zgIEYXtJCoAS+9N6jTf6Gpe7AomhaHaxdeew90De9eprZUqdusOPfV7i3
         XEemupF1d7H564xzAWH5qd6+pTiQPaDxNbiLDoqtbbIkHcqbzAh5KrCs5qQQCa8F8Woa
         XJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456935; x=1743061735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBqnol1b1U07MdPTBArBjwy+SqNB5QKILDiy5yFFkkk=;
        b=JpDw/F3+Awta7+gdW4GU11LurXk2rf5koWAryyJhUZVvuBI3EPgS/xU+gnD1n+XOQ0
         OtRXUzTlp3U9t3tJjmTtis86MQcA/Tafpp2ES+eRt1ph2JmQrbFxMrR5RUG6Jtfua2Fx
         EOd6lr4ikL5rJlg2po4Xe+W9Oo6SjrRbfSTByDwwbYvkcAq9+pQRk/zUiu2L+sLazJ7N
         Zj+rOub0nZwQt9EoxsByedM/N1ROgv8k8UjEQ+1tG8uw3uvbUmyFnoRf36/NwLqg1ySB
         d3cHs9/GHo6vWmAIySDQv3QSmtW/fW8s7G/qo7jDIfVn9b4CL3uhy1IhIyYKH+Y/mfMn
         yEhw==
X-Gm-Message-State: AOJu0Yx2L3UMA2mMzIBPtl5SifE60SFRamtnJs7OtyFO/w6Ztcf5pjpy
	JJQe6aaILkRhtq0G+kLj0Z8VBusra++1/07uIwjL9PhB9UgfFbaDwO9qlhvtNoRhGvYKYuGJiig
	MsNiW+IxZezPwMtWUSyZ2WTzBRXk=
X-Gm-Gg: ASbGncti+UDumzoynDFeFJwX4kXdkbpcthW4n0YI2XZticvmTVIbWy2iV+P+rHO4Vkm
	TlN1V81X9bvZfqVInAD/M1elHLsd4u0XhV2JT4DqnG8QPLvDTveRviN3F7Gi94b9jGSG6NsMNMk
	XxZkVz4jbfIqsp05boS/IoDWlU
X-Google-Smtp-Source: AGHT+IEl/KKrpfoWdY+46+9n0siYNowyFblKIdE3gHV8yBXAdii/ngSKnNH0ME4HfjEMMQLlRyRHeGTSz2m9E2KH07w=
X-Received: by 2002:a05:6808:320c:b0:3fb:174f:821d with SMTP id
 5614622812f47-3fead610fa6mr4756380b6e.35.1742456935117; Thu, 20 Mar 2025
 00:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319214213.2505249-1-raj.khem@gmail.com> <20250319214213.2505249-2-raj.khem@gmail.com>
 <4890e4e46e07e1473da235daf0c489585d6b01cd.camel@linuxfoundation.org>
In-Reply-To: <4890e4e46e07e1473da235daf0c489585d6b01cd.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 00:48:28 -0700
X-Gm-Features: AQ5f1JqholuJdoL8nbUQ_acK74XKLTcEyqZffp9CsEzoilJ1tFXo9Fa6a5DjllU
Message-ID: <CAMKF1socZ5d8rXmQz-HtQzDs-9SeWmJtjvv+H2QXtTLKPA-39A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/9] dbus-glib: Fix build with GCC 15
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 07:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213372

On Thu, Mar 20, 2025 at 12:37=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2025-03-19 at 14:42 -0700, Khem Raj via lists.openembedded.org wr=
ote:
> > GCC 15 defaults to C23, it can not handle it
> > latest release is from 2021, and this seems to be
> > deprecated upstream and no longer actively
> > developed.
>
> This isn't true with 0.114 which was recently released.
>
> Was it confirmed we still need this with 0.114?

No, we do not need this patch with 0.114, you can drop it from the series.

>
> Cheers,
>
> Richard
>

