Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39C227C2E5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 10:34:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so12770172wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 02:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gItg6LvbqVkNvVpiK09L35ZTBJZL/5Br8o81teVya1k=;
	b=fYelrlaoShIMlR4nfPQT8+r8qm+f/M48/h1V11t0B2w6Z2uAMr0rXxfm8k63f5edKa
	J+y251X0s4+HaTHW4owePLgCyc9rTBXI4C3NmTOxIcKPF2wI+JalrSFUPkCeIxWyqGGh
	/AHm3ACNBzfBx/He+8MDpyLkTDDEPELrCwKR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gItg6LvbqVkNvVpiK09L35ZTBJZL/5Br8o81teVya1k=;
	b=BoguUJzP/Q75XulIhk2n6R5f3DAJOve+NFmT95r1xUN24SwkTXEOb+eygXw9dwvW+s
	w5NhHXsM7Gy3zcD9JzHehC4oN9vaxxlZwSe27aKNnnWwis8rhW6WAomzLx6+Z1IkZRX9
	PLghYAR554dRVueD+Wx/7qP5ms7Bu5e2AWamyyB/A6+XZ7FNX6vwLrdgB6Yq6Yt4VfCh
	lrTEENYY/3mWzWi63zAflNv34oIhOeYBiSevBGMl9LmA+uB6+r9pm/I1KgL4Nr84PlN/
	ZGarrQPdyS0avYx2ZLpTPjZHgzir9EJONibfgnBH/LVC8Q5t+5ptHwiGxRAULlErL0MY
	5Pcw==
X-Gm-Message-State: AJcUukeh61wYVx70Esp/fnx4Q8ACg0hUaUpoFxPX1UV2psIhuzgPONoq
	ep1/cEXhTapbSOFj0sfMqN0mcA==
X-Google-Smtp-Source: ALg8bN6RcakBK5DhbwUC8Z5HMfh0Orswx1OIG94J6aoWBPeCR7FpU4UhFXTgUEg4NOghPGaQxnvQHA==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr14287857wrv.161.1548498898865;
	Sat, 26 Jan 2019 02:34:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m15sm90722949wrr.95.2019.01.26.02.34.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 26 Jan 2019 02:34:58 -0800 (PST)
Message-ID: <cc81145d8a0f3fd9771dca0d67d2652f3fe8ad11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 10:34:57 +0000
In-Reply-To: <CAJkqNs36diCh3qUHA8+ssmi_BGKjgY_xd_bs1sDAFvWwwGp6ew@mail.gmail.com>
References: <CAJkqNs36diCh3qUHA8+ssmi_BGKjgY_xd_bs1sDAFvWwwGp6ew@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] lib/oe/patch.py: Fix applying a directory as a patch
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
X-List-Received-Date: Sat, 26 Jan 2019 10:34:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-25 at 20:55 +0100, Tomasz Dziendzielski wrote:
> If a SRC_URI content ends with '.patch' bitbake is
> trying to apply it as it's a patch file.
> 
> It causes that if we use git repository for 'patch' package
> the bare clone is extracted to a directory
> (i.e. build/downloads/git2/git.mirror.org.patch/) which is considered
> to be a patch file, so patch.py tries to apply that directory as a
> patch
> which ends up with a failure.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/lib/oe/patch.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 07a40fc50e..3d0b7d7289 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -793,6 +793,8 @@ def patch_path(url, fetch, workdir, expand=True):
>      """Return the local path of a patch, or None if this isn't a
> patch"""
> 
>      local = fetch.localpath(url)
> +    if os.path.isdir(local):
> +        return

This doesn't match the comment above, "None if this isn't a patch"?
Does the rest of the function use "return" or "return None"? It won't
matter in practise to python but we should be consistent and fix the
value or the comment.

Cheers,

Richard


