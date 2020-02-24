Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE0C61681
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:44:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p9so3567wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 08:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HqeLbEsSAuj9Tg1HR5opVECmWQwgD2KeAJUgtyB+OdU=;
	b=OtKN+XfV0GPvdPBOezcV0roKd7Dq4KwoXQ/Slu3T5M/6NhGmeIAu5+trLpJAPm2KS8
	zcdpf33Pt6uLjTHSsDfHBZ9Xfo1B8BAkdbqAGjSCsmy+8j+2xJXIuJOKStNpyvQ18ytT
	zbOQtx97I7X/0tkjt4tgrw1wNYRob56sBokg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HqeLbEsSAuj9Tg1HR5opVECmWQwgD2KeAJUgtyB+OdU=;
	b=icyMRka9zWcDuNRlaKsHxcnsOJY5a2Hlduh0vHzy+HD8N/7NRSsnsQ0sguXXqPk31/
	bIAOZ4gv5CrqjuwGQLhJbMvNHDwCmn4VIC9QPwqAjL5TgawSTu8SdRtyBsURt/DN+uE8
	dmGe1DbVEkV6mvB7Tj7VcirF+Z1L/4xGeorMU5xGlYU5l//Ql2bSPJLBb3whgQQmRGKN
	+wq+XFefVmCLdDdO3J/gCIkL/qEt2cz46jVdunZ8bS+hp1r5UyWtpyZZ/uIWP0EqQgTY
	r5ovhcFFmBdkzvc+AihGS/cuVqKeM59kbwHTITYdOZIslvgZktlpYBES1TRUlICJedPN
	0YRQ==
X-Gm-Message-State: APjAAAVFHNPigAyUDRL6iJcZzSdmxyuneiz5rNTWq60dxfeUxCAP9WwO
	d7yq/XzBDXV5GvmppKLMuCMi8vTqc8M=
X-Google-Smtp-Source: APXvYqz6VCcPXFApg2qwcaij9valuIHIyNDvYBcavAJHJvLaByPHjTlMnfiIr0/ZRMZU5P9Al4b+Vw==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr22358084wmn.47.1582562670094;
	Mon, 24 Feb 2020 08:44:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l132sm20198137wmf.16.2020.02.24.08.44.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 08:44:29 -0800 (PST)
Message-ID: <669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, =?ISO-8859-1?Q?Andr=E9?= Draszik
	<git@andred.net>
Date: Mon, 24 Feb 2020 16:44:28 +0000
In-Reply-To: <20200224134022.GB27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
User-Agent: Evolution 3.34.1-4 
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
X-List-Received-Date: Mon, 24 Feb 2020 16:44:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 15:40 +0200, Adrian Bunk wrote:
> On Mon, Feb 24, 2020 at 12:59:55PM +0000, André Draszik wrote:
> > The number of threads used, and the amount of memory allowed
> > to be used, should not affect sstate signatures, as they
> > don't affect the result.
> 
> Unfortunately they can affect the result.

I looked into this a bit and its complicated. The threads are used to
compress chunks and their compression should be deterministic whether
done serially or in parallel.

I did some tests and:

xz <file>
gave equivalent output to:
xz <file> --threads=1

and

xz <file> --threads=2
xz <file> --threads=5
xz <file> --threads=50

all give different identical output.

So if we force --threads >=2 we should have determinism?

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
> 
> I assume 50% wrongly gives the same sstate signature no matter how
> much RAM is installed on the local machine?

I did some tests locally and I could see different output checksums
depending on how much memory I gave xz.

Perhaps we should specify a specific high amount like 1GB?

Does anyone know more about the internals and how to have this behave
"nicely" for our needs?

FWIW we haven't seen variation on the autobuilder due to this as far as
I know.

Cheers,

Richard




