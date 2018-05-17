Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 21E1A744C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 19:53:21 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id a2-v6so3808593uak.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 12:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xb1dmES58KHA0EaWCrNGGB/4XejOB51WvKU7KErJ+uw=;
	b=LG7bhKm80jyJLwPUTZwzrJikdtWky1XKBCBVXXvJHr54hZtZofs1UeoNvOmX8O+nfA
	SkVkUSak30yZ0GyqwQHQ8JGFY0gCBiuuTqrBzRO8emyHXpYfSD6IEozHo7+Ucup1JBza
	atTFXj9svBi9/L194xzJXvz8LZ2tBCnjz+tooInmD5C2MBrUcVtjbKEShBHKdCgZ7Fr8
	3iw2/ZCjfQq2pnVY+NqmgSKp3c04NlpFWd5fXIdHn3rGRXjrb7B3OIdm0dUaQWQdfmnp
	l/gBB0r/eXXKiopPCX+iMS3E5oHuXEaWa7nxuM8748PqKwjnmnArLYhjH8nbPxGyONRg
	VGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xb1dmES58KHA0EaWCrNGGB/4XejOB51WvKU7KErJ+uw=;
	b=tY7WrQgT9DdYi2Cji6SHEokj1/GvRxTHcSkan1EnG/EW/O0AGdBci52FFFSabJ9pao
	r2+FoNNq7/D21GqPbjql+rZsHb8DEv+SZglL2bvucN6nnS2s0cLdpgMLlLZcyaaUTVNy
	+GEbwEaoV8LScCztdbgVqM4zE1UYAWHX6oYGibm05UNoP1YJEm3Si6hH8hZx7a6IVJNc
	UWIdfLQwoSh6LaP4oI8ltaSmdWTHQQPQS8BGwep1rlr9sfEcerZLCnKjcr6IWSLlsmUP
	rq0SMqNYBqUJvCSl1y7dG6RxuWVPmI8zo/ERIAp46xiu7c5qny3HSauT1MIjjchYJXw2
	ELKA==
X-Gm-Message-State: ALKqPwe9uqWCvUa7CGGMBPPjvZFvD3FbCvOTqFdfkkJVuXj2cOE6EEQ3
	gymPC17dgXIOTTfoViUITOA9AyGuqD7vR6gR2H7NMQ==
X-Google-Smtp-Source: AB8JxZqV9IoF/L5ZYIexx3UeIGI60XKZjwZNx215w5TNkEtgO82Y05T7Mdi50N7L4bD11RY/0/A/zwu2YXPMSQiLPGE=
X-Received: by 2002:a9f:2823:: with SMTP id
	c32-v6mr5576751uac.193.1526586802442; 
	Thu, 17 May 2018 12:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Thu, 17 May 2018 12:53:21
	-0700 (PDT)
In-Reply-To: <20180517191536.12283-1-fabio.berton@ossystems.com.br>
References: <20180517191536.12283-1-fabio.berton@ossystems.com.br>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 17 May 2018 12:53:21 -0700
Message-ID: <CAJ86T=XbsORQD062SHnacc6kk9+cvfpJGdnpe8m_70V8P1McxA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Add util-linux-umount to RDEPENDS
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
X-List-Received-Date: Thu, 17 May 2018 19:53:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 17, 2018 at 12:15 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Images with systemd fails on reboot with error:
>
>    [FAILED] Failed unmounting Temporary Directory (/tmp).
>
> This happens because busybox umount command doesn't has -c
> option. Add util-linux-umount that has this option to fix
> this issue.
>
> See details: https://github.com/systemd/systemd/issues/7786

That bug report mentions a fix to busybox. Since the fix is available
in upstream busybox, maybe better to just backport the patch to our
version of buysbox:

  https://git.busybox.net/busybox/commit/?id=426134128112738c97a665170b21153ef0764b7d

> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta/recipes-core/systemd/systemd_237.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index b7c2113255f..3b0f4580d49 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -478,7 +478,7 @@ FILES_${PN} = " ${base_bindir}/* \
>
>  FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>
> -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty"
> +RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty"
>  RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>  RDEPENDS_${PN} += "volatile-binds update-rc.d"
>
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

