Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC2DC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:09:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4262.1784534939673216395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q3TEFuU6;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso2293165e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784534938; x=1785139738; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3j9gjghnIjb0Di54udKorD20zaTEw51G01V+y7sJmEk=;
        b=Q3TEFuU6AvdAus0hnoTA00/62RfX0u1uf79lmmrDFYckQm4jS0CYuO96WKskiqY5jw
         gREepQ8zendzjyYxu2XKV+UsV44rs5AuA36oOO9OvMiupUOvj6OrvhS2/6ZSlDKZijbI
         t5sCDxZRIiuTsNQhHm5ieQkafK64z/e+4HIwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534938; x=1785139738;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3j9gjghnIjb0Di54udKorD20zaTEw51G01V+y7sJmEk=;
        b=jz36OxwfY50lhin0t8ALciEG13Hjs64rmw1ZXwjrfrZsofV/U//2F3Dpg40wiiqHdY
         SNw0cXWAs9P5I4YY5G8Z2uWJqBAbALGKWfrB8mfAjGZxCwPGj8BaO/hpv13MCsnS6g0f
         +xpI7LzcfXvvDMTHbVwYAQReJgUwf5NYiOqFQPf+uQn8MgGcmPiKhUR7I7FoptmSRBUb
         z45xymnJvcSuXDMZOeAKS7R1Tp8Vi60X1nUIll/9Bnbo4D1cr+weYc8VfwExIY0xfM7g
         7FpUWzEGz6o4PyWM/g5qJVOTjvsU3/3y8WJL8+09OS1KRn71cx0X1de7RvmNsMjG0FdK
         YV+A==
X-Forwarded-Encrypted: i=1; AHgh+Rqg4s2aRPqKY3it9BWhu8QmjVwVC4GbO2CNjONp4s4AeECu3kNJuZXVpCpu8xQQE4jL0QGgyHAx24IKcJIAWjMWQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuABd8s/UJYcDvvr6DlBxBM7ERLpX+50AapQJWNhQCcfwuxap5
	W+s/m9RCkPzokjBX9AUACk+Fszdk64bgv3knepNs+ChLHtTlDizagIBqZdWjswNpvWhtWcu6aXv
	0QRI7o5vESw==
X-Gm-Gg: AfdE7cn9Z0YnoRF0RA2WyHfm70mzD6JLlvypiqwDmBqyyxB7alEZXOryD/IUxyZiyu3
	wmA8zP4UFtDSgvyNQGUsbwMWiODOKnxJod9E40+h9UMxp68OCgqb1yy5vxk5y7wmcFs0mt+amp4
	EfpQaHzVpL2WO5uvkFxMsv+AluAcwyYD83L6+dN7jQgR8wOJk98cxSDMwCMyg06KGuc2jZE/yL9
	xdgOIDmc+ASGFuLNnXAWKCinIsYYqgPj01AmHHbeC3euUXV9AOMBfSUVPjOb1ekxQM/d/V2gvvL
	SXICqz2cAYBnLbAhcLJqIfZYirmbQwJd4dV+lUiaYHe2lwWnSqEIXpoVecGYxVKLuAUBhFFXe36
	7c1AHubXIWXhlTFy0fgBHXj8N72HjzSvbu8ohdfKqS+n4/ETHWeDP7rlzuHNc3GP4ppjqq6Ytl8
	fbjZ2YiFF5PdLDcG0G93a2kCGAdbC4T7yWMveQlUhx0lNV4L7ZBdYZe6hsxFksXg==
X-Received: by 2002:a05:600c:4703:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4954e893f8cmr123372525e9.15.1784534937750;
        Mon, 20 Jul 2026 01:08:57 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm232103765e9.15.2026.07.20.01.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:08:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 10:08:57 +0200
Message-Id: <DK38U8J7M0EP.H6R91H3OQ454@smile.fr>
To: <enoch.ng@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libxpm: upgrade 3.5.17 -> 3.5.19
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260716142529.2686271-1-enoch.ng@windriver.com>
In-Reply-To: <20260716142529.2686271-1-enoch.ng@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241339

Hello,

On Thu Jul 16, 2026 at 4:25 PM CEST, Enoch Ng via lists.openembedded.org wr=
ote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Squashed backport of two upgrades:
> 1fc25a668e libxpm: upgrade 3.5.18 -> 3.5.19
> 767f686226 libxpm: upgrade 3.5.17 -> 3.5.18

Wang did not author this squashed commit. You can reference their
commits but if you majorly modify them (like here), you should be
author.

>
> A vulnerability in the `xpmNextWord()` function could cause an
> internal pointer to read beyond the file's end due to improper
> validation of file boundaries. This issue was fixed in libXpm 3.5.19.
>
> The changes between 3.5.17 and 3.5.19 contain the fix to
> CVE-2026-4367 along with other changes that should be safe to
> backport as shown here:
>
> $ git log --oneline libXpm-3.5.17..libXpm-3.5.19
> 9a05472 (HEAD -> master, tag: libXpm-3.5.19, origin/master,
>         origin/HEAD) libXpm 3.5.19
> 5448e1b Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()
> 5b7e903 (tag: libXpm-3.5.18) libXpm 3.5.18
> a5549ac gitlab CI: drop the ci-fairy check-mr job
> 10070a4 Strip trailing whitespace from source files
> 5679dd6 tests: poll for stable compressed output
> 7ce3959 man pages: adjust line breaks in source files
> 60ee362 man pages: remove .PP after .SH or .SS lines
> 3ba5d81 man pages: ensure .BR macro has multiple arguments
> 3aa8a1e man pages: make indentation arguments to .IP be numeric
> 854c23a XpmCreateBuffer.3: editorial changes for this man page
>         [Debian bug #1102886]
> b7309b4 Fix build with current Windows headers
> 2803929 Use _stricmp() instead of strcasecmp() on Windows
> bdb6c75 Remove xpmstrdup fallback for strdup
> 73b69d7 Remove xpmstrcasecmp fallback for strcasecmp
> b30fd09 Remove ancient port to 16-bit Windows without X11 libraries
> 0224b43 Remove ancient Amiga support
> b72af4e unifdef VAX11C
> 02702c2 unifdef sequent
> b4e2177 Remove outdated ifdef checks for including stdint.h

I disagree: 3.5.18 is a maintenance/cleanup release with major code
removal (even if obsolete) and I think this is not compatible with our
stable policy.

To fix CVE-2026-4367, you should backport the fix to scarthgap instead.

>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
> ---
>  .../xorg-lib/{libxpm_3.5.17.bb =3D> libxpm_3.5.19.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.17.bb =3D> libxpm_3.5.=
19.bb} (88%)

Regards,
--=20
Yoann Congal
Smile ECS


