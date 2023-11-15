Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D22C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 15:33:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.16207.1700062388966533947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 07:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAZt2jN6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-408425c7c10so55794925e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700062387; x=1700667187; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D/gfmVmGstK98A2KkKtszpkVjMFi2oRHDURmzOy6C4k=;
        b=GAZt2jN6Vrx4QlZtcdf+1CzhlpM53Zdp5X2cHgf9Ez7zeV7rciKf0QdTvDhTmEorhy
         vhbPjhuCxnAO6ctRnkhk/p3QpiiEGLwagbFNvArNlz8epTWwjUEIjKRFNB/TSfRVZk3+
         D0YTFIpkPjS9ldHRITOQ6DubrnIJGh/+rhuyxATIjurL1ucKo9kc/53M6dhrcwi4lgxy
         q8Ehx0iLl7QqWtOGxE4x3naXXlszvB/67X4X7i56p9mbomok4seF1FgoxRgwOnX/S23p
         5i3g8VU+E5dhd6SrGSn2ocE8Oyd8voo4TE+oYo77mpbAfLx2pAbCrgvJfr2oi7RetbHL
         Q2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062387; x=1700667187;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/gfmVmGstK98A2KkKtszpkVjMFi2oRHDURmzOy6C4k=;
        b=bT3xLe22qvHxgxvzGTWumcPIRrygTK4RQqeRW+V4oBjYUfP2Uh9p0LHYPKGwMWMHZm
         oY4bAr1q8u+DT2RO++sEvi6eU04cZrH41zxs4prA0bnwJm15lC4Rr+gt+dlDAyBnAFn0
         FlkZB3oZEohQLMpE6PsunDVPAIUjfNzvigXfD4Y1RUtvfSp6wpqcEdETS3ruRCZz+jnR
         qZGEz8y6jTuVFMnQPX8GbqbGn7i8tg2lhmlXKv08z/KCstJvp2+80WM48jtonVwdGn3W
         /m/H7VNVaWIsm4vyF6p9Gl9VYBkmD3+N5Ukkayt1c60MN3OUsSiWOj1GTFgFjSrfVvd3
         Lr0A==
X-Gm-Message-State: AOJu0YwHl1PHEJY1hQj8SE91TZaqPTF/28SWkqUV+J3vUq7R8EOrqOJM
	hPnICrKTYIKEZFurVT9RJVI=
X-Google-Smtp-Source: AGHT+IFIPOYYb4vuWqDXQ+Q+hWqvFGhLNpB10YhE+0ofyDwHKQxbUmPr5DgXr6DLK+FRguA9dMoOOA==
X-Received: by 2002:a05:600c:4e0e:b0:408:e441:1697 with SMTP id b14-20020a05600c4e0e00b00408e4411697mr10749498wmq.39.1700062386903;
        Wed, 15 Nov 2023 07:33:06 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id az19-20020a05600c601300b0040849ce7116sm21629706wmb.43.2023.11.15.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 07:33:06 -0800 (PST)
Message-ID: <641bc35b54b030e9df1b7bf695d8dd124dc7edfb.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 6/8] devtool: new ide plugin
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com
Date: Wed, 15 Nov 2023 16:33:05 +0100
In-Reply-To: <aca00f120c957c3d576257548cedcd5c75080d0a.camel@linuxfoundation.org>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-7-adrian.freihofer@siemens.com>
	 <0d980031e13375a78227a7143a1b2c32f14a5d18.camel@linuxfoundation.org>
	 <f5cf8365d1447f9aa70bb478b66f079a404edf1c.camel@gmail.com>
	 <aca00f120c957c3d576257548cedcd5c75080d0a.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 15:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190733


Hi Richard,

> FWIW I think it would be fine to add an API to tinfoil to execute a
> task and only that task ignoring dependencies.

I'm going to try to develop a patch for a Tinfoil API extension today.
I'm not sure if I'm up to it, but I'm sure I'm motivated to try. :-)
I think that this could lead to a very useful compromise.

Thank you!
Adrian


