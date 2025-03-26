Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8777CC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 16:05:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.26482.1743005138395252601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 09:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nw1MH0QC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913d45a148so5778513f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743005137; x=1743609937; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tPIp+6Vl+e3cv7YNYEWqxxFNPivP1pmPT6Ktipok3CU=;
        b=Nw1MH0QCK9yKFPvTlOXW5kVV2VhPW9Tns5r4YSShosf6CVgsWEkNP9r9ikXPcRE7sn
         JavPWLtfRWtfW6XhBqNbpRa3d2GUrUuYFHPAJlqpugQJfw5NE27gc9+8cOfHCOaD+GMl
         SO/aCdkfTk2CNMpJQ7tB915CethwkLjt/I5vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743005137; x=1743609937;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPIp+6Vl+e3cv7YNYEWqxxFNPivP1pmPT6Ktipok3CU=;
        b=c4szt/AojG32L1krIc5fUFop/cojzrbw5xsSZazgahxAi2FyPfeBNwX50Eakg1j+Fx
         c7WQKL1250KREjLpKxiJk4HJw9urqGdyQCnc6VZhvbTTCIe6iEaaDav+X0vWPkJSKNQG
         9n75KZTMHexy9Okxngl8mD8fCH4Kagl4MI9QQGSr6P2POe95eSaHWcTCQt3tXtawds7x
         kot4WpOrjDwYrWnhXDEhnTeHtpB4b2/OOgidmXLry2uhBApsZGOaihEsi36W7Yhb1vWF
         0Y2ySpLR+FoRhmeFCCrK+VahkZIv5Uv7pZkG9ZMknjNfOF0uGbxIRxkX2VQgcRDosau8
         wgFw==
X-Gm-Message-State: AOJu0Yw6935Xak0AfB4RLC6MPiihEnP2s3Uc1v2+Qx1WeL5xtZmXPwRK
	1a1ZN6yo1uUq8NaWhYLGLF3APqWwELjOkhgupWjxp/TH8k1xMzuQv9LZc5d1OtY=
X-Gm-Gg: ASbGncuMTRaW/M6H2b12e40nZB8AibmIEVLOx3hkw0eMuy7wik3rRHARU3e6z29kpkz
	hOW8q7cctdKX2229uFtI8n4vD2bW4I9gdFZtqHRt181eRAca+5MKcOW4fUimjxROWwfvUmVxSDJ
	C27GPvbTR8GhJuBWWggU0SpGM/UmzYEy+m8dh+DcwZPBSKR7qQU/asjhV1mLhrTv7b/xU+JJy4d
	q512WniSMyMSinDBmUCJMTY5ym9/1II0/AAE/idKXR2LxPbecWwvuS4xI1qELs/itGb7u4F+P6k
	WcuG8Wr+nBRYE7Y0tsS/5SCs9dFXi7sUxGU+YEntqfvNSy80ruWuwbNpHcpgIKWde8gh9QArX6E
	J0dp14TNOD5nrkdn2FhJb/rXzbkju9iH0hg==
X-Google-Smtp-Source: AGHT+IET+A7fiio639czWo1m2tW7rhpqd8T17L0Dj/SJyWVwqvYuADAhVhzArF0qk2XKe3Wegh2sAg==
X-Received: by 2002:a05:6000:18a3:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-3997f940da2mr17141220f8f.50.1743005136305;
        Wed, 26 Mar 2025 09:05:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fab8:513e:e094:22ef? ([2001:8b0:aba:5f3c:fab8:513e:e094:22ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e66c7sm17442475f8f.79.2025.03.26.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:05:35 -0700 (PDT)
Message-ID: <524ac8df44c628ab5dc61f464d525f5bd9b234ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][PATCH] linux-firmware: upgrade 20240909
 -> 20250311
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, steve@sakoman.com, hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, Otavio Salvador	
 <otavio.salvador@ossystems.com.br>, Hiago De Franco
 <hiago.franco@toradex.com>
Date: Wed, 26 Mar 2025 16:05:34 +0000
In-Reply-To: <b3f0e7d4-83c6-4632-98c7-e25327b872ad@cherry.de>
References: <20250325215444.11125-1-hiagofranco@gmail.com>
	 <CAOSpxda1s_VUBMTQBRzfdXGy0B=9sgNr=eq+LdDDKFc+koG4dQ@mail.gmail.com>
	 <b3f0e7d4-83c6-4632-98c7-e25327b872ad@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 16:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213653

On Wed, 2025-03-26 at 16:38 +0100, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi Steve and Hiago,
>=20
> This makes me very uneasy.
>=20
> Ideally we should be backporting all/most commits from master instead
> of=20
> doing a big upgrade from 20240909 to 20250311. Additionally, we need
> to=20
> guarantee backward compatibility with current users of scarthgap, so=20
> this means not blindly backporting as some files are moved around or=20
> split into different packages, we need to make sure if files were=20
> renamed to have symlinks too, and in the appropriate packages.

I'd add that the firmware upgrades have been a consistent source of
packaging problems more recently, lots of follow up fixes :(

Cheers,

Richard

