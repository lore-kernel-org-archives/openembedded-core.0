Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id C362460777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 21:52:01 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id y6so3565759pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5k59ch1oduhjbyKX8TtngR1UzuA+KALGdb4ibzF1vko=;
	b=kt04eUx7SJUDBD2YHqi+dYwMTzjVbIQaRa0dJtziSA7aygEYaqhRuNM49ZstWog4Bx
	I0EA5bCBEX6PDxokVttGgzyuhJYokI86r6vCjH3xKoLIg3naj5cfV0XgLI8AllkFJdz2
	d0Rg8Ja4yIiDawkIEUUQu45XPoZEWEncORQXo5CdnWVI1UjFAlUIUHIuWfSnnupzuzY2
	Q1sboRu8sZBZG/RjCLellcvkha+YmaxyrArQD1sxQG0N+yJ8csSZsa+A5gNfbcJ7oQCD
	Vbi0OmDsO8i1DT94G7XPzMlJqPrzOEpXEhc1GVTXke8o1kOoAnQa0MTQS0qMZzBi+w/Z
	V9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5k59ch1oduhjbyKX8TtngR1UzuA+KALGdb4ibzF1vko=;
	b=joqpl02yWa6dvArgw1g/gcdK/8GjcrJLgoJNuE7F7n07iXvN57XTMtXhTySeJfadCH
	KsmzdapE3DHQOy+s28KXh0hRCBJ0ZHqW/YgWfV2703htDRPOI1ILhRVq4hfkqlnjGwfv
	KCMEztANT2vDWHDwVaWSSB2NLufO/WP9bxgHp6O8U/fxuwQ9mbMD27YMuXFZh38dxhxM
	qnlBXBqbg+cyk4cfUhDZ0anevpvj/xk2+anh7iglCbZlZhZ8iu4YVsiQw8jXXoaUYidV
	49qoZ+Se3R4eX71ywUI7NVa1Bb242rfARSJdWYGCUgGz3J92raD7MllSti4g8wtrzXJl
	doNA==
X-Gm-Message-State: AJaThX66Acc80wYP0+tFe/joMYuvSnan0iSPAfB6Lu10X2eXqmMyRUAU
	xnNnb8vNRcph5QYn9C7NCVWkFXr19OSm/oP14qA=
X-Google-Smtp-Source: AGs4zMb8+rdWKaaMrCP47e+UQbpBWlcJCDhM5B9TFcauwWFZqMUflOZnwbd2T63qlUKX3KwA09qimufnHRt9Byx9t70=
X-Received: by 10.99.160.96 with SMTP id u32mr3709719pgn.25.1512078722793;
	Thu, 30 Nov 2017 13:52:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 30 Nov 2017 13:51:32 -0800 (PST)
In-Reply-To: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Nov 2017 13:51:32 -0800
Message-ID: <CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Thu, 30 Nov 2017 21:52:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 30, 2017 at 12:20 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 932c9a2..db26b4f 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -57,10 +57,11 @@ do_install() {
>         oe_runmake install DESTDIR='${D}'
>
>         install -d ${D}${bindir}
> +       rm -f ${D}${bindir}/ldd

Doesn't lnr take care of removing old file ?

>         lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
>         for l in crypt dl m pthread resolv rt util xnet
>         do
> -               ln -s libc.so ${D}${libdir}/lib$l.so
> +               ln -sf libc.so ${D}${libdir}/lib$l.so

this is ok

>         done
>  }
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

