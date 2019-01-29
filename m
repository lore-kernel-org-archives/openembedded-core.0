Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 776806006E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:17:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p6so16829420wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 01:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MJ97newvQY/TcL8oz92pFDYrZpJwSCfux11mECuNf2s=;
	b=RRMeFJBJPHyXdkEh24K3jnvWmOOuVSVJgWbEmzdjDi7+KGPtwuZT84o4dD9Vtp7KNJ
	KWPK8GWFQsWaBuH0mrI/M1SW+hJg9jhW4Q8v8XGqNRSBcwECI0u/khg3y+3cGfw5yTo6
	rxqui0wJmBn2HWjQ5G0lC2qsN6L3CXjVqqNGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MJ97newvQY/TcL8oz92pFDYrZpJwSCfux11mECuNf2s=;
	b=hs/jpvVR1SxkvnM5binIvEKSqdq3YoFNusIH5+gn2iqzVdbFp1KOQe5yeVmql0NDlS
	xH/wHPRGuJzt6I/lVre3XSR6U9EsnvnO3BFxMK51VWtAOTkQDL6OuriLLuTToKsBlL12
	gYqcSabELIusOc5MUa3FF0TgpNYLYZLFCG3tgY27Alj/RZjEKeRfSu4958DMyPm6mzUy
	PA/ZBZ3uZxmTay97qFbubHRHROGmRfThuefsXgi+W3JrCwwZ1woCk+IeyE0uqUup7bMB
	h6DyUwu5x5yKNoAb/UWBlinrazwamWITnKpeVVTY8v6P1i8uaCpv9H3u3PffUC4rLvi1
	a05w==
X-Gm-Message-State: AJcUukfgu8ncy6nSY40+oq9WgwliFXXZEvJ+o7JqXKxjjbBHurz2drSf
	T5zoF2YFI/Q6zrwdDAJXU7RUBfoGzIs=
X-Google-Smtp-Source: ALg8bN5lPDzO5DtZDHZAtDyZkJD0q92XioEnIphBZzTC1I3cGpoJeXwl+OtyrM+cMfMNYInepUHgrQ==
X-Received: by 2002:a1c:c87:: with SMTP id 129mr19321336wmm.116.1548753461870; 
	Tue, 29 Jan 2019 01:17:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o81sm4052233wmd.10.2019.01.29.01.17.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Jan 2019 01:17:41 -0800 (PST)
Message-ID: <c799f5a1a19e38f905d0976b49f982ab63d40389.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 09:17:40 +0000
In-Reply-To: <065c6c6908cdc0bd4eabd7c4270f4299b9034888.1548753246.git.Qi.Chen@windriver.com>
References: <cover.1548753246.git.Qi.Chen@windriver.com>
	<065c6c6908cdc0bd4eabd7c4270f4299b9034888.1548753246.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] pkgdata.py: avoid target-sdk-dummy-provides to mess things up
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
X-List-Received-Date: Tue, 29 Jan 2019 09:17:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-29 at 17:14 +0800, Chen Qi wrote:
> Sometimes we meet the following failure for the test_lookup_recipe
> test case.
> 
>   AssertionError: 'zlib\nbusybox is in the RPROVIDES of target-sdk-
> provid[32 chars]ummy' != 'zlib\nbusybox'
>     zlib
>   + busybox- busybox is in the RPROVIDES of target-sdk-provides-
> dummy:
>   - target-sdk-provides-dummy
> 
> This is because target-sdk-provides-dummy rprovides busybox.
> 
> So clean things up to avoid failure.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/pkgdata.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py
> b/meta/lib/oeqa/selftest/cases/pkgdata.py
> index 0b4caf1..e02c6c4 100644
> --- a/meta/lib/oeqa/selftest/cases/pkgdata.py
> +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
> @@ -13,6 +13,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
>          super(OePkgdataUtilTests, cls).setUpClass()
>          # Ensure we have the right data in pkgdata
>          cls.logger.info('Running bitbake to generate pkgdata')
> +        bitbake('target-sdk-provides-dummy -c cleansstate')
>          bitbake('busybox zlib m4')

Nice debugging!

clean is enough here, we don't want to run cleansstate on what might be
a shared sstate cache though.

Cheers,

Richard


