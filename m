Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 37B6B65C8A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 21:16:16 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id 51so49410385uai.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 13:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OKvJmFvrtrKDdTMzAipqncxCGM73OFodvtZGZy3ZJLk=;
	b=IXbe3EyN159U8+HPpdNfaMCgzkHbCg+eTiReFNPDPdEihATWtk78MN5IHEFEwrwizu
	Bqg/yZmx1kueZBeDr39XqqSLXQa7/aH2Xys/lU1o41bbxwdErn71VAVGnPBhg5MPJpG0
	4kPRdAfRDPYGgxAhEVAjJtJWgs3STbul1Y6KD+tSs1EGowSrOq5MWffwQ+HYkVBMmUYx
	VT8XWIe+Yha7YtAfGqD+nE5vBwU4NZ+2mAkKxhQQFs99XwirSLyMahUKqciWIdnpaBDT
	5D4yxaolK3xNswOlyTKtN74sX0PHgBxMIZVlvCkp6a1GCj9KJkryBLOD+tExx+lQzNsK
	2t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OKvJmFvrtrKDdTMzAipqncxCGM73OFodvtZGZy3ZJLk=;
	b=Htqwth9+p77WITdoUWmPLlOp9un4va+//czAxJjPthfdXaWEBZzFJPE9RepRQgvyq5
	w1rhWkn6RZStQpl2648WZ7OC2kXqq/eoQoURLRqB9QUauG8ikXGFV2E3ne1M+p8VSuNP
	NF4mOmhmeZZm7rnWcTUA8P1Vvzxqlzz785mmfE4ethj/VlcY58QPmzZLCqK1A4s39y5w
	OoBy5L4r+JhyjrdWZhnVPNVEFN2f4sXQy8DW9EHqAsOhl3upRKEErsSxQ4VpZYX1z1Yj
	iPBDVuv1NS1i5PyVid6ZlRc/P29kO4QUYp8W9MBP3OsQqrffM2wON5RGAPpB0GxsIN8U
	EvJw==
X-Gm-Message-State: AKaTC00Yfh2vc+QV0nZHFlEqzu+3eT28XtVNYIWVdnhw4VXFhTKJ3dHEx4gFyFLVZyBxsZORvZyyEH7Y8V9MZw==
X-Received: by 10.176.0.180 with SMTP id 49mr67218614uaj.32.1481404577934;
	Sat, 10 Dec 2016 13:16:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 10 Dec 2016 13:15:47 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612100630310.23762@localhost.localdomain>
References: <alpine.LFD.2.20.1612100630310.23762@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Dec 2016 13:15:47 -0800
Message-ID: <CAMKF1sp_R_qapapbcZ8mu-b1BumWekvKjA-QXUDLOTSWgOoXQA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can "IMAGE_INSTALL ?= ..." not be written in a more obvious way?
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
X-List-Received-Date: Sat, 10 Dec 2016 21:16:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 10, 2016 at 3:40 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   i've nattered about this before but not sure i ever got an answer --
> here's the last bit of core-image.bbclass:
>
>   CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
>     \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     '
>
>   CORE_IMAGE_EXTRA_INSTALL ?= ""
>
>   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>
> the first time i saw that (long ago), it took me a few looks to figure
> out what was happening. can this not be written in a more obvious way:
>
>   CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
>     '
>
>   CORE_IMAGE_EXTRA_INSTALL ?= ""
>
>   IMAGE_INSTALL ?= " \
>     ${CORE_IMAGE_BASE_INSTALL} \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     "
>
> is that not equivalent, or am i missing something? it's certainly
> clearer as to what's happening if people are perusing the code.

They are same AFAICT, dont feel strongly  about readability but feel
free to send a patch

