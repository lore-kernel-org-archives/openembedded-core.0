Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.71615.1629389180033768799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BmT/XOUd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id q11so9882925wrr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2dWUqJ1P+eCC6RxQjte09ngg0Pu2eX2W6hqrB7iAi3g=;
        b=BmT/XOUdcelOWdnQMqO80xHXqynfWUW7Z6H0h+va5RDVhgmAoDrjoRoItMhA1XQoq/
         OH+DbkxqvR6ADoVSjjuOx1pho34I2PpkLvJxS0ISXxcwVmeGlsxe/kAfs1BJbgu8QnHe
         z8pzY5FdVzq/YWoZ6k2tTi0uqQMghUUvWUp8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2dWUqJ1P+eCC6RxQjte09ngg0Pu2eX2W6hqrB7iAi3g=;
        b=Ktz+G4GXhtYWZ287BCbpRmyOftUoQTU6RtSZ1V4ceodLCIUeMAUGH8+OT61x+ciazC
         imZu8YSBFJT13ALb8uZb4hvpruTZIQATyyHMVjdWUfg1l1Yj80d5rHoBOBr1FipAIYMJ
         oq+x0sdVW3vB24ZW0oWKcg7trm2psDjYrFiGsEs0nJ9p+xgjMxSyCcujNHck25wuXmSM
         EFdODAyKimxphV++gVCDO5gdq3+64MyzRexAeFoJjDTcSeHInayYXligMlk80DTKBGV+
         NedU6LokvF7Ej3jMDlqAX8a5UIQLM4a2SAP+A9r13TvNesHzDUiHr/SiwenGDPJB9Oi3
         WkGw==
X-Gm-Message-State: AOAM53081tU2Rp63jlA0fbFxrXfVpDSgP9D+IwXoP/mWwGZIJE/5Jv/h
	qngEfiD3OY4gYdxELBI4Ve7oAA==
X-Google-Smtp-Source: ABdhPJxlkvB49LMG7+TX2saQxz4TJiZ9XBvpGbAhXQdm5JIeUo8a/Ym0ESyahSgEyVZtFkibdCeN2w==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr4670022wru.80.1629389178471;
        Thu, 19 Aug 2021 09:06:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:893b:b0d7:8112:9a58? ([2001:8b0:aba:5f3c:893b:b0d7:8112:9a58])
        by smtp.gmail.com with ESMTPSA id l17sm7593399wmq.44.2021.08.19.09.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 09:06:18 -0700 (PDT)
Message-ID: <ba3db5ea7343701e5a78c5b55704bcedfb2106b5.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Aug 2021 17:06:14 +0100
In-Reply-To: <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
	 <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
	 <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com>
	 <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-19 at 16:50 +0200, Konrad Weihmann wrote:
> I kind of missed out on this change... but I got caught up by reality 
> hard this morning :-(.
> 
> I currently don't see a reason why zstd is required on the host - only 
> systemd is having a hard dependency against zstd atm, while the other 
> lately added references are just optional PACKAGECONFIGs (and there are 
> plenty of them which have loose ends - in poky and meta-oe)
> 
> So the question I want to raise: why a hard dependency? wouldn't have 
> been HOSTTOOLS_NONFATAL enough?
> 
> I mean this is the second hard cut in the project within just weeks and 
> this time it was host related, which is even harder to fix in a timely 
> manner in a corporate environment (basically rolling out changes to all 
> dev installations isn't something I fancy on a Wednesday morning :-( )
> 
> None of the commit messages somehow mentions, why we all of a sudden 
> need that on the host, instead of building it from sources (which should 
> be possible judging from the latest master sources).
> 
> And on that note: that the documentation wasn't updated in the same 
> changeset is very unfortunate (not even the crops container where updated)

Sorry the change is a bit of a pain. It has been in master-next for a while
and we did have to jump through a number of hoops as a project to enable this
(e.g. adding to buildtools and our autobuilder infrastructure).

The reason we're doing this is that we need to use compression within bitbake
itself for some of our output files. We've not done this in the past as it is
a pain to have the host prerequisites however there are multiple places we can
potentially benefit, such as compressed pkgdata and compressed siginfo files.
It is also possible we may be able to store a compressed parsed datastore.

The siginfo files and datastore could mean we can improve debugging of a 
number of currently hard to solve problems our users face.

Without this we're unlikely to be able to move forward in these areas. If we
do it, we open up new development opportunities and potentially improved
usability. We can't "just build it" as that would mean we can't use it within
bitbake itself.

Sorry this isn't well described anywhere, it is mainly as we can't yet
"guarantee" that this will do these things. We do know it won't happen
unless we try though.

Master *is* a development branch, not a stable release so things can change.

Cheers,

Richard

