Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C20A26C44A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 08:34:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p74so21202949wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 01:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=U50LOluFB3UWfRmftoRzcX1+PW5RtTWzrhvWANGogBg=;
	b=WF4imwqUDByUNaVjy2M4lJnGiEDipu6nnidB8S1HtqMKJ8cvUr2zHLeyzI44W2T2KL
	bcj4EreqVrNknQouOd5nvuKzy08KYuF5u5JuHnwmiVcyF7MOJnguy+/dUgJfIkGlHArz
	eVzmJ7/sFAUwj8Xo1fQD8Mcl11Y0T5s+IJip0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=U50LOluFB3UWfRmftoRzcX1+PW5RtTWzrhvWANGogBg=;
	b=LUVknwu10eYKGHFhHhhwFP4B4KgVRzkQK31lSLVMXiNxyZbGODULzIQwNxLG4o5NKa
	OHwSSzNgsQ/no60nrb/LqmP94In1Q9lB2MumLHdZ9aScypMfsTW7oTOkIq7dFKTvxcPm
	Trm6Z7t9zm0Ircchqb7vOBEBT85bZR4MM6Or3vBtuq9JgoF0/Ct/TzE1sDGO3LujdPwy
	oS5OxJzgJxaoYcm6j0jsV7qkO5zQL1PoeRph81Zh+Qkh5+5u1A+hDpv8hdPxpxUpiVuJ
	FxqvYQiW9lsHmfJ7UGMKj+amtUccuhlCcnr2w17NKc9nlhg4he5quJKRJUmMCNt9aLLf
	f9Jg==
X-Gm-Message-State: APjAAAWfVyT2mE8k7QtbmppquWS1k1nPe8k3pw79R7OnGIHmQ6tcUrFI
	ahrPItb37IJ3YuwCdr011RUm1piBvHY=
X-Google-Smtp-Source: APXvYqxyyqjjqM/iIzidFBN5wP2CnEYijZBFHEbZ/2mk3DZdK6ceTT+SFaLgKZzjkRA55+6z4BusSw==
X-Received: by 2002:a05:600c:da:: with SMTP id
	u26mr34141569wmm.108.1563352478406; 
	Wed, 17 Jul 2019 01:34:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i66sm39403680wmi.11.2019.07.17.01.34.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 01:34:37 -0700 (PDT)
Message-ID: <b60f393b0bddab4623d22627d2c83b33774c4565.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: William Bourque <wbourque@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 09:34:36 +0100
In-Reply-To: <20190712140020.28280-1-wbourque@gmail.com>
References: <20190712140020.28280-1-wbourque@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] wic/plugins: Source that support both EFI and BIOS
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
X-List-Received-Date: Wed, 17 Jul 2019 08:34:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-12 at 10:00 -0400, William Bourque wrote:
> Add a source plugin that support both EFI and legacy PC-Bios.
> While using this plugin, both bootloaders configurations reside
> in the same /boot partitions.
> This plugin has very little code : to avoid code duplication,
> we simply re-import bootimg-pcbios and bootmg-efi source and
> call both their SourcePlugin methods.
> 
> Signed-off-by: William Bourque <wbourque@gmail.com>
> ---
>  .../wic/plugins/source/bootimg-biosplusefi.py | 213
> ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/bootimg-
> biosplusefi.py

Thanks for adding the test, that is much appreciated!

Unfortunately it failed during testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/290

(https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/290/steps/7/logs/step2d)

Cheers,

Richard


