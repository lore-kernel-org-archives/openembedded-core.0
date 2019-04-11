Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id D694F7D3B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 11:19:15 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 103so4846393otd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TuL4ZucuIFZX3EUFhe4ZdQko6HGHebs0ub3GjNo3AIs=;
	b=FZROgtJPpcd2Fb1erytSiCnQ72bQMcPlN13YpgdnPxpFpTQIqPmuSeLrOSCybbUMGi
	+jrV6EEcko8iwIK9FpdzINgSwJOxlUwSXAvP/Q3zazuUnodlnE6OOGW/HEB061dV+Mjt
	z3W8dFI5OToEY/j0mVq6i+RY9znzsAngYY9HaBMdd11usB+fWc2/yF9des6qrrsgR3GY
	5qaP9vw9RpW2BgS8g+hlMCvbKrH8wDe09KvKMavc/przP9tOhFRKYb5r5/vKSzyOrVjv
	Fyi4XX2fLPhnWlGAJjjUjdcLQGN4tbY/yYwJfK4c+GEMBwZOl07uIGlmlxyhSPMoht8M
	0EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TuL4ZucuIFZX3EUFhe4ZdQko6HGHebs0ub3GjNo3AIs=;
	b=EQAj5lCdzFqMKbsJj950zahyOjXaHW45dyC3RkdrlND1T7T9ekX9s5rOu++ClDqNJY
	AByvhi2ys+8A0ol63gWgSCJG35I6n2c12IXJWyj+t0qYOfubxCghjxTKw4808PBqd5IH
	uEeLbGfSuQOuHoNtqcB04OxDB0dWg+0sXUZNaE3RV3HKajke9Ym+paZpvua0O7u28ChK
	Wd4+V9t+jXu7ypz8S+ZAEm2Zhx3avYb+QgQb+jqnC0IBBePGKpxK7bnKziE8iZiziUsI
	JUbWWJSOIIs0Kzw46XjKS2p+iSCF9XeLDj1ifpa66zLjix7hxL4AQmGZWemgn39rhgDJ
	MFrQ==
X-Gm-Message-State: APjAAAUekJU0lcPrhLLp9Rw8I+j1pym/Z6N7miibUj9HAErwbbutIFBY
	76V24hH/x6oogS5wNtxg4uYydRdZqsfU3cZ28lY=
X-Google-Smtp-Source: APXvYqy+50nYMUbwejt4sMiMwz0/moyHs3w2tgEy3cFLjzzPpG8/pdZuNWgvb26bkuQlHAQEjqHlnDqxTIeuzi1k1/Y=
X-Received: by 2002:a9d:68cb:: with SMTP id i11mr31996269oto.237.1554981556898;
	Thu, 11 Apr 2019 04:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 13:19:05 +0200
Message-ID: <CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Thu, 11 Apr 2019 11:19:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2019 at 08:13, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:

> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -101,6 +101,7 @@ toolchain_shared_env_script () {
>         echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>         echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
>         echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
> +       echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script

Please explain why this change in the commit.

> +RDEPENDS_${PN}_class-nativesdk += " \
> +  python3-core \
> +  python3-codecs \
> +  python3-netclient \
> +  python3-email \
> +  python3-threading \
> +  python3-distutils \
> +  python3-logging \
> +  python3-fcntl \
> +  librepo \
> +  python3-shell \
> +  libcomps \
> +  libdnf \
> +  python3-sqlite3 \
> +  python3-compression \
> +  python3-rpm \
> +  python3-iniparse \
> +  python3-json \
> +  python3-curses \
> +  python3-misc \
> +  python3-gpg \
> +  "
> +
>  RRECOMMENDS_${PN}_class-target += "gnupg"

Do not copy-paste large chunks like this please. Assign the
dependencies to a variable, and use it where needed.

Alex

