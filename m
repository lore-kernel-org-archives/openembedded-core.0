Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE8EC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 08:45:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.5619.1634114704803955988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 01:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YfECkepx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g25so5745437wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6Xzs89BYAcIvTrRBndLhMNSbhtU5auy7muCOQ93fE90=;
        b=YfECkepx3aP9cWI9yh5XkD54NR3JURvQ8wMsNiNZvWvYAdMVqCABq2eX9ez7FNJI9E
         B8+ROZgP9sc+hsU259tDB+k/0pyfjYizBmyHwKvfi3u0vi4j56/2Pu95K6+sP90be/Bv
         gMo7NO1sJMrZJ8E/NcOEO37MlA/rqdvIM1PHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6Xzs89BYAcIvTrRBndLhMNSbhtU5auy7muCOQ93fE90=;
        b=OeHd7tLCc2g5lcIRUW3RXSXoHDptHnVR4ZNwf9/XM7xhcptK/Cday6xfaY7ToKAHn2
         TsG4A2UykRvkEFGykF5aE9aC37S5HJtlbt/dgXnPva+aUnp2cxgUYEToX6OGFmEUPdKh
         UzGv243tIM1i9t+7AQEICwJvyuJPI836MJ2z8UOYwxmX7RudJdN66gp48zcXbEdZWq9w
         buUQMGnh7eRyDOoSt9Cqlylr8YiwW6a+EDkauSQyZLQzMIsQuu4W49WIdclEuSmI6cnL
         gzb/YiuFr0zqDAxdEn7psCcTBOhAbqCM6osO9gsFx/jS5rULwBXPPftfwqetOunCsGVd
         Csmg==
X-Gm-Message-State: AOAM530x1y6k47u9DmFPS9v8nob4+/0UFjVF/5HZN0gMJp/QjejoYqpf
	LMMklCqpPEKUus7rKCkGKGNkpg==
X-Google-Smtp-Source: 
 ABdhPJxtz5RpGNg2Dygxowe2TqTb2rbigMqQ9KdZRgnB04SojAf1KGUTqEppaR4b8DhpEMtNCiUiNg==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr11715825wme.127.1634114702993;
        Wed, 13 Oct 2021 01:45:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:65b2:89df:e6ae:44c4?
 ([2001:8b0:aba:5f3c:65b2:89df:e6ae:44c4])
        by smtp.gmail.com with ESMTPSA id
 j206sm2047747wmj.23.2021.10.13.01.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 01:45:02 -0700 (PDT)
Message-ID: 
 <e34be048ff6e037547bc7e0baf1c6d9f7d4e3e56.camel@linuxfoundation.org>
Subject: Re: [PATCH RESEND 2/2] glibc: ptest: Add support for running glibc
 test suite with ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>, Nathan Rossi <nathan@nathanrossi.com>,
	Khem Raj <raj.khem@gmail.com>
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Oct 2021 09:45:00 +0100
In-Reply-To: <20211013103522.3f15e078@ktm>
References: <20210930104357.3906-1-lukma@denx.de>
	 <20210930104357.3906-2-lukma@denx.de> <20211013103522.3f15e078@ktm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 08:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156893

On Wed, 2021-10-13 at 10:35 +0200, Lukasz Majewski wrote:
> Dear Community,
> 
> > This patch introduces new recipe - namely 'glibc-tests', which
> > builds and installs glibc test suite to OE/Yocto built image.
> > 
> > It reuses code from already available 'glibc-testsuite' recipe,
> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > to execute remotely (via SSH) tests on some emulated machine.
> > 
> > This recipe installs eligible tests on some rootfs image.
> > Afterwards, either all of them or only time related subset, those
> > tests can be executed on the real hardware, to facilitate validation
> > of this platform with for example Y2038 problem compliance.
> > 
> > By default all tests are executed, with 'ptest-runner glibc-tests'.
> > To test only time related subset - one needs to call:
> > cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests
> > 
> > To facilitate debugging, source files are provided by default with
> > the unstripped debugging symbols. Such approach would reduce the
> > already complex recipe (as it inherits base glibc one), so there
> > is no need to also install *-dbg and *-src packages.
> > 
> 
> Gentle ping on this patch set.

We're in the middle of trying to make a release. This change needs to wait until
after that. We're starting to work through that backlog but easier things will
go first.

FWIW I'm still very reticent to add in two code paths doing similar things so am
not entirely sure we will be able to take this :(

Cheers,

Richard


