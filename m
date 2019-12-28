Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 55F0960234
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 23:40:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so29565144wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 15:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=0NiomNNj9X90MQdrgUTRN36Ug9sbbbbPxfSt2BMSWlY=;
	b=Jk26x720enxXRpzwuvnIuHLQ8VezDsX41r4Gn1WLwj/ccHhBN/J2i5w4T+tiRHddT4
	AIppZEEFD8ctwiRY7Q4j4nPsac+65roXGYYElkvl1VtgKZdMcvwVrvVPZ3nijTPZNsKC
	Xg6kPh67rtsSJy6NkrDQyjp5vV//B3hOTURKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0NiomNNj9X90MQdrgUTRN36Ug9sbbbbPxfSt2BMSWlY=;
	b=tZy0Lls+7IdeVLdHUOE1EwzDma0itQAIjq40FyUTwxzAA3haQROkj7iLQRlC0KAFCP
	Ae2jtinBBfrGcXMe51vNzt+Q/1mFP31hrF07MF7GSHBFeyFfqAcFYitjtZCq7bTbduU4
	9u1T33xafOHt98PnhI2xLZYbAwnai9jT/S4jTe0cER8iAWFJrU+3QkVGYqv2VKR3RiKB
	W9PlXtuJSdkHggSc7D58FCIkCMuMsr1FIr0S1ctXKgkqMU6RGVRobHp4OzYOfE80xqss
	XoqKnIxcK4uB6oQudQLwUsx92jjbIYvRkz0ppulvirM+pRwNQvw1v0LJKrvQ0orSKW6o
	L42Q==
X-Gm-Message-State: APjAAAXTeysxM9wmr06JkxEbDMtic9sm7INoq/9jAXt+mcQAbFubvJnB
	2NJIk1KKRpYDKuhpyyDIYFjsYA==
X-Google-Smtp-Source: APXvYqxImSpPtC3P/6ccb5ixkw0n+GtVWv9SAXqC8ELHfWRRI8JODvoEL9GMy/fyNo/X1T+uEyWjYg==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr54405775wrt.136.1577576416993;
	Sat, 28 Dec 2019 15:40:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m3sm39409552wrs.53.2019.12.28.15.40.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 15:40:16 -0800 (PST)
Message-ID: <d484a5d2af60732c5b7367760d98b1803efa760f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2019 23:40:15 +0000
In-Reply-To: <20191222075951.20275-1-masahiroy@kernel.org>
References: <20191222075951.20275-1-masahiroy@kernel.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: fix suspicious comparison with ('' or 'custom')
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
X-List-Received-Date: Sat, 28 Dec 2019 23:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-22 at 16:59 +0900, Masahiro Yamada wrote:
> I am not sure what is intended by the code:
> 
>     d.getVar('TARGET_OS', d, 1) == ('' or 'custom')
> 
> This is equivalent to:
> 
>     d.getVar('TARGET_OS', d, 1) == 'custom'
> 
> If the intended behavior is to take the second element of the array
> when TARGET_OS is empty or 'custom', the correct code would be:
> 
>     d.getVar('TARGET_OS', d, 1) == '' or
>     d.getVar('TARGET_OS', d, 1) == 'custom'
> 
> Or, more simply:
> 
>     d.getVar('TARGET_OS', d, 1) in ('', 'custom')
> 
> I guess this is probably the intended behavior.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Thanks for spotting this. Given this doesn't seem useful, I'm going to
test a patch going one step further and removing all this indirection.
I can't what use it has...

Cheers,

Richard


