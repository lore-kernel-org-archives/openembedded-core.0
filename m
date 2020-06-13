Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.610.1592008899451047288
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 17:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHS9nhrO;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id h185so5093986pfg.2;
        Fri, 12 Jun 2020 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:organization:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ca1HUXp64R1+pMY7Ay/RKiliIoRCIC2CaqSH8X5P2hU=;
        b=dHS9nhrO13+TJVuvmXtVNwTbTvBQhJliBLEwFWqtOllCO6NWOXD57woc9Ogh1yr6s0
         eFgTjP8K06XerE9x1Y29pe2AYD5mWSJFMY9wBD95E/5gHbbbYt7FTpb0nr00voThLRmF
         ZUc0gdvNXyFglWWa0afAjpifFfjDwlsvBbEVD+Ljy6ZDMuZb4acGS1kqT5q0R0LPlXXP
         7bRBbWD6FqSc0PyKVIO1qqx8PsBj1dMThGPl1l9jCC1luHAVC6lyPD3CqM3v96CXshiW
         9rNS0d6LWd1Ds/FE2cRa4UKLsUVIZpcmyXXe5Zni4xFqMVDus3v2DM5CsPldZQXW+H9y
         49Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ca1HUXp64R1+pMY7Ay/RKiliIoRCIC2CaqSH8X5P2hU=;
        b=SofJdTyfAkdJJK8pI6+iuFKXfbDSfcyxjpClI3/HxqbyAqimTfpqOSxLszfQPneftS
         ETo7wdfWkj6yW99RSGhg8goRyBtyNWpA5BYQ0QaBgHUjHgJvVPFHV8vkNYcIDYwXA84p
         yA/C4OGK8lNv0D6MZ0VeKO7nt5MLBspD5VRSG2xvh4ECTCUIOTUvC6QCarocLdzmZW/F
         pwlkqOoDkODZIKQGEsTxaVqzLUplmETFxrVuHrCNlk3MalO/FxP6BK2CMU49hMdk+o9j
         2tXESTuf3Ge181cCQAjAtQWinA59LzDNZgul1kCFH2x8cRHBo2hdOktUeOHLPtDtLfVm
         0hug==
X-Gm-Message-State: AOAM531+Z2I8Gz161G7HsJIKp+i4rO2qA6a1Yd5DB2PMPuZOeMBvMo8F
	cmUIDTWt3lJHhXmCFn1Etuk=
X-Google-Smtp-Source: ABdhPJzzqJsoL7jTjgFTRt6pf2KDTEBX8FL8GcR5UQhEHhyJLnSYLsFbCYlH+4idu2gJBr81tQya7A==
X-Received: by 2002:a63:ec44:: with SMTP id r4mr13062157pgj.11.1592008898401;
        Fri, 12 Jun 2020 17:41:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from tyche.localnet ([2601:646:9200:4e0::96b0])
        by smtp.gmail.com with ESMTPSA id m14sm6176084pgn.83.2020.06.12.17.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 17:41:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Openembedded-core@lists.openembedded.org, openembedded-core@lists.openembedded.org
Cc: tmark@isc.org, Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
Date: Fri, 12 Jun 2020 17:41:36 -0700
Message-ID: <14618585.ZI4Hmrvx6b@tyche>
Organization: HIMVIS
In-Reply-To: <b10c95a7-5d8b-d922-ad40-6d97cceb9c85@gmail.com>
References: <20200610143520.2727827-1-uvv.mail@gmail.com> <6dd0de0be72028b355cd759e40fee22c9d24ca7b.camel@linuxfoundation.org> <b10c95a7-5d8b-d922-ad40-6d97cceb9c85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, June 10, 2020 9:36:52 AM PDT Vyacheslav Yurkov wrote:
> On 10.06.2020 17:05, Richard Purdie wrote:
> > You seem to disable parallel make yet no mention of that in the log?
> 
> Right, I forgot to mention that in the commit message. Building bind at
> 'compile' stage breaks parallel make. I assume that can be addressed,
> but I'd need to take a look at how to set that dependency with autotools.
> 
> > Why doesn't dhcp build and link against a static libbind by default if
> > these issues are present the the dhcp authors don't want to work with
> > such libbinds?
> 
> That's a good question. I assume the alternative is disable threads in
> bind recipes then a shared library can be used by both, dhcp and named
> (DNS). Hopefully Thomas from ISC (in CC) could clarify this better than me.
> 

I think it would be good to share if we can. Shipping two versions of bind 
libraries is less than ideal, have you explored disabling threading in the 
bind recipe and see if named is happy with that ?

> > Cheers,
> > 
> > Richard
> 
> Regards,
> Vyacheslav




