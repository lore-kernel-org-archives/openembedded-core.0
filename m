Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76400D3C908
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 11:05:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4471.1729335934313082880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Oct 2024 04:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FquNPNJr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so26412515e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729335932; x=1729940732; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcidMzNnkkNMr/BA/rnjrs/hYAXqkm1fzpKf1jUzO1k=;
        b=FquNPNJrw+tbffGtp96HuK3H+2yK7rFFuERSXfJ7BRYxkoZoi4k5ZgjULxg714PhDK
         i2/JtDH3qxsrR+N422EcGeoeERN0lUP1E+cLxOUnFNIoWD+OL18YTkQeQx2mwMX1kptp
         ZOOrPb1hn+AmcfjUZjkyunJc9inIxFzjp/etk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729335932; x=1729940732;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcidMzNnkkNMr/BA/rnjrs/hYAXqkm1fzpKf1jUzO1k=;
        b=P+cr0rw943o44rTMsa9q5NNIsHi0yrNW7RCBVmVCGjEmSB0FBQWuWMEGTYb4LFU0R+
         Ulgwf5MTP+aNggLsy/kBzcXo8R9rfvTP/T+e08yYuhl8UE54KJuOVJtrEB12Vzq9AC/i
         FK4VWy4Hr2pPFgJpWdZ2NVdeDAVfnpgLasPrnyhgqvlqWsuDkpapELE2j/zJNI450aLY
         g51knLAG+yaT5AaAmtKmzjwkWbhwd+aawnrRlCWZsYAduwkGcwBTLt/DoZeMvv7iAj8e
         XiBjXXELnfrGxzBqlvhuV3qbT/lvjC5JR7iyCCT7sxExznamVMGnhpFei0tV9B/H3vhj
         FLpw==
X-Gm-Message-State: AOJu0YxYiPq/JqZdfWlmPZKh6zdytBMfJUkaafq/sfNQFVJr6Avkseav
	v7YJ98r0wK84Ybu5Iwkzx+hEFq4JZlEWSenXaSuSNLw25ny+cK371Yi+r7B5Oo1hr8stolkjIJw
	F
X-Google-Smtp-Source: AGHT+IFk4l8KixcVSWp9/gQ0UkDJbiC8dVwcOZFK3adUv1l1jXAxX/Obqh+dsaRl2xmcymO5DsTO3g==
X-Received: by 2002:adf:e745:0:b0:37d:3dfd:cd92 with SMTP id ffacd0b85a97d-37eab727fabmr4121927f8f.28.1729335932192;
        Sat, 19 Oct 2024 04:05:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d275:580c:d39f:fb71? ([2001:8b0:aba:5f3c:d275:580c:d39f:fb71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0edc7csm4167960f8f.85.2024.10.19.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 04:05:31 -0700 (PDT)
Message-ID: <b950f28016d4a59baf20047279b33f07182c97be.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 19 Oct 2024 12:05:30 +0100
In-Reply-To: <17FE0CA1425F2338.24631@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 11:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206082

On Sun, 2024-10-13 at 16:26 +0100, Richard Purdie via
lists.openembedded.org wrote:
> I've spent quite a bit of time trying to reproduce/debug this:
>=20
> https://valkyrie.yoctoproject.org//#/builders/35/builds/216/steps/14/logs=
/stdio
>=20
> 2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS -
> runtime_test.TestImage.test_testimage_apt: FAILED (218.02s)
> 2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS -
> runtime_test.TestImage.test_testimage_dnf: FAILED (155.47s)
>=20
> on debian11-vk-1.
>=20
> I've a successful test and a failed test testimage output for
> comparison:
>=20
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
log.do_testimage.1487387
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
log.do_testimage.3323465
>=20
> along with qemu serial output:
>=20
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
qemu_boot_log-fail
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
qemu_boot_log.20241013104106
>=20
> I've tried rerunning that exact series of tests on that worker with
> no
> success reproducing the issue. The image was overwritten by a later
> test so we can't retest the exact image. I've checked the journal on
> that system and there isn't anything related around the time this
> happened. The two failures were on different network interfaces and
> both interfaces work on later tests.

This is happening on most builds on debian11 for my test branch. If I
add new changes, the issue doesn't happen so it looks to be timing
related and needs a populated sstate cache.

I put auditing into runqemu's tap locks codepaths and the devices are
being locked/released correctly, there is no duplicate device usage.

I also went through the non-tap/tun codepaths and I can't spot any
issues, we do use slirp in some tests.

Since we have a trigger point where we know it is failing (the runtime
ping and ssh tests), I added a os.system("ps awx") into it. That gave
me a process dump of what was running when this happens.

https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/3/=
log.do_testimage.3603268
https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/3/=
log.do_testimage.3902903
https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/3/=
log.do_testimage.4042146

From those we can conclude that there is only one qemu-system-* running
using the appropriate interface. I couldn't spot any other particularly
untoward processes running. That tells us a lot of things it isn't I
guess.

In addition to the ps, I've now added a netstat -tunape to see if we
can see something holding a network connection open. I'm wondering
about our httpserver used in some tests, or debuginfod, or something.
That build is ongoing.

> I'm open to ideas...

I still am, this one is proving to be a pain...

Cheers,

Richard



