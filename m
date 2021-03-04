Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.5262.1614859404929902385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 04:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=aHjOetME;
 spf=pass (domain: burtonini.com, ip: 209.85.167.53, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f53.google.com with SMTP id m22so42767851lfg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 04:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OoovgADO1omjEMsrr4571m4zDpmQq8rMJHQzTAf0u2k=;
        b=aHjOetMETkWqUsjWTyY0OTvuLodH1V9FTeikD3EhunwEoWOAGGmpqTiNkNyIB2C3Iz
         /F4gF/plunc5gJaMa4VOLCsmRWsLYQ0LvK/hXqYibY+K2D0ZkBY8peXgxmtdCiaazmEZ
         TaQB5KIXYZ7UAwqB1cswX1hEAosKLDTYRFJfwMk3/1rSajY4VhMmbslG21GKPlGDIQ72
         SAEldB61a/PpT7EB1OfkmqegD6pciGTOt3Icyw0FL7v90Aq9j5OkghsvnwjvRVHXs3xd
         W3rIDlosi8tu+vntMJbf12DKk7w6F8UVMBo3uQH4wasT4UUPPRUzeYUwsJN9O02irmcE
         k+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OoovgADO1omjEMsrr4571m4zDpmQq8rMJHQzTAf0u2k=;
        b=SjwHTW8Qf7nrP4knOENOwe0yTuKsAr7mrVyw7BD2JKZ54Dw85FlRy628OyyIOlRs6v
         YJOeCwp8QsXF3+mR/9MVNLEy8sJ7oOYuel20ID/u6XXQGqU7F6VtRQib4IEJHTCD50RX
         esbutCQzg05NEo/YJ45h/fKlB5muuIBy2GV2JDdCCfxLI13wIW61zaFPbLZb7Eq5U2bn
         yst9g7o2MTBj5TR6IBVtfOC8FVWbcikKw8k+ycN+gUyIKpyFYrfPO8DoYJ7hWj3E33XB
         c/73uvKSyR5fj+y7OMc8obfhRJVWb5K6AKSKxCA7XeoB5C2wbezhpyPtw1fFGV6gpKYA
         zp3w==
X-Gm-Message-State: AOAM530BQBgweFZEm9GeL1rWqGj6whSeDn4XKszypM/kvDJ10pAhN6kc
	sIRH6W9oCwwqSCOKgRn4DBX4uIUTl3MFo0BqPM5E7g==
X-Google-Smtp-Source: ABdhPJy34/6qzAP87erKbceqL+tpS69JkAnO5Lo37Kd/86tJWohhF/IX6FwUAjYAE39MhYo0bq8nSFg7LCoRzEYpPIw=
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr2013660lfe.61.1614859403000;
 Thu, 04 Mar 2021 04:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20210303213341.759637-1-ross.burton@arm.com> <CANNYZj9iY1G+6MaZbCAxuSK_mXx4O5H-XUj7gDkUetsKPXoh2w@mail.gmail.com>
 <bad87dce51ed66f61e2b647483a1f03ff3064fb8.camel@linuxfoundation.org>
In-Reply-To: <bad87dce51ed66f61e2b647483a1f03ff3064fb8.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 4 Mar 2021 12:03:12 +0000
Message-ID: <CAAnfSTs7cqK-zJ9TKnbSSOesOFuZBLrPGDJbb3+E_u9WBAcBvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: less parallism to increase chances the test suite works
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Mar 2021 at 22:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I have to note that x86 ptest is not affected and runs fine, so this
> > may not have been fully researched. Could it be specific to arm?
>
> We've seen this on both x86 and arm, I think the arm worker is more
> consistently loaded and hence we see it more frequently there.

Out of all the failures in 2021, 25% were on x86. Considering the x86
build machines are large Xeons and the Arm works are
previous-generation eMAGs, that isn't bad.

> I'm willing to test this approach, see if it reduces the number of
> failures we see...

It didn't reduce it a lot.

I retract this and have sent a brute force approach of not running the
test suite. It's ran in upstream CI on every commit and isn't really
an integration test suite anyway, so we're not losing much.

Ross
