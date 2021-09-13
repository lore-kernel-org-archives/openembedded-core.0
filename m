Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.27707.1631530817010383051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 04:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eL9m7Zts;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t8so8950390wrq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=N16o1xaNznPubLlyTwoQX8Hxei+BUKgeQ+K2iOKyjGY=;
        b=eL9m7ZtsDbOAFH8yQKBWkP+3MaFCNOP9RILZ/OMj/6sZxkUlIZv/XjczkAqWCDZs2w
         c0ytSMBDmoGZ+QMvYRfAFS9yvbar02adJV0wpg9mk3AOcnTS9HtwAoAEKAQZZXR1Rw9+
         mQS8UdEAsewFtnDGvPvCImUybuoP+4i+BQ7a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=N16o1xaNznPubLlyTwoQX8Hxei+BUKgeQ+K2iOKyjGY=;
        b=vkc7Bz9odLk37TGn2WzI14qE8ayGz0F5myZJJwKSXMYWwU8HB753q4+vZ2GZkazncT
         oCQ4MKLY+nFuJD+Ie5mvYxpZOrCbZV3Q/xFEEDMqk3E9XNl4+dHtl3IK50zPYCn3I4BD
         Z154f/aQDYyd4iHr/5U26rySo9Euq68+r0Xdm0OBuCreI0C2nOL/VgAIKQfqxsjOAydh
         b/EeomsJVm+sdAcUgcyqOjPw97oE6OzVXnzt8HqPr4NGy68bocNxOfxoTyD4AX/CX4wq
         C0Tas/huzdHCMmy3hWMXKPyWs2unuPI7oKf1Yosr27Shb6XGc59tkgwMDm+YlRb0BLr4
         DOOQ==
X-Gm-Message-State: AOAM532eha48syXzjRA1WU9+R1dKN2Hf9/7Ss5nj+X/TydEB8PcfJrRH
	6oqZ1Nd3BePooBoCCFPjTnOiHg==
X-Google-Smtp-Source: ABdhPJzHbldAmw17NlLh/vXoIdBin184LwsLNoFcqGKeYXSc/UhOJWjz1BL6RfInD9GNztnbNvyhYg==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr11954480wrv.34.1631530815287;
        Mon, 13 Sep 2021 04:00:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7b8:8478:e47c:cb85? ([2001:8b0:aba:5f3c:f7b8:8478:e47c:cb85])
        by smtp.gmail.com with ESMTPSA id f23sm5779883wmc.3.2021.09.13.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 04:00:14 -0700 (PDT)
Message-ID: <0f44c9945b6ffc2583dab6eabd796b2af7633ee4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: support persistent /var/tmp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Sep 2021 12:00:13 +0100
In-Reply-To: <11e3b9fb-0673-db2f-5f6a-4f10d48cda0c@windriver.com>
References: <16989323AFD32DAC.17148@lists.openembedded.org>
	 <16A0074A273CDC4D.26797@lists.openembedded.org>
	 <11e3b9fb-0673-db2f-5f6a-4f10d48cda0c@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-09-13 at 11:42 +0800, Changqing Li wrote:
> ping
> On 8/30/21 4:11 PM, Changqing Li wrote:
>  
> > On 8/6/21 9:21 AM, Changqing Li wrote:
> >  
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > Steps:
> > > 1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
> > > 2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
> > > 3. docker run -it --rm poky:latest /bin/sh
> > > 4.
> > > /var # ls -al
> > > drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
> > > drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
> > > drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
> > > drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
> > > drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
> > > drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
> > > lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock ->
> > > ../run/lock
> > > lrwxrwxrwx    1 root     root            12 Mar  9  2018 log ->
> > > volatile/log
> > > lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
> > > drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
> > > lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp ->
> > > volatile/tmp
> > > drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
> > > /var # cd log
> > > /bin/sh: cd: can't cd to log: No such file or directory
> > > /var # cd tmp
> > > /bin/sh: cd: can't cd to tmp: No such file or directory
> > > /var # cd volatile/
> > > /var/volatile # ls -al
> > > drwxr-xr-x    2 root     root          4096 Mar  9  2018 .

Sorry, I appreciate this change hasn't had feedback. Unfortunately I'm finding
this one hard to review. I'm also worried because it changes a number of key
areas of the system init process in a way which looks very tailored to a
specific use case.

I suspect we do need to have some kind of better configuration of this area of
the system but I'm not convinced this patchset does that, it looks more likely
to adversely affect other use cases in favour of a specialist one.

I am unlikely to want to make changes in this area until the next release now,
sorry :/.

This is one of the problems with not having enough people with specialist
knowledge to help review, too much falls to me and I just don't have the time to
dive into each different thing and stand a chance of making the correct
decisions. This is frustrating for everyone.

Cheers,

Richard




