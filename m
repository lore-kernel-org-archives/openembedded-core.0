Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C9BD86C0E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 21:57:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p74so46221588wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=lSJO7OdRyFSxNNWTFytZ7zDG+000nZCpquMZpbOa5o8=;
	b=bhm95jLQWYxE0mOJaMj5w3M5pLamVKDKrq1vwrNJ4uyk8+jspXMvikIde/yv3VzXk6
	e2nmU+Pbj8HkAXs9X//0RPf5+IfEBUHHkAMybWbfN3+zPztnqvS4j3ntyC55vmEjWXo+
	FDUebiHtPGx3sRsxSO92g1zSuiei7lFxy3uTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lSJO7OdRyFSxNNWTFytZ7zDG+000nZCpquMZpbOa5o8=;
	b=hKzOPKG/FyOm7dW5LSTgWgDa58FmW+gRjLoEyLhaLFKNQtV+sUvhlJw0k2jNKzs7Xo
	CfjP1vCSW9h0qhHdIDSu1MdckKyKgcGdP97yLKbsWdOD1ElCABdSXBqwp5YuA3cxEhrg
	v8O1T7Tg4luOpUzwqSES0PjixgV35j3pGeLHqOipbymkTMW0cpdF61WCFsYT/sTPzUHb
	AIl3Huug3QKs6Q4KU3hXxlCTqKwvCK0taO2OTsVU0oOsKVLFRw5R9JGzOyWP9jYUcyXY
	i1n+Xh/gH1p/l35pxsmY/XtRbZTTUHdJsPDcYb/UPggofoNhjHbq0y3V35IYh9Hzyjia
	dF/Q==
X-Gm-Message-State: APjAAAW3Nsmi9OCf1w1prfvgg4US5VpT4h0QQBKmsKTyq29bpG8gyuNu
	j+s0uX7k6ZS5xFBYnCz8EUwicg==
X-Google-Smtp-Source: APXvYqwIogMnHrv6H8B7K3MVEqZXSF7pwpbMyiocwm0zV4pBdBnuLH9JBMYu3W/KbeI8BvBhH2jG3g==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr78334626wmc.175.1564091826229;
	Thu, 25 Jul 2019 14:57:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b15sm66294267wrt.77.2019.07.25.14.57.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 14:57:05 -0700 (PDT)
Message-ID: <a961a7b844771bf26bb1f8fe8c97bdaafe1cde2a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Klauer <daniel.klauer@gin.de>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 22:57:04 +0100
In-Reply-To: <dad4085c-9767-f4bc-e89e-462166f09d8b@gin.de>
References: <dad4085c-9767-f4bc-e89e-462166f09d8b@gin.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: package.bbclass behaviour with multiple providers of a shared library
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
X-List-Received-Date: Thu, 25 Jul 2019 21:57:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-25 at 14:43 +0200, Daniel Klauer wrote:
> Hi oe-core devs,
> 
> looking at package.bbclass and in particular the
> read_shlib_providers()
> function (although, without having fully understood it):
> 
> For scanning the SHLIBSDIRS, it uses os.listdir() but seemingly
> without
> sorting. There is a comment saying "the last one found wins".
> Couldn't
> this cause "undefined" behaviour in case there are multiple providers
> of
> a shared library? (meaning sometimes one provider wins, sometimes the
> others, since they are in separate files in the SHLIBSDIRS)
> 
> Specifically, I saw a build failure, which I can't seem to reproduce
> anymore now, with meta-freescale's openssl-qoriq, which packages
> libcrypto.so.1.1/libssl.so.1.1 in libcrypto/libssl packages but also
> in
> a openssl-qoriq-ptest package.
> 
> .../tmp/pkgdata/lx2160ardb/shlibs2$ grep -r
> 'libssl\.so\.1\.1\|libcrypto\.so\.1\.1'
> openssl-qoriq-ptest.list:libssl.so.1.1:/usr/lib/openssl-
> qoriq/ptest:1.1.0g
> openssl-qoriq-ptest.list:libcrypto.so.1.1:/usr/lib/openssl-
> qoriq/ptest:1.1.0g
> libcrypto.list:libcrypto.so.1.1:/usr/lib:1.1.0g
> libssl.list:libssl.so.1.1:/usr/lib:1.1.0g

We definitely should sort to make things deterministic. Since I don't
want to forget this I've added a patch into my testing queue.

Cheers,

Richard


