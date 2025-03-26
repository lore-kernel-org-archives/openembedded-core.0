Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB3CC3600C
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 15:28:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.25511.1743002909131084896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 08:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXC90ron;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf0e07954so52582136d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743002908; x=1743607708; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkXs9n/Hud6cQsBT+hPDy6Gu9YbidW+9q/eGXZJjK5U=;
        b=IXC90ronWPMoTRgIZv1AoJdhAl+Z3gAtIh2Abiw3al0VhW8Jd8wJAmP0P/YdDkMoGX
         dttqW2Tz0BrxTyLgBrZREpw1j2999BRWEvT9etWLqf4jiLuSscFoaUPdWEMOmgrE9lGh
         /ivhaoVenJmWdf1vL7ZlosLEq3fhS+zj759/hTT8mpF7M6umxSeIfHuHi/eJLsaTmk6i
         +tOMpmoo4WomAN/9iOnF3IyKF3E9wpBJKp+vz4UT/rIWeOzQ9IhJ+YSiEK+gt8eIFK95
         OS9zkMy9ljfZcB5azAKV3wdtlT3HPZXXJ21Zdqp4/UJhxiv0j0ntPLOKfp7TkmZxPTWv
         YEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002908; x=1743607708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkXs9n/Hud6cQsBT+hPDy6Gu9YbidW+9q/eGXZJjK5U=;
        b=L/o4evJ7Ngcjeaxr9iFCuXU2pobBe7KfxMvxIcX9m/z4KLOrnmzSTegLDUoXNgJow3
         abpzZF+zEo53otMRIeMlUywETZ1Ye2NlzR4zHC9KL/ZDHrMvFWa5kPaysD6oWP+ASNgH
         WJ5mwRTPOCHhp68XK7J7v4IusA+vTjYZlIWvVSRHUarG9U6F/ZfW7yt16gpAsBC5bqMb
         eOJkUfQmUamEWQnYTcyLRn/t91T1DRdQ5E7l5s5MYsP3CkVgBw4S6tzJDw8YDvh+trke
         Yu8u3MmCY4Sax3QxaG2TeQc37q6djz/IUCCbIwfo7dtif/K6TY0+wBYmHWwBcZGTU1u2
         CJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz/zo6XHnsX6BF6PDgy/KE6b5SlBR9Lt8fKRGSrV5P7vMOFfmw43qoRAEQJJjTo13YIaqLo7GHHr9HxNsIdjt/6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yza6AZ1RSogWkU8ZZZV+JZ3rpTCi4mN3IJXmvKfkmUPDJld03B0
	tQ41xQHvmAGf6UiFeYDcBwrgn+dersfPZXk+48q+D+OkW2tyxNovxAlD6s3tkE/Dk8KSoVDyx5K
	RWFdPfTW0oz9yjQGKpHefyGUU6Ps=
X-Gm-Gg: ASbGncvWbGv23RWF7vWra244KKt+dwh+3YyjizuhP/iBW5JL0bFEE5EYDMdqVtFbxwP
	S0vfeyaQlwoY6CfkhY3RkqQfvub8FIPHJxKRqJ2ZruPsHSLbZjtHv/NF0Pox8iXbMdhGGe0Jm7M
	CzzdD1IGOC5Gf8UHECEyTxZgdy/G3QlPP+W89/fyvcyb3ruTUs2VUW08j8H1KH
X-Google-Smtp-Source: AGHT+IGRe+NyIctwbhBDANv6UPdsNqSq3M9BwixEoHZPafp7W5MXhQwylvOry8ZO2I9SwvZcmLQs0NRMOXwQphE5uOM=
X-Received: by 2002:a05:6214:19cd:b0:6d8:9062:6616 with SMTP id
 6a1803df08f44-6eb3f2ba60fmr324573606d6.7.1743002907928; Wed, 26 Mar 2025
 08:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com> <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org> <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Mar 2025 16:28:16 +0100
X-Gm-Features: AQ5f1JpyLNpUpjp_ULi39lGOeOuMBeIazNVaIsf4iE_khAM-gcniKEaBGjrUPy0
Message-ID: <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213651

On Wed, 26 Mar 2025 at 16:17, Mario Schuknecht
<Mario.Schuknecht@iris-sensing.com> wrote:

> I was able to reproduce the problem now.
> And as you mentioned, PR="r1" fixes the problem.
> But setting the PR variable is rarely used. So I wonder if this solution is okay?

Probably not. There seems to be a deeper issue here, and it's better
to get to the bottom of it. If you have a bit of time, I'd appreciate
if you narrrow it down: inspect the metadata of the .deb packages:
gnupg, and then gpg-error, before and after the change. In other
words, is the problem with apt, or with not repackaging gnupg
properly? How does it compare to when using rpm?

Alex

