Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6887B7941F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 08:32:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v16-v6so14035465wro.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4C4eqT1T6qkFS2whXG10Ploe+9AJvgn2ZgeU6VGc7RM=;
	b=fUy+1pDZkMJGFjPv7VWFBHCiiJx/3GBi1vZQJyFGyWbWxsKZglELhPZ3ipNEKBrUSN
	fkKlqX3e1+5vh6cpd1PNffp5c8pdf4vDEP8K5xdzCby5UUzkNfG4ixHUZtUYsPXr4E9s
	6n38KNcFdie261N7utCwLp3I45vnB2zmVQv1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4C4eqT1T6qkFS2whXG10Ploe+9AJvgn2ZgeU6VGc7RM=;
	b=pCXBHFfW3SL8FXG5miecUuIb6OF+jDRWGnZioU5qBKDVwsx6twoiOf7Cnh00q/Xg/r
	I4IPQSdhWgaw4egkE9xkcfP/xKOfDOFa1g4LbszcTEggP8NFqAHOyEED1g56Z1z6rdPx
	8zXJPCphozyPaiCigNv1FXRRKLmlVID5q8/OFjuNUcU4w4H81pW2ykuk4Ow1wNHwQ/m6
	M41f4FizrEBEk33d5lWqGzf/xqGUeaqh04Oqe3ScPLPCV/W/Mryt4ouTWZEK4wYmtiio
	5Tbl1TPC6AE3fk9U8uiEYDFsG+nvn1/s9TjZum7X0R1A4etaQEPvS8yJ1AmqKdC2jxnH
	CQsw==
X-Gm-Message-State: APzg51Ad8shn4gBJKfAjaJaHYWqXZbhoxtFrMS4e+rjIiKh0T0HxFdjf
	TPcYlDaT22bfFYvgAs3YT+dLZw==
X-Google-Smtp-Source: ANB0VdZKkrxJUSLii2MNIfuI0ysXChhhICqUMZRp72ucbDeHFEa+UZLdqgESbu8FRm8DEKm0cvi6mw==
X-Received: by 2002:adf:eb0d:: with SMTP id
	s13-v6mr5192218wrn.174.1536309127023; 
	Fri, 07 Sep 2018 01:32:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g17-v6sm5713199wmh.19.2018.09.07.01.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Sep 2018 01:32:06 -0700 (PDT)
Message-ID: <a984728279d4ddd6664b0c15af35a2b3ce552067.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Fri, 07 Sep 2018 09:32:04 +0100
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 0/7] disable allarch when multilib is used
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
X-List-Received-Date: Fri, 07 Sep 2018 08:32:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 23:52 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> V5:
> * set PACKAGE_ARCH in event handler bb.event.RecipePreFinalise
> * add execption of target-sdk-provides-dummy for package_qa_multilib
> check

In general this looks good but oe-selftest -r
sstatetests.SStateTests.test_sstate_nativesdk_samesigs_multilib fails:

https://typhoon.yocto.io/#/builders/28/builds/44/steps/7/logs/step2d

Cheers,

Richard

