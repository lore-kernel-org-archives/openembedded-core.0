Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31905C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 11:57:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.12571.1746791841341069057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 04:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D3D8J1PN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso267515f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746791839; x=1747396639; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2bQl5Me6ROb8DNpfMYeM40D/vHAfH4DQJ2UIuVqoI=;
        b=D3D8J1PNqaoB/UG/dySO9lu0ZrRQzkKS5NQ542AOMPK/YfidbofMe22Jm24v6RWwJg
         eKVRce1B9jJVROkNYoXQ2f8Ni70E9XY+2FgUUYutX/qBsStPFi97onj1cIM4q3Vz7O/8
         JEBKJCo1l3Kf0IC5dQwm0d2hYZpeuf6XyaSMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746791839; x=1747396639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JF2bQl5Me6ROb8DNpfMYeM40D/vHAfH4DQJ2UIuVqoI=;
        b=eSW/uPB9cxcRFBU2BO0jWAo1K//RW5UdUzEClKm8axEGwo15E2pEReeSSYRkHPVhrA
         jA85fhXy1vRdRl0PfyMuN9l0oO9GvodmtXlGdjuoJqByyMOcvSpQRAK1YlB1vVaPTgjf
         Nf+aKKTmpy/lSBK6ojLzfv9cXRugz1ShnIWk7qn+ITp522N43cNzqPwCUyR1GzPUrspk
         nqSXpr4OE9s84DruA7oXrhhTFRXd0KkXhP9YCwevkL9IJQo+cqYug9E9oDMkxGmNFvql
         ob1qvzAZBk9TUhkTzKsK4XmDvoTxh7XbjsEckhwnaMty/pxS+nP6QE4ZqzupGpdYY/ht
         eIyg==
X-Forwarded-Encrypted: i=1; AJvYcCWdvEAGWMlGiPsFdUgCL4vqbPF1Rcal7BZF1WUTxbgvjCHi8KKyLPD5WKHA+SEHHQ8Hr6gwQ+ovoO2R0F0Fo4L9RQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbHNMDz790oX0PWObQ05A4+LEVaBwQCTyCK3NTOA0sdVextIsm
	OIAEApAEjQ4ROLBG1TZbHBIj5z8/rFxSGJ7PDD+VPSOjjGzGm0AjDjwDsIX4mAY=
X-Gm-Gg: ASbGncuRjPCA2AB7YsCGQ4qCi9FY/FT8DoBzqerlisBlRvlToa7v2hOOTC7DKVlgT6O
	idOU3dtJMUveN9gLJWiB78ehoukdJcIQgghMaEpDeCHx4wgwlz+nem0GnFM5eeRbLJXHsMkMFrm
	7L8uD4nNVoR8Lzyo59o5noIHSjQXBJwAbsfzkf4bZJ7fUk9cE4tF082YeIF7wLks1KcrbzUCMai
	gpRt38mIkQEyHh8qH49sVLWdQV1iltfLeHMu9F5p4H8un5DhlfcV31001r3lPaSK4w03theRJ3s
	ZV20ovrM1CkB1p9GPnYyjbK8stCNWHBlXQ30aXHtTkNuKpby7scah5+w5qXjsVJ3N4qXh39tOmn
	c9YB6JN8CKWFQAZhu+5auDQgVl5vt/lVoQne+LNmB
X-Google-Smtp-Source: AGHT+IHTeim4RLo/FnH2ClS6/jPs7/+XuvRq1N8IEjzoHnIjF4f+sgguMLuTBrpITauBAc7AV4raFg==
X-Received: by 2002:adf:8b53:0:b0:3a0:b1de:1be0 with SMTP id ffacd0b85a97d-3a1f6466002mr2157079f8f.31.1746791839265;
        Fri, 09 May 2025 04:57:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b9fd:97ba:4403:f351? ([2001:8b0:aba:5f3c:b9fd:97ba:4403:f351])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ed1bcsm27032725e9.18.2025.05.09.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:57:17 -0700 (PDT)
Message-ID: <96b723f484be3439194ada5add34185f321a7e95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] clang: Space optimize clang recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 09 May 2025 12:57:16 +0100
In-Reply-To: <20250507185827.843653-1-raj.khem@gmail.com>
References: <20250507185827.843653-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 11:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216200

On Wed, 2025-05-07 at 11:58 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> They can consume quite a bit of build space, we don't debug them as often

I did get some measurements before and after these two were applied:

https://valkyrie.yocto.io/pub/non-release/20250509-59/testresults/buildperf=
-debian11/perf-debian12-vk_master_20250509082553_2859d5fb9d.html
https://valkyrie.yocto.io/pub/non-release/20250509-58/testresults/buildperf=
-alma8/perf-alma8-vk_master_20250509082530_2859d5fb9d.html

Sadly the improvements aren't that large, particularly considering the
original impact of clang.

Cheers,

Richard


