Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF23CF07DB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:07:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.39200.1728551224248548280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CBbmPM3L;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so924583e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728551222; x=1729156022; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YjnRUYrFImCK+IO9irSfHTCRWKTMmqU2ZAJqMAfgPA=;
        b=CBbmPM3LE4q3DDtbeRieQAWlBOTuXPw2xUXj8I02uqIo/+hp73NA5bqGMopHw2hpN0
         nRMiYCQYNjTQcavV1q5i1DwGI668667KXP8YIB+Dwmp/wt9bpz/W+HOC9pBP6mJNdKi0
         gY4eMu+cAErXZ8+YWfb+3GE0tPhwoYCRRDYu9VHQa8TKbDBNH+7bK6uPvGUSulHHSN+z
         UKqMW2L1VaKUnNsXg9+6Zm5qVTclo2NK/xOMR/fv2SXcwJ/7NekSFa3dzgMvfT1kwM1o
         SYUAQ2qgS1/BEIBezxuMh2ray4Yh9Z9GvvaOCZORAx2646gbL/g78am4Ax/ljs/ix+8s
         HSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551222; x=1729156022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YjnRUYrFImCK+IO9irSfHTCRWKTMmqU2ZAJqMAfgPA=;
        b=RchHsLNJi5rB/UjB7uGoU0Fs6MVqaBlhdNFf/fKiLpjE8osWFgZM0wljeN9FloS9A+
         pGrXreGwvHf/+Vejc+rLrh8ATrHoJJ7vC3ZNal14O5WZKOxyFHPRK8u/4wCaBzc/g0SU
         oHH+LqktROpExh+YBaSQhGS2Js2QGp1teUs/NtYkt1FAFUkl1/W5aqxtOksmYCBnLw3w
         HuCpgAgKv7VImfptBcQ2a1F80Er0prpkTzmMMpXls3GC1+NgzJBuBnYGZEE7fV1XyndL
         tNNV9Q1T2YblkWSF8Qk0mTUYw3B1roRUGEhTGM/Y3Pqys9CNC1KyurgYaPzdrB/B1q0p
         v56w==
X-Gm-Message-State: AOJu0YxgKLQcM9whOjTifQCrAuxiKmp1JMcgbdDcyydfO6d7diuSoabj
	He+86i8M/3/gCrbAp3HCTbB71CucHb9Pi5tPAfIJ9C6xXz31RrZp2VgzjA5kx7M=
X-Google-Smtp-Source: AGHT+IGf8GoJ/mEidNnUCa+eUuwtuLaKpsLHYxjeWYqeMyaWCAzYkXJ/Ung9mg02sfJgnfcBiWQOQw==
X-Received: by 2002:a05:6512:3189:b0:52e:98f6:c21f with SMTP id 2adb3069b0e04-539c48c3486mr3802518e87.16.1728551222306;
        Thu, 10 Oct 2024 02:07:02 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb905385sm168431e87.291.2024.10.10.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:07:00 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:06:57 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH v6 1/8] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <ZweZMcmlcxBHo5JB@nuoska>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
 <20241009112634.402123-2-mikko.rapeli@linaro.org>
 <CAAaKDhFczX1CosfjUj-vBOjcHyBt77XGZks+LAKJSr2SamXHNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAaKDhFczX1CosfjUj-vBOjcHyBt77XGZks+LAKJSr2SamXHNw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205399

Hi,

On Wed, Oct 09, 2024 at 04:53:58PM -0300, Ricardo Salveti wrote:
> Wouldn't it be better if this was a kernel class instead, similar to
> how it is done with fitimage (via kernel-fitimage.bbclass)?
> 
> I see a lot of similarities here, and it is confusing that one is done
> as a kernel class and the other is added by including in the image
> recipe instead.

Interesting idea. I'll have a look. Maybe this could be an improvement
on top of the uki.bbclass. UKI combines kernel, initramfs image etc
so the implementation can be an image class, kernel class or some
magic post processing (e.g. wic) but needs to be generated using
systemd tooling. Thus I think image class it is for now. I agree
that setting this up is not nice. Need to configure initrd, kernel
command line, kernel, systemd-boot etc and all the config switches
are independent. At least the selftests will contain a fully
working example so users can replicate that in their builds.

Cheers,

-Mikko

