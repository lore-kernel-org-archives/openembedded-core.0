Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 47BE77F820
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 00:43:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so13726535wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 16:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=kixhN4P+8zHHBhqxfjGvqaDIOlI4+COq4UeX+D5PWx0=;
	b=Rcg2ngNF7gswOPniyyCXzjE5cz0P1Ns3iSMbvii2p6Wx5G6zqr251F2yWGs9R5MrYO
	O5mBdiS0ytEoT3NDMEHS+PMCKTHQQUURMAwBQgqn8B4MbMH1V17OlROs4yMuAuRxkqkR
	ACPcab78kMM2ZS53mlVogkeBIP82wp3pucpDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kixhN4P+8zHHBhqxfjGvqaDIOlI4+COq4UeX+D5PWx0=;
	b=dmvw8Hf/kHIR6X8eHvBQDDvKroLbzlLzGwjhtvzxXyPPyAv3w4Xjy74go2NaQQgdxo
	h2NfkFsscUUU9To6ERMOwAPmOsy5hXCpR6h5W/EMFTpCUlM8pHXeE+UpVyCzCZZyTWSm
	RR6hcz6s9xSTnnLHjWt0pRKGgb5JBe4Pc1x/tt73IKMCXv6jUimNpBg+bx23jEWX5DU0
	d4wUAmSdpwKJNq25ry/a0IbePYBteU2BqkpnW+Ch/Trj5bcf24iKWzt8KJ5SbANlqLQT
	+Tc6cj9w03D2Z3I5RJeHN5HYlyHwur2D7oCYA+8Xh6Yv8YRlLgxhdAflr/6jEDhHDdrj
	sJPA==
X-Gm-Message-State: APjAAAXsVb1ArfpXyCBbVXT6fy9f9+y37n2cZoqq84qiKjHFv3kU4Q01
	I+RAG5zWT5AL632LoIdMXmJxJaYwGSs=
X-Google-Smtp-Source: APXvYqyoxvNaBXl+fSo028Es76IKOaGvfgfKXOc0Kc+HNkaunmAV6ARpmymcvMHbXOEWbk/B25NJlA==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr30310816wme.27.1578271440075;
	Sun, 05 Jan 2020 16:44:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p17sm21227738wmk.30.2020.01.05.16.43.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Jan 2020 16:43:59 -0800 (PST)
Message-ID: <113ad12f2f746054692ed3843a9b359793d470bd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Jan 2020 00:43:57 +0000
In-Reply-To: <c5060a41-8348-37c7-7293-47a534182995@gmail.com>
References: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
	<c5060a41-8348-37c7-7293-47a534182995@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] sstate: Add extra directory level
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
X-List-Received-Date: Mon, 06 Jan 2020 00:44:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-01-05 at 16:41 -0800, akuster808 wrote:
> On 1/5/20 4:06 PM, Richard Purdie wrote:
> > We're having speed issues on the autobuilder due to the numbers of
> > files in sstate
> > directories. We previously split these by the first two characters
> > of the hash.
> > This change extends this to split by the next two characters as
> > well, creating
> > more layers of directories.
> > 
> > This should signifiantly speed up eSDK builds on the autobuilder as
> > the current
> > sstate layout simply isn't scaling there but addresses a general
> > complaint.
> > 
> > gen-lockedsig-cache needed to be updated for the new split level
> > sstateI.
> 
> I assume zeus worthy?

I think we need to discuss that. It is a fairly significant change in
behaviour.

Options are:

a) none of these
b) only this first change
c) all of them if we want to fix the 255 char sstate filename limit
issue

Cheers,

Richard


