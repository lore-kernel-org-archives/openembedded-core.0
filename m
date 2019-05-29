Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C7C1D7E31C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 22:01:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r7so2761329wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vnJ7mMFBToXJNXc1zomlqH0MkXt1vce1zZjDq5dZSEo=;
	b=LAWtN4GuaykD+4ULL698/VwsLTBRX8jRhoTWENsL5mYmp0EH0tFX2elDuQI+EUjO69
	NesB7Scy8EJtzfzGIKEOdkLZ5+kbydRnfpkhAP6qhfWhsTW0253KzYrVL3Nv4zPmkWMV
	axU3kb1N5SsxB1lsq/0pODyrwhE3BWKPR0gbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vnJ7mMFBToXJNXc1zomlqH0MkXt1vce1zZjDq5dZSEo=;
	b=OSlzG0T87jSXlx1M2PuEvrwnorA51/y22z8C84YyH09yKtex2icCIBRShJPQ+ybbZ8
	ocx5h2Uh7CdqW3p2U3kwJnqvY/UNUId9GoKZ80ywy1HVtPwuhH2CkH6KKP1eRC86EHGv
	erUqiGOAjkzVkPhIJDF9qQxQwCtxfN+dmvyQNeS0h+iEzZ4jznBgFfKWH+hlih+lKItu
	VZgMyz4NJTLL4wn3+gvOvmieciTqW5AEzew9g6vTWpij0zjrhb1+JMKEAqH3gr5H1PQf
	PGpdIvurhqXy7E69F9P1qAF1fU3S5zEUV8aiNt+mVtp23OddkRwY3528DoG0k0ttCKyM
	BGJA==
X-Gm-Message-State: APjAAAXHqVOf1cIYmdp+t3ohjoIwhchzJNpvy9hHjU80gE8pz1HoWJ9e
	egKu8OdrqnlTvaH9aDxwNJ6OZw==
X-Google-Smtp-Source: APXvYqyBf7adUKNCJs20HzpJEDtmh7E0MLYNxT7WcTu6LOQx2jhCLzcZznn2nLY+uQ5n0dfJQCxqcw==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr181157wrw.196.1559167277429;
	Wed, 29 May 2019 15:01:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r16sm463538wmh.17.2019.05.29.15.01.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 15:01:16 -0700 (PDT)
Message-ID: <286871f94e930242edc9d57dc39392e695abfed9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 23:01:15 +0100
In-Reply-To: <20190529144250.419-1-JPEWhacker@gmail.com>
References: <20190529144250.419-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] btrfs-tools: Pass DEBUG_MAP_PREFIX flags to Python
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
X-List-Received-Date: Wed, 29 May 2019 22:01:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 09:42 -0500, Joshua Watt wrote:
> The DEBUG_MAP_PREFIX flags need to be passed when building the Python
> library to prevent these non-reproducible paths from being encoded
> into
> the library. The patch that does this was accepted upstream and
> supersedes part of a previous patch that passed LDFLAGS to the Python
> library in favor of passing EXTRA_PYTHON_LDFLAGS, so the patch and
> recipe has been updated to reflect this.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

This breaks btrfs-tools-native:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/875/steps/7/logs/step2b

Cheers,

Richard


