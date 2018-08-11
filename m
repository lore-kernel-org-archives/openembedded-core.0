Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0091D6093A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 16:10:53 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l2-v6so3929182wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bNtaOC0XMJjojBAA0vscEE11BffUlx/ihRkiB0Tbho0=;
	b=hz87PETyJKHxoxCbhvdjaPoxLnmOlvq3Iy/kZ1rvIB7ZKl9Gu245SKYH/z1ZBAGGm5
	Ouc1Wg+1EyHal+T4JxXuAnmCLkmNGFP0onowwi8Aoyj6clyWI4+FvI0fcMrG57x2uAcu
	gb7e8tpAtrXd/byCXhhx6hDWbYAf+jW38aml8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bNtaOC0XMJjojBAA0vscEE11BffUlx/ihRkiB0Tbho0=;
	b=JhAjDkE1I7VlAs9s/mHyZBfPJOZfO1/r3590FP++1433imDr634WDW2kQxx/+r1Y8n
	X4MqHpfgkv+uqbQo8LCWU4zQAOPfViWPOOFofohoRCE+1mJqzFeJbXpHlqNwJK6OUblx
	kO7WZ4h6piuejDnRITDBiwFpBF+hmozIqs2ZoS2BHllc6eteOyGPsjJk8DcA1AJjPp28
	aIgpsjZ5ufO/OeE5YNezhZq57Q43FWoLG/9uFiQANUWcSalZNrxu1WCaz3sXCRNIv4Rs
	aCo5ZqRTl1vFlwegwKcsojzyb8ins1nT5462F5tcalBux/ch7wLimDzqe5dgkKjckVqp
	u/Vg==
X-Gm-Message-State: AOUpUlHHfaWY/cOqHLIPYUmoOch6zyXRYF8CIzb/g+5NtgXMugBzWfzZ
	5a0/4zar4ilArtAxp2katCa3+Q==
X-Google-Smtp-Source: AA+uWPwYFZWt/UC6Y7NbsAwapBKM/oZwIhjsw2OYTlFbCcO6OmjexJH//aoXiOcFstbu8CdfPB3ipw==
X-Received: by 2002:a1c:d946:: with SMTP id
	q67-v6mr4076469wmg.156.1534003854677; 
	Sat, 11 Aug 2018 09:10:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q16-v6sm3141972wmq.25.2018.08.11.09.10.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 Aug 2018 09:10:53 -0700 (PDT)
Message-ID: <3dc3372508f6543edd5e6805ca004bf4bcb80c1f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Sat, 11 Aug 2018 17:10:52 +0100
In-Reply-To: <8aa373833d3e5f54689b8863f864c39dc90e5cab.1533888808.git.kai.kang@windriver.com>
References: <cover.1533888808.git.kai.kang@windriver.com>
	<8aa373833d3e5f54689b8863f864c39dc90e5cab.1533888808.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Sat, 11 Aug 2018 16:10:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-10 at 16:14 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Some allarch packages rdepends non-allarch packages. When multilib is
> used, it doesn't expand the dependency chain correctly, e.g.
> 
> core-image-sato -> ca-certificates(allarch) -> openssl
> 
> we expect dependency chain for lib32-core-image-sato:
> 
> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> 
> it should install lib32-openssl for ca-certificates but openssl is
> still wrongly imported.
> 
> Disable allarch when multilib is used.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/allarch.bbclass         | 4 ++++
>  meta/classes/icecc.bbclass           | 2 +-
>  meta/classes/multilib.bbclass        | 3 ++-
>  meta/classes/multilib_global.bbclass | 4 +---
>  meta/classes/package.bbclass         | 9 ++++++---
>  meta/classes/staging.bbclass         | 2 +-
>  6 files changed, 15 insertions(+), 9 deletions(-)

With this applied, "bitbake nativesdk-dbus" fails to build since
it can't find the extra autoconf macros from an allarch recipe in
DEPENDS.

e.g. https://autobuilder.yocto.io/builders/nightly-arm/builds/1262/step
s/Building%20Toolchain%20Images/logs/stdio


Cheers,

Richard

