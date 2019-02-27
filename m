Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF077C92A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:14:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z84so4796569wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=92bvpHb5+sqqIDvBtt64h3ylyp+TQdgfOVMUdElm6mA=;
	b=hrRWU3ktSiJXLMPRBS2GkCgdlGaPwGqET5G9vhBmDrBP69ZDhm/KOpEZr0TIPnI7qq
	Hwbeb8W9nBAV+PZXW2aJQseHEm6TTuQOZrbw8Or/YW56Kdc15/TGab2G4PJEZQCZAdSJ
	RaUBN5L6r0H1ugo4qtqAajWUJVOerVGq4D7p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=92bvpHb5+sqqIDvBtt64h3ylyp+TQdgfOVMUdElm6mA=;
	b=tRk37C0Xeo27JpL43JNqUtZng+AeQmTPmg49NfjhrPzRxYWa4YMvI8TgbrELgpKh8l
	ajPqavvq9bW7W4hsGNf38YoWEoLFGNFtlUYjrcuIS+x6mxiCVIIiMd+p0Gr/K5pXlalH
	8ztqA9/F8b6YloCT4sFpNVZFOlch5/y0aHysdStCbmlyvieOu4oFYTghDUsjwyHNJOeM
	5hMSzbwWdbpEqkVhmcEmW9xzA9ghMBfCRfk6zsI3LHEJbOJQDEG1PQV6YdM3jck/zdMA
	M6+qUH7YtIV2Z4+SxvV2HxVCjrbeg4hk2ckI8QjxLuW1OPfnNRiTcDTP8rJ335xmzH87
	e4oA==
X-Gm-Message-State: AHQUAuZK+Ovgd9WdwgzNARABUiWsv7sLUqD6SFC71uujU7DuNqaRKiE2
	Q+LKmPnLIYh/dsyUOTBpWuzZPA==
X-Google-Smtp-Source: APXvYqx588piDI+0aXNDeZCt6uh0T2lDXTbYNm2ek448846WFZ4Z6AWOW8/gxsWFNnrbAeQNI574TQ==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr1530223wmc.109.1551258853938;
	Wed, 27 Feb 2019 01:14:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a8sm10271296wrt.79.2019.02.27.01.14.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Feb 2019 01:14:13 -0800 (PST)
Message-ID: <6862c155552e878fe373a4bca6320c68798194e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Olaf Mandel <o.mandel@menlosystems.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 09:14:12 +0000
In-Reply-To: <20190227091055.19107-1-o.mandel@menlosystems.com>
References: <CAJ86T=VRke7oXB6p-7UA=OCewHC=fb0xMG4Pr+f-8qvG3yof8w@mail.gmail.com>
	<20190227091055.19107-1-o.mandel@menlosystems.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] devtool: deploy-target: support "unsafe" symlinks
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
X-List-Received-Date: Wed, 27 Feb 2019 09:14:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-27 at 09:10 +0000, Olaf Mandel wrote:
> The bosybox version of tar in sumo considers symlink targets that
> start
> with / or with ../ to be unsafe and refuses to unpack them unless the
> EXTRACT_UNSAFE_SYMLINKS environment variable is set to 1.
> 
> As even many core packages legitimately contain such links (e.g.
> coreutils-locale-*, dropbear, eudev, initscripts, kmod, ...), add the
> environment variable to the remote script.
> ---
>  scripts/lib/devtool/deploy.py | 5 +++++
>  1 file changed, 5 insertions(+)

I'm tempted to suggest we backport changes to busybox in sumo to
address this...

Cheers,

Richard

> 


