Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3F56061E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:21:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so14041952wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/5CP+WLoK2VwzZ+X6S939U2IlPiygDWKzr0hVCY5NRY=;
	b=hLlL/YnkWidqpCipbHeqHtnyd0bE3f1pC42q+JjTNHYi2xYb8seujFKrwMF1ifmBcA
	RJcisk+fWRISCfwNqxVmUAo6XCKUsghS3P/CUjVfRw9X/uT3XEvhBgmQG7bbDXUj2YcY
	wbO4fz/oC2TVBzjomImSub1wDr14+CdM4RJTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/5CP+WLoK2VwzZ+X6S939U2IlPiygDWKzr0hVCY5NRY=;
	b=aLqmFLDXioNbu3EdnjQ5n8kHkumIXr0RiWwsrlMerbi4F53KZmrBLwAdJg/L6MSeOJ
	ytxTUk6Fk8fBWyG0HuuKXFwpm8ueNZnnfYH9zyTvOjAESvw44VwXP+vLOQp6y9l6TJ98
	2c8n6F3QHO8dLMlhCD/Q4PCDTdCKL7UI33OlYQysJd9UZzHvVDKp5O9bVxfFFcWeNejk
	12wGW3vb9pc3cemF/yR7EoO2KuJNURkWBJ8Cpl0qzjfe97cU/QUhjDS/bU7KtCyYa2BJ
	97CKwpYHiWr9VkllRU1Jzwtc0t0rPfCFHMx3NH1/V0j0Jq0+2aXFjtqflW1hwoAiSOp9
	/HSQ==
X-Gm-Message-State: APjAAAUxLaTIhA0vjWbc+zFebtCZM5TJWBTeYOf+TvqS2AaRnENjbwuq
	ckqiF91P1wx4d9VB81HjQbnnbg==
X-Google-Smtp-Source: APXvYqxrozNREuuINEBogNiAAs7dVisX/6IZMk84iNKfl5OJRait4Tbf2R8lnLdeupsGXsgjwrbvIg==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr70568808wrp.17.1582626081818; 
	Tue, 25 Feb 2020 02:21:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z25sm3566801wmf.14.2020.02.25.02.21.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 02:21:21 -0800 (PST)
Message-ID: <29622e48fc7ebf80aa002b2d1903f6d970af9d86.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 10:21:19 +0000
In-Reply-To: <20200225054406.867243-1-raj.khem@gmail.com>
References: <20200225054406.867243-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] mime,mime-xdg: Conflict with allarch
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
X-List-Received-Date: Tue, 25 Feb 2020 10:21:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 21:44 -0800, Khem Raj wrote:
> mime and mime-xdb classes add dependencies ( both runtime and
> buildtime
> ) on target packages, therefore recipes using allarch should not
> inherit
> mime/mime-xdg or vice-versa, this fixes subtle sstate mismatches
> 
> [YOCTO #13805]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta/classes/mime-xdg.bbclass | 5 +++++
>  meta/classes/mime.bbclass     | 5 +++++
>  2 files changed, 10 insertions(+)

Is this the right way to fix this? mime info probably is arch
independent, so should we be whitelisting some of the dependencies?

Cheers,

Richard


