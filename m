Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 980A3601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:07:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n25so14313692wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=lu02Os+aZFXxsWoWkUsWO+54hPIpRF81xax0Sla9Llk=;
	b=VzXTHSIYv+9hAJS807ux2lq16zXfBWHFAJSSq9CUDupwShBWtTFQZmotRv8bUa3iMR
	+pG55dkuCjnP8FGiz107LUSmROdC/7Yo5bqy+v+nrb7VM/9i+XKiYcFmiooYeryeCDiB
	2LSKZhcFNYnLQgfTEItRYydnoJAqvPMvhqQfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lu02Os+aZFXxsWoWkUsWO+54hPIpRF81xax0Sla9Llk=;
	b=omEreRoRCaeEcwQhtpkpgH93VaMyA22H5vsRb9Iu29dOMvCmLALOb1JDHlXa3tOdDE
	6G9p4ZLXvEiEVQKmu6mbFzJyKBoFIvbTJFsLjSIIFOM3zC55pxP+JMNJaCpz0IcSMqJy
	Rof3jlj+zyyKBTreONyDWlxkmwwVKBrDbUUR6q12HvrtTj9/x7bqQYhunA4iUtFqZCaG
	Ry54aq5ZE5VM9cNPkq2p8yDMqwUY3jgXWHu10HSp8Sr3++E/DaN7oIPFe18XuNhLMThm
	JQzHBXg8j7wKSy/IpYKr2D9bk9ioKNVJ6ADihzxfI+Om0rtoq9cisRpgyUzA72jw0POA
	zn+w==
X-Gm-Message-State: APjAAAX2jtGOX1+5Td5fOIBAGhHTPvJwU7YGoCi8GePMwd3weovaH8Am
	cYFss29+z8GjKa+GxoNOYZAngQ==
X-Google-Smtp-Source: APXvYqxgwuzZ+5qfidS8KG97/FElK6IOJqbd5P5GoharnBtf1iZzAsQQ34f3ljYSEkf4oK5M+UW+jg==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr16523087wmc.92.1556525274266;
	Mon, 29 Apr 2019 01:07:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s132sm6283534wms.10.2019.04.29.01.07.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 01:07:53 -0700 (PDT)
Message-ID: <1a85bbb62522b769f22833c11713244ef8e67b19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steven Hung =?UTF-8?Q?=28=E6=B4=AA=E4=BA=8E=E7=8E=89=29?=
	<Steven.Hung@mediatek.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2019 09:07:52 +0100
In-Reply-To: <ec922d7762594a07a99e5c00241ea82b@mtkmbs06n1.mediatek.inc>
References: <ec922d7762594a07a99e5c00241ea82b@mtkmbs06n1.mediatek.inc>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] musl: fix build failure when ld-is-gold is in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 29 Apr 2019 08:07:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-29 at 07:31 +0000, Steven Hung (洪于玉) wrote:
> based on the solution: 
> http://ffmpeg.org/pipermail/ffmpeg-devel/2018-April/228246.html
> 
> Signed-off-by: Steven Hung (洪于玉) <Steven.Hung@mediatek.com>
> ---
>  ...branch-to-PLT-in-THUMB-2-not-support.patch | 28
> +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl/0003-fix-conditional-
> branch-to-PLT-in-THUMB-2-not-support.patch
> 
> diff --git a/meta/recipes-core/musl/musl/0003-fix-conditional-branch-
> to-PLT-in-THUMB-2-not-support.patch b/meta/recipes-
> core/musl/musl/0003-fix-conditional-branch-to-PLT-in-THUMB-2-not-
> support.patch
> new file mode 100644
> index 0000000000..02b4a7a2e7
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0003-fix-conditional-branch-to-PLT-
> in-THUMB-2-not-support.patch
> @@ -0,0 +1,28 @@
> +From fbfc3a6ad1e7f844ca4b9736330f28ced2f2a7d8 Mon Sep 17 00:00:00
> 2001
> +From: =?UTF-8?q?Steven=20Hung=20=28=E6=B4=AA=E4=BA=8E=E7=8E=89=29?=
> + <Steven.Hung@mediatek.com>
> +Date: Mon, 29 Apr 2019 14:28:52 +0800
> +Subject: [PATCH] fix conditional branch to PLT in THUMB-2 not
> supported yet.
> +
> +based on the solution: 
> http://ffmpeg.org/pipermail/ffmpeg-devel/2018-April/228246.html
> +---
> + src/signal/arm/sigsetjmp.s | 3 +++
> + 1 file changed, 3 insertions(+)

The patch is missing an Upstream-Status field and Signed-off-by?

Cheers,

Richard


