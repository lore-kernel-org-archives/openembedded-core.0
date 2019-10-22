Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CBF3C7D19E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 12:50:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e11so9217820wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=eR+VZ2dHdlcgHlVu3Mi8o5OAAZT4YHQUAN6hNl7/PhM=;
	b=iWymtny4fUpSjaOmxDGEj+t3+B0tGG5/jmgEkKZujaFHcLwBxyzMLJf0NEiiCfCHZd
	TzrCdgFQ6y0X25VHwdvEoxrETModvgTgVp/XHvxKX4ZtaIQLDWxGDbX3ir5bR4/7++hO
	XlQOUc05Q5gF0pb0nO6B7jWScNZHn7/mgN1lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eR+VZ2dHdlcgHlVu3Mi8o5OAAZT4YHQUAN6hNl7/PhM=;
	b=qx1CglTRNtCyz6MZ/h0imXulGODJGkRh1d6bC4y/r4GOTjrkbDIuZ8vvNv3LMJSmz/
	/LGB83iTFny67N6c1Q/F/zQkgsK6lza0JdM9DBHwPc5n0TKjs/n31yhmIN2xumdhbrlZ
	ZJklL3KRDzo8bBa8sok15xVvcytTkqhocwIxltPpySzadw77Ro//gsFzJh4ycN8NjfU+
	4RHmSQZXatI0ItwYzaxc+/hroscYeplnE/6GAzqfBwcwuDN3Me/mYkdQicUc9hm6l6Xq
	2z4NPlGB4BTENjv0X1SIaq/jtjeMN3WK/fA1KXhJXJo66o0b7ZK3YlTRVdmiD1NeKrng
	J64w==
X-Gm-Message-State: APjAAAXJ9dDf5QIsk8Z33/GMvcEflTNaeJ7E6dpQbX6ZfYB9rz8OlvvO
	cpS5AIqyNdnqHF0IukE5A+1pR2Z00gM=
X-Google-Smtp-Source: APXvYqyQGafRN8cFVSJaAwMk8T7s1vgNQqeC3+6lC3PXoWiB4GJeud8EcRdbWEr0YL7OMKs+7t5XiA==
X-Received: by 2002:a5d:6585:: with SMTP id q5mr3663354wru.74.1571748607371;
	Tue, 22 Oct 2019 05:50:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j22sm21580157wrd.41.2019.10.22.05.50.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 05:50:06 -0700 (PDT)
Message-ID: <3fa389507f352aab06a4e084039e0bcf68bde9b1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 13:50:05 +0100
In-Reply-To: <20191004142027.27324-1-bunk@stusta.de>
References: <20191004142027.27324-1-bunk@stusta.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Tue, 22 Oct 2019 12:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-10-04 at 17:20 +0300, Adrian Bunk wrote:
> This LD_PRELOAD trick is not really suitable for busybox,
> so can be the only part of coreutils needed.
> 
> coreutils depends on the new package,
> so nothing changes when installing coreutils.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 4a74f619af..cfeb42d579 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -49,7 +49,7 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
>                  env expand expr factor fmt fold groups head hostid id install \
>                  join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
>                  pinky pr printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
> -                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout \
> +                sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
>                  tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
>  
>  # hostname gets a special treatment and is not included in this
> @@ -58,6 +58,10 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill l
>  
>  sbindir_progs= "chroot"
>  
> +PACKAGE_BEFORE_PN += "${PN}-stdbuf"
> +FILES_${PN}-stdbuf = "${bindir}/stdbuf ${libdir}/${PN}/libstdbuf.so"
> +RDEPENDS_${PN} += "${PN}-stdbuf"
> +
>  # Let aclocal use the relative path for the m4 file rather than the
>  # absolute since coreutils has a lot of m4 files, otherwise there might
>  # be an "Argument list too long" error when it is built in a long/deep

This seems to break core-utils-native:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/1157

(can be seen with a world build attempt)

Cheers,

Richard


