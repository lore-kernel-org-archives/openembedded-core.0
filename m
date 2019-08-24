Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id E5F0C7ECB9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 16:50:01 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u190so10994599qkh.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SmJS1gfNi+/iZ6Xwe88266lGsKULF4N+L1TSnqXTVkI=;
	b=GKRgztVmWqLvlwehwcYMyP56HaxowjaThv/991wqGDpWt6++x788Z/sQrEKyhvc9WP
	XtgKtOblddl+vhmKcYQId1M4J7YZdlJ7qbdvyFMoSdouyp9VaQzNWdJihvs8oy3MJ+NL
	yzahmBE9N8kDDw7o32Psas4ID3QZV3JanzeLCuDofz4Szp0w57ATvmMIrdFRjSc/qgl3
	OLZYDVfORGXGDMvL7PXOTH7ay9QYl9vS9TQFC/Si/rdRHVzXMv0AVfsB0ni+83Hmdj0U
	Y/svBVXyd/vRII1iN5d5pZ9szk77iP/ZlNCr9a2A1a3q99PVP0bZy47OAb4BMrVc0F/f
	fDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SmJS1gfNi+/iZ6Xwe88266lGsKULF4N+L1TSnqXTVkI=;
	b=Qhjb4NNomqTFIhQhBa/dqQPnvHU7IPjVl0XIV3/j2V7dXvCaK/3wUQTdA/Dgf4q7cz
	kUBgPuhkn+JZslpkBUYx8CdlAKwMOYDm8Z9CbwRlsCLz88EpwzpfIQFuT5ryrBXkHu0d
	bvNZBf5LsOp2Lw3+fE88XCWATQ2O/WvQ45W/pCqk/lmeREDHKHA794v5kYCEmScbpfRJ
	lof539J8YozwbmbumpOyGEyFWhrba3cpd+XWRPBfQMDCJ0L/xXBml+tub2bewEvDnI7d
	pqeLCECqyEU/qjHEh6An76eDbD2+BcNCp1HQyv7Gz3psoQmjdINV/pQzXOGNxZkiyfXl
	TcOQ==
X-Gm-Message-State: APjAAAUcwAOH6cKFYs+Keh0GPskVlGUgWhZIxr9Ats/v7yypVlw9lOi6
	NRhLStX87KrcwFDCZQwLYtX6gE91mo0D0u7pXFs=
X-Google-Smtp-Source: APXvYqzm5Nbr2C79rgedc2S9vvAwj5zsydYm+/azkIuSvFh27tgO6wESFW79Ngg3h1AnIV2PBGX09a3F110DyDbyKxM=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr9804805qkk.474.1566665402289; 
	Sat, 24 Aug 2019 09:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-12-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1566593504-21918-12-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 09:49:35 -0700
Message-ID: <CAMKF1spy5ni8O3stP=mFZWK8bjLzwwY1HUHfd+asACXX10Md5g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/13] sqlite3: make CFLAGS consistent across native, nativesdk and target cases
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
X-List-Received-Date: Sat, 24 Aug 2019 16:50:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 1:54 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> The previous simplification:
>
>   https://git.openembedded.org/openembedded-core/commit/?id=604777acfc54d285f315b622bd147ed02d55d6fd
>
> looked OK but didn't actually work as expected. The native and
> nativesdk classes re-set CFLAGS after the += has been applied and
> so any modifications made via += are lost. Use _append instead.
>

Not a question for this patch but the original patch which attemped to
unify patches for native nativesdk and target recipes. In my opinion
native and nativesdk and native particularly should be compiled with
default options and flags as much as possible, unless necessary
is this needed in this case?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index 7cf23d0..044af5e 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -47,10 +47,10 @@ EXTRA_OECONF = " \
>  CFLAGS_append = " -fPIC"
>
>  # pread() is in POSIX.1-2001 so any reasonable system must surely support it
> -CFLAGS += "-DUSE_PREAD"
> +CFLAGS_append = " -DUSE_PREAD"
>
>  # Provide column meta-data API
> -CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
> +CFLAGS_append = " -DSQLITE_ENABLE_COLUMN_METADATA"
>
>  PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

