Return-Path: <scott.murray@konsulko.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 307B078049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 17:38:57 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id k192so6088320ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version;
	bh=TW6+xi/wrKqNPcJsduarQCRFXNST9Kqe1zhSBBhhksA=;
	b=EWnJHTPMgyNp7i78ZhpTZMf4oTKERngQf/aJ5PiSIU/cyS05Hfmyz1ow3TX7EjTiTm
	YtNvivLR9bCaboTndbNDNWguhn099uizGqExkT97+dPPAfHaVnU6oxKwa6HYqmfJZgnq
	2cxQOYZxqZPqf1AuEMSz3KSI7waT5Q7/4Rvko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
	:references:user-agent:mime-version;
	bh=TW6+xi/wrKqNPcJsduarQCRFXNST9Kqe1zhSBBhhksA=;
	b=e8u/3F6UR2hip5UHpxMsD7oowWr9ZT5O1vuJg2wkR2SBxpV/WHmQt6Wgdxom/z/sKK
	Z+QE90PWSLJdGG9AKjv7ipsixN3PZKIcO7AzuYANQMPtRIE0dIMneyb3IK95S2kyeCIm
	28dpzY8hsjLRncGJtlH+YpKAThxpmDep75cEM2vWQmvmZ1o6F4Mc9cdpevKWwpoGJc8D
	f8BikMQBskMuvaDY1CSIEeTZeFmBbo4QkG11r31hb8gr8wRMA/U+q/TpjyssAnlTgQR0
	wZeKsOciCu0FF7DJnNdo9VYnqXad8CLnEKUf2IsVPoSMeGd3dt4VoffLID9SjSxikEgi
	PIYQ==
X-Gm-Message-State: AKS2vOw/xnbEfaaRTuxDEf0eJzy+B/Df2kGX/AbEegmmfWnP4P5E4b7v
	6p9CjJ79Z+T8P5Y/
X-Received: by 10.36.23.146 with SMTP id 140mr9641341ith.88.1498671538860;
	Wed, 28 Jun 2017 10:38:58 -0700 (PDT)
Received: from godzilla (69-165-244-87.cable.teksavvy.com. [69.165.244.87])
	by smtp.gmail.com with ESMTPSA id
	z64sm1455078iod.55.2017.06.28.10.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 10:38:57 -0700 (PDT)
Date: Wed, 28 Jun 2017 13:38:41 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1497868738.24449.41.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1706281335150.8288@godzilla.spiteful.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Wed, 28 Jun 2017 17:38:58 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Jun 2017, Richard Purdie wrote:

> I suspect this has been missed by some people so I want to spell it
> out. We have our first CVE in OE-Core itself.
>
> The issue is limited to binary ipks potentially exposing sensitive
> information through the "Source:" field which contained the full
> SRC_URI. Those urls could potentially contain sensitive information
> about servers and credentials.
>
> After discussion, I ended up changing the field to contain the recipe
> filename (no path). There was talk of filtering the urls however if you
> try, it becomes clear that sensitive elements can remain and no
> solution is likely 100% effective. The other package backends don't do
> this at all so this brings ipk more into line with them. Simply
> clearing the field doesn't work with the current opkg-utils. It can be
> changed but the change becomes more invasive.
>
> This fix has been merged to master.
>
> I also did take the decision to backport this change back to
> pyro/morty/krogoth too. I appreciate this can cause some disruption to
> people who rely on SRC_URI being in the Source: field however I
> couldn't see any other realistic way forward.

I noticed that this wasn't CC'ed to the yocto-security mailing list.
Was that just an oversight, or should that mailing list be considered
defunct at this point?

Thanks,

Scott



