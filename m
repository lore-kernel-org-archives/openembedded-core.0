Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9524B7D034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 11:55:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o10so1360823wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 04:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=9h/YUuZMGUzQtQ/TGGB+McYrgmQuqK5tlgM2toRPCJU=;
	b=EmjndD7hQnhEi7xwBQAe4xZRQUqI9Xy+5qvPh/+cIEJHGvh8LOlanbpoLQKdE7Is2F
	LhCuWlB3Lk136nBjQNwRz2P1jeUk6YaMvXFRhuGwb1P73jNRoDeaeUlIwlI0Xu2443zq
	47hj4e5qmbOXl316W7oPknvB5Xvpq1c3w/PUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9h/YUuZMGUzQtQ/TGGB+McYrgmQuqK5tlgM2toRPCJU=;
	b=CVrXwyd+a0qIeQjj6cBdIeaN4gZAVXbD637h6YXgjPDQACZJcHK3FPBUQT6Y+r8MO7
	SmGX484B99IkzC0MLrHJvi/EuusiG15KN8sWy9Os5ccixnSRy/if5H+BBFZgNw7Y08WT
	R9TsHbBV3JXKZpLMxFF4phVRWL0sZk70d7GXQh9Fhr5HOSPodlkxds+VM7lGqJcKLhee
	26+hmf9BbtQmOAQPH2qufVgYKBieyWctsSBgkGo8V2NqwX4XC2f2vlGKn79pORuyjoCR
	QOiJM1e2XOKujs4ry57YSDyjSAP9Zjyxt5amP3nEUQbRuoZ/6ZHhNr44Xts0D6ouCFKZ
	JWLg==
X-Gm-Message-State: APjAAAUi/S7BRTQG63AtdrMM+kNwISG444m8/t0rt7cRsj7vYF7MJZCm
	d7/7SdApwdXnWlzBw2iuRQvZdQ==
X-Google-Smtp-Source: APXvYqy+lqpJk+otk56FMGFJto8hOfoRCwFBDE746nNPvznZbFR1xxcWY/CBxaIR8DTU/YScQ6XN6g==
X-Received: by 2002:a1c:b702:: with SMTP id h2mr4934978wmf.94.1553514954266;
	Mon, 25 Mar 2019 04:55:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 3sm20924464wrk.68.2019.03.25.04.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Mar 2019 04:55:52 -0700 (PDT)
Message-ID: <d0fe7249917de2139a9d8d577984a8476b1ce395.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Liwei Song <liwei.song@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2019 11:55:51 +0000
In-Reply-To: <1553138356-85237-3-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
	<1553138356-85237-3-git-send-email-liwei.song@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/8] mdadm: add udev rules to create by-partuuid for MD devices
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
X-List-Received-Date: Mon, 25 Mar 2019 11:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 23:19 -0400, Liwei Song wrote:
> installer use partuuid for boot and swap partition,
> But the udev rules for MD devices do not have rules to create
> by-partuuid under /dev/disk/, this will take 90s to wait until failed
> add the rules to create by-partuuid to support boot from raid
> disk with "root=PARTUUID=XXX"
> 
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>  ...ev.rules-create-by-partuuid-for-md-device.patch | 29
> ++++++++++++++++++++++
>  meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-
> udev.rules-create-by-partuuid-for-md-device.patch
> 
> diff --git a/meta/recipes-extended/mdadm/files/0001-udev.rules-
> create-by-partuuid-for-md-device.patch b/meta/recipes-
> extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-
> device.patch
> new file mode 100644
> index 000000000000..c1f7b1cf8736
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-
> partuuid-for-md-device.patch
> @@ -0,0 +1,29 @@
> +From 7d1fa6afba936edb3e211f0ccdb58b1472b4bbf4 Mon Sep 17 00:00:00
> 2001
> +From: Liwei Song <liwei.song@windriver.com>
> +Date: Tue, 26 Feb 2019 07:05:42 +0000
> +Subject: [PATCH] udev.rules: create by-partuuid for md device
> +
> +Create by-partuuid for every md devices.
> +
> +Upstream-Status: sent to linux-raid@vger.kernel.org(
> https://www.spinics.net/lists/raid/msg62373.html)
> +
> +Signed-off-by: Liwei Song <liwei.song@windriver.com>
> +---
> + udev-md-raid-arrays.rules | 1 +
> + 1 file changed, 1 insertion(+)

It looks like upstream had concerns about this so I'd like to hold off
on this until those are resolved.

https://www.spinics.net/lists/raid/msg62376.html

Cheers,

Richard


