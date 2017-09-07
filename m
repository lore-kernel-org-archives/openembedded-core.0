Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A16F677F4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 14:25:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so4581944pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dExNRZ0RnYHkngiRnhDUTtIPAWDCJla+YjfUqZEAZBI=;
	b=l5SyJD3lV/0PRLVuQU4mVYcQUM1voR588ddJN3kn+OVbahkLHdWZd08QmcoQxoJZrW
	ZbpRdUjQYZcCc99UGHan6mLEex3NucxwtAuQbI0AMS/pLO1XLR+Z/fsK40cpuUTV9m4Z
	B2xJYiX0H1RcKD0mewOzBdbAUs+pC8ABjXQ9L7YP3d/lLxduoZi5CVMZht6xDI+iGzZz
	n/OLbR3u7EEswnGoHQy9tIUyd1E0JJ0GUBO8mNs4bh0rtTMi7JbmfOSY+x6DMy2JZEvh
	gfgDM6Dx52efbuCkTHfHXjC28T2/uLyreWgoAm0yUsWnLKBSP4dyUHaxu2mGQijuhcHl
	Ah/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dExNRZ0RnYHkngiRnhDUTtIPAWDCJla+YjfUqZEAZBI=;
	b=sIcs65If/OJq02D9qgw7SnmnLs/nShYnZhF7xaBwRTrLHTtcSHWpeZw5uGlENCkDMU
	HhGSP8vGQufXkwxe5/4yFnKahsBH0yW5IqmcKLGzzdQXtRlVE2hBC7ZSTouy0EYqbAQR
	L9UysnoouR14szCqt/ty1kHq5zYjvC9eIZZnat7P06DpShATB568ZBiR5a2plIEzz/cY
	RBIgRPTA5rJMg6eow4/nEUp+mUF267FoFCswjgXiFyisCQ66tIp+uNGeDtDyHQ2xmoc3
	U0UJlDy7DhnzBsow4F/nVlX6wV5yandVFes5hr2TPlkGspWj5GKADW+/mTPZLuHPN3EX
	r/Kw==
X-Gm-Message-State: AHPjjUj1UbgVyGKfKGTxDjXYW88RsnP4WJIDVpvw8gRlR0whAcIcpZ+3
	OaHUEFZynD4WIdglextUGbHy9CQmYUbWQylmoUk=
X-Google-Smtp-Source: ADKCNb4j+eHsi17KyrVU75c1AF9U+wkQ0DU48gWIm+vjTLVXeEwM+9JFOBG/aQNV/u4Jdo8/yNfFJBQJ/lGEt+Yadds=
X-Received: by 10.84.177.129 with SMTP id x1mr3280176plb.161.1504794346598;
	Thu, 07 Sep 2017 07:25:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Thu, 7 Sep 2017 07:25:16 -0700 (PDT)
In-Reply-To: <20170907123142.28622-1-willn@resin.io>
References: <20170907123142.28622-1-willn@resin.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2017 07:25:16 -0700
Message-ID: <CAMKF1soT9H-mzF-SO-J+ABWi-A=F0RqqRxjqiUuBrHzO2x=Ndg@mail.gmail.com>
To: Will Newton <will.newton@gmail.com>
Cc: Will Newton <willn@resin.io>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 14:25:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 7, 2017 at 5:31 AM, Will Newton <will.newton@gmail.com> wrote:
> The previous logic applied a regex to TUNE_FEATURES which could
> set the GOARM value to 7 incorrectly, for example when dealing
> with an arm1176 core. Simplify to check for the presence of
> "armv7a" instead. At the same time add a check for "armv6" and
> set GOARM to 6 in that case.
>

this looks ok

> Signed-off-by: Will Newton <willn@resin.io>
> ---
>  meta/classes/goarch.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 4a5b2ec..35f2987 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>
>  def go_map_arm(a, f, d):
>      import re
> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> -        return '7'
> +    if re.match('arm.*', a):
> +        if 'armv7a' in f:
> +            return '7'
> +        elif 'armv6' in f:
> +            return '6'
>      return ''
>
>  def go_map_os(o, d):
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

