Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE1817D3F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 09:11:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o25so8305809wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QdaDfmgL7JCGDHjRWWNzYuJoeHQyCJWJ98ot//yHbiw=;
	b=HLvZqXIDtZhD0woIPeUUHckJGdXSsUZiLayPeUmlRtmd3TwsmsPhx4ig4yVzh61aDA
	3usx4ieWl+RwVDorZ9vMNGgVe3xyMDMUVkHqLcDu91wVBOPaOciPV2s7dKWa7m3JEQXH
	pc//Wh9EI/rMbmyV0jcwDsyp9md3BETpR7hWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QdaDfmgL7JCGDHjRWWNzYuJoeHQyCJWJ98ot//yHbiw=;
	b=drpHhv8AJzz9ZuD0Om+wUBiIfLdYzetD9msMNAoMA2N/KPnpWb6NiZZj3eawhDX5vZ
	XYkuRd2XBuMJucoFnomUOinEct/L9fJDk0ZhFdPfAX6wHhnOXMFhbgeno2dGNeo3Je5i
	ZRYBdr3gMsQvjsjIvjfER3EP14dAj6KHzn4Pw9nJfiR657QCjq+haXBFusp8mQfemDJJ
	rH1HD9uthd+0ILUXUE0M5IJk15mOi5R0EAeicyw6K5H1ROe31WL7WrVmwJylu0B10I8J
	oaO+0hgRM2bvEhZkSuKRCk26+LBPLYL95NL5tZIeut3MEE1bPaIEYpRfsfgqpQrX80yy
	HAXA==
X-Gm-Message-State: APjAAAXVZPI59kNayQOETSJBpZMZ9hdyeQIzMDd4LoVcbSu9w9qp3Umj
	qOoUsUoHMOBqX5IUqqZ7e/UwOw==
X-Google-Smtp-Source: APXvYqxfIddsYq2p0N4mtF5Dlo2PeuVeabc0wVkQL/fvdQN7bqRyUyHwCnIIS2ULgpGvbuN5PhBqvQ==
X-Received: by 2002:a1c:dcc2:: with SMTP id
	t185mr21319930wmg.143.1557220281418; 
	Tue, 07 May 2019 02:11:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h12sm8922278wrq.95.2019.05.07.02.11.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 02:11:19 -0700 (PDT)
Message-ID: <b0de3994461222d72afa80ec291874c609d7ba93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rui Wang <rui.wang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 May 2019 10:11:18 +0100
In-Reply-To: <1557198375-4569-1-git-send-email-rui.wang@windriver.com>
References: <1557198375-4569-1-git-send-email-rui.wang@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] dhcp: Revert "dhcp: enable gentle shutdown" and reset handler
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
X-List-Received-Date: Tue, 07 May 2019 09:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-07 at 11:06 +0800, Rui Wang wrote:
> This reverts commit 4653fdd4b4cf13543e32fbcf09e50f60c1719a34
> 
> This patch is used to solve the problem in which dhcpd can not
> be killed by SIGINT and SIGTERM. But it seems not good to rely
> on ENABLE_GENTLE_SHUTDOWN, which is an "undesireable feature"
> and will release its address after receive both signal, accoring
> to the comment in "includes/site.h". Then there is no difference
> between "dhclient -x" and "dhclient -r". We can find following
> call trace from source code:
> 
> main() -> dhcp_context_create() -> isc_app_ctxstart()
> -> isc__app_ctxstart()
> 
> The root cause is that exit_action() is registered as the signal
> handler for SIGTERM and SIGINT, which do-nothing as the comment says.
> 
> To fix this problem, we could simply set the default action for
> these two signals if ENABLE_GENTLE_SHUTDOWN is not set.
> 
> Signed-off-by: Rui Wang <rui.wang@windriver.com>

The new patch is missing an Upstream-Status?

Cheers,

Richard


