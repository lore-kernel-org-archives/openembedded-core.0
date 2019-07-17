Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6487ED36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:41:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z1so24414934wru.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qhaHZ80gXviqUYa7BQg8aG2pYGeHtpFrr+5oJ9VXQPM=;
	b=IjhphLxV85p/lkINaHTud/CfrsozxbdeLFmZjixPgsb6qgzxKDXTIQoS5OWls+znYt
	TjuOaLyKJppPn71uaRtXGVR9oRZi/2SdZxJ3YbleeSqb9tXl1A17Bw5TJcwxMWewIgEp
	2Y5DBp0UWMggmw+oRY0C4XpebvJrhQGAxtSCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qhaHZ80gXviqUYa7BQg8aG2pYGeHtpFrr+5oJ9VXQPM=;
	b=mUvrWdL1as0q9jfVObYh5KkjGfAZc8sH8EQagJ8AAPuNFmXTW4W6kNYz9kd10tBLOI
	uvWw/hz2sVMyNrBJ3z9LbPl4GZilgVeprOJ2vtlu7uQk985Sd67GcBNPawsZWgIMLYm9
	dtyhSjr5dNXBkM5PvRNmv3g2tVxNj43TrCteQTS1XIg7tWdWsawrfRytzqnxvQaeYmCM
	zrmCQGj5jH971cXFl+17iwqw+tFTXFwiYzpBgXJa+lu3IPaFn0nlACB3zmD/rCwtJvAH
	VrwQP1CjERiR43Itpst4ld1ysrSt52gpiwQi70/1bjIHusp/QHjBVEdUKJqbPaJraEDd
	DDDw==
X-Gm-Message-State: APjAAAXFVlEr/aj9y4Zl4gDhjBnd92vyqfuk3QD5l30ZuItDxLSZ9ivM
	qc0G3+fFrCKvHz9x3K86vERanQ==
X-Google-Smtp-Source: APXvYqx92ZGtSlUzuCxY8Gb4blnrthfXEi8KNAPIWVR6cjkjwUqGgPfWE7GbFT6Zon27Q8k0u6K2+A==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr44670524wrn.171.1563363714884;
	Wed, 17 Jul 2019 04:41:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u1sm22781338wml.14.2019.07.17.04.41.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 04:41:54 -0700 (PDT)
Message-ID: <1728686637c0ddb7bfcad08769da97a8705daca7.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jun Nie <jun.nie@linaro.org>, liezhi.yang@windriver.com, 
	andreas.obergschwandtner@skidata.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:41:52 +0100
In-Reply-To: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: fix missing signature
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
X-List-Received-Date: Wed, 17 Jul 2019 11:41:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-10 at 15:10 +0800, Jun Nie wrote:
> u-boot.bin with dtb & signature should be placed in ${B} so that
> it can be deployed by u-boot as expected. Otherwise, the version
> without signature is installed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  meta/classes/uboot-sign.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I continue to be very worried we have no test coverage in this area of
the code. Since I don't know it particularly well I'm effectively
merging patches blindly :(.

Cheers,

Richard



