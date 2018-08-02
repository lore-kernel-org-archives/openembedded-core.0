Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1A16978DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 07:47:57 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id u11-v6so806486uan.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 00:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O69DUb7VffBOsiQDLkK9aPAefRZhmPAiDiO0M5bbpi0=;
	b=KoCzYqdr6ohKZIj8MXjgqysN0+JMyZ5r9Zz/O9KATqI9EngwnjVK3qrkjmyY+sHcJ8
	QBBORgpyAiJmUvFMZ6MExC9MyJNqYpPcx0P6PjVE9e7y8JtIKzBpOtkkMyPCOZc0Szdc
	ls3WU7cqHc8pbyQCZVfNOshG1Tv4du6eORgVcXdOo13g34OP3XA4w9T5Lx2zRU2CuMnr
	Jqp2g2OBo6AjuJzjKwIyuTDNFXqWEUadl4xRNhaMcPur5RavUozG4mvIcluXy0MX3U7N
	5Dq4RvIEhy/H9j7HaYQnaaR488luyNDOP/vZB4EBiHKCbT0mLZ1mr9rJAA/cpWnIf1V2
	hA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O69DUb7VffBOsiQDLkK9aPAefRZhmPAiDiO0M5bbpi0=;
	b=JvyrdvwgG+nQkFOO1BaajEkPdSsThY8YVOl34rUHXKzOGrV5A6XLh51r+/j3j7unZ2
	mQjKW3J0QgIMSTemBX4CDr4lbuJJj8In8OkPP17jUM5x6xj+QBG1/B5FR+jgJIGgKaAn
	BFIGduTIsFpageppd+ngggWLUBsncvJ5LLuJa1mwRQxdGR843U7cY1zgzaby0s+v6Nby
	ZmEBCeENdYdQ5xyW8YDjOT1mE+woCvRCiPrw6/bWocJPKGMYixh2w8dw1HmcIjm7BGuV
	ZBe43SidoUTTnYSQ/gNYE0enyat1ECmUkAjNpfA39xotNpdvi9ks2ldF67XRZsKtBXI/
	0CrQ==
X-Gm-Message-State: AOUpUlGcVVcmjm3heM0DPKRAjlzBSevWPNdQzgJXmbRvDYsvQu6BMMpG
	pEMosStIRpDNzlzw5Y1GyDxrcJzs1idT2VSU45Q=
X-Google-Smtp-Source: AAOMgpdx1pmNQ7naxwzkrqcKc6pPEuNqb5WZbOwafrBAcKyu0FvZf7LLwdvc3AU8eDXBAzwYPt3BRCAcBpZcxpV+vIE=
X-Received: by 2002:ab0:52f1:: with SMTP id
	w46-v6mr1099811uaw.52.1533196077958; 
	Thu, 02 Aug 2018 00:47:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 00:47:57 -0700 (PDT)
In-Reply-To: <20180802071149.19272-1-raj.khem@gmail.com>
References: <20180802071149.19272-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Aug 2018 00:47:57 -0700
Message-ID: <CAJ86T=U1A=NLC+oPZtB89Ckcjx9yMUrQfPHCo=Z4uBVc01zvYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Thu, 02 Aug 2018 07:47:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 12:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
> fix internal linux headers
>
> Full logs
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8

From the musl commit which fixed the dirent struct alignment issues it
doesn't look like it was armv5te specific, so mentioning armv5te in
the commit message could be misleading.

  https://git.musl-libc.org/cgit/musl/commit/?id=b3fa0f2b1b8c267c1cbe8c62464e484f3a174a4e

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index b56870cb3f..e7d0e1a66b 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,7 +3,7 @@
>
>  require musl.inc
>
> -SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
> +SRCREV = "f2c6dbe2442027ed8fe0fa869918e41f495534d8"
>
>  PV = "1.1.19+git${SRCPV}"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

