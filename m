Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id CBE8A78ED0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 09:24:22 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id o18-v6so1189286wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=woVZFGtdK2oa5Ylq2f8UB2mEJgMh1XvjJxziOUwENg0=;
	b=fFkz0yWFkk7VLcOgSBSDk4AtYgbOumNHp26aGJ++oPpw4hYP6QJkOYLNMLZzTRaGoP
	u/w75uXRELmKYjtGHFqS8VZ0SwZW+OBs2gAektuaWBt4v5LHP9OElfuCYmDCTn4bJWuS
	mvdwQb/VaCaPaINoQc5oeDWMlQj74EO5SErw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=woVZFGtdK2oa5Ylq2f8UB2mEJgMh1XvjJxziOUwENg0=;
	b=DtknD13CMtWk+mHqavnclvdwIyBaiQomWm6fSynjJkZCHu73OFrmOsqkFiTLw9yWsM
	RmIjzZdwrJl6qG+nHOTdGhJ5BiHTAkkdZD5Mt+/+1bQx6rPioaoZ/X8Vr7fj9+ueCdha
	91n0FY3/4Xe7nfkfLoffaXkRkEa939Sp+RhEO5d+F0Q0wxUIJWbL1z8zxH1sc2uoFLj5
	6pCbtzShDsH88v35nVf1rOev4/JlCgWGt7M8MmikIkXhmprTYm8DXM0crvo3uWE95zTZ
	LpzUtaE45jnFaGxny6r6HPDF/zbrFIiaC/nmGjZVZXRZCs/NR2D0dmjKBdLUn57j2eIN
	guzA==
X-Gm-Message-State: AOUpUlHpUWOdkb59f0n24KkKJ6hWn/lQZ7C466tJh51LeOD0vQVQVcoi
	idQc3XVhVdkQ93tgTflk/E6oAA==
X-Google-Smtp-Source: AA+uWPw9UHE/xKuYeLO9aorgHqxUJ6GSsox/qRHATaY/p/ETuPZrbeCrSdO6vCvqY/Mwhc9GQ5aloQ==
X-Received: by 2002:a1c:a691:: with SMTP id
	p139-v6mr952636wme.42.1533893063395; 
	Fri, 10 Aug 2018 02:24:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm9750093wrs.8.2018.08.10.02.24.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Aug 2018 02:24:22 -0700 (PDT)
Message-ID: <fdafcc6cdd7abfa519ae59df871a844a07103e3f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Fri, 10 Aug 2018 10:24:21 +0100
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
X-List-Received-Date: Fri, 10 Aug 2018 09:24:23 -0000
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

Looks good at a quick glance, I'll put it in for testing. 

Since I just saw it for other reasons, could you also see if we could
remove the ${DEPLOY_DIR_RPM}/noarch/ mentioned as:

# For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/noarch/"

from sstate.bbclass please?

Cheers,

Richard

