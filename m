Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCBB7F815
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:48:30 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i13so27127962ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 02:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=saSTprlierzO3Qciw7XPcbf1nh+/hKF4hsEyGekG+zY=;
	b=hXdHYbJMWGNkfdPFvRr44kpwFre5jiqszc7e06V6bDFiPoeAsG11RagKfkArwmksin
	mnjci37dMLVEqKV19QICX1CxYajgY/MJgF3YLiVFGRCeo7XVvULdB2gMeTnyPUjkDJYZ
	AhhZRIFRVEJ4yTSbFDW+3ltuFkiYhxZna3GI+EiyiJQZ9gyNNQMHNMOwWTTcJeliIUT7
	LQcPyrqxMiiNDWN5qJvhRxZ5YLrN++odP+yTMGnXPrqWOdUIFE0Je1suUS9kzlsaTpdm
	jJBiOnm/n2LVtkAtY3wtpD7mdwCg5GeeLdvZLjI1Ae+a2XbFPZtRFOQ2p4pQGVl9nmgH
	4K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=saSTprlierzO3Qciw7XPcbf1nh+/hKF4hsEyGekG+zY=;
	b=CSOhL4QJqMkGZiV3wWRgLw3WEWsgfhchWAESDq8ylHv6bTQfs0/4ed2e7X0bM8bF6e
	c+gkdTGpLJWngtXZbuIovseqr2CcwGHX4YNX/b1LyIwL7FtSS5xtYVUse6VJ79LMNtIX
	fJlEQkcATr+Tt9xxb/du/6nY7VagIkaHuaZi9e8sRTSiST3Opbq9u+pVxMPfzifrBW0J
	IKEcuz8WX+BC0D2Q57CFqpk59Dbgl0GAkpFIpq+zYgFFS8afi5U23Ei6mC5qlSeS4t9R
	HwJcQjIWRrJjW+feggdi6znJyeQ9v1D6ntjISdkG2EG+i63NX4vn8khvIvonOvKM/xL9
	2CAg==
X-Gm-Message-State: APjAAAUdjZzZozxF0w5DJsQHFBfUraQg06knH1xRt+ywEiVB1bVTPqq2
	FwrOZPZ2TNBEUHQ2iGTimjS82KiT7Az82RKAwD0=
X-Google-Smtp-Source: APXvYqxX1j6VQM8NMb1+83xcUUQETiwyXR/z+/nMzk+IEis+hREL6DtxlIoP2lNk83aIxXtKQLnr0vxfc5mX6QSrhyk=
X-Received: by 2002:a02:94c6:: with SMTP id x64mr2425333jah.81.1574246911819; 
	Wed, 20 Nov 2019 02:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20191120091258.30350-1-stefan@agner.ch>
	<20191120091258.30350-2-stefan@agner.ch>
	<20191120103145.GA23054@localhost>
In-Reply-To: <20191120103145.GA23054@localhost>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 20 Nov 2019 10:48:21 +0000
Message-ID: <CAO5Uq5T_xA5XzyOmgRbPWBFoJZ3JEqzrnja8=xt8_eAV-nbjEA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] image_types: add Zstandard conversion support
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
X-List-Received-Date: Wed, 20 Nov 2019 10:48:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 10:32 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Nov 20, 2019 at 09:12:58AM +0000, Stefan Agner wrote:
> >...
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -59,6 +59,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
> >
> >  ZIP_COMPRESSION_LEVEL ?= "-9"
> >
> > +ZSTD_COMPRESSION_LEVEL ?= "-3"
> > +
> >...
>
> Why -3 and not -19 ?
>
> Compression speed is not a real issue, and AFAIR decompression
> tends to be slightly faster with smaller compressed size.
> Plus the benefit that smaller images are faster to load
> from network/storage.
>

I've been carrying similar functionality locally and at some point
pushed to `--ultra -22` and with a large image (~2GiB) the compression
stage then took literally hours. Not sure I tested with `-19` though

-- 
Alex Kiernan

