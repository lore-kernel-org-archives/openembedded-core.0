Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 160A97F7D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:00:45 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s14so1119009wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=kuVNwjHm7oMBDQ3HjiPgxQIE0Vvzk91fb75yvyd3R4o=;
	b=YbFptRbFsDKR6uNXMV83DRayKRCVkwtXM8QM5zD3gdlOQo9cGqxvtcrRCjsw5ddDbn
	vTTcPLJJkBsRbVtmxAswfFEUjsKMqv7TpSrfXQIAJyBV1+ZN3pSGYz+Daa8PP732aTzR
	jsXPPeZ+YWePei+j7uQax1hXk+6vfklJvIxMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kuVNwjHm7oMBDQ3HjiPgxQIE0Vvzk91fb75yvyd3R4o=;
	b=MoEsr9yyhkLeX7FLXaBRgNubcFDAET5L2EPVv9WxFazO6wZzPflevr8hLvhvQ5CuPZ
	zOw7KZMGN5PGvbBkband+Z2GN4PaCXQJo8J/K95/INubw55UhJCgiLJ4FKhuI4eMZNza
	HN6K8nE1qFHEMNKNV4mziM5JokoA0Z8Is9w4IY8kgr+7o6rpgWBxjqJxbJ+z3iFN83v2
	aRyDrACGDSRCjhmGICXQa7yxht7HQv+FZVV/auUFCk9BpagOES8KvOfpE6cLYcnUCPab
	Zk+b/e/GOTvlziXNXXRQmVj9vSaNefq20cQWsrey7iViVIkEYIl1FObPZ5VRWbC7vsIL
	wO5g==
X-Gm-Message-State: APjAAAVnZXB5Kezs4OPhM2rOToxs6T5VjYB+/VakHMXhaBkRrmTyVajb
	COh7MCC/NsBN2RQk5bF664NwJw==
X-Google-Smtp-Source: APXvYqwEfobCGhXPmIUWTQkqjnePk5uknxEpbBLmJ7pKTYVNydg7EOlEQX5BhIKIAKds2VegKamjlg==
X-Received: by 2002:a05:600c:507:: with SMTP id
	i7mr1389632wmc.135.1575489646794; 
	Wed, 04 Dec 2019 12:00:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h8sm10068452wrx.63.2019.12.04.12.00.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 12:00:46 -0800 (PST)
Message-ID: <ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 04 Dec 2019 20:00:43 +0000
In-Reply-To: <20191204193254.2418208-1-raj.khem@gmail.com>
References: <20191204193254.2418208-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Wed, 04 Dec 2019 20:00:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-12-04 at 11:32 -0800, Khem Raj wrote:
> Use PCRE, this enables using posix extended Regexps on cmdline
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 1fa82363b1..8f867aa9b4 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "
> file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
>  
>  #gtk-doc is not enabled as it requires xmlto which requires util-
> linux
>  inherit autotools gettext manpages pkgconfig systemd update-
> alternatives python3-dir bash-completion ptest
> -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> +DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
>  
>  MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>  SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.x
> z \

Given it works today without that, shouldn't it be a PACKAGECONFIG?

Cheers,

Richard


