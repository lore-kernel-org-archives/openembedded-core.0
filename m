Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6944C7D720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 12:39:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p10so11787211wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8ZVkLKaLY+99PI8z6s2jE2MhkiQgxWNI3nbiiXfgWlY=;
	b=Zm9HvF0IwWHypfUJXa6w9qmY7lPxwOOEMSG0szjuweQfoTxov9zHasl9NznRGqMp1p
	zAt1/RiGClj5OOdfmxbaK+0nc6HNS19/f9SY59HE6OMWPHhQcF42/Wja0WM6fuT3beW5
	Z0/mQP7aSGZdGsQOsxS3dGMGdLj/AsF0Vn+jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8ZVkLKaLY+99PI8z6s2jE2MhkiQgxWNI3nbiiXfgWlY=;
	b=lVSQfvgA1ka7MfX3y/d2RxOyYYdrQA7v/xy/WHqsOTi9Q5IBnkOLcvKkxWGT4pzoM+
	uSaU4HvvOcQmqzhtiK21f/zZ/n+OjLB8NsGLZQOOlxT+pZk4PZVgywK6KF05C3q/O0PK
	OiJZ8zQlsDHbBsqRX6UEb1Z+CVu1ACg199MI3xixEbbGlrskv88w33pLrhbfWL4XoQob
	RcF9uzVxJ6LkQZ0egk0UFg/ykVftX6aUWc7I5XmfuIfEpHCY2PDK/eB/Ao9qP6D1/Ewh
	sIfe5dDpE/vklFkxS9xGvNbEi9avVzWKywTKtM5Aw689BWFgCsCZewvcZ5z1ZIGSuimU
	2v3A==
X-Gm-Message-State: APjAAAX5jNbkdZzzgVLIpJDOI6oPfv+KqqCSIGkPjmFAWS1SgJX80JMQ
	QPV0HlMnLYoeX2wrvf228iwvdg==
X-Google-Smtp-Source: APXvYqyLzAJcNAZHlij1s77laNWeN/eWkWad0t9H5v72J1FRkjfMOiJsDXg4Ygcn7w8RWxTSp2ERxA==
X-Received: by 2002:a05:6000:5:: with SMTP id
	h5mr35612060wrx.271.1555072795174; 
	Fri, 12 Apr 2019 05:39:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g13sm6254408wmh.11.2019.04.12.05.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 05:39:54 -0700 (PDT)
Message-ID: <5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 13:39:52 +0100
In-Reply-To: <20190412123046.17510-1-daniel.thompson@linaro.org>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] go: Allow bootstrapping using host go compiler
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
X-List-Received-Date: Fri, 12 Apr 2019 12:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-12 at 13:30 +0100, Daniel Thompson wrote:
> Currently go-native bootstraps without any dependency on the host go
> compiler by building go-1.4 (the last version written in C) and using
> that to build a more recent version of go. This does not work on host
> architectures, such as arm64, that are not supported by go-1.4. To
> support these host architectures we must rely on an existing host go
> compiler and use that to build go-native instead.
> 
> Rather than add arm64 specific code that forces the use of the host
> go
> compiler, we use an architecture neutral approach based on adopting
> the
> host go compiler if it is both recent enough and the output of `go
> env
> GOROOT` passes basic sanity testing.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  meta/conf/bitbake.conf                 |  4 +++
>  meta/recipes-devtools/go/go-native.inc | 38
> ++++++++++++++++++++++++--
>  2 files changed, 39 insertions(+), 3 deletions(-)

Whilst this is quite a creative approach it isn't deterministic and I
can see this introducing bugs which are hard to track down :(

I think we need to make this a specific configuration option.

Cheers,

Richard


