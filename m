Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.19904.1585335383221593314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 11:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=d4YZORRk;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=hdlx=5m=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48prfp2wcmz40;
	Fri, 27 Mar 2020 19:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585335380;
	bh=KFosnqAAPYJfkC7AYT9XzLLiMF2RB05vyoB8fqFAY+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4YZORRkmsnOCyuJaSKjgDdCXHkUj3+Qo5R/3+Dp8a+zgvOLlRx5yeZULe9SWgcGS
	 aFD2hFU7I2qCGWnHwVptzpt4vLAbsPi2dd6hW8qJn3NRhJ9cKfGRBE1A75w/T2cYR2
	 LvZZR6dmTPuvnmq91EBICuCY4kXfMNf/JnUgLPQNjzUabts4qpR0dZ063+IGvyz28i
	 CbmtJr3R+bqYl+OKRhQoaQzoVPi19ZxSgQ6ig56XDKVDfl1e28SIqieXN3jysGYNnt
	 dA6JdiqqBKrNmxnRc9T/nKo8/rRd6NbpjbIro0IBF9p61TElj1IEPnHo9C8uv/nSbP
	 iG/eSbyiIvCssjYRLNTz+FHQeGvLr3x40cGi8PEeTMq0byd886BhfaHX33UQToGoB/
	 htbg+yMDctysO72VJWlZnYnMp7qGNCe3qxkQP40MJNmtbryWxvf4JGwgXMiX5DZwjL
	 Yeq59iQ7XgM3MOiaJAP1MBNSVYjMUcLU/ThNJ6cxT782r4fVZY+hrOuVXvmgrYu/3c
	 dXMZUTXHjE8Y/Ui9jAWbhUn9BRlbUWVcRe02rSTeodm6sPrQAcZzQbco7YULyaANpE
	 D9jvr3xRNm6ZeC9dMMsQBxMkuqZ+ZOnV3U88TbpxbrO0O0X5R3VW34GTgJmTsYH8ro
	 Q1jQurcEdIWZhQcRlFgkL5aE=
Date: Fri, 27 Mar 2020 20:56:16 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
Message-ID: <20200327185616.GB23840@localhost>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
 <20200326191628.GC5401@localhost>
 <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
 <20200326202650.GA14127@localhost>
 <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 02:23:03PM -0700, Andre McCurdy wrote:
>...
> Right, it's not related to musl or glibc. I suspect it can be
> reproduced by building for an ARM target which supports NEON, ensuring
> that DEFAULTTUNE doesn't forcefully disable Thumb (e.g. it should be
> armv7vethf-neon, not armv7vehf-neon), setting ARM_INSTRUCTION_SET to
> thumb and then compiling with frame pointers enabled (e.g. by adding
> -fno-omit-frame-pointer to CFLAGS).
>...

Thanks, this was helpful in figuring out what I missed when testing.
I can now confirm that the problem still exists, also with glibc.

cu
Adrian
