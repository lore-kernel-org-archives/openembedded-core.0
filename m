Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 61D3061121
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:07:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t23so12298337wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MFjytXCYoarsywI+01fbPkT3OXL2oOK7kY3ps8bfxJk=;
	b=EwaDP2/KD+uJvFacdse6l4r+7F3WU9LNU460lPKEyNMcxMRFiDp3zVyHN5NxGAvAd+
	zsIn0bXnOc2yXICgBjVfJPhPkfhecZHF9Up6GR6hUfs8a7TrV5co3jYg28oPQ7MS39Bf
	Ae6Ma4voA9p+awv3WMS8VlSL24vjI3NHSsaio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MFjytXCYoarsywI+01fbPkT3OXL2oOK7kY3ps8bfxJk=;
	b=raU1S6YS49UXfiQgUWImiyS56LW2lsK6VOdKgr6Bv23VjEdb6954LB0BF7kWRz3Ctq
	p6htSYCZ5JOv0qaqEkmb4tcEugdwWaN07Uz27yZRwzqh1b6Kt4WgnGb7GJUl7cIBvmNg
	prYQZUOR0pnqvrHtxz6Nxib+qWho1jOT3aD9DOoNFWsCFkizC5FQQSZ+GVWcwayF2J2n
	veVjgLzFd9OIMOHdRSlBURwBry3g+s2XE7EfvCtXpVxMJYiRqMq9olSLI3IXx/zoJrl0
	KjterboKR8FJV5b6Dyq7KBH9O9jMyZYRiiuhdSaBhJaGv4JVkpqPQMhdYIvGi8YCHkMQ
	bPNg==
X-Gm-Message-State: APjAAAWZOqeZy7ACqtTTkehedJ00GgXtPO58+ZDdHOG76+dTJdPUkX8e
	Kfkw/+2lLWKf/y2JHPQB1Dl55g==
X-Google-Smtp-Source: APXvYqw7pNSak1OAFR9g7D5ntXVrY+DZBQDZkSz0zm6/fp4//aTFAZb5TRxjT2hQIgrBwVEZ2e5FCw==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr9269599wmj.57.1581754055951;
	Sat, 15 Feb 2020 00:07:35 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w26sm10387607wmi.8.2020.02.15.00.07.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 00:07:35 -0800 (PST)
Message-ID: <5cb5c42022e1032c871c13222e1279df6d6c46f0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kevin Hao <kexin.hao@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 08:07:34 +0000
In-Reply-To: <20200213023141.1657-1-kexin.hao@windriver.com>
References: <20200213023141.1657-1-kexin.hao@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] wic: Honor APPEND
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
X-List-Received-Date: Sat, 15 Feb 2020 08:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-13 at 10:31 +0800, Kevin Hao wrote:
> APPEND is used to add additional parameters to kernel by features,
> such
> as read-only-rootfs. So we should honor this variable when we compose
> the kernel parameter in wic. I know we also can resolve this kind of
> issue by using the .wks.in template introduced by commit 42e870c5ed4b
> ("image_types.bbclass: support template .wks.in files for wic"), but
> the
> APPEND is needed by all the wks, it would seems pretty ridiculous to
> me
> to change all the .wks to .wks.in and then foist the APPEND into
> them.
> So the APPEND is definitely deserved to export to the wic directly.
> 
> [Yocto #12809]
> 
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>  meta/classes/image_types_wic.bbclass | 2 +-
>  scripts/lib/wic/ksparser.py          | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)

This seems to cause a selftest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/688

oe-selftest -r wic.Wic2.test_image_env

Cheers,

Richard


