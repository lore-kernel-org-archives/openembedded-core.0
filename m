Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 80D027E8D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 16:32:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z23so3802644wma.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=thqR8pTTOBpm50l2l/qkFrPlytZ5Cy1jgysgX7YLCj0=;
	b=cRPv4jhb5Xuv7qZLRAdlfDihEi6/R10UE9KzfiXJ7/U8TvJepXcucYws38vDw1nmcC
	zTWayY93Nv2FUzMSwHA9DyJ5rnW4MHTvccJM5XxBlEM2Go6lgQFNLYoG+eDvl3LvoLYN
	TaSpbKWpWe4vkMZhxmL8sU9ha8k/1UgMpBDXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=thqR8pTTOBpm50l2l/qkFrPlytZ5Cy1jgysgX7YLCj0=;
	b=PxUDY/dEEPEkqBnKtJayVt9vQAf8Vy6Kj3jFuqk10h4Z6upTLnNi/wgFixBp7jP9Uj
	TQrSBI6Of1bNQQNaM/3dlX8yq+S64SyvwHXF/6X9aM+mbSMQAJciWodquwnnuyRWwS3s
	fFgIOqINjZblSJ8IAwntbD5ASOmOezwygleuBHLvUC6ouapXU3tDKOP4+bPj13DVh3As
	MVlPAbX++CgRR2dkkDc3EfX2PKLhS3ogwdwhdjIR+hp+CTajlmtpRMMW16xypAsFnbP0
	GwPZYfzAO6AalZBPyWUMWWjeIZrkop+MWb2Byd8C+HtWPpcMY8853hZ7L7f4MYfKbqCK
	I2ug==
X-Gm-Message-State: APjAAAUmxGSOj9HtXdlCUiDAGIz+qS5k7FgTK2MfU7QowMTP1lzAET6u
	qCW1z5TVZy5hUrPEv4x/vZoaUA==
X-Google-Smtp-Source: APXvYqyX5lyogWgxS5ohy7AwSf6ony5DQsmnHPZXKcXNexSp9/mVQIBVCSe/KEgH4Tmx0fyNlfOW5Q==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr296385wmc.159.1561048332276;
	Thu, 20 Jun 2019 09:32:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y184sm45255wmg.14.2019.06.20.09.32.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 09:32:11 -0700 (PDT)
Message-ID: <8c968fbedd663a6e4bc401e4ce4b363f15d6045f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 17:32:10 +0100
In-Reply-To: <20190620154302.9251-2-JPEWhacker@gmail.com>
References: <20190620154302.9251-1-JPEWhacker@gmail.com>
	<20190620154302.9251-2-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] python3: Reformat sysconfig
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
X-List-Received-Date: Thu, 20 Jun 2019 16:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-20 at 10:43 -0500, Joshua Watt wrote:
> Reformats the sysconfig file when packaging. This file is output by
> using the python pprint function. This function will wrap long lines
> at
> 80 characters by default, and will even split strings at whitespace
> boundaries to do so, e.g.:
> 
>  'A': 'B is really'
>     ' long'
> 
> This causes a problem for reproducibility however because there might
> be
> lines of differing lengths depending on the build path. These
> non-reproducible paths are removed, but their effect on string
> wrapping
> from pprint remains.
> 
> To correct this, reformat the entire sysconfig file by re-printing
> using
> pprint with an (effectively) unlimited line length.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Fails on nativesdk:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/969

Have aborted that build.

Cheers,

Richard


