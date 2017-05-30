Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3A571B04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 05:28:36 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w1so5300338vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 22:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aub3I3MS0fy+JXHaUc9tRv7FMYkLpfqdWqih0znU758=;
	b=MpLK+6SDExxugD39NTD37rDZRoGR6Vg5kSk2CXuJ9QQKrM7gMcKu+A5whYQlzFOLIn
	mvNYAH3OdfmVHmuU6givpfy4ir07SBi1ZYMlfoNzrLUku+2FX7nscySNPBpJPg0TF3nU
	JwIU10umIsqd228vdVtbTx0l5fxtkvy07eKvjccLNijOrjFCZ9+bdqI0hLLTH5XF34k3
	1IJAjVyNL2/y4tacENDG06yf6wHnjQz81rIao1jEB9fSp3WiQnaj6+c/CN9KBt7xajnx
	GJxXYN7iG1z36KrR7189156BOT8ALxJJSBqvhKMbV0Smm+MhY4+c4pqonhzTqbPR5lBN
	i7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aub3I3MS0fy+JXHaUc9tRv7FMYkLpfqdWqih0znU758=;
	b=Abb3l5YqKSRB2QyKdci4zBob/94ZjQ/zgbzM+vZgo1nqq5eNBqk83rJH6Tun+puqog
	pQT9gbSFrrh6KYJe0hQaE/CIMmScanTkzLD83CaZy+Zd/jXm9grn/sJ5CFh9LjdGWhUj
	1KGsnKMnRF5nn7yaD35yxGDACZt+u74+LU1HVy5fMOW59Sz1VkjW6O60xpiGl5mUaLhN
	e1orhjWX8/Wh8o7dQBrFhzevGpq2FgCfDCHrSVuYV3P04tPV7IwSKZdTqCLKuIjVXkRS
	8obSrZICSw3fxL7//r3WwYYxSvTOcA88XoHZbb+P7WTw2zSVpdkA6Iqd4fi7cFv4kNSo
	j/rg==
X-Gm-Message-State: AODbwcDPre3IHcVghrvqtW9wY8NHgQ3IQcBW3IfJpE3QNqgTIajAQV4t
	ur+KG4h+r4KZ3VtdUewYcAsLMyFDyQ==
X-Received: by 10.31.89.68 with SMTP id n65mr7198670vkb.71.1496122118125; Mon,
	29 May 2017 22:28:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Mon, 29 May 2017 22:28:37 -0700 (PDT)
In-Reply-To: <1496100337.25229.147.camel@linuxfoundation.org>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 30 May 2017 01:28:37 -0400
Message-ID: <CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Tue, 30 May 2017 05:28:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for your review.

On Mon, May 29, 2017 at 7:25 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2017-05-26 at 17:22 -0400, Trevor Woerner wrote:
>> Somewhere along the path from OpenGL ES 2.0 to OpenGL ES 3.0 are some
>> algorithms that are encumbered by patents. These algorithms are
>> enabled with
>> mesa's --enable-texture-float configure flag. However, if hardware
>> acceleration is being used and the hardware supports --enable-
>> texture-float,
>> it means the hardware vendor has paid for the patents.
>>
>> This patch will add --enable-texture-float for any hardware-backed
>> gallium
>> mesa driver. In other words, if you are only using the software
>> backup
>> (swrast) you'll need to enable this flag if you know what you're
>> doing (which
>> assumes you are complying with the patent). Otherwise we enable this
>> flag so
>> the software can take full advantage of the hardware.
>
> Does this handle the case where the driver may or may not run on a
> platform with the relevant hardware?

The choice of gallium driver should be set based on the MACHINE
setting, so hopefully this is being set correctly from the BSP.
Presumably the user isn't building gallium with "swrast,imx,etnaviv"
then trying to run that on intel hardware! In which case, you are
right: the imx/etnaviv code will not be able to initialize the
hardware, and the code will fallback to use swrast (if it was in the
list).

> Some platforms add swrast as well
> as hardware acceleration which based on what I read above, may breach
> patents depending on which hardware its run on?

My understanding (from chatting with airlied on #dri-devel) is that
it's one or the other, there is no fallback: "the drivers don't
dynamically fallback ever"

If the driver can't initialize the graphics hardware, then it will
fall back (fully) to swrast... if it was listed. This makes me wonder
if "swrast" should be always added to the list of gallium drivers
built on those platforms with hardware-supported gallium drivers?
Wouldn't it be better to have the graphics system fail to come up if
something is configured wrong, rather than to fallback to software
rasterization and let the user think everything is okay?

Currently the OE code initializes the list of gallium drivers to be
built to "swrast" then potentially adds others based on PACAKGECONFIGs
which are expected to point to which hardware is expected. Maybe the
OE code should try to set a hardware-specific gallium driver, and use
--enable-texture-float. If, at the end, no gallium drivers are listed,
then the OE code should set the list to "swrast" and not include
--enable-texture-float?

If you're running mesa on platforms that have hardware support, the
"swrast" is not required (as is my understanding, but I could look
into this).

According to Dave Airlie, Fedora builds now include this option.
Specifically: "there is a fedora patch that mostly does that \n
disable the float just for swrast". Then later: "actually the patch it
ships now just bars float on llvmpipe and softpipe". This requires
some "reading between the lines", however. Of some interest might be
that Arch also includes this option by default (2011) [1] as does
"Intel mesa" (2012) [2]. I can't find anything definitive, but it
looks like Ubuntu also includes this option by default (starting with
14?).

Sadly, if we don't add this option, mesa's advertisement will be
limited to open gl (es) 2, even in cases where the hardware would
support 3 (and greater?).


[1] http://www.phoronix.com/scan.php?page=news_item&px=OTUxMg
[2] http://www.phoronix.com/scan.php?page=news_item&px=MTIwOTg

