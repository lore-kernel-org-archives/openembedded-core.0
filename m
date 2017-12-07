Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 909266010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 19:21:14 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id j9so5119873pgc.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 11:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nh1grVcW6xT1WiMn2U3wede9AvCdAw2U0SMQGk60KS4=;
	b=D88iMKi6MSKHgxFFq7oMwO/9LgUhJ1XVLDwU0jQJe8omcWXGfYxktn9ZzkhvNKPc43
	l15hSqJmZApk07U/aCkpzEykYI1LiDrMkDzafBKpWX+Y9j9vSLA9BU2wdam2E0ffshkT
	xHIPuNlXn7SMr1xPHr7BTfrmb5J9yxYTT2gHc8aTKqYASA859WMKocEgHtdeNYNF7WIi
	xy1ymfle0DRtY+uiBwnUpydvrXa5eB6VRYW75VoCcpEZD/748mcSGQAs+NsIQ8+RiFsZ
	P8Jo+CmO6m7fM/IoWd7LNbKeMZFiU55O7S7lT9Pg80fox2M4y9uP2+EBWjR5l48i3JGK
	96+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nh1grVcW6xT1WiMn2U3wede9AvCdAw2U0SMQGk60KS4=;
	b=oktorC+lMAD2XgQxnlObO7M4UL+726/MphIG+lOo33kfIkn0WImAoq5+AJqPCSBoHa
	1UrKvMRVlu26jwmtiqqpIvCuTXJ4NkXeqdCdU1Lgeprvh7yO63f3U/hLzlchI0qdm+qj
	HoxdBFUD152eLnKx9c+GaiL82i++pFJ8J09KYURl8cyeQpHyTOMhdNEQYgd0W2lUPvMX
	Jw0A8KbAXoM9RSIvF56t+3GhiGGJa+yu1NEIqJE2ENrXJWDnPoJXs8XthqV5K59dbkCX
	im62QtvJKbB8nC5qREWuOrLeBOSG0EhKSa8dnAKH4Wt+MSjPWxwfuhuxFiwsRSHdZJZs
	gItw==
X-Gm-Message-State: AKGB3mJeR3j0EbggjkM4mMhUmG3CgcZoXf4wuT8HU8UkYhdC/yQg3vY2
	v0siRWOL2eT9GtHlk//Z2Vc3sgGZyIcva/p741U=
X-Google-Smtp-Source: AGs4zMZ5wiNfK82KXU3AJesJYYcSxoNETaZ1j61lFL5+XhtrwhCxcH+JX/Lhx6b0uvaZiRR7Sq0IQBlAo4w997ej+hs=
X-Received: by 10.159.252.68 with SMTP id t4mr10416579plz.423.1512674475262;
	Thu, 07 Dec 2017 11:21:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 7 Dec 2017 11:20:44 -0800 (PST)
In-Reply-To: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2017 11:20:44 -0800
Message-ID: <CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel.bbclass do_sizecheck behaviour changes
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
X-List-Received-Date: Thu, 07 Dec 2017 19:21:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 7, 2017 at 8:15 AM, Mike Crowe <mac@mcrowe.com> wrote:
> I discovered today that our kernel size check has been ineffective since we
> took 7384d2831c713ac5999aca83c312154dc15cec56 from 2014 which changed the
> units for KERNEL_IMAGE_MAXSIZE from bytes to kilobytes.
>
> However whilst fixing that, I also noticed that
> 849b67b2e4820564b5e5c9bd4bb293c44351c5f3 in 2016 changed the consequences
> of exceeding the size from being fatal to merely a warning.
>
> This second change in behaviour wasn't described in the commit message, so
> I'm not sure whether it was intentional. I can believe that when generating
> multiple kernel image types it may not be essential that they all fit, but
> I don't really know what the use case for the feature is.
>
> I could fix this by adding to kernel.bbclass something like:
>
>  KERNEL_IMAGE_MAXSIZE_CONSEQUENCE ?= "warn"
>
> and then using it when delivering the bad news so that recipes can override
> it if they wish.
>
> Alternatively, I could treat the error as being fatal if none of the kernel
> images fit within the required size. This would degenerate to the old
> behaviour automatically if KERNEL_IMAGETYPES contains only one entry.
>
> Does one of these solutions appeal, or is there another even better
> solution?
>

I think default should be a warning with a possibility to be turned
into an error
if user wishes too. I think if you are generating multiple kernel types then you
will use all of them somewhere, so I would say if the size of one of
them excedes
the set limit them break the build.

> Thanks.
>
> Mike.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

