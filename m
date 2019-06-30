Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 07BA07E921
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 11:41:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so13081496wms.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=exK5Ci8zozCydo+zAdZMlNLF6BoBETP9u+e3z1u2wDY=;
	b=UNwOrfxGH7IJFVbX1d5RJMWwLj+riHGylEPjUvVdFSLxZDbbauUXD1911bvpjcvV+B
	U2drD2vrbwcQ1vpigzUBossj7+dJCKhfhsJk9qNh0AqP42JC+jC4YetWaKcWt8KW3bmm
	dEEv5kMh745wy62l8a8qWa8jfpt4m0XKwToGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=exK5Ci8zozCydo+zAdZMlNLF6BoBETP9u+e3z1u2wDY=;
	b=QsLFk6En81uhYYyOAkc1+gM2xPGqGHcUEVW0FZQVu9LxYmbsfzNpGdy7XVvHFmtl5r
	tttlGSZ3IzmONE1MI2ypjaPst5NdF3qM58WDuVlvex3v0yQ22zGwSUNvtvCxWcNzcSeP
	R0eGYSk7p7OFo15ZA7zprss8NJNvzNFqdk5I7BuC/IRaAICE33XH6/dMUbJ8skW/bp5q
	IWNkvD4k5GJvakosraE7WV8T37t4HdJmvhSIn9zopgkoOlpxyhkCZx1hxEL/xz/abZPm
	Xg9U4DTDkkmTSS6DimtJnKHdw4xG2Q3CGsEjJVVTFw4R0u88GAw8iwq2OJsODrXUUmaD
	JugA==
X-Gm-Message-State: APjAAAW4SVGxZlvWuI0Pm0xVvts7ExaZf6bcUDSRofCKQANuD3pEUrv9
	bNlj799qdMO8TKpX2YkrrZJojg==
X-Google-Smtp-Source: APXvYqzDrkYmKcT7qpq7BFTI7LWPOBELFIZNvsyXFgyw2QuTd7Deu4vJPmEveZU/xkRqb1hncyUZfg==
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr14062217wma.48.1561894886749; 
	Sun, 30 Jun 2019 04:41:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n14sm18210126wra.75.2019.06.30.04.41.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 04:41:26 -0700 (PDT)
Message-ID: <2cb63a02a86f2726a47354dff8b5dc1d34e3ef00.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 12:41:24 +0100
In-Reply-To: <20190628033830.27713-1-anibal.limon@linaro.org>
References: <20190628033830.27713-1-anibal.limon@linaro.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Sun, 30 Jun 2019 11:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-06-27 at 22:38 -0500, Aníbal Limón wrote:
> In order to support multiple tap devices in the same qemu virtual
> machine.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---

With this change included tests failed on the autobuilder. I think it
breaks usage of tap devices after the first one. E.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/756

(but testimage failed all over)

Cheers,

Richard


