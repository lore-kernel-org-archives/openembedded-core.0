Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 91B2C7E258
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:59:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F8N73L2Yz44;
	Thu, 30 May 2019 15:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559224791;
	bh=uHH6UniJlgA0NzJuIVK9WwFgJ0L/jt2S2pKTySKL7yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2fUCUrkthTTvaUWyoME+dsrcW0laejMhDE9Tm+APzWmCqdFTJ05u2QIPc4Kte2yk
	P505UJpr45hCURRguXRBKDGJUlWCvYAFEQ+naew5wWsWEJOKoHYSUvHw380YWOCSVu
	TqJe7NLjDBXMUtgmxuqTEydrKVOEOhJJDGicWoHwVAZpuJ5kMtuAjngUO6HrY0Vxeh
	9kuxCIBBwxxw3y20px2FZUldYcS0Rqm+FXS/o13J2EzPIu44VRQEl14hWBNKda1BrN
	yyyE5s5eNsDxwFzNvV6j0NYrnJRPQrG0G/q4bPe2aJvy4j6ROVwKcK7SXkit1VG/MG
	OmmPXM5sNwo3gz3C2X4t8bDN7sJ4OX4+3JFBk7ZDmSzVbGzLuZ+OhgNdOW8KngRV/6
	d8WMyBJqhWUqDDBzJ3Oha3PMZnRPlXtliJ7Y1B5QTzpvN6FFawwgy4EmjmJGEHhfv8
	q7uQXMqE0d8AuONnRWr7QlU/u7bs7f3ac3n4/uMxvEw5w+j5C6Ug6Kkij/Pq/SGf0h
	lzhoIvlhq+B2JjcDjyA36Qvi6aeUu/6NcNau1R6d2FQp2yetBr/SVXPf7TeFLbVUwM
	vqIHzWO09/X+b6MJezz7AevdpPkX5Bpjn4mf7KIFrbyGS5JCVy59humvZWbW7wLDHC
	fayCIYN/5u8MShqPn2MHDep0=
Date: Thu, 30 May 2019 16:59:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190530135949.GA318@localhost>
References: <4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 13:59:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 09:13:02AM +0100, richard.purdie@linuxfoundation.org wrote:
>...
> I'm torn, partly as if we stick with bz2, we effectively do that
> perpetually and given the size difference, we should switch.
> 
> Tim mentions we could fix the crops container and I'm tempted to switch
> given we're so close with the current patchset...
> 
> We can add xz to HOSTTOOLS in master and that makes sense for a number
> of other reasons but gets tricky as we can't add it to ASSUME_PROVIDED
> as easily due to the libs it provides. I think we only need to worry
> about this on master though.

There are also some other related topics that might be considered
on how this should develop long-term:

1. How important is it to support host distributions that are not 
listed as supported? Not limited to uninative it can be painful
adding support for new distributions to stable branches.

2. Does using uninative by default bring enough benefits to outweight 
the problems with new host distributions, or should it become 
non-default in master?

The sum of the two points above is especially problematic:
"re-use of native shared state artifacts across different host 
distributions" is a more exotic feature, and effectively supporting
this for unsupported host distributions is the problem here.

3. uninative is so fragile because it tries to fix the C library
only. A lot of problems with host distributions (not limited to
uninative) would go away if one host distribution would be picked
and provided as container for people who are using other distributions.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


