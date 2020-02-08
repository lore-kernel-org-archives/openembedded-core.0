Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB60610BE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 21:56:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t3so3011841wru.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 13:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ocSZqn7RFmaK3MVZeHYWCNuXTsDXkoov/C9O8sk01Js=;
	b=WF5qiofIEDzFUG0aFdXNv/jUkXraEtMiv2yfEWDz0tTI129S/wbfDHUasO8EaIO7jS
	OQzUUwflumOJETi9QMfQcyYixpYCpcM3nKAjRL/lVHNloibEwtiZYcC+Psf4xcMgMbmQ
	eDyqdRyThXdjtrQLtbksI1dLREGAvCtSqG8gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ocSZqn7RFmaK3MVZeHYWCNuXTsDXkoov/C9O8sk01Js=;
	b=f+g0hs2bpyhuHjjmD84jLdRQtHWbOR/BXmsPafOwt9qNX8+DuEWENXckP43JDEWMM9
	wL6E18SRqqfm+FLFOceyHJhr2ex0lDtycgZ9n9naaUF6fXVXRUnRrP1vz8t73SdwBiFc
	dN+m6ar4YWMFuybPdQuaACrgY+tWqW91uf4BUU5OIahWWgh1KwdX97e/Z43bau/+tXjT
	4EXTTOcwKm1v1obS9A68AL+6w5bhO+MWv4nrGZQ3tnfQaocvoa0vberMRUayKgiICIg+
	QmspyzpMQg9jPPUBaM8K2yWDGXsdz7gsLcWNVp4yGDjeDWYvUxr+85OsUC8st6Ij6/W4
	hkfQ==
X-Gm-Message-State: APjAAAUInXo2iso/15kXdkSXmrCP9JDm8qjAkBAC1xdnLnm2LWp9A18r
	XJrOgBAMTPJuY+ZzGgaayavr1A==
X-Google-Smtp-Source: APXvYqx+jNLxJxz3jFNjSYLbZTn3rDF84zFGCeU9KKVxKcPVILJc19MjDw3vqgmXSfE2fne7EtGTJQ==
X-Received: by 2002:adf:b605:: with SMTP id f5mr6621287wre.383.1581198989230; 
	Sat, 08 Feb 2020 13:56:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s15sm9216518wrp.4.2020.02.08.13.56.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 13:56:28 -0800 (PST)
Message-ID: <85beea5aef24489b87c53295b3dbcb0501b2a01d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 08 Feb 2020 21:56:27 +0000
In-Reply-To: <20200208021236.1857972-1-raj.khem@gmail.com>
References: <20200208021236.1857972-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] oeqa: Use --disable-maintainer-mode configure option
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
X-List-Received-Date: Sat, 08 Feb 2020 21:56:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-07 at 18:12 -0800, Khem Raj wrote:
> since the versions of autotools might differ, and difference in
> timestamps for configure and system can result in reconfigure lets
> avoid
> that by touching the configure script to match system time
> 
> Avoids
> error: newly created file is older than distributed files!
> 
> [YOCTO #13779]
> 
> Suggested-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Touch configure to match timestamps with system
>     Move the touch cmd to configure step itself
> v3: Use --disable-maintainer-mode

I tweaked the commit message but it failed during testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/1545
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/1541
(and on other arches too)

Cheers,

Richard


