Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D536F7F821
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 05:37:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j15so1536073wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 21:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c+1F9f+RQya/dioLWronTeSx6ZTddE6U08FzjeBp1O4=;
	b=h5K6GVsrBYavw6J/9midDBDqFpXC8ZFsMpWVP4OFTP1hm8+JCib6alLCHdZC1fMZ+2
	vIjRn2vhzKeWh5VVIwiNf5bdX2jAxbNmxeTW0UUQGCtQgQFJ2x3278tUvRmBXZDLyOJx
	BQH53s1JxAH/z6LjrZfC+1513zko198mlXOmhngnL04hG7i6SzrISyY/I1fRnln7qOz0
	MwOvh+AgrRYiweesXNr/wMAHq5E+nJKjBykUqmNutYO+MiBNqjPW2/HR1tMaFsKDQ580
	8TQ+CFUMFGD3z8p2+Q5UjgMfd0EZANyC86CiI3d7yGLVYQC4igHo92Zm798Euu6Gok6g
	g1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c+1F9f+RQya/dioLWronTeSx6ZTddE6U08FzjeBp1O4=;
	b=gdg9wil9BrZ4OCk9odp8RnPkDaNtOj8BQdMQmUl0zu73uI5Wc5FdscbM6O1zNLm9lV
	QzmDIdbaCe07URyv6ZRXu/vVx5pc4P6XeqCVIoBXYKuRVko/Eb3KreA6lylm3sbBF4QR
	RzMDDIPX7Ix66NOPun0cnSkLs7zyUEnG/vQpwG47QGtoPhH/YP7W8AdveSWWfduTX534
	RGaMQpQ/NXVmCmUk9b5yQJ0Sxe1ruLyZ8OGFkiToWn1oQpTVyFARyPkEpKu7N9Yozi9+
	J7WzKDH2n+wRmX4Oxk+MU+sKL1zlieMCiJ7Pjy3srxvInJSfNrDR7ZHxvCJXSCeE8goW
	zptg==
X-Gm-Message-State: APjAAAVU7uw2/wzWkktzMpJCyshyJ/Xufya2WIqESFeuw0gDd+enmqqe
	WfhrqhRoz5NHW0n3vJe7pjhZdTQinCpSE/TEVDgHrQ==
X-Google-Smtp-Source: APXvYqyb+u9iBNGezVpFRdnZxpwjXX7jyuvKKhQuhkFBIKtbTwSdGkr5AUXj2S31KOrx7zED1N0Nvl7EkXwGzzUa1QE=
X-Received: by 2002:adf:f40a:: with SMTP id g10mr1078250wro.228.1573105066064; 
	Wed, 06 Nov 2019 21:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
In-Reply-To: <20191106221250.GD14721@localhost>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 7 Nov 2019 15:37:34 +1000
Message-ID: <CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Thu, 07 Nov 2019 05:37:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Nov 2019 at 09:34, Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Nov 06, 2019 at 10:18:18AM -0800, Alistair Francis wrote:
> >...
> > +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> > +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
> >...
>
> That looks wrong, what would you put in TUNE_FEATURES
> for -mabi=lp64f when -mabi=lp64d is called riscv64-f?
>
> Also note that this is only the floating point calling convention,
> whether the compiler emits floating point instructions is defined
> by -march.
>
> It would be good if this would start with a plan how to handle
> all possible combination of RISC-V ISA extensions, ideally better
> than the arm mess.

I am keen to see this as well, since I am currently directly
hardcoding -march/-mabi in the machine conf.

It would be nice to see the ISA tunes available in oe-core, even if
that is just the tune features and not predefined tunes (e.g. like
microblaze).

Regards,
Nathan

>
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

