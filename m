Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F46CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 14:15:10 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.943.1725286504491403590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 07:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nU8kKFux;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53349d3071eso5636304e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725286503; x=1725891303; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnH4mR2y31A4XKJIj8ve72voIfa2Upubn3kaO4Z28FU=;
        b=nU8kKFuxpccFuft6anX0Z+S5S8mEHOYGJG9lOPDAZURL9eNLi3Kq153l8y8DJP1T6N
         n3jR5dpEysbObJrkIiwLyEC/fx/s259LtVWoRMRcTQ7kTzbZLh8PtJuwUmY9zds789hY
         RsGxuBH7pF7i/gJrNxdoAQee/hj5XcJlUYSm81XniseJrTZIM6C1a0LoB9FkC+cj8BBh
         CzVVuNj81sb7yqXztOeoYVP9VTW4ZpeVVtX9wiLuaaimL/bvUKxPhdWBaYxobihN15/J
         BvrIskRiN5N+xwFrMaYF5Cq7Nb05JdxgPNIaBtr5ycTVIsXKh8K7oCShN+YNcNHavSSz
         5ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286503; x=1725891303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnH4mR2y31A4XKJIj8ve72voIfa2Upubn3kaO4Z28FU=;
        b=mfQglX2hIA26+mgapQTJ/s1LpyqCns1pQ9ymkYP1cGUjfEMuTN4Ibep9liJFKj8cxd
         FdRx0bsg4XJ9YB2TYPe7z5SZnmJ/ATcIWM3hMsxlBy6MhNVbqronk4FiopiVoIOsOtAu
         6pCHRF6E/wEm5p2OcwtsvKzcLfaeA5fWnqYDOEBvOXenz4zAhix40EAiu57bkMsueGsB
         aJEzgzHI9/WU9dwbdXGtmUCN02wjNz/xp/LRPGRo+53yq+wyYqJFAZ3P3KImM3n5oyey
         m6XL/Z1CLQRkNcjsridraN9BhEYgCQHLlWGwbDOvc2W3lE5HcH1fYurmWn0cOLLtvTAs
         49KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6UHXLqwXlbbm9ztVpZzTHavORE7YVhhmf6/hiQtZUSCIy5ncyJfUGV6rN9uYM1iGPb6vex+D9/iitCnqNSmJ6OA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCq0k0nuVjJSjmeuUodDHO9h93tNKqL8/HqJm85ng6shexF1/H
	vlH03lfa3/BbfkIzgORH1YVUlgWGaep+e5lEwJXbotUozXAyIsf3lSOiTit3eFI=
X-Google-Smtp-Source: AGHT+IFHcv7oIJHWcvkUwwx5Ey8+Um9vq0Ta6HjH56d+kBCM3QrCLPiY7i9mLjETtW03j0LWIu4EQw==
X-Received: by 2002:a05:6512:2247:b0:533:d3e:16e6 with SMTP id 2adb3069b0e04-53546b2d65fmr8527988e87.25.1725286501920;
        Mon, 02 Sep 2024 07:15:01 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827a1esm1624481e87.142.2024.09.02.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:15:01 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:14:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <ZtXIY7nwRpNJSVmx@nuoska>
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org>
 <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska>
 <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska>
 <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
 <17F16FAE8869E0F4.11433@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17F16FAE8869E0F4.11433@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 14:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204106

Hi,

On Mon, Sep 02, 2024 at 04:15:21PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Mon, Sep 02, 2024 at 03:03:45PM +0200, Alexander Kanavin wrote:
> > On Mon, 2 Sept 2024 at 14:25, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > > I've checked and I have not found matching examples. We have everything working
> > > for UEFI secure boot for multiple ARM64 boards and qemu, including oeqa runtime tests.
> > > Currently the qemu side changes to support UEFI secure boot are queued to meta-arm[1].
> > > They could in theory be proposed to poky as well but there is no
> > > matching machine config for that. meta-arm provides u-boot and many other
> > > firmware SW components, including fTPM. ovmf seems to be only for x86,
> > > same for the meta-secure-core side examples for UEFI secure boot.
> > >
> > > systemd uki support is really generic and not at all specific to arm
> > > architectures. That's why I think it belongs to poky. Yes, the tests
> > > need to be somewhere else currently unless test target HW already
> > > has UEFI compatible firmware, but even with that the deployment of
> > > signing keys/certs needs to be done separately.
> > >
> > > [1] https://lists.yoctoproject.org/g/meta-arm/topic/patch_v4_00_13/108164747
> > 
> > I've checked now. There is support for UKI in
> > scripts/lib/wic/plugins/source/bootimg-efi.py
> > 
> > and there's a test for it in
> > 
> > meta/lib/oeqa/selftest/cases/wic.py (see
> > test_efi_plugin_unified_kernel_image_qemu)
> > meta-selftest/wic/test_efi_plugin.wks
> > 
> > Which begs the question: why add the class at all? Does it do
> > something that can't be done by extending wic code? Can you adapt your
> > work to use the wic plugin using the above as example?
> 
> Well, I wasn't aware of those implementations nor do I know how to use them.
> 
> I can try to figure out.

So, this is a wic image format specific re-implementation of systemd ukify.py script.
Calling not systemd ukify.py but objcopy directly. No control over kernel command
line, but could possible be added with simple patch. I don't see how to hook uki
signing into the mix with custom keys. Maybe a post processing step to the .wic
image build.

Since this version is merged I presume ukify.bbclass will be rejected.

systemd is the origins of UKI spec and they host the reference implementation
in ukify.py. I would prefer to use those.

I went through quite some pain when getting uki.bbclass to work with TPM devices and
dm-verity from meta-security which involved splitting image into dm-verity image
and .wic image recipes. Now this .wic format specific implementation could
help there, but still leaves kernel command line and signing open. I would
like to upstream these setups so that other users could also implement
secure boot with UEFI all the way to userspace. Testing with qemuarm64 and UEFI
firmware from meta-security based on u-boot is rather straight forward once
details like where to store/generate signing keys are sorted out.

Cheers,

-Mikko

