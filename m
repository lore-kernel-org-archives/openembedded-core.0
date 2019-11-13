Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 95668731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:21:05 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id i12so3073477wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1YB4eDSwb481Xxwdve8XVVWLVIlWa43UlZmGgOU5rMs=;
	b=ii5KT1ykuQ2agFmU1zDuKqq20YDC8aPLqJMNt9fjrO70W/sUAoPJTvzl/RlptFdOyG
	29sQPaSaerBa8BM9WGf9jZp5F9Wu99kOIpuGN0eDnz42qWyROl8/P+GGZPzLXKWTu0md
	WyNfV33AhUvshdBN+LIDq/LAqymlGKR2wXY6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1YB4eDSwb481Xxwdve8XVVWLVIlWa43UlZmGgOU5rMs=;
	b=CF6m4aq90yesDMtiljzEpdgC7/ZdzzAJF4WTfHe1J1Bku80iPZpUDZCD7KfNGVM+Bh
	ftYmuSb5fVxEzxMt51EPWiqiGIsoi2TU6Q6nKT1Eh7vjUtrV5oQ6bVxfngHtr30CPMJN
	bxqZAU9fCFmJ2hz3xVBM61rUVPPZyhlyJjcQv7+H/ipWZrq5QjXqg7s2I6zw+ttfgXC2
	F50t/VtMJgNhTn028tbdN8AhLZqwMi+mkubCCKed8xLarboUmMHPQzIxZd0xhJhlom3Z
	LyjHDX2hUGW6OoIHIZ8XkprUg11cFDkfJrNmt5vR4TSWHWRH3jTDXTvUvH6V+KORXU4q
	TIsg==
X-Gm-Message-State: APjAAAXtsM20HesXQsi7ldEvTxf3Ucv4nEtBxwuUt30R7Ey0LZm8BFzM
	QSMX/2zQmvMtcvRkc4vP1CzCVg==
X-Google-Smtp-Source: APXvYqzyaXYZeBPrbl088gSBcXRMTYqJjBLyXzeDO/zPAVctFWJKTYfJVkAA/EsiwOrVk6PoHlNboQ==
X-Received: by 2002:adf:f20d:: with SMTP id p13mr3432305wro.325.1573662066105; 
	Wed, 13 Nov 2019 08:21:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y15sm3263739wrh.94.2019.11.13.08.21.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 08:21:05 -0800 (PST)
Message-ID: <f53835dc2b5b9b2188d5e946ac1198c969821322.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2019 16:21:04 +0000
In-Reply-To: <CAJ86T=W=wDNw7PPH5w5Vo0WEtdfZj41J036o3bAb=D4hiV9cVA@mail.gmail.com>
References: <CAJ86T=W=wDNw7PPH5w5Vo0WEtdfZj41J036o3bAb=D4hiV9cVA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: fetcher uses wrong SRCREV for class-native
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
X-List-Received-Date: Wed, 13 Nov 2019 16:21:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-13 at 06:00 -0800, Andre McCurdy wrote:
> With the following test recipe, foo.bb:
> 
>   LICENSE = "CLOSED"
>   PV .= "+git${SRCPV}"
>   SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
>   SRCREV_class-native = "fc3e8f717779cabcbe583cac304308eaad5f1648"
>   SRC_URI = "git://github.com/file/file.git;protocol=https"
>   S = "${WORKDIR}/git"
>   BBCLASSEXTEND = "native"
> 
> when building foo-native, although SRCREV is set to "fc3..." via the
> class-native over-ride, the version of code actually fetched is
> "015..":
> 
>   $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
>   PV="1.0+gitAUTOINC+015b0cdce1"
>   SRCREV="fc3e8f717779cabcbe583cac304308eaad5f1648"
> 
> A similar problem happens in reverse if SRCREV is set using a machine
> specific over-ride, e.g.
> 
>   SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
>   SRCREV_mymachine = "fc3e8f717779cabcbe583cac304308eaad5f1648"
> 
> Now foo-native fetches the target specific version "fc3..." even
> though the machine specific over-ride shouldn't effect -native
> variants:
> 
>   $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
>   PV="1.0+gitAUTOINC+fc3e8f7177"
>   SRCREV="015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> 
> Commenting out the line which appends "+git${SRCPV}" to PV seems to
> be
> a workaround which results in the expected version of code being
> fetched.

I tried this with master and didn't see it reproduce. Do you have:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d427f58977a46f2bda4b7f30cf83793373e401d3

applied when your build sees this?

Cheers,

Richard



