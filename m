Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33E5CA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 07:56:56 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.44832.1725436607537122474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 00:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d9RKQzNN;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso10922150e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725436605; x=1726041405; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ImFmK+UlEFLXFS/GmiGjJrn7v1u5H0iDBH81l7MRutg=;
        b=d9RKQzNN5WkOhWwYsvnfdp22PUMWtfag17L58WMBHl0n7mJkTS1NCWGc/aVIihObt+
         q0z3w+yExwq/Q5JBCeCSorwPWmouqyFMSWGIVUREPgn+8pM/FpG7fn69QjOfrc0pjLW/
         1SBROVGhN8mbO5OrN1d5sNMggAgwmlLnXP/vbcd1A7F7uCTeQrmGjC/WghJqg7VVIaft
         gV1qlXY0KrAx3zIX/v1G0MFZRjMiDFfFqm4i4S0JcdlNlaSwpxLoKXN7DEh6CtmFzzKi
         i/WMN8jTp5PgCyL0a95okczB26yLfKRm07dvVkX48SRGQmF2Onm7kJ9J99FfOfuwGzTl
         +Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436605; x=1726041405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImFmK+UlEFLXFS/GmiGjJrn7v1u5H0iDBH81l7MRutg=;
        b=PJ8U9Ek6KTvGqJ0a9etFCM5IwakEX4UBSrGSGTeWbj8BXTvCGBoogu2096fSZOoG8c
         +8xP3p/ywqpnvUiSUU0gAJzOB6KEHW1A1IWYyeU4MCk/JHvfrxJENFPYbXkxz+L/0201
         eFnrapJNcy3y6NjzCsmour6CUEUVzWYNFkeoH8Esqc79YS0aMWPb879rITQFSSsouMZz
         WpKVt4HsK1uNE2L4wDjtFgT+EySV6u5pNmJZWjgv1lGRNL4yX5GDwQDdLsDGDpbcGMd8
         xS+rKbkLrqpzsL2wmob4MnyHUdHCaCzmnqxBeKYIq0R0DA8ILWgcO4WyFsbxmM7sCPEW
         /Rkg==
X-Gm-Message-State: AOJu0YxPDpjqZ2u9mekKvoW3MMCd3aVWUHa4JZa6a0sOFOXyXe63+jEt
	ChFHz0ocuFEqAMgaEFCuDLWIdbZyxBww+p5SO9y1gEqxYPG7Hyu1WvPcu8HWNJ8=
X-Google-Smtp-Source: AGHT+IFVyDGERRJV2ey5n45B9z68C4oLxZYWQs1Ododa85/QuY1EQqEty+ACia4iZxwgLy0jWsqKEw==
X-Received: by 2002:a05:6512:440a:b0:535:6892:3be6 with SMTP id 2adb3069b0e04-53568923ce2mr649939e87.54.1725436604539;
        Wed, 04 Sep 2024 00:56:44 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827a4asm2272896e87.131.2024.09.04.00.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:56:43 -0700 (PDT)
Date: Wed, 4 Sep 2024 10:56:42 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <ZtgSunyGsn1gtMfF@nuoska>
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org>
 <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska>
 <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska>
 <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
 <17F16FAE8869E0F4.11433@lists.openembedded.org>
 <ZtXIY7nwRpNJSVmx@nuoska>
 <CANNYZj8rA+unjecEiofA3Ht94Y2mqBygLnBP-rWEeZPfEEq+Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8rA+unjecEiofA3Ht94Y2mqBygLnBP-rWEeZPfEEq+Kw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 07:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204194

Hi,

On Mon, Sep 02, 2024 at 04:30:53PM +0200, Alexander Kanavin wrote:
> On Mon, 2 Sept 2024 at 16:15, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> 
> > So, this is a wic image format specific re-implementation of systemd ukify.py script.
> > Calling not systemd ukify.py but objcopy directly. No control over kernel command
> > line, but could possible be added with simple patch. I don't see how to hook uki
> > signing into the mix with custom keys. Maybe a post processing step to the .wic
> > image build.
> >
> > Since this version is merged I presume ukify.bbclass will be rejected.
> 
> Not rejected per se; I would suggest that the existing wic
> implementation is rewritten to use the class (and hopefully becomes
> radically simpler and shorter)!
> 
> It's fine to not be entirely backwards compatible; this is master, and
> we can break things.

Does the implementation have to be a wic plugin?

wic is another wrapper over bitbake and I'd need to teach openssl native
and python3native things to it which seems a bit too much. uki.bbclass
is much simpler and wic can process the produced .efi file when creating
the ESP boot partition. I can try to fix the tests to work with uki.bbclass.

Cheers,

-Mikko

