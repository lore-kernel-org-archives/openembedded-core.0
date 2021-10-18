Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF7EC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 10:15:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.34279.1634552157526121746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 03:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R2Q5+ULZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id y3so40490488wrl.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 03:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FfKdpht32sAOC0K0gpKrr/ZdqIMD/vSy7Qo7MtWoD/Y=;
        b=R2Q5+ULZrP2BiopbL11I60geusl/75dGwVOsu8MXLOxqaWsq0UcvbnrZ96x0bqK8lh
         ukxnr+7N+EKx4SW192IHVZDgVoOxYgMxt85w5hSiAlgKuQN1NK0dx/1JPccD0pSSe7UP
         OxtFRa2D5qtWUVzHBmyrwrhN0J/FOfhgeGmwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FfKdpht32sAOC0K0gpKrr/ZdqIMD/vSy7Qo7MtWoD/Y=;
        b=sXqGX0z4xmH9juloVywst9wFTW9rr5amSFTDXk3QVWPX4VW7bMAdluLvjz68JTPlQ7
         yJDW2eagH6WGKoMMKNFtOeaSV2SPmd1b+KNTZK22duUL5KbeO2FKtSTzRX+1Bdqr/Lrg
         Q6xAsMfcSCblBBOOpaLYVpyh6MLIo4fivep1f8gTkPH2tyn+smqxxh7IcnbYPDnkvKuy
         Pu4mtnSQ66IGqys2rTGZ35Ee2mKKdq1FksKO2gBhdpxC16wrdPg5dkr5O6mSwZ4wrTPN
         bFtqZp45jYiv03vXDu5CG9umzeW3faou4xDcEdKDSFOJ51oUAdaGpovU3JfqktxVEc+F
         W3EQ==
X-Gm-Message-State: AOAM530P+8BcZfmVUcURRcrxLDlEkUkIBkq7aTFUf3DBRNJh30zGTTwy
	K67CwSHyIMQhSmru3EGOxeJO7Q==
X-Google-Smtp-Source: 
 ABdhPJweWFvRCBfR55fETeYebSPcYwuikbLCSbZiOuVe09RY8I2vvDkOWLJrKl+EotbqY1WbTc4JsA==
X-Received: by 2002:a5d:6d8e:: with SMTP id
 l14mr11379769wrs.304.1634552155948;
        Mon, 18 Oct 2021 03:15:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1325:5a42:b4ef:5218?
 ([2001:8b0:aba:5f3c:1325:5a42:b4ef:5218])
        by smtp.gmail.com with ESMTPSA id
 t18sm13655650wrm.81.2021.10.18.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 03:15:55 -0700 (PDT)
Message-ID: 
 <d3c28cb331c25a4ef6350fc0c4d1d950a1a45c87.camel@linuxfoundation.org>
Subject: Re: [OE-core] Little sstate reuse when using uninative and yocto
 sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Oct 2021 11:15:51 +0100
In-Reply-To: <f372075e-51d0-da3b-837b-d5143cb7c7c4@gmail.com>
References: <f372075e-51d0-da3b-837b-d5143cb7c7c4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 10:15:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157053

On Mon, 2021-10-18 at 09:16 +0200, Jacob Kroon wrote:
> I'm on latest dunfell and using uninative and have put the yocto servers 
> in my SSTATE_MIRRORS:
> 
> my-distro.conf:
> ...
> > SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/3.1.11/PATH;downloadfilename=PATH"
> > require conf/distro/include/yocto-uninative.inc
> > INHERIT += "uninative"
> ...
> 
> but I thought I'd be getting more sstate reuse than I am:
> 
> > bitbake m4-native
> ...
> > Sstate summary: Wanted 12 Found 1 Missed 11 Current 0 (8% match, 0% complete)
> 
> Is the above reasonable, or should I be able to pull m4-native directly 
> from yocto servers sstate ? If so, is there a way to debug what differs 
> between my local siginfos and the ones on the sstate server ?


In dunfell hash equivalence is enabled and this unfortunately means the sstate
doesn't work very well unless you also have the matching hash equivalence data.

We do now have a way to have a readonly hash equivalence server and we have made
one available from the autobuilder so this data is shared. Unfortunately there
isn't a way to configure dunfell to use one though :(. That patch is a feature
but could be something we consider backporting.

That said, I did a lot of testing/work with master recently as sstate reuse with
hash equivalence was not what we'd expected. We ended up making a lot of
changes, including a bit of a rewrite of the server side of the hash
equivalence. I mention this just to illustrate it isn't a simple problem and
that fixing this in dunfell may be tricky and would need backporting of some
invasive changes. I'm trying to at least get master/honister working right in
the first instance.

Cheers,

Richard








