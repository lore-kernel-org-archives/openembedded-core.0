Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 354B27F276
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:57:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y135so7056465wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VS4VUi6oigsMmQFouBwl95Gv7BRoIMBC01I/ie68VBU=;
	b=MLXS97xBekKMasqvjZnGSkMKiTWTW/W3E7ZnwBfAKA9pIHc76/oFv/WNMg/TiRfHrL
	vV3Uz2zIgNjgs5j78UwNdXgAyZSrzSOHSv/6EijHcjCHAib8Z1iZ6qGs6SKXhQeidXst
	TNQPh386N4jiFQh+5G8q3sr1FfY01s1HOPOgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VS4VUi6oigsMmQFouBwl95Gv7BRoIMBC01I/ie68VBU=;
	b=mW7LaYwdkWsR1jjgrVFmsOqU5ItIyL7JhjigYQhKg+0O6nR8dNmyoc63Eehc0LMyT9
	/QtgnQTMMuFqy6Pj9Uja4JIcKDnNV5OWQ1h7ckNbiZrMkYJGyY8wX22s9LkyAYsgGwTn
	z50sQDlaTzL4M4hm8pue8lvRJ/sH1W0dLDCQ9rDt4wtANvRaugAaF+jdE3AqHGgK4Fvv
	DwjOoa5H+D/PNuD13bISjyUyhhuD5mu/ajHwd/nn+kzY7c31i0w33KPMIiONQwhdF5j0
	camBrvsVuaIhx6ZWfIzD1B4Tg6MOCwz5dUWEG8N5nwGhNcIb1dmN68WRE5lwdU/QWFnu
	TjUg==
X-Gm-Message-State: APjAAAWMNTTDFR96qfbkOpmclcOd+3iubiQ75O1lK31VntcdGHsjZ+W3
	aFa3ytw1PsJ1hOMDhjTKkaLyyA==
X-Google-Smtp-Source: APXvYqw8dhsaZ4NL1Mn2AWmINiKRXfzKmSje4llNgHE6FmYGJlixd1Z/4HO7odLgc0spzOEYcH48Tg==
X-Received: by 2002:a05:600c:2049:: with SMTP id
	p9mr12820552wmg.30.1568631451786; 
	Mon, 16 Sep 2019 03:57:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b62sm23928152wmc.13.2019.09.16.03.57.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 03:57:30 -0700 (PDT)
Message-ID: <380372ea5dfb9b87cd72363064c5f63e61b84744.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 11:57:29 +0100
In-Reply-To: <1568615805-50657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1568615805-50657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] dnf: make dnf work in toolchain
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
X-List-Received-Date: Mon, 16 Sep 2019 10:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-09-16 at 14:36 +0800, Zheng Ruoqin wrote:
> We need to configure dnf to use package architecture from yocto build
> system.
> 
> Install etc/dnf/vars to ${SDKTARGETSYSROOT} because config file in
> host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux
> will be covered by another ARCH which result in previous config
> settings inefficacy.
> 
> To resolve it, put config file in target-sysroot like
> /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has
> its own target-sysroot, config file will not be covered.

I'm afraid we can't have target dependencies within nativesdk packages.

This is shown by the fact this patch (and the similar rpm one) cause
selftest failures in the signature tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/381/steps/8/logs/step2d

2019-09-16 00:24:54,670 - oe-selftest - INFO - RESULTS - sstatetests.SStateTests.test_sstate_allarch_samesigs: FAILED (111.59s)
2019-09-16 00:24:54,670 - oe-selftest - INFO - RESULTS - sstatetests.SStateTests.test_sstate_nativesdk_samesigs_multilib: FAILED (144.14s)
2019-09-16 00:24:54,670 - oe-selftest - INFO - RESULTS - sstatetests.SStateTests.test_sstate_sametune_samesigs: FAILED (161.53s)

you can run these with commands like:

os-selftest -r sstatetests.SStateTests.test_sstate_allarch_samesigs

Cheers,

Richard


