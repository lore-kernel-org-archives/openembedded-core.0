Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF88608E2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 23:52:27 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id i78so3081099vke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 16:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0nTI06mxEMKXAc4iuIsQkqXraATQZm2cKzVLzdbS/eY=;
	b=S/zX7WajB4sNOCEJElDzdcGk9M8x5Qz8rWme5EsflSy3Je0GBuo+37iT+AqG0nr18n
	gMeDv9Lo22tnmWp+bKzKiUAOnPYmQMXASgFLSSWY/aqicItylqj+Go8sbA75iblXbvq3
	dRcZJWiA9ZCE64r7UKcUKzg6vgxy3HrYmJWvyy7thBqkWu0bSekHcSobVNWRI78c2vVC
	X0+PCUw+VFMZ7xNNIYLto7GAnOsgIFX3QmZ/PWchbnDipPKvMA2Yk5HIKnQUkiFQhV+4
	QM+7HQFW8QT1kV5PiDG2JdQUehHw771fP7oVdiarpRrsjII5tPtjNLYNSD1B7FpgeZmy
	o4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0nTI06mxEMKXAc4iuIsQkqXraATQZm2cKzVLzdbS/eY=;
	b=TJN169ZaAo7YIuvKYeUhosPE6c2WLqOIg9lkgaDiEJMsS+8ZCWBICn+4QhdzESp48Q
	BNoFUiMzHL3vGW88ZbOdi3bSZRC/Tz97H1Cba5QMVSuvv0+JPKvuF0f7U8NN2BWxp2F2
	A41af964BPbZM32OLt0gspgU3uZhuTzHw85kJm6Dbu4l7BJVvur636aFCELXiYUlEsuO
	9OuH7o5Ki1CHlG7IsZXWQKTvZNxPnGwI24lT50Pq5dMPiLGsfLp9szsHRbsvVEhVZsUw
	nVp+A0cXhb+APOwdJu2FHTq+msg/sh8ZV6Up10wXE7Q7ZBK6aEb2mlcSlylLpwK7i3OT
	NnXA==
X-Gm-Message-State: ANhLgQ0tIkXrKUSBPbCdnADcejsElWxel+R5K+wXzld8npRVCSzNpu9+
	WCW54VaCi3jjVANHEHe1tsalwHGiUNJT0ZxAmO0=
X-Google-Smtp-Source: ADFU+vuXrptMc94uvVw7uFQM/RjnHXX2CjuOIQtKCdZn7ZkMynDtuysJAkpreTMWwtm+aSjNIjKtqLdV6XEGxnjNtLI=
X-Received: by 2002:a1f:e004:: with SMTP id x4mr3151965vkg.79.1583797948643;
	Mon, 09 Mar 2020 16:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200309234454.1387958-1-raj.khem@gmail.com>
In-Reply-To: <20200309234454.1387958-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Mar 2020 16:52:17 -0700
Message-ID: <CAJ86T=VLYoXU732i1np59BjQVuQp=qy+DUHbQAiWhGgnvQBi6Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ruby: Use arm32 for coroutines on 32bit-arm
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
X-List-Received-Date: Mon, 09 Mar 2020 23:52:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 9, 2020 at 4:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> in 2.7 [2] ruby enabled ucontext for coroutines on arm32 but it does not
> work for musl since it uses glibc specific functions e.g.
> getcontext/swapcontext/swapcontext also see [1]
>
> This patch reverts back to using arm32 implementation for coroutines on
> arm
>
> [1] https://bugs.ruby-lang.org/issues/16455#change-83442
> [2] https://github.com/ruby/ruby/commit/6c6bf9ffcbfeb8be9d9c342e7604b74ec819e88a#diff-7fccec8474e2184cd2518046bf39d54cL10
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/ruby/ruby_2.7.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
> index 268b4bebd9..884bb0ef44 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
> @@ -25,6 +25,8 @@ EXTRA_OECONF = "\
>      --with-pkg-config=pkg-config \
>  "
>
> +EXTRA_OECONF_append_arm_libc-musl = " --with-coroutine=arm32"

Generally any _arm over-ride should either be duplicated for _armeb
too (or the commit message should explain why the over-ride is
specific to little endian ARM only).

>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
>  }
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

