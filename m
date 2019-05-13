Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 875757DEFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:32:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f2so739263wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 14:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=x1thHyIj/tgAkNlSEXUGIgnHb/TZCaqArGf5Xv+lBqo=;
	b=aPj5NVZ/+zH5jdL1Q1ny+bH2OFQpgGXzCa1dtztW1ciJvdaxAYi33ewqRo4le+wBsE
	xOWKBOYZ8E6u9Lvi7OFkmp9yB9yURnYZ7ZoGdBzlDCcgvU4+y3MCPApc48Sq4UpxWQaZ
	r+7LDYZj5hTLGCHGQ9Ic/xZQbVP7MYZbsQB+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=x1thHyIj/tgAkNlSEXUGIgnHb/TZCaqArGf5Xv+lBqo=;
	b=YhZvAKZoip8HxPeL49GyY68MfLMu9u67dRQXnYHen5ZZFmh+mA7c8C2T/b+5rpidJ7
	F06apjIjQg3DyxK8DLlUPT3cTmibtogTDT1LCyIhrEuZkvKMQCcYRgb3z3MXRFn5ncKm
	OWa4iwPSjQTWp4vjylmtaNWoX0MwuKII/zd8ajZXPEbstGwC4w8/HlKXnUfmKqiw6Wvg
	m+3qcZ7b76k7mCkmYlOHOTuDEw9alX3sxU8FVPup6rU4qDP5r0SaWBK0NrPazMVIraUM
	7apy84iztBph8bqpm3WSWWfULtmTxpVZQX2Wc1P6rOP4I9vDrNC4HUtmjoayB9b0OM2W
	Ezuw==
X-Gm-Message-State: APjAAAW9JF4nmyraXTwRdx8PfYE+djnBsqjK9jvo8d5SFYcANW/3/FVm
	ujPaU7IAwxOwJyaEh/KT+FEq+Q==
X-Google-Smtp-Source: APXvYqwSAJBdNPMeSJ4w+E8cuvtx0BCXWY1I3Pe66xSQyqiEHHFLGt73Rb8zkxSBebzRJmMd1nqQzw==
X-Received: by 2002:a1c:c917:: with SMTP id f23mr16181513wmb.4.1557783126172; 
	Mon, 13 May 2019 14:32:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n4sm1455857wmb.22.2019.05.13.14.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 May 2019 14:32:05 -0700 (PDT)
Message-ID: <285d0ab949e76f9c46049746918fccf50aeb3d09.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 22:32:04 +0100
In-Reply-To: <20190513154101.25386-1-akuster808@gmail.com>
References: <20190513154101.25386-1-akuster808@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] runtime ptest: refactor for future work
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2019 21:32:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 08:41 -0700, Armin Kuster wrote:
> This in preparation for being able to run and capture each
> ptest separately.
> 
> moves things to setup and finish functions
> breaks a few checks out into their own tests.
> 
> no change in result tool output.
> 
> Recipe  | Passed    | Failed | Skipped | Time(s)
> -------------------------------------------------
> openssh | 0         | 0      | 1      | 1
> openssl | 146       | 1      | 8      | 68
> python  | 0         | 0      | 0      | 22
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/ptest.py | 100 +++++++++++++++++------
> ----
>  1 file changed, 65 insertions(+), 35 deletions(-)


Failed on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/152

Cheers,

Richard


