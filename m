Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.10117.1623145719149046978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 02:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g6C8BWJY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso1409826wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DMJwnPdJVh75efgUybBOfOl6u1ttF8uVg9+f5H2q1d8=;
        b=g6C8BWJYvXoQkmFxqeWcAfBSQvrFMFMOVhab9Fz0AAoAfjtHKrhfKjrzhep7x74/66
         OkcJqLsGrg1UXUUW21ZhImY1DT4/S4vtgbJcZZEflbMFW9NYbGL9jkzsaRLpXGYZaYAh
         kFYTvtzy99Hcw/u9wEanls56v0HT2vGwFc60g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DMJwnPdJVh75efgUybBOfOl6u1ttF8uVg9+f5H2q1d8=;
        b=jgvWZKWp43EcMbNpFeXV0xqW1LPRXQPZksPNEnJum3YI+HRvaIIWjTM9NXTf5q4zew
         BsdaiGJm+9E11UbfqvEjXLNZM+cwO9cL7jW4wSx5rNRQKMPXO8zKwGMD8v4r2f9FTwRM
         Jw+1Hf9Mz6ZsImOtmG3Rzw2ioSBx0M5GqLMljzBlAMGGk+MVTmdM3Hb8bDRfrHH1C5u2
         XWv55g7XDafQQnAoD1OxMSjRX/OcysTaA/Wa/huqIeZCcqmo38bo/7FERuZVZG+Zpryw
         YVPKxtFXzLyUasZHbFsRiVC9Tt5hNF1FydcomGhjm045VwfV0jk3uRlbYcKymij+55CT
         LreQ==
X-Gm-Message-State: AOAM530OuS2cOb8ZgQ+4aanpuhrgUq3RRF4K7VLNfgzd7woTbSFn2rOu
	MqtogUS2bHUOpgZmFt0t2hYXLA==
X-Google-Smtp-Source: ABdhPJyEQBZ7mLQSf3NidbFduBTIckbJFsrYiBZcmVdqhHAlwgsswlc0wAl6ITmmbfsNvRNo6RjOzg==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr21481549wmh.130.1623145717309;
        Tue, 08 Jun 2021 02:48:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:119e:2d1:fea4:6669? ([2001:8b0:aba:5f3c:119e:2d1:fea4:6669])
        by smtp.gmail.com with ESMTPSA id 6sm17448028wmg.17.2021.06.08.02.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 02:48:36 -0700 (PDT)
Message-ID: <54d4ce6da8eef4d8e74ad2625d4e6f03b9644a21.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>, pb@pbcl.net
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, wesley.lindauer@gmail.com, Kyle
 Russell <bkylerussell@gmail.com>
Date: Tue, 08 Jun 2021 10:48:36 +0100
In-Reply-To: <CAAQYJAsr=Rh-ie=KKrW=QFg=W2OhbTFNaLOKqeq7sxoH_gRB-Q@mail.gmail.com>
References: <20210607212558.86624-1-bkylerussell@gmail.com>
	 <01B7D818-661B-4A57-A3DB-C6AC0F0DD217@pbcl.net>
	 <CAAQYJAsr=Rh-ie=KKrW=QFg=W2OhbTFNaLOKqeq7sxoH_gRB-Q@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-06-08 at 11:20 +0200, Andrea Adami wrote:
> On Tue, Jun 8, 2021 at 12:02 AM Phil Blundell via
> lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
> > 
> > Wouldn't it be easier to just force -fPIE on for those users for whom this is a problem? Or force -fPIE off for native everywhere. I'm not sure that doing something based on GCC version is obviously the right plan.
> > 
> > p.
> > 
> 
> I was exactly wondering about distro/include/uninative-flags.inc which
> at the time was supposed to fix the changes btw ubuntu 16.x and 18.x.
> But this doesn't seem included nowhere.

Well remembered, I'd fogotten that. It is included by default:

$ grep uninative-flags * -R

meta/conf/distro/defaultsetup.conf:require conf/distro/include/uninative-flags.inc

Cheers,

Richard

