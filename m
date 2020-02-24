Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 945776168F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:21:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g4so4238629wro.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 06:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Gr4uj+hkv3GlmkpNZorGHCcNL2aJ+sb41y3y5l3iXzE=;
	b=rd3z9c/s9gsrVdf90qbzelXPbBlfooGHv8gVP+YCiHSm98rMOwDR3ZBXDG4y0JiGT/
	nFGrtk+ZbpZ8Op66OG569KmacaCgf/fkVIqZclYamQEVHmSbN664HFoeA8zSUrwwUqQb
	i4M6tNcy3QuPpqrKSXQSB9MIdjYLT8iLREuPpjRHXKec+zCiG9ER7BZ4j2H5d7kJYOcI
	OhBoVI5wLtp0i/sBitSgiJm9fMBtcH85HohIBOsVz5q3FvUpiO+RXbT87PfaKAk7FvWa
	UxvzgnOo40+9g+nregccq0Mi7oeM0joUrjgL4SoiatFNfzR+Oy/Ssci/FiN/so1YfCLu
	+gxA==
X-Gm-Message-State: APjAAAVfLlAVg9E4x8L1O5u9dxo97U1fRRGK3IoickMqTEhNH2gWv6Cv
	ljxdbydw87wm1fjrzQZ6RhQ=
X-Google-Smtp-Source: APXvYqxj1gGp/ltAD+RDJuE28IrjQ0ovIqR7U4GmJsGiQJQyz6cA6mCkgy1FkDC50RTkRzJhkAkFgQ==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr16361820wru.384.1582554119249; 
	Mon, 24 Feb 2020 06:21:59 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o9sm19311833wrw.20.2020.02.24.06.21.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 06:21:58 -0800 (PST)
Message-ID: <6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Adrian Bunk <bunk@stusta.de>
Date: Mon, 24 Feb 2020 14:21:57 +0000
In-Reply-To: <20200224134022.GB27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 14:21:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 15:40 +0200, Adrian Bunk wrote:
> On Mon, Feb 24, 2020 at 12:59:55PM +0000, André Draszik wrote:
> > The number of threads used, and the amount of memory allowed
> > to be used, should not affect sstate signatures, as they
> > don't affect the result.
> 
> Unfortunately they can affect the result.

I'm actually aware of that, and was contemplating on expanding on
that topic ... I guess I should have

> 
> > Otherwise, it becomes impossible to re-use sstate from
> > automated builders on developer's machines (as the former
> > might execute bitbake with certain constraints different
> > compared to developer's machines).
> > ...
> > -XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count()}"
> > ...
> 
> Threaded compression can result in slightly worse compression
> than single-threaded compression.
> 
> With memlimit the problem is actually the opposite way,
> and worse than what you were trying to fix:
> 
> When a developer hits memlimit during compression, the documented
> behavour of xz is to scale down the compression level.

I believe none of the above is relevant in the context here, though.
The whole point is to avoid running xz again (within
a different
environment) if artefacts are available already.

threads and memlimit in particular are meant to enable compressing on
resource constrained systems. Allowing sstate re-use no matter what
threading and memory limit was set seems sensible, even if a build-
machine has more ram than a deverloper's machine (or vice versa), as
the point here is to allow sstate re-use to speed up builds.
The point is not to change the compression, or to invalidate upon
slight variations due to different amount of RAM.

It's good in particular to re-use the sstate artefacts, rather than
creating new ones, just because the build happens to run on a different
machine.

Once the artefact has been created, it doesn't matter anymore how it
was created, as long as the high-level options aren't being changed (like
an explicit compression level, checksum method, etc.)


> I assume 50% wrongly gives the same sstate signature no matter how
> much RAM is installed on the local machine?

Likely, but a different problem...

Even before this patch, you will get differing results, but this patch
doesn't prevent you from being more strict and specifying --no-adjust
and it doesn't prevent you from changing the compression level as a whole
either.


Cheers,
Andre'



