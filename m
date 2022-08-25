Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B967FC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:59:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.22520.1661425160447069799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H/6+ROCE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso2310760wmb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=WofCPjDPRjJanIgrEcdBIIe6Y1g2NTpmE2mGT4Vf/6o=;
        b=H/6+ROCE5b0sHhePblSI76ySEdyXUPftXU3KZd6WE865y3Z/ABgME/El1tUaQcyFpu
         F20EPLn6yil7t7OYOqm/dEDTTwMmImNGRiUzZzk2TMKb/85knRBN9U7Pkyj7/vSEBMSj
         AqOpTMLWg2HYk53WdE4lSFZQHZ5exDFex3fV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=WofCPjDPRjJanIgrEcdBIIe6Y1g2NTpmE2mGT4Vf/6o=;
        b=U4ArmxqOLAyPN3T7XzbMxI6L6UMJavofnwTKKKXHa3Lneu03wVhjOCcYbsaX1foXXK
         pxdmTqJufnsqYvBGPs501m3e/3hZEs0cteR7H4AijQQgAqxK+x+EYgjaGXgW/H/90lep
         QTGPnbhe3j91qL4/lxCVHgKv6rtnmf5xY/KH0pDaEOjwZBYcy3NrM1oA2KjUw4yIOu+n
         RGFq1ZpJWrWvkArKmEcVOwrGk8FIpEIQQ9AnDQeKm+y93Tvvy6swoYh1iw769/qvHVjf
         5sB3jb9sYPXYi2j6lHCuGidwGgzVakBRl02MaNarepyn0hGKgBG9ZVBCYyt+zm6zD8cN
         mHgQ==
X-Gm-Message-State: ACgBeo1aQRblp3v+87jKHbBAP//GhvDK8RrHh/8RT6aP+W5SopNNqKVL
	Yo13tiAyqCU3+n1VqyGUSZHdZsOeQ9qjJA==
X-Google-Smtp-Source: 
 AA6agR639nnkwR2lIeobJOu8yfs6Z3HrGyvm/gmN2hZVD2n1rH/aLAz03CnFrHHbtVEU38zoqRNImA==
X-Received: by 2002:a05:600c:1906:b0:3a5:fe9c:4dcf with SMTP id
 j6-20020a05600c190600b003a5fe9c4dcfmr1992230wmq.118.1661425158913;
        Thu, 25 Aug 2022 03:59:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8059:8737:891c:87d?
 ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056000008600b0021d6dad334bsm19523586wrx.4.2022.08.25.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:59:18 -0700 (PDT)
Message-ID: 
 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2022 11:59:17 +0100
In-Reply-To: 
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:59:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169850

On Thu, 2022-08-25 at 12:52 +0200, Alexander Kanavin wrote:
> This will complicate version updates unfortunately, as updating
> .cargo-checksum.json is a pain :(
> Can we try to arrive at something upstreamable?

The usptreamable version of the patch would probably be something which
splits the target names in no_atomics up into components and matched on
subsections of it rather than the whole string. My rust isn't really up
to doing that though.

I didn't really want us to maintain a separate list of targets which
have atomics issues given it and the list in no_atomics would get out
of sync very easily too.

Cheers,

Richard

