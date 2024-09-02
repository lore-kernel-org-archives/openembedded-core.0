Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15F0CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 12:25:48 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.37446.1725279945238432187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 05:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sFLXmrae;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so46172831fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725279943; x=1725884743; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xfzAPNYCGFLnX9lZo4hvgkF7FP1Xly+F8uS8BL7yqZY=;
        b=sFLXmraemV64D1YSHBxMHq975ObvqJSGH5RpN/lM4sKHwX5mMvkR0nkEURLIiZbcJB
         uS8T358jqLuEmRE8iH2ORFSO05Pcgmn0zbbP45ioRkZAiY/G6EKMFfU6+dZDbSav5ZQM
         1XVr+yA2GOOwXHioQXs7X7Ej+TYgyCR2HVK5Mvrqm1KDPffweSxno+lyxY8EoPDOActO
         0hUai/6CDLx0OvX8xIXhs/Hr8FBC5GorXUAEzvXyw/othkKw6pELn7vXuW2lg9jL7gvW
         PYKRylZ/oMal4gXj7BKfHGiuVt9dzeVxs2StKao1mY4C2DS3TeBzQ8bLtC2v/u1HW4vj
         pOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725279943; x=1725884743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfzAPNYCGFLnX9lZo4hvgkF7FP1Xly+F8uS8BL7yqZY=;
        b=RuTiSW8TkgeBfgLOH9S5yXN42iUpkRvoj0AMI/RWKq5Ccsb/PnrTTdmPupmGop0K/P
         tKwyexCtxDYyLS6RqUNpdTF/M/Ll59Fl9clVCvfYmKYm9wJEtuLzc1aYm2h9Fot7+JHR
         pfrO7tiZ7zztwFyBo00onhsw157UrgVA8dnyJvy/tA7eIbnbsyhQ81ZEKUD+FIdTm2XV
         N5+OK5Ec0ALCeOw1odv8SHOuDy5Gv2iIcOj3lTd7VOIyYZd5WXroaIIYQSPIzLojEMhU
         tI4IKiBhRQ6PHRwBUfotBRMyJwOQitMgWP+w5cumJoGvGeLHO2moL0+Q49NuiSHbODFL
         HmRA==
X-Gm-Message-State: AOJu0YxiXBqMmB06GuzGgho0T5m22lyEwL68EpbpT6h7RVuO3Tbjh8Pj
	f2WUVrhQ5qq+2TivpqRHlAV76JS3wXrA7/EXchLQcDpxbabFWB+eQ1hOXYBHJpM=
X-Google-Smtp-Source: AGHT+IFcOOe7ibO435aEylLNTTmMDxE6wb8rWA+wgwJTD/XW3o9O08bxPPz4FXCL2VrMBMOCnM2+XA==
X-Received: by 2002:a05:6512:10cc:b0:52c:cc2e:1c45 with SMTP id 2adb3069b0e04-53546aff20cmr7409959e87.15.1725279942616;
        Mon, 02 Sep 2024 05:25:42 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac33esm1619025e87.102.2024.09.02.05.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 05:25:42 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:25:40 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <ZtWuxNNd9KNxT4T3@nuoska>
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org>
 <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska>
 <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 12:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204100

Hi,

On Mon, Sep 02, 2024 at 02:01:31PM +0200, Alexander Kanavin wrote:
> On Mon 2. Sep 2024 at 13.23, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> 
> > Hi,
> >
> > On Mon, Sep 02, 2024 at 01:11:27PM +0200, Alexander Kanavin wrote:
> > > Should this also have a wic based selftest or some other way to ensure it
> > > works?
> >
> > Yes, but that depends on the UEFI / Arm System Ready compatible firmware.
> >
> > For qemu, this can be setup using meta-arm and qemuarm64-secureboot machine
> > config. The patches for UEFI secure boot are currently in review and if
> > approved
> > I will switch those to boot uki binaries, patches are ready but not
> > submitted
> > yet.
> >
> > I don't know if poky alone can provide UEFI firmware to boot with.
> 
> 
> 
> Doesn’t ovmf recipe provide exactly that? Can you check (grep poky) if
> there are existing tests that involve ovmf (I believe there are but can’t
> check from a smartphone)?

I've checked and I have not found matching examples. We have everything working
for UEFI secure boot for multiple ARM64 boards and qemu, including oeqa runtime tests.
Currently the qemu side changes to support UEFI secure boot are queued to meta-arm[1].
They could in theory be proposed to poky as well but there is no
matching machine config for that. meta-arm provides u-boot and many other
firmware SW components, including fTPM. ovmf seems to be only for x86,
same for the meta-secure-core side examples for UEFI secure boot.

systemd uki support is really generic and not at all specific to arm
architectures. That's why I think it belongs to poky. Yes, the tests
need to be somewhere else currently unless test target HW already
has UEFI compatible firmware, but even with that the deployment of
signing keys/certs needs to be done separately.

[1] https://lists.yoctoproject.org/g/meta-arm/topic/patch_v4_00_13/108164747

Cheers,

-Mikko

