Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2244E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:27:18 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.82967.1734445630682811695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 06:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wKEv4yQ7;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467a8d2d7f1so35138121cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734445630; x=1735050430; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI2LNbbWXZ9Z8FvzMKORI+2mntrd0zDfby+4DTRM/Fo=;
        b=wKEv4yQ71yN5o+HcdsV6hi5Jk3Kw3kEPRROQSNBb7gFPXw6d4NO2Mze1Q+aWv35/Ps
         l3iorPkGDNfG7jyN2gaFjPdfJnI/id6dGHmIRkjz+JpBgau3C2ImnVIRPH2pUj6tuu8r
         +6JeoFEz1isc/o6w9zm4eYKZImUB00kGdqwJZIIQ5MJ1ketCnqXMuT2zyD835rPFFab+
         nJiAsivbFbC6coBE6l5LNq38t8sX61I7RXNMFYW3LzJyo0GwZv0cg/+sVjFKTNUFHW0l
         rXpUWWJR8XO1MF5iSUCChXCq6uCq4k9IGlT/X1QNnI0MQjLYjLf3oQREmXqz7trd5txT
         tyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445630; x=1735050430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DI2LNbbWXZ9Z8FvzMKORI+2mntrd0zDfby+4DTRM/Fo=;
        b=e4+Ybsmuwr774s/cvx3wCPMezBEY90zilz1LBkpPRfFH7v0fZUaa+ouCZ4yDbpxwVm
         CkQs98NWky9JqBafd/M9evwggrg49uVwogARRJZ+RXZoukVbE1esNYi6DyPI5duRkHrc
         m5qrwmU0Sm8P4BRXQUyEW9eHqSey3IYwLjR38tHDb2aPHTZLoeayq7zorWtoUmUGCBR4
         G0/SGcZzVuRdTqECzpAMpPXtgVJaXWEwMVEG36QewpNBAhwr5Z3aFbyoWy5CZ9wpjpll
         JVbhLlymR/9BWsZCJxs9NlZYn9md77WkXN79KTPuxGEPcgQOgMEu4lrgYO6J85UBCjqz
         +BXA==
X-Forwarded-Encrypted: i=1; AJvYcCVyatgibZhS21OtpLA4/arhKsI/u3j8EhXVse3DQ32i5UMgD+4LF15r1Q34WIPK+UWlNyw1oje2cWrb1QGjhfvGlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtswXcb10nG5j9S8Zu49002G4IouqNu64z8nnro4dlXkrjC5Iz
	bLKWKtsv4wX1KbBXNkCVyJtw9YwF3z/2dULTuMAwIuJ7c2FNzXN4qxi8Cm4qGvE=
X-Gm-Gg: ASbGncva8+nkcS889rntwyJc5aMQu1upS4SvlXELU8YTQFY4r6/kCYBqVimFmRrzlqg
	pR8w/e10cfr8/MUxqtUqrAU9qz0QiOKvfrx1Yyccl70d3yGpsRrz9JxkFa159bZJiIcQ7l3Ir6V
	TF13LrO2jhggHbfKIrcIOr36EAWb1URuHaqpwenS1rKgKGIPN8zwWBaFtuEq59D4uGR4puww0aT
	oxHGLZlhzfwniy9AFJvnnKjvz2ums59z6uw9soFO8f+1r7TAbIz106n6c+NdsflagC1YD00c2f3
	vJ+s1/Xz5YB7bfIJ9ZzJe6+X
X-Google-Smtp-Source: AGHT+IGvSBGb0s9ts7j8uNQg+nc9snUQUliltK3uvCm2AoRcju4hA8fkjXsE12J4FKI9x3LHwrxfkA==
X-Received: by 2002:a05:622a:a:b0:466:a6e4:4c1a with SMTP id d75a77b69052e-467a5790116mr292898141cf.31.1734445629687;
        Tue, 17 Dec 2024 06:27:09 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2cbea05sm39380321cf.44.2024.12.17.06.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:27:09 -0800 (PST)
Message-ID: <2f8011f7-09db-4fe5-b66a-74ef2ba1cb0f@baylibre.com>
Date: Tue, 17 Dec 2024 09:27:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 2.1.3 -> 2.2.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20241216154438.2864156-1-tgamblin@baylibre.com>
 <D6DW7PTN19KR.GBZIIVS8HE7K@bootlin.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <D6DW7PTN19KR.GBZIIVS8HE7K@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 14:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208841


On 2024-12-17 05:11, Mathieu Dubois-Briand wrote:
> On Mon Dec 16, 2024 at 4:44 PM CET, Trevor Gamblin wrote:
>> Patch '0001-numpy-core-Define-RISCV-32-support.patch' is included in
>> v2.2.0, so remove it from the SRC_URI list:
>>
> Hi Trevor,
>
> It looks like this patch is breaking the reproducible builder on the
> autobuilder:
>
> AssertionError: The following deb packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy-dbg_2.2.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy_2.2.0-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy-dbg_2.2.0-r0_core2-64.ipk
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy_2.2.0-r0_core2-64.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-2.2.0-r0.core2_64.rpm
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-dbg-2.2.0-r0.core2_64.rpm
>
> https://valkyrie.yoctoproject.org/#/builders/37/builds/687/steps/12/logs/stdio
>
> Can you have a look at this please ?
Sure. I guess we shouldn't be surprised at these breakages by now :)
>

