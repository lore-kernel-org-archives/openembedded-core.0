Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF8DC282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:20:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.7366.1741339255930787177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=W7HoZf1r;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54954fa61c8so1781538e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339254; x=1741944054; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BvMYZtSbGvtW0/KlDr/alS+L/V3hW1blsVjQ9uH7jAU=;
        b=W7HoZf1r/adEVIgIwOi7mRrHpuRf0i6hdkkhHl5LLjLlCkqu7UU31gEW5c+/sxsx/K
         iK7R+T+M/+wxDc9eBckKt+nnKOFMGAJkvUK7249s8J52dA1BiDql/YGNs4+Zku8rEIiP
         lMBDQg+LkpmiFCCVsuqwpwYGZMbQbBLuJkzEpGgBnf5MX4SUTYzMad9hPKlU5ursJQ/R
         O14nvHUoCfvl2AfTWWA3NmeDFz5Q7k8QxzDk3KxYuIPRJQWKcDvsHghi3R0mudT+k+Gc
         YSHN+W/PJKFhCColt6KAeLVHzuL8VMZMU+VMyT9yV4tRVF/QVDF1R8Uqx6QaTpLN+HSl
         bTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339254; x=1741944054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvMYZtSbGvtW0/KlDr/alS+L/V3hW1blsVjQ9uH7jAU=;
        b=I1gKsHB+6pz6zqamLgT0qJUFaGawmavtn/FjY3BBlPGVK1L+TsizSNdPCuxHsbi1D0
         Za6VCNVHrHEkU4/Bl5lVGv6cKwMRhpda8x99d9mK0KERQw9JiPRMc3eQzNGstYYIj7Zs
         ++i/vDK91s1mx1dQ3gAspDh73/9Go7w9YHkvz5DgBQLjDT8E7d3TNJHgtUkEy45/vHtn
         fm8r3p+9pV/Lv1i3Endc9+WeTkzbI1VTpV5YmwYYDcpu/bqeXsmdQ5PHQZiWTE7byNwb
         6xsKpsDWrwrpg6H9m3nPXTev6jOC33Qr+rQCQbaEnJCbci5SqzsJi26nI1ytqJuWN8LO
         iu6w==
X-Forwarded-Encrypted: i=1; AJvYcCW3KlID7eS8NHGnC88IjSTjEv5pdD1wTwGNFhH5LQMSQhbfPrhmHI83EVxhadQx4e5XcI1qitz1RxVruC2lmLv/sQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5u52z+CieamR6JrIGgboOjqfLx+vUz08SIj8/4+0d0ZEE+qGJ
	t3W6hMXDz91uku1s1s6DHM7oFreYkdZMvscGyX3et0f66GZhUpXYSoD02nyTiKg=
X-Gm-Gg: ASbGnctupXDXcOXDwRKRCsMVAfnJb7kKOP2FrEVgLQ/u0SO7HdWM1YLrilC98vr9Cj7
	kgwue8fLB8zsIPqfbIN7UzH1B1pGwDH8Semr0LHmvccS//yQGueSIAVGSnK4A99GqVtVRFtxSpY
	en+TeTujzgNo2dhpTraUYOSG5GcuUJZZKgtYp8IMwDOt5EIYUuMgfKBWPTVkJlAfZTAvXmwn9al
	n1QF9Wp6oHKNwSjANYOJgewtwDbl6R1mp+MtNCdgucqYGjjbmYfa82aSviyljbk6tUVa63Mxr8L
	N6BEWVDmjQdh7YoVoDI5eMc5+zdCKBGjbQJKNj21Ki6EKWgtoezmT9WY2asjtqSmsPzKzLpfza4
	kAZ/vwy44XrrI2NcydOY32awz
X-Google-Smtp-Source: AGHT+IEmZKlLahCHiKK8w6mK0G4n7hwHpD2mOnjVdw6DuggFdJXe4bJC1IgzMS+jJrv3R6O37ScVRw==
X-Received: by 2002:a05:6512:3086:b0:549:8b24:9896 with SMTP id 2adb3069b0e04-54990d9da71mr924076e87.0.1741339254020;
        Fri, 07 Mar 2025 01:20:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c33bfsm428590e87.236.2025.03.07.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:20:52 -0800 (PST)
Date: Fri, 7 Mar 2025 11:20:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: quic_bpothuno@quicinc.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] dhcpcd: upgrade 10.1.0 -> 10.2.2
Message-ID: <b2noen4q3zwtrjzetuctxu4knvb7nvitnqykny6d7yc4hqouji@bdj4l3i5t5pb>
References: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
 <0ba2e2413c2573331e643f0021dc0aed964e005e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ba2e2413c2573331e643f0021dc0aed964e005e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212419

On Thu, Mar 06, 2025 at 04:36:29PM +0000, Richard Purdie wrote:
> On Thu, 2025-03-06 at 20:22 +0530, Balaji Pothunoori via
> lists.openembedded.org wrote:
> > This change includes:
> > a. upgrades dhcpcd version to latest 10.2.2.
> > b. update LIC_FILES_CHKSUM for dhcpcd
> > License-Update: Updated MD5 checksum for LICENSE file to reflect
> > changes in version 10.2.2
> 
> The key thing we need to know is did the license of the code change?
> The recipe says it is BSD-2-Clause, is that still the case?

Yes

> 
> Do we need to drop the fix I merged in one of your previous patches? Is
> it still needed with this version?

No, it was merged upstream and can be dropped.

> 
> Cheers,
> 
> Richard
> 
> 

-- 
With best wishes
Dmitry

