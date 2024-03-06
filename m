Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD67C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:17:09 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10411.1709727424915670530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dEmpx7k7;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5133d26632fso4954465e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709727423; x=1710332223; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vkrxjV1NErBvfo7uztS4WCrt7Z+spO/nEAxCjpDjX3s=;
        b=dEmpx7k7xDESxemkVWUmDSpdPLmMH7TFYUBwS1khNAPVQLY2k9HoPA72PxMSQvVQhd
         w3MEwT2B7M2hAtrMInMLOoWJ6SH4GxJClbAqQASORCCcQah2A0vuUj7Ap2hrQVCswAoi
         QzQigUOY7gBnUWTUanj85YIxqp6iwaE8tlKN5sYevAPyZyzypfmAIifubqJboD1m6d11
         D2vVd835fY0wtv/FUDbvJWygb91BI4RFQWbzsMS2LW3YcTXKH/iTLtZBmenIy+hmmz91
         OxfHZMZ1vmgl8KHqZ9NazLo8BKi2XEJAXtjzzvwy7NGA2qzyFcZ07MeV5rxMni0nOoYV
         mJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727423; x=1710332223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkrxjV1NErBvfo7uztS4WCrt7Z+spO/nEAxCjpDjX3s=;
        b=JjddReSb0/A3X0U78ijTye0bcymKBBJdfgyPapJvVUnC6Qwflnpd8Fko9jp5KkAmR8
         Qf/ijZKUmoiWf/zSEmOazlUsNHlsPY+g/qOD0wnKvb3qYKoNJotsOEskMAmG86zlTsr5
         lI1kWiiRzKLAOEUQanwYpIyOZFDN6AecHmb3oxKRd6dn8SHGbyJrqNDeSuLoBSGi7XEY
         Uv9t+ukS7CGuwikVteV+YEuHZQH2dnTjc4OZ4RKmICuaRSZjXc+h8+CD4L0lBjTPUabu
         ez5LOoUKmiXTgYPIk7JA+j4NrYBHuGeLJfwrJIJHS1zssCpp6UiyRwnpKF9lLLsTYUci
         jpcg==
X-Forwarded-Encrypted: i=1; AJvYcCWTdUXb1SdmuDSDtJyGIpeqorvrIt7K5+ZCGcRaKEonQ9QzmWQTTm7bG21UnVQtgdiJY6JXOZUfDziBdyr62TWfRHohJ33YDZ5tyL/LCt/TWjIHW/b8+WkO
X-Gm-Message-State: AOJu0Yz0lF0P/sRU9zdpM3wO9yRW7uhG+YD0pKOAAwbo5BIQ3H6vQtAr
	V9DmsKVJOMZKSkV5lZ/24KSVqBkljrcEmMSXm2Ug0KoHPMtFHt2P6TyUeRHBfIe2kGRjdNbU4MA
	dqhjN8/AihX7hcJYUrSE6CO+AVDyrdDYc
X-Google-Smtp-Source: AGHT+IHN/XlLvTMQXafXBrPATukag7kXsXmp/piWc79JPAUy48t855TrHLw00wBrZxNgKWqkmBv7QIwBy81ccIADnTw=
X-Received: by 2002:a05:6512:3da0:b0:513:24ba:466a with SMTP id
 k32-20020a0565123da000b0051324ba466amr4196768lfv.53.1709727422800; Wed, 06
 Mar 2024 04:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20240305203608.3039688-1-tom.hochstein@nxp.com>
 <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org> <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
In-Reply-To: <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Mar 2024 13:16:51 +0100
Message-ID: <CANNYZj9U6a+7owpXurYud=f71qd0xz9Yc209nasxZgT1FwYEpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: Add bmap-tools alias for compatibility
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196670

On Wed, 6 Mar 2024 at 13:13, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>> I'm worried this will just mask things and stop people renaming :/.
>
>
> I understand your point of view, but it is a must for package feeds, or it will break them.

For that purpose just RREPLACES/RCONFLICTS can be kept, and the rest
dropped from the patch?

Alex

