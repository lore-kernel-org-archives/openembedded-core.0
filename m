Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8696AFC2
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:10:10 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id r11so3261766lbv.36
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hIhwURpaKO414CpY2/Ah2tEiO04JOBoDlYIGfJn0CEY=;
	b=NaBDs5Wx0UGy6KsDKlDzofTzegmEHd+PS9uiwPXl+waLuaokdMFz67ppE0YLkBuwvk
	T5ZnvEoqlxhV9w04mLeSpTD42VfMm9SjoK5ySjkvn3bVwJZOn9GBSg3XHm+bwV6C2H2A
	UyADwe2yqBgV3/or/kbitqcsB4DssTmYMmvOCnaPQUOjSx5UGcOIS/bmjxgMsHaWZYOo
	Knxky/JPML2M/QOKCJBP23rsQ/yEbP1Tcvr34LycqklyKgt5exYbAHbaPqZK25AriI7z
	3bl3AKfaQLeyhCchK9BZI8Pgjbg7ek/es+KFfsnKT5PFXlW6aESf5pU1a2sR9vI6wJFl
	0MSQ==
MIME-Version: 1.0
X-Received: by 10.152.115.176 with SMTP id jp16mr3704391lab.17.1376061009958; 
	Fri, 09 Aug 2013 08:10:09 -0700 (PDT)
Received: by 10.112.158.229 with HTTP; Fri, 9 Aug 2013 08:10:09 -0700 (PDT)
In-Reply-To: <5204FDFE.1020100@pabigot.com>
References: <5204FDFE.1020100@pabigot.com>
Date: Fri, 9 Aug 2013 11:10:09 -0400
Message-ID: <CADkTA4OoQgqeM-pWrBvNmRGNLjCEh6x6MVEdatJhVTmiQMMV6g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto (dylan 3.8) arm and recipe-space issues
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
X-List-Received-Date: Fri, 09 Aug 2013 15:10:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 9, 2013 at 10:34 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> I'm trying to use linux-yocto_3.8 under dylan (poky at 899e5cc) for gumstix
> overo as an experiment.  Since there are no overo files in the meta branch
> of the linux-yocto-3.8 repo, I'm using recipe-space metadata.  I've run into
> two anomalies.
>
> First, in-tree metadata is still being found and referenced, which is good.
> In my case $KARCH=arm which brings in arm.scc, and arm.cfg has:
>
>   # Failure to use this on ARM results in lots of interesting runtime bugs.
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>
> But "bitbake linux-yocto -c kernel_configcheck" produces a merge_log.txt
> that has:
>
>   Using meta/cfg/kernel-cache/ktypes/base/base.cfg.sanitized as base
>   Merging meta/cfg/kernel-cache/features/kgdb/kgdb.cfg.sanitized
>   ...
>   Merging meta/cfg/kernel-cache/arch/arm/arm.cfg.sanitized
>   ...
>   Merging meta/cfg/kernel-cache/ktypes/standard/standard.cfg.sanitized
>   Value of CONFIG_CC_OPTIMIZE_FOR_SIZE is redefined by fragment
> meta/cfg/kernel-cache/ktypes/standard/standard.cfg.sanitized:
>   Previous value: CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>   New value: # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>
> and indeed CONFIG_CC_OPTIMIZE_FOR_SIZE is not set in the resulting config
> file.  This seems wrong, and I haven't been able to figure out how to fix
> it.  That it's not diagnosed by kernel_configcheck also seems wrong.

Definitely something odd going on here, we do want CONFIG_CC_OPTIMIZE_FOR_SIZE=y
to be in the resulting configs. BSPs can disable it, but the default is set.

Let me have a poke at this, and get back to you.

>
> Second, seeing in that file that various features are being pulled in from
> in-tree meta/cfg/kernel-cache/features, in my recipe-space overo.scc I have:
>
>   include features/spi/spi.scc
>
> because the in-tree metadata has that fragment with the contents I want.  It
> seems that because the reference is from a file in recipe-space the existing
> metadata from in-tree isn't found in this case, and I have to copy it into
> recipe-space FILESEXTRAPATHS for it to be found.
>
> Is there a way to reference in-tree metadata from a recipe-space scc file so
> I don't have to duplicate it?

Absolutely, use:

KERNEL_FEATURES += " features/spi/spi.scc"

in your recipe, and you'll reach in and reuse the fragments and follow the
kernel tree around.

Cheers,

Bruce

>
> Thanks.
>
> Peter
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

