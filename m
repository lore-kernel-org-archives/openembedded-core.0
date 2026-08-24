Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91E4C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 20:54:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7654.1787604882879058739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 13:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CMT00Vzn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2685563f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787604881; x=1788209681; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EL2k+og8iXmnkcA8Oc/k/c8+DxjxwEaK/+gldJi2TBg=;
        b=CMT00Vzn+AUPdaHRwwHzo0Db7FnzxU219tYklB0sAFLTneT47CTC7ARP+MKVUcbNqj
         vJobcLmoZEwAlhWt48Qw2mE/Val+RDYqGv0+YfjYF83P1jJL8vWQB4vSqUFK5UMFnHJ1
         +4PF9x6FQ5cDDDlOlxzieG4JmsNh4Dw2CV3Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787604881; x=1788209681;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EL2k+og8iXmnkcA8Oc/k/c8+DxjxwEaK/+gldJi2TBg=;
        b=lWeWCQIshBnVLU6rn60qFP++gSrgn4HAgPBIiyfkhM89yVG5LwwT1A9rY72xxcvNy+
         pmO8kIqZzPgDgkB83ktv7o/NofoR/udJ6MoYjW3vZ/KdvDjgZ11dYnzgXylkWajsgLKc
         /0jknAoOLF7zqHvT8kGz9YqtRli+YNL5u6VRxldP3VRiN+jen9RVP0Pcr9DizOJSS6Wz
         rmbqLGEPPIVHyftHVKeujNhiYmWhsXcTtB4KOZ0c8kTdh7GoTWhNMh2MQ0k9hy5fvvbn
         HaWNiEXtB5MHUageg8Y/J4/mDcqVsEjXUtWHIXF6T8u3VCMw701CftkB1/CS7nYNPUe0
         gUrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxID/B1UuLY9n+KcVxfO+44U04TJaSZVP0uHtVmrXdV5Pv9Kn5sUjPhhLaDZVmkDUY+EGRTqMMLLyh+U0oB0FQnQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++miyrX+UtdKkWIdS6vH5apNuGVLlfOD+JPXVvw+eb7WvseVDDub
	R/7BM5hCiI1oJq6kx6K3ksc+wixKQzw6stCeI0lk6bMjNuEcXbH7MAh0ZOGCBMyGwZA=
X-Gm-Gg: AR+sD11V2jCww9N81c86C7Ubm7czxxlpwPBxg5ksdLv+PiMZQgiTdBkNoaFeJGd65b6
	sJmDJZABOqBiaKHtqz5MUuTRCJt5FjHh+sSiDcByjFsCqtOT3JfT05iEePQjT1kNb6resUoCjtc
	V75INY7S+xUXW0PyYF7a8fAwb37LIh8CMa4SzHh37AyO/pxFR/4y6d7KeFUE5EENFEOaYFTe4CY
	iYoyRXQn17VP1Ox6EjhxoPzcLoMCZxLj/e5bqmuIH9XpE8+muDIZbnzWBea+XiF0P5kyJe44/I3
	ua93ciHmT6+6WIc4QC2FqRZKr8zKXXjzyady3/ACyEY5l4/xcV/M9iVD3FfnywWt8NyqbYXw5lr
	hUb0v/SNBnH8gQEWID9SXndXmQRHN2EHhDIfyLfTJkug7Fw3n8RM/kYvLg8B+lzOhxS0Z8J7ofX
	GCCiWPTqq9E3TAgwEEWKDlZKL76NPONMx2EtmCPhDEQyGRYD+e7Gk9Gc9uWRuyzq1MGhvB79prF
	Wjt8FjnCcYy0YKBhoN0Z1rCQOfX+UDJU7XkklakeRO16AbZAD1eCSQ=
X-Received: by 2002:a05:6000:230a:b0:482:aa2a:52f7 with SMTP id ffacd0b85a97d-482c817acd3mr23219658f8f.6.1787604881068;
        Mon, 24 Aug 2026 13:54:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f? ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd2aesm9361829f8f.21.2026.08.24.13.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:54:40 -0700 (PDT)
Message-ID: <a675f066372e55c60a68c661f3f72913ba67be53.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC v4 0/6] openssl: upgrade 3.5.7 -> 4.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, jaipaul.cheernam@est.tech, 
	openembedded-core@lists.openembedded.org
Cc: "yocto@pengutronix.de" <yocto@pengutronix.de>
Date: Mon, 24 Aug 2026 21:54:39 +0100
In-Reply-To: <1ab3fd79-62c2-4697-abdd-5691fa8b9e7b@pengutronix.de>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
	 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
	 <7a100e486f8bcc7f48ec0073ccaa95fabeb8b59f.camel@linuxfoundation.org>
	 <1ab3fd79-62c2-4697-abdd-5691fa8b9e7b@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 20:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244152

On Mon, 2026-08-24 at 16:16 +0200, Ahmad Fatoum wrote:
> On 8/23/26 9:02 AM, Richard Purdie via lists.openembedded.org wrote:
> > On Sat, 2026-08-22 at 19:51 +0200, Jaipaul Cheernam via
> > lists.openembedded.org wrote:
> >=20
> > There was one failure in core I spotted in barebox:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4689
> >=20
> > I think that is openssl related but it is hard to be 100% sure.
>=20
> barebox v2026.08.0 was released today and it includes following fix,
> which should make barebox compile against OpenSSL v4.x:
>=20
> https://github.com/barebox/barebox/commit/7152488b95484e8fc4a427471dab0aa=
4fa5e0aad

Thanks, I'll queue/test an upgrade and see if we can get things
merged...

Cheers,

Richard

