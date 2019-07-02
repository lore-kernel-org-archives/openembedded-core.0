Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45F267EB0E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 12:36:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so17661079wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 05:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=CV6N45y5ln/a/BPvxbDOThSxIKPdF8I7oP71v/mb7HY=;
	b=cZoTclCk6cIZgPDDNvjXM0Q0BmzoqgfseM0sNWQ9g/3i/S81ikP7dVpRZ8mLb1M2Sk
	vJj/WI0p3SG1UN2dCZRBnqZekXZ4ksB7/6PNz5vPuwfI/6p6ukrWkkIdPmGgVknv6FEm
	QSn9tgvaKqrsGlDqGaxeUvKfx117FaGVv/wuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CV6N45y5ln/a/BPvxbDOThSxIKPdF8I7oP71v/mb7HY=;
	b=ZDCWm1pUJkSx4Uo3bONFX4+Rk1Rppc4xjcBRE0MexYSRH23qJ2g8ZT6zMqoUlILzMw
	i06Ps3+Pgv636u6NfCyf6VsZfB28sh8lp19yfLh15SYrwYY9cEG4KsMzuxeyCPdDt70L
	3DcMpEXH7lkww9VygZ29OoYCSqzFqPgGGGmmH0/S7fpiOJgQQVxdLwJ4imtdarGW9Mhk
	2kkq89vujR9VKbuu5Ngovg8ZDpQG7LyUUb1qT90wpbIGoly7jdIQ93XxJbzi1MGwNIlA
	UBTRP+TW/4HpmPzLecUu7bjwscM0TlrU2/28UT9k/MwiVvHT6p4WSgv0G1BTUeRipHG+
	pfvg==
X-Gm-Message-State: APjAAAWdhSTqRfKDos+HsH9RCEgM6SQ1j+HjMWTazmI6VWpqXD/Ou0g9
	MpUnlWIKGamsttuIZRcen1QdQg==
X-Google-Smtp-Source: APXvYqykBoxNKjSSL/LCm0uFOFHtMDpoDs6qXEdcZ9r2K1aE4m6lju0NpxQtdOFSEK8CJBDzB/0iQw==
X-Received: by 2002:adf:ec49:: with SMTP id w9mr22024789wrn.303.1562070984102; 
	Tue, 02 Jul 2019 05:36:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s12sm2346397wmh.34.2019.07.02.05.36.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 05:36:23 -0700 (PDT)
Message-ID: <5216e46ff0ed4d283b2a072e7a9780feba89df69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jul 2019 13:36:22 +0100
In-Reply-To: <20190701182306.32677-1-JPEWhacker@gmail.com>
References: <20190701182306.32677-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa: Test bitbake --skip-setsecene
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
X-List-Received-Date: Tue, 02 Jul 2019 12:36:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-01 at 13:23 -0500, Joshua Watt wrote:
> Tests the bitbake --skip-setscene option to verify that it correctly
> reuses tasks previously restored from sstate, but doesn't execute new
> sstate tasks
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/bbtests.py | 30
> +++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

I like the idea but unfortunately it doesn't pass:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/267
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/265

Cheers,

Richard



