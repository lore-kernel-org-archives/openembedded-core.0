Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64F727F2F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 16:57:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t16so3623141wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4r2LSqx2S/2S0i8L69qP3p8jjRWQN9I8Hc4nSCxylF4=;
	b=VKlDsTuq0phcEh3hXN1g6xPhR+t+rfsvBN2WFpaid3gXLmBHQOeBf7l/SrlgXtXWn8
	WU2mQrC69uqHIaUaA5IHdJyrkDoxH4HLtC+Eje34fVuCmW52Z2V8m7UEolIg3ySJkcw2
	BKd0IDuzBNINAxKHmXjKASjHIsDYmsqLGL6zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4r2LSqx2S/2S0i8L69qP3p8jjRWQN9I8Hc4nSCxylF4=;
	b=nUkozFiQAFZ/+Moc1obwmzBMVLIDbtD0XoqUT1Kg0m36TOhhqA9S4E0Qy/Pv9IQrUA
	mVKtEVNqYKuNinriZielzLGUyG1JEmJNdn8hnpp2+9ZPsrCKz1EVfJC5tIh2NZHADAMq
	P08HNDMXfK96Vxk17AbGRwfz3DGZVdLocHz3xtDXIrHyvLHIrkuaU7RzBdsWCWxICzT7
	VdKw5tF2FqAC84KhFv7bnoHZJk2Rt9OVXfave49YT5Q2bmaFicL07jEhKFHnTDBZPI4Z
	FKDUQ5CRTGdnuj68JduBhB59HQmuDZDkrDt4vzcCFP8uP40JCfQRRppij8tif3WS3y1K
	8QPA==
X-Gm-Message-State: APjAAAWI28lonl6G4DJXxxI5QHmRH66iQLKRq+peDtp1qMA3tSdxXWmS
	XVzm+40+7CFUUscpHEoHqoB9PQ==
X-Google-Smtp-Source: APXvYqwZVzMV0as24kIn1JQSgCfzyc2oN3uIDlRr44HjDd5NSk4Q0d4uhZy6au6e5XYFRRFtQ4+dNA==
X-Received: by 2002:adf:fb11:: with SMTP id c17mr3544316wrr.0.1567702631997;
	Thu, 05 Sep 2019 09:57:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r16sm3416450wrc.81.2019.09.05.09.57.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 09:57:11 -0700 (PDT)
Message-ID: <e492d6be1e469026e7132b3a6c78c2775c2eeca6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peiran Hong <peiran.hong@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Sep 2019 17:57:10 +0100
In-Reply-To: <20190905153846.11226-1-peiran.hong@windriver.com>
References: <20190905153846.11226-1-peiran.hong@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] diffutils: Add valgrind to support ptest
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
X-List-Received-Date: Thu, 05 Sep 2019 16:57:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-09-05 at 11:38 -0400, Peiran Hong wrote:
> From: Peiran Hong <Peiran.Hong@windriver.com>
> 
> The test "strip-trailing-cr" for diffutils package is skipped since
> it requires
> valgrind to run. This commit adds valgrind to the run-time dependency
> of
> the recipe for diffutils.
> 
> Signed-off-by: Peiran Hong <Peiran.Hong@windriver.com>
> ---
>  meta/recipes-extended/diffutils/diffutils_3.7.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb
> b/meta/recipes-extended/diffutils/diffutils_3.7.bb
> index 7daeee3513..2d763633b6 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
> @@ -17,7 +17,9 @@ acpaths = "-I ./m4"
>  
>  inherit ptest
>  
> -RDEPENDS_${PN}-ptest += "make"
> +# Include valgrind since the test "strip-trailing-cr" requires it to
> run, although
> +# valgrind is a heavy package for diffutils
> +RDEPENDS_${PN}-ptest += "make valgrind"

This effectively means "bitbake diffutils" now requires valgrind to
build before it. I'm not sure its worth doing that for a single test?

Cheers,

Richard


