Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D64A7E3BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:29:59 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z6so2655090qkl.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 16:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ecd6AD2pbmr9xcR1IpJ0uSZAazFp/JnzLVHI01ILZd0=;
	b=NisfOMMUpl9rCbBBnwqiyAs/pz4GvT9xTOBzzNx3+IXYjoz4G+ZKkE+mheT+umri6i
	iEraNnwUFT2T/3gwUaSRugDG+0sM408zM5A8qZe7f0WFNzwxAAOZ0rjNGDGNKAdV8cGa
	T7lm6lhTTnTYtQMGz3LTbxHH/y/CjUIZ8cNkDDnYcHePMSB6Vi+Q0oP/Ew3+zxkc/wyg
	HwiefTAcoQ+UgcnJd1CMrQLy6DVoxuO4o9S02KxWzKoPB2D2kRUUVKyA35Dn2V9J6cm4
	NPF+UfAmL1kxCtHS9GGHaDx8ypX6OI8e3PAEaBLXbVXDeFUGyPndnWyI6DpDr9d6DCb0
	ntzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ecd6AD2pbmr9xcR1IpJ0uSZAazFp/JnzLVHI01ILZd0=;
	b=emZTws5SRqopQkaRzoQrY+fhM/0Jz77jIfhLXxSm9YsqeJHZR4R/BbAAP9fQb2dQFe
	DDyWqxh5BPe+BZBw0Afgt/0kWb0FvJdj50PXaUDncnDjUg/3kw+2YzKwMXK4A/jApELt
	UPFD1UYr28CgdZroLNcmF0J1gFODmspZGLQ7O50zvW0fE05zYut8sHdu7erxQ4sCpzV7
	ndCcpGNDUmmX1t2tjyG+hnIzSj7H1s41Em0ARGFEaAIkSQhxI3RCnnDsLigE8X65z2f2
	iwOi2rzIyg/ilA9rM6i+FJH2JaKaXSSJXPoi+FwyRDd9ZRn4TMM9nGcy0HVr4yHRVkt0
	zs3g==
X-Gm-Message-State: APjAAAUM4SCiOZ7UbghAysbJANVZkaFTicnXX56LYIfPzwxdlJDdVUKV
	fgEj5qagBm/ahxHj+J5lmJ9nOEysGrl0X/GN/lwFJOR5
X-Google-Smtp-Source: APXvYqzrk7ml5N04aCoc+r1LRo/secV/RzTOeFaGtRVqYNlEat1VGCbHDCngKr6HZPY5dsPVPTyJXP+fi37i+jrVlNs=
X-Received: by 2002:a37:b287:: with SMTP id b129mr63148325qkf.20.1558567800061;
	Wed, 22 May 2019 16:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190522013228.7591-1-raj.khem@gmail.com>
	<20190522013228.7591-3-raj.khem@gmail.com>
	<20190522064909.GA9621@localhost>
In-Reply-To: <20190522064909.GA9621@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 16:29:33 -0700
Message-ID: <CAMKF1sqj0+y_55xVf6SRjS1czodtioUYxVv1tbWU4_7AKYrzLw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 22 May 2019 23:29:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 11:49 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, May 21, 2019 at 06:32:28PM -0700, Khem Raj wrote:
> >...
> > PN and PN-binutils is not empty anymore on musl
> >...
> > ++#if !defined(FNM_EXTMATCH)
> > ++# define FNM_EXTMATCH (1 << 5) /* Use ksh-like extended matching. */
> > ++#endif
> >...
>
> This might fix the compilation, but it is horribly wrong.
>
> It passes a flag to a function that this function does not understand.
>
> In the best case the function returns with an error on unknown flags.
>
> In the worst case the function does silently something different from
> what the caller expects it to do.
>

I forgot that the API is provided by libc here so mimic'ing the define
infact could
cause pain. I think its better to nullify it in this case where it is
being used in these
files.


> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

