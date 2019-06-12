Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 788EE7E6FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 09:59:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v14so16184350wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fwEsolURFnEacZAJyekO20IAKLwx9o6L+ilJ0HheIZc=;
	b=THHMqPl4tWyZsbm4oIf6V2pFZm7ohmOmWJjYsVtmLX+rdaN09GYT4ZkHFYM3LJRh0o
	P2v5d6uqsLaoh99yrwTs1iXANMu71emW//0FAxUnEtmOPP81E3UiQtL+2HPZdAnqVa76
	LfUc6nwOhQcVd99IY20CZJ8gsxn60TKy4c9Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fwEsolURFnEacZAJyekO20IAKLwx9o6L+ilJ0HheIZc=;
	b=sZUfONfFsmFzuv5uYtoccEJZsjHH6/JWuJ7vxVnZMc9Ejgl7SAxkkT3O0bnz6idFLc
	HBN2eEcA6y4nlFqICVImMBmBrjypWe2tUy/eqHsm1/EQITvnmwQ3ie/tiRjezeGg7jA1
	JN7OWlQybimgLSKsS1cdyXft0Ds0bVNl++xPbmgZdMsvBGxutM4JVjW0QNybVTDOItCO
	vhBFxs9vuxmNh+xZ2eJ0MuBrMQQqHlY10iv1gs7U7YYe61sm8s/9cCkezuXHtVlH+dOe
	98V3P2+VeS171oOP+vhtcgaTd4+BQS7Mr5ACyZAZSoYN5quysILPcs0+rRdEWxIlgTik
	91PA==
X-Gm-Message-State: APjAAAW6UwA+KwWgCjZK15mvEPPvlH4HIZIvA+meAV4ukpz/DP77PgYi
	Ogtd05Rvy9C9nWxnO2/644wPLg==
X-Google-Smtp-Source: APXvYqxeYkS1tmpTDpPXGNiln3qVnNcwa9zh2/p0Vi/d3qZrsIYQN6qO/GqkvotamHHfZ33KhgOk+g==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr17162898wrr.273.1560333544997;
	Wed, 12 Jun 2019 02:59:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d10sm25748319wrh.91.2019.06.12.02.59.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 02:59:04 -0700 (PDT)
Message-ID: <51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 10:59:02 +0100
In-Reply-To: <20190612081559.5102-1-alex.kiernan@gmail.com>
References: <20190612081559.5102-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
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
X-List-Received-Date: Wed, 12 Jun 2019 09:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-12 at 09:15 +0100, Alex Kiernan wrote:
> Since UBOOT_DTB_BINARY empty means we don't need to inject signatures
> into the U-Boot DTB, we can remove the dependencies between consumers
> of
> these two classes and resolve a circular dependency between u-boot
> and
> kernel.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/classes/kernel-fitimage.bbclass | 2 +-
>  meta/classes/uboot-sign.bbclass      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Really wish we had tests and documentation for these classes...

Cheers,

Richard


