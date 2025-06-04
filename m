Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA958C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 10:10:00 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.13132.1749031799265436535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 03:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=E/9D18DY;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-551ed563740so8182391e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749031797; x=1749636597; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zmYOc/ue+uPuxG6JIQqbSvEbKq/TzcriJw6tUtT3+q0=;
        b=E/9D18DYRviYHDqsJB1YdbO0M1lxQ3xi3i4e7c4foFYKcr/qf1JdywzrhJrprt38/M
         6OVI038nKB9CFhWbvbzarnz719qK3FrHu3nQ/ZhXXACbUjX1W02mr23OAkwtvC4TY8QQ
         k+vhHCem7WBiUGZmsFnCrWcGI8wmc9Vf92KpmckVidS8u5Hh6Nnie1Fr9v27dTMUZgTA
         /GNwYqVBUwKRr1xdl8DFsct6Xf/Q4ldrV5cpMzezU+KZ530iD0JmIUF24uX3vvgLY5Ow
         jIpcAmPqJFsixNrgTTBsi7ObTRJ7tA5P4vfMfLpAKb+PARHU64twhswnUG/MhZLcyuPr
         wiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031797; x=1749636597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmYOc/ue+uPuxG6JIQqbSvEbKq/TzcriJw6tUtT3+q0=;
        b=dIPJSmMVar4NzrJkY/Ku1m2lUi61O3GoyhUkpIHY8wUcO/c3NkHQ+BnLHuhuIOp9Ds
         UYFaZh4iY13k+/VG6AN/Hv7Y/oGNkzDCAaoZiT2WGgH7fRQpDsy8QsIu4zEjdeA+aT3k
         uQ+iT3motXaDpo62ybKakETnrjjvpIkkI/q1On/sJ18Nlilhj+XlYJ1XVnUBSNEmrhOH
         NQ/A/0Wt5J1VhaGgXihqlY6Mbx6qF4G4PSv3ArFE5rUSHQzY9cZMf3cQ2ehvhIdmJGNo
         X4na6a11/zZKFMD08o0ezicBVw2HqbY0CWVAhn4t98ZRB7UUXh1l02AH/re1JUAOAQIs
         /DCw==
X-Gm-Message-State: AOJu0YyfHWhFCCPhhfCmnHX5PUzrw1gaI+rtgQvgS3K2SAnggpve/qP4
	TS/JOVGsXK25NCVPKH3JaGbtLTOCOZQso1G22HfhoXe+yUDycCx/Gvl4MFqbFsuLPNI=
X-Gm-Gg: ASbGnctFmN4NaJfP/sQ08hnEwSKk01SgmNQzOtB3/keCCOfiUq6ZSRIowWB83zMeoWl
	O7hK7bb4+o4/umitFeTkiCODUK+P++SLZ3+gA7ETRJMfshP+PfBSIMkBo38/3iDoZdzs1zq9ANG
	bd0nO6K9NcfH0JMBeGUw6iU1SvshphGdUOuaRINTF9t0LzzTRBThaTEP05iR+P/ZBtPgxZyRlE1
	fdstzLRESxgf6bffRcju4y94e0mvSArzqeSx6LQDA4GF2tKTF/+sjUSKqxWRb9pvpDGd9n1gQa7
	wWJsf1U87LXBsY36bvA0BxFqiF2+vXk0ybbXFFh9S/Dsulsh2euIw3fGv7sET7zgONvkTDkL7v+
	j/76skQ==
X-Google-Smtp-Source: AGHT+IEZyRn0zpABki+zGR/nIwq32kmIJLUf7sY5/qw1/7AGt1wN7FiqinKz+I4+8vi6rxqCLr/+AQ==
X-Received: by 2002:a2e:9a0d:0:b0:32a:85d5:849e with SMTP id 38308e7fff4ca-32ac72033a2mr6553341fa.32.1749031797007;
        Wed, 04 Jun 2025 03:09:57 -0700 (PDT)
