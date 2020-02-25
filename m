Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 478D96027B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 09:16:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t23so2172675wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 01:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=W1pYs4H4oMSdnN6uhemH+eZrQj6XW9qsViXMpI2BnLc=;
	b=L5fqJTZSqpGkQXzZH4q7MkbibhXZQwfZCWkLaEG1rWMilfRppRJBk2onnhzKcUyA6/
	SPwq46UdrG/D3PY6hXIly0LWygsYb4LdBZ9Y9KtkPFDFWVMqr4DAmZWrGFY213b9Lbtc
	lZIZdF2X7dWagh90kw75+pKL01fM0SfO9f+RvL0pA2xECfezc79k0B6+kMk1dTaIuMOa
	25ZfS8JWFHLpSI4od+8HX45ox70AgxxCapNQAVTdO3DsYHwhm10MdB1tMO1SAjuKeVQY
	cdgoAsJPS6QK5apXNUFQssvZO/72RNNU1oOD1QpNUjXmdPGDUibKoENppM3VU+B4GTq2
	fgTA==
X-Gm-Message-State: APjAAAUApksSo3XUOCIadSxwSPw//HTvpWDM0t8kYtD8JEgGvoqY5sKe
	OurUU7DnDe9hb03qof80lNs=
X-Google-Smtp-Source: APXvYqwfdBGo+YY27lFFQIMrx/d9F51ynvk3eV51bZH2BY770PSGbcQ5syVSFxZzQI+bYRk3dUgMxA==
X-Received: by 2002:a05:600c:2942:: with SMTP id
	n2mr4038473wmd.87.1582622181842; 
	Tue, 25 Feb 2020 01:16:21 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a16sm23662503wrx.87.2020.02.25.01.16.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 01:16:20 -0800 (PST)
Message-ID: <861ecc2be15dcbfcb8cb5a6dac481561d235ddd9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Adrian Bunk <bunk@stusta.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Tue, 25 Feb 2020 09:16:20 +0000
In-Reply-To: <20200224220013.GA11259@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
	<23c396de32bb98414dcb2aaec178e73079e000d3.camel@andred.net>
	<b14a0847fffc79809e5fcef86d82b5a8abf3f9a2.camel@linuxfoundation.org>
	<20200224220013.GA11259@localhost>
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
X-List-Received-Date: Tue, 25 Feb 2020 09:16:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-02-25 at 00:00 +0200, Adrian Bunk wrote:
> On Mon, Feb 24, 2020 at 05:32:29PM +0000, Richard Purdie wrote:
> > On Mon, 2020-02-24 at 17:14 +0000, André Draszik wrote:
> > ...
> > > I don't want to penalise myself or anybody else by generally forcing
> > > a low number of threads either.
> > 
> > We didn't have resource issues on the autobuilder with xz but others
> > did report it and its why the memlimit was set. It would be better to
> > remove the memlimit for determinism really as far as I can tell and if
> > necessary throttle the threads count.
> > 
> > Maybe setting an upper limit of say 10 threads and a minimum of 2 might
> > given us what we need.
> 
> On a Threadripper with 128 cores and 256 GB RAM it would not be a
> problem to use all cores.
> 
> A laptop with 8 cores and 8 GB RAM is problematic.
> 
> > Perhaps we just allow the number of xz threads
> > to be set independently?
> 
> dpkg manually reduces the number of threads until less than half
> of the RAM is used:
> https://sources.debian.org/src/dpkg/1.19.7/lib/dpkg/compress.c/#L566-L574
> 
> In a script it would be possible to use --no-adjust to achieve the same:
> $ xz -9 --memlimit=50% --no-adjust -T32 /dev/null 
> xz: Memory usage limit is too low for the given filter setup.
> xz: 39,972 MiB of memory is required. The limit is 32,051 MiB.
> $
> 

The problem with --no-adjust is that it also prevents xz from reducing the
number of threads. It will do that in preference to changing compression
parameters, so as long as you have more than 2499MiB of memory to support at
least 2 threads (with default block size), compression will be identical.

> > > > FWIW we haven't seen variation on the autobuilder due to this as
> > > > far as
> > > > I know.
> > > 
> > > BTW, pigz and pbzip should have a similar thread related problem,
> > > according to the man pages, if you read between the lines.
> > 
> > Agreed. We have less of an issue with these as their use is much less
> > frequent. xz is used by deb and ipk for packaging.

They both actually don't. It's reproducible no matter how many threads.
Interesting...

> 
> Good point, dpkg does parallel xz compression and I am not aware of any
> reproducibility problems this causes.

Debian's dpkg tries to be clever by simply reducing the number of threads until
compression uses at most half of physical
ram.

I guess this typically works out as at least two threads in most if not all
environments.

Cheers,
Andre'



