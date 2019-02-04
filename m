Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C9E876D9AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:09:57 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g22so10715052edr.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IgO40revaEh0bdfqMEmFxVOgTd8dygIulDeiwMioImc=;
	b=j7BPVIdyxe2gnM+i/AY/DDggxMS+cVmFII+P/pDVmYnvpnXQTrntV9z6J2IZpFPb31
	CGZ9UDEBrCpnoIKcRARZbuFreQ8kEhF3D1v+50Jtzi3eaEvv3qNjhV0aJDGf9mGQTmo4
	ATEv0nSPBaYngPOviyX9jV+EAM+aUVJxG9sT16i3dc6XSRvdA+Zt+6ObCdH2CHY/HoeK
	/Wz1Zq+Y+OJyIz4PGlT0M29DVRB4vJlYimILBgKA7whU+X0CAxhXT+wUhmqyC8b1l6TM
	571VY+N1r0IyggIZcHVh5dH8f3Mfoduw0uBCnkyzVzlUG3AQJpi8VlXoMvdCPjIccjSr
	gcRA==
X-Gm-Message-State: AJcUukcuoDfneAh9l+U2wNypoWzen3qE8cPlDsEVA4AtUcYDmFOAIwL5
	0ftrI9tRvL5YMAFcrR27pJXPmdsa
X-Google-Smtp-Source: ALg8bN4+7CzDrQ1VbJxQPyn9LSxSBBpyQa4favP2+lMdfXh24nRz3mT3ePfGyVN9cFHaGNT8dmG9RQ==
X-Received: by 2002:a50:ca86:: with SMTP id x6mr48562723edh.287.1549274998444; 
	Mon, 04 Feb 2019 02:09:58 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s36sm4259147edb.43.2019.02.04.02.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 02:09:57 -0800 (PST)
Message-ID: <bf21bddd5d05587008b9b0cf5c75e56b7ae5cf40.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Feb 2019 10:09:56 +0000
In-Reply-To: <6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
	<6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 00/12] util-linux: one package per binary
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
X-List-Received-Date: Mon, 04 Feb 2019 10:09:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-02-01 at 07:32 +0000, Richard Purdie wrote:
> On Wed, 2019-01-16 at 12:51 +0000, André Draszik wrote:
> > v4:
> > * update patch 06/15
> >   * unconditionally assign PACKAGE_PREPROCESS_FUNCS
> > * update patch 07/15
> >   * introduce update_files() helper function
> 
> Ran this in -next but we saw things like:
> 
> ERROR: util-linux-2.32.1-r0 do_package: QA Issue: util-linux:
> Files/directories were installed but not shipped in any package:
>   /usr/bin/x86_64
>   /usr/bin/i386
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install
> 
> (from
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267662/raw
> )
> qemuarm was similar:
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267853/raw
> 
> so something isn't quite right :(
> 
> I'll retry with a small subset of the series of patches until we figure
> this out.

Some of the binaries have symlinks. Originally, I've had a hard-coded list,
but that only worked for Arm.

I've now added patch 04/11 ("util-linux: one package per binary (pt 1b:
symlinks") to deal with that more generically.

Cheers,
André



