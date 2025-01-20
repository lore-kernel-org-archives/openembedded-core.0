Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB727C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 13:42:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.36701.1737380546426841631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 05:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PZWJ4OBx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2508706f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737380545; x=1737985345; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j0l+NtOTyd5zHuprz2kI7IhLSC+xH/GzePzZaGnGHew=;
        b=PZWJ4OBxldprQbDRGwJ7xBJLkkgAsnRAgGIp54R1ZrK+xH+u7nf7s0wtAnZimlgiQv
         hWZ8Z2g6xJPtPYfwivOLIawckVNd6mRp1eDzSrxypIruc03T7Hufl5KYDfazoSFRfNat
         JqN0BhDEeyZ34Kw+EM2DKwFhz8+JZDu5f0M3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737380545; x=1737985345;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0l+NtOTyd5zHuprz2kI7IhLSC+xH/GzePzZaGnGHew=;
        b=gkh/9AnbEsEeMDKNChAv6YooreY8suo8UVn1C92h3Yx3Scg4OUT+brZ5xQgPpoeJ+2
         KaBdYTSdWd0rQKYK3fd+ZDiXiXKZQ1yk3KX4bEyKcvwad6b2g5pDQOlJL4DCBqJO3/WX
         dzuGqm47wepA16iFGUwLLu6FAPuZ7fNd0FkOmyrZLujDT5Xl5sDbt2PLCpbqoxu75E72
         0/D+wY3epIPAhvH4aCVaZaenwW7amIVk+lBQkHFFK86+PdqVOEIW8oe5CESOdIj1bR+i
         P5Uht/3C61QpMEI4qkk7GxvoUKnJQMTWwh6875+9VHms67XluJYA0kjDim81ZMW6Z6aI
         nN1w==
X-Forwarded-Encrypted: i=1; AJvYcCVVYu2FM2pC+8OYDMv0xERPRVxAY5DJi28wvL7wGOgdlc6yYNaxpfepHvh9Gz41dgjf8KuhODnNgYYQMy0Pd2IhSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMBkkkYY9yJDuCWnbo3qVGu1oblSktpprl1wdd6zgbOC4TtV9L
	hX+1WH01XD1U5F4wy+Hzp4lgU23Wrt5MY9674CurCh3DxMpkYeHMbxktOdC9gGw=
X-Gm-Gg: ASbGncswa9XGUgjVc47/JW0vM8ZaYzKb2n8nEtb3WOX/Ha1X8oCeUIFFaAkv3bB94KL
	H+DJBmyxdy+8+K9P7NNvWngT9XTX7AUkACZq11mOV3L13wVRGQVm+tra54XyUieOoeBlMczYnyz
	O1mmCHl0ekC+s6MIJq/ozM0l6Db8YxuKNbZMYWDCfiljmtjWzVvhH8+a8vzmMAQrLbCPAlCmo7s
	eQ7tbiVFQkz+6wXsgOE6ACTDcXHt4ifkMGfUz655k2tqZVPZ6mcWbqgDbq1TvJn2nZbTfatFnmP
	iykhgLfeCtMpQItDLnMA0+MQLJ2MpR+GPolT6dzAL6YiR6xDj9WjY+KXsCo=
X-Google-Smtp-Source: AGHT+IE5Q8Yo7GsqZJtSaS6XPOb4ouPjpqrvzNGXYk12IE0pZ2M8KhDJzg6o+a7DmnHfbTs9/lN+Jg==
X-Received: by 2002:a5d:588f:0:b0:385:e961:6589 with SMTP id ffacd0b85a97d-38bf565f8b9mr11151051f8f.20.1737380544852;
        Mon, 20 Jan 2025 05:42:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a8b:bde5:329e:7f3c? ([2001:8b0:aba:5f3c:3a8b:bde5:329e:7f3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm156093345e9.0.2025.01.20.05.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 05:42:23 -0800 (PST)
Message-ID: <0cf72b0f1033722e4c197ae1bcf7891e1d34f65d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] sanity: test for c toolchain
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 20 Jan 2025 13:42:23 +0000
In-Reply-To: <20250118120105.11681-1-gavrosc@yahoo.com>
References: <20250118120105.11681-1-gavrosc.ref@yahoo.com>
	 <20250118120105.11681-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 13:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210029

On Sat, 2025-01-18 at 13:01 +0100, Christos Gavros via lists.openembedded.o=
rg wrote:
> Users reported issues caused by missing the right libstdc++-version-dev.
> A new function 'check_c_toolchain' added in sanity.bbclass to test linkin=
g libstdc++
> Fixes [YOCTO #15712]
>=20
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v2->v3
> * whitespaces are removed
> * the format for reference to the bug is fixed
> * 'Reviewed-by' tag is added
> ---
> =C2=A0meta/classes-global/sanity.bbclass | 40 +++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 40 insertions(+)

This is looking really good thanks!

The one thing left which probably needs tweaking is testing this on
every build. I think that is a bit too much overhead and we should do
this in check_sanity_version_change().

The reason being that once builds are working on a given system we
probably don't need to check again. If people do run into issues, they
will probably test a clean builddir and at that point the error would
also show up.

If you could send a v4 with that small tweak, I think it looks good to
merge, thanks.

Cheers,

Richard


