Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id F28B57D265
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:26:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q16so4843078wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 13:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=0svf6u+zq9YvzEcx81414j8V6GFCi2snh/CIG/gUDf0=;
	b=Ak2T/Me1Eh/SLyPhictFv5BJIHACJ6yfB5qOfDF6xV+URQJpvfFwW7sZRArmoQXuYo
	ckmzVTPJESjwYpsIUq8isxF1QbB+dSslm6zgbIJUwugjrMJILHdsJ0hwIL7St6TLMruL
	ot35oMEfX3JOh/QhXym+m7ds3W5n5On9+OtRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0svf6u+zq9YvzEcx81414j8V6GFCi2snh/CIG/gUDf0=;
	b=FMuos16IkORFritvGwP1XPTuOfRW0Fh7Mf2LIX+Q6JlyxnvjeVwGaZN0Xp6rZCQH9t
	klTWrCPWFytaiaKnqpcKQCrDzLZLGQbM5orjzjPO2a9z/eqmYlGuBtmV/ceHXuYL455l
	gUVAj1CHXCn8VZC6S03UYZj8zYNYqqY5KwCiwVrVdxhC26wK6tj0UNN5bmFMUH1yxWQn
	kOSVjYbquIvSI24Z0NsXvX24hkyN16O47vyt2HKw4AiM/fUOK7qj4hWHKG93Afcg6uys
	v2Exmvo7cLL2nLaKPODR0Te11EfTBUN/1XHTI40Lu+c9/XrNXfjKjPLVsSC3dystPbDs
	F9Ww==
X-Gm-Message-State: APjAAAUePQtRDYhMdsQEpSpeBRh/c/YqvsPYWJVhV06XiRowXZZo2otI
	s0oUg3Nfg0hmxktBXRdL7L1ehw==
X-Google-Smtp-Source: APXvYqzDXJOYR7HXX1Xbaet+YRP6cDARgQ1WrDFm5CAwwijHtrwX9LfvOY0p2Y/GxUyD9CEAf+wg+g==
X-Received: by 2002:a1c:2087:: with SMTP id g129mr4996045wmg.114.1554236808358;
	Tue, 02 Apr 2019 13:26:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x18sm15434953wmi.6.2019.04.02.13.26.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 13:26:47 -0700 (PDT)
Message-ID: <8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Apr 2019 21:26:46 +0100
In-Reply-To: <cover.1554233389.git.pkj@axis.com>
References: <cover.1554233389.git.pkj@axis.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Tue, 02 Apr 2019 20:26:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-02 at 21:30 +0200, Peter Kjellerstedt wrote:
> These patches are intended to improve the ARM tunings and came about
> after I had to study the tune files a lot more than I first had
> anticipated...
> 
> The first patch (arch-armv8a.inc: Correct
> PACKAGE_EXTRA_ARCHS_tune-armv8a-*) avoids odd architectures such as
> "crc" and "crypto" to be included in PACKAGE_EXTRA_ARCHS.
> 
> The following three patches (where i have sent the latter two to the
> list before) restores the "armv*" features to TUNE_FEATURES for all ARM
> based SoCs as it does not make sense to remove them from the SoC
> specific tune files just to determine whether -mcpu or -march shall be
> used. This is because the SoCs still support the armv* features
> specified in their TUNE_FEATURES even if they also have more specific
> SoC tunings.

It depends how you view TUNE_FEATURES and what the presence of things 
there is defined to mean.

"armv4t" is defined in the arm tune files to mean "add -march=armv4t"
which is the convention used throughout all the tune files.

I'm still not convinced this part of your changes improves the
situation as it then breaks and confuses that situation.

I'm also worried you're wanting this as you have code elsewhere which
is using "armvX" there to mean something else?

Cheers,

Richard



