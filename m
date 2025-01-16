Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26237C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:09:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.51282.1737040178332596246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C1fzGlx4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e399e3310so1163163e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737040176; x=1737644976; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=96wjZ6F/yB49p0wHhGaV5fvperNBkHtnLDAtrme3tPg=;
        b=C1fzGlx4QR9Em8y8dPS6Cd+pdoju9US0zG566Mm2NlF7IAQejSZNqugiVFQ5WdnDUe
         8GcRIOVaBO1JHAQNxOySw1klmhA1itE7bVK1N7hc+EDP+Tu1692PUY+tnNsEAC60z6RY
         IobYrIZCDqctNzMJNPYPNUvoyrA/0ieLB04gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737040176; x=1737644976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96wjZ6F/yB49p0wHhGaV5fvperNBkHtnLDAtrme3tPg=;
        b=ebNVVrDiPlSzFsc9n/wlkwalQNe/0OIsQWg5id9kvFh1FaFWEOm9NTDs/2YCFRBjhh
         ITlqrMkYc0oxq5vakgLtey1wS7pRLP0R04TAk0KD3TSq8yyjn1/ujxvmLEsKo8AAR1jT
         vU8FSwC/B8YATcGGUYMkD9h+I2e0UOAxKmJ90mVJA1yXCTs556bviMfIRo67w3QCmc1B
         N73kxP0eUlua3waAZqfODJIHrwKLohU9UpFz0SylO6GN2JlCkMucLT2mT2Wy/hiX0Pcd
         T6u+1k6y7NoDufWohEjGkan7mec6knpbifzEI94DENx//9c3FHvEBZc8Jxq+xTLKPRRV
         186Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwl+NlpitzaJRTTResncN4vq8IaAf/MiBOVVTncyHH/Ip1TF589MLU1C4qYJj+rQSpodCyP+T0sTEtAn1RffaFUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJCbZor8U7ryYpkiVMex5BqCeJ2FRKhwk1QdIQnni5eHP453Gu
	0GKe4UHo+iarwMqQyPCROMPDSCIGZxlVlNSzwgbp1VKXgzCF8uVJe2fDxoypJGs=
X-Gm-Gg: ASbGncvAnFtUk90tKX8XrDrzV2njbcjgk0578jjWcs3eCPDuk2kDFzTqbIHrVxLYQMe
	RIA3Sy5Y8iXAZy/dmhoDZDgbHhhh2henLD+VbxkLIH1NuLSjECVwefwrwJ/XFhW8r6Yji4tpZMQ
	BOvljKxgZa2nwYOxI+PcXycJ1iMV4Ty6tpGOVLEnV0ERlto2OHAK3UXO1AAAB2WAbHE0TNJd8d8
	sulFdcrM3pVjbp2juO1ASbE9ihMaiyIVu460nDh5pUBiwD3Z6tz8pLo57S7RBTF0mSo3ZgHbg8U
	YIHpx1Ytbs68D4tO/EW/wR3eNd5T1N9QqRK3kKoTLFXEfw==
X-Google-Smtp-Source: AGHT+IGzCoWogk/JuRYAZnnUPueokY3yQPDPnEZ8Wms1EBXPrHftdBs92DcpN3PjJdRZkHvb035NbQ==
X-Received: by 2002:a05:6512:23a8:b0:542:97b9:89dd with SMTP id 2adb3069b0e04-54297b98b70mr6171145e87.2.1737040176232;
        Thu, 16 Jan 2025 07:09:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7fc3:ea77:314b:489f? ([2001:8b0:aba:5f3c:7fc3:ea77:314b:489f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60b0dsm11991e87.142.2025.01.16.07.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 07:09:34 -0800 (PST)
Message-ID: <29c89cf909ccda3949e0bd1b50a5dbbc0a18094d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 1/2] rust: fix for rust multilib sdk
 configuration
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Date: Thu, 16 Jan 2025 15:09:31 +0000
In-Reply-To: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
References: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209952

On Thu, 2025-01-16 at 05:48 -0800, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> YOCTO [#15061]
> The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 i=
n the same location.
> This causes below error while installing the lib32 & lib64 binaries:
>=20
> Error: Transaction test error:
> =C2=A0 file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk=
-linux/environment-setup.d/cargo.sh
> conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0=
.x86_64_nativesdk and
> =C2=A0rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
> =C2=A0 file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk=
-linux/environment-setup.d/rust.sh
> conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0=
.x86_64_nativesdk and
> rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
> ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/i=
mages/core-image-sato.bb:do_populate_sdk)
> failed with exit code '1'
>=20
> The change includes:
> - Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between t=
arget systems.
> - Moving the non-target-specific environment variables to 'nativesdk-carg=
o' and 'nativesdk-rust',
> instead of being managed by the cross-canadian recipe.
> - Removed the redundant cargo config file from the 'rust-cross-canadian.i=
nc' file.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/cargo_1.81.0.bb=C2=A0=C2=A0=C2=A0 | 15 +=
++++++++++
> =C2=A0.../rust/rust-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27 ++-----------------
> =C2=A0meta/recipes-devtools/rust/rust_1.81.0.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 13 +++++++++
> =C2=A03 files changed, 30 insertions(+), 25 deletions(-)

Thanks for the patch. Just to confirm, are you saying we no longer need
the $CARGO_HOME/config file?

Cheers,

Richard

