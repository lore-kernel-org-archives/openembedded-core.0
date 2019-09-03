Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 66B6A7F2A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 20:56:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z11so18913105wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=msBp0CFGiAQmUwU++EqjMD1btzZhSi6yBikAwcfrvJs=;
	b=VF4OqIxkxAucITqWdjaezZyM0xobzY8tltftseoiOIxpq2+HOhtKT4CHQauLgUdjyr
	O9KDZFJrhLMpLyCAMHzSncoqDpl1zkRXxbi1FNCMBwDvV6eiqLv4mMoYpdgW2GWytv5k
	+Ci+vgkYb467n8EV5Uv1V0BfkFURuJYVijSGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=msBp0CFGiAQmUwU++EqjMD1btzZhSi6yBikAwcfrvJs=;
	b=EwlP9mA9ub3PmrM5R6yAMyN/I7+tm+pECIunzwRCkPqRGyNKuEp+X1pR7YboYc1EM9
	27WbL8mDyCj6E1E+HCDWeDzgoC3rdVA8LtZJyr194eS8g570vHHPEP+DSBtqk2LYTFWM
	01DSHYRRqoPlnHEK/Kqf3q5NzfZBBRR2wGmJaRjDtMKFJ+MqEmtQ5jgsbZiGM2/lst4f
	Tph7q9f2AeWY+xODs4mbx88v1u6iXMejinocqPN5WH7pCKYE8JPm5v5vm6IcC1CFqElU
	uCGRyYbdab1jwJWqgwHtBKHAbcFkIbphriSwBcNnxiv5rYUvnu4bH35grrafIAVMvmNy
	I5gw==
X-Gm-Message-State: APjAAAWqm6HVijDhkn9Tm9oq4BinmvsAEdN64tuVNIne2VdKPxgCesYV
	p2qBRuSK9P8NUW1uTtryI+1g4A==
X-Google-Smtp-Source: APXvYqzW8PHcGmCIvyy6kzSJCbmW9U3ErQVHGBGmr3WpxCc1eHSTzfuGMOxfDiAMiBIZSwhjIUaugg==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr3052981wru.249.1567544212097; 
	Tue, 03 Sep 2019 13:56:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l62sm1474241wml.13.2019.09.03.13.56.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 13:56:51 -0700 (PDT)
Message-ID: <8a31bcb75bee9ee5bd1c4e44c9757d8cf7986308.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>, zhe he
	<zhe.he@windriver.com>
Date: Tue, 03 Sep 2019 21:56:48 +0100
In-Reply-To: <1774382209.769.1567544016190.JavaMail.zimbra@efficios.com>
References: <1567480164-343138-1-git-send-email-zhe.he@windriver.com>
	<1774382209.769.1567544016190.JavaMail.zimbra@efficios.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng: babeltrace: Fix negative clock offset
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
X-List-Received-Date: Tue, 03 Sep 2019 20:56:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-09-03 at 16:53 -0400, Jonathan Rajotte-Julien wrote:
> Hi,
> 
> This patch breaks the API of stable-1.5. It is clearly mentioned in
> the commit message:
> 
>  It introduces API-breaking changes in the C and Python APIs, since
> we
>  need to be able to return negative time values, which were
> previously
>  used as errors (-1ULL).
> 
> You can have it in your layer but it should never be upstreamed to
> yocto/oe in any case for the stable 1.5 branch of babeltrace.
> 
> The change you are referencing
> (61cf588beae752e5ddfc60b6b5310f769ac9e852) is queued to be in
> Babeltrace 2.0.0.
> 
> Richard: as part of the lttng/babeltrace team I advice against using
> this patch in OE.

Thanks, it was in master-next but its now been removed locally and will
propagate. I appreciate the advice.

Cheers,

Richard


