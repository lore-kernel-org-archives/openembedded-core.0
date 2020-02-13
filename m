Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 94A0160C73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 14:57:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so7083800wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bJkAWT2o70K0LN05aRsL7LXXHPbSZQDeUFyc+xFByGE=;
	b=J5/OFHYkh1ouYWRZyCxAFjp0ycjzdaKOcatsn/WoxeQzpqTePqm5t/41ljMFV0baag
	GBMhb5XJZ0kkDIkSp83X/0APQTM6q1GgiDyp3fRWYnl5dYPm9u6WVsteXcdot0v0UK3u
	HZzajW49gQq6Ou48AD+8QiIuyBHdX6S+zHTSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bJkAWT2o70K0LN05aRsL7LXXHPbSZQDeUFyc+xFByGE=;
	b=EIlVYY98adJXcaFsgYLNjBW8UpkUbEfsl5jWQ6bOX787PPyc+swVZTBs+7IGXKJL/o
	ARTQNPrXvDvInb0Wz9AH7eo0Ggi9vNN1O965vkxRJiRkeJbQslvO2ryW5nhLe/Ujy4py
	/2/jRX71s0GwrTrwMIsEkeD7vm/S0COW5aoSWNqovMsa6D8UE68QUQsUFW5S5BuvymZV
	hoDGQo4rzhohdKBRzN1jwJre+yRgzGf7FPiQcx79vIChWF13dGjHRHOZYzvgTMkS+lvG
	OYMTFst49yL4jhh/zUC0p+eF8yNgx36QPeUYI1wtb96F9ZoV273Chfazuqn9iNPGRNby
	POCA==
X-Gm-Message-State: APjAAAVLGgjlohaWlaqZrFcf9/2B6fNoUmzYQD0VgoalE78Clkt0DBQO
	dR2KDQVy1Kpi+lEXmosTgtGFiw==
X-Google-Smtp-Source: APXvYqzHpPghqmPrXg7aVlops3oAt6AjYQJKO/9nvZQrJu8HjcUso00EqJPz7Jonz0u1RfP7uqJs6w==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr6218965wmf.63.1581605864322; 
	Thu, 13 Feb 2020 06:57:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c13sm3140819wrn.46.2020.02.13.06.57.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 06:57:42 -0800 (PST)
Message-ID: <d7204f49d7917983bc22c212708b4995567c4a4b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 14:57:40 +0000
In-Reply-To: <0ed1fb312bbdfc1bcda92d8f153cbca0ba39fb1e.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
	<0ed1fb312bbdfc1bcda92d8f153cbca0ba39fb1e.1581580428.git.raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] busybox: Backport patches to support removal of __NR_clock_gettime
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
X-List-Received-Date: Thu, 13 Feb 2020 14:57:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-13 at 00:21 -0800, Khem Raj wrote:
> This helps compiling with musl on 32bit arches now that musl has
> switched to 64bit time_t
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...rappers-around-clock_gettime-closes-.patch | 113 ++++++++++++++++++
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |  53 ++++++++
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |  43 +++++++
>  meta/recipes-core/busybox/busybox_1.31.1.bb   |   3 +
>  4 files changed, 212 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch

Patches fail to apply:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/1797

Will abort this test run, drop this and try again.

Cheers,

Richard