Received: from nuoska (85-76-50-178-nat.elisa-mobile.fi. [85.76.50.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2d3bsm21294691fa.97.2025.06.04.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 03:09:56 -0700 (PDT)
Date: Wed, 4 Jun 2025 13:09:54 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v4 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64
 and qemuarm64
Message-ID: <aEAbciwMY_LS2AMU@nuoska>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250528005133.GP100073@bill-the-cat>
 <aDav-wwUJUIGGFVI@nuoska>
 <20250528141808.GU100073@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528141808.GU100073@bill-the-cat>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 10:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217898

Hi,

On Wed, May 28, 2025 at 08:18:08AM -0600, Tom Rini wrote:
> On Wed, May 28, 2025 at 09:40:59AM +0300, Mikko Rapeli wrote:
> > On Tue, May 27, 2025 at 06:51:33PM -0600, Tom Rini wrote:
> > > On Mon, May 26, 2025 at 11:35:44AM +0300, Mikko Rapeli wrote:
> > > 
> > > > Booting u-boot on qemu with kvm is currently hanging on aarch64
> > > > build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
> > > > disabled as a workaround.
> > > > 
> > > > To reproduce, build on kvm enabled host where "kvm-ok"
> > > > succeeds. For example genericarm64 machine and core-image-base
> > > > should then boot with:
> > > > 
> > > > $ runqemu slirp nographic novga snapshot kvm
> > > > 
> > > > On qemuarm64, default kvm setup will boot directly to kernel
> > > > and is not affected by this. If build enables u-boot as bios
> > > > then the same issue happens.
> > > > 
> > > > Without this config workaround, the boot hangs without
> > > > any messages in qemu output but ctrl-a-c to qemu console
> > > > can shutdown the emulated machine.
> > > > 
> > > > This seems to have regressed after u-boot 2025.04 update.
> > > > KVM boot can be detected from speed, for example genericarm64
> > > > boots in 550 ms with KVM and without in over 5 seconds.
> > > > 
> > > > Fixes: [YOCTO #15872]
> > > > 
> > > > Upstream u-boot discussion:
> > > > https://lists.denx.de/pipermail/u-boot/2025-May/590101.html
> > > > 
> > > > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > 
> > > I think it's a tad early to disable this. On the U-Boot side, it's being
> > > looked in to. In fact, you're saying v2025.04 is working (current
> > > release) and v2025.07-rcX is failing. At this point in the U-Boot cycle
> > > I think we'll figure out the problem and fix it. If we can't figure out
> > > how to keep all the use cases working for v2025.07 then disabling
> > > BLOBLIST here in OE can be thought on, I would expect. Thanks.
> > 
> > 2025.04 is affected by this. My wording for this is not accurate enough, sorry.
> 
> Do you have a known good version where it does work? I assume it's
> v2025.01 that does work, and an OE-specific revert of commit
> 53d5a221632e ("emulation: Use bloblist to hold tables") with appropriate
> status tags about it being discussed upstream would make the most sense.

As you suspected and Ilias bisected this to:

53d5a221632eeef7483d250fdde09bde6cb54df9 is the first bad commit
commit 53d5a221632eeef7483d250fdde09bde6cb54df9
Author: Simon Glass <sjg@chromium.org>
Date:   Fri Jan 10 17:00:17 2025 -0700
    
    emulation: Use bloblist to hold tables
    
    QEMU can have its own internal ACPI and SMBIOS tables. At present U-Boot
    copies out the SMBIOS tables but points directly to the ACPI ones.

    The ACPI tables are not aligned on a 4KB boundary, which means that UPL
    cannot use them directly, since it uses a reserved-memory node for the
    tables and that it assumed (by EDK2) to be 4KB-aligned.

    On x86, QEMU provides the tables in a mapped memory region and U-Boot
    makes use of these directly, thus making it difficult to use any common
    code.
    
    Adjust the logic to fit within the existing table-generation code. Use a
    bloblist always and ensure that the ACPI tables is placed in an aligned
    region. Set a size of 8K for QEMU. This does not actually put all the
    tables in one place, for QEMU, since it currently adds a pointer to the
    tables in QFW.
    
    On ARM, enable bloblist so that SMBIOS tables can be added to the
    bloblist.

    Signed-off-by: Simon Glass <sjg@chromium.org>

So tags v2025.01-rc4 and earlier are fine and v2025.04-rc1 and newer
are affected.

Reverting this is a bit hard due to other changes so for oe-core it's
easier to disable CONFIG_BLOBLIST where possible, on qemuarm64 and
genericarm64 (uses same qemu defconfig) yocto target machines for
example, which for testing purposes can be used with qemu and KVM.

Cheers,

-Mikko

