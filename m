Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD33747F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 00:44:26 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id i3-v6so1822543uad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 17:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0ZgwYbcUt3nC6WL3IAG1IJGo1FBoieM+Ppu9Ji1eEZ4=;
	b=oDpO24iOhxc0rpVf6LCjmXm8dGu1NyAMmsDja0b8dN9BDhqdRay09MPsh2se+Tqkeg
	ebYwIzgVaMVi1jIhojMj0jt6TWYtK2k8tn1p0Dxd42OE8ywZWc+3U39D7nihrkHEn2dy
	UFL2rqQEsDuTrRdyp3uCTEsimdGxZ0WGGvPwirQ0OYpWxb4e4H4JeIi+vMbdoGALkw8a
	UiaCWspcs4DidyO7NS/CeNHGWoyPD9k0f24/6CuWxbti3HA1cYB3NVpInknPx16l6E8L
	EmCWBoP39hFxh7c2lIHAx5S9t/3oQBn3a8LRQi9NOOq99GHH30YIFl8ADveY950bvHkN
	U/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0ZgwYbcUt3nC6WL3IAG1IJGo1FBoieM+Ppu9Ji1eEZ4=;
	b=Yyurq8rCHMHZNpLos+9rvRjX8Ralrqe2FGe9PyDRmSPS0Afj8M32ol/sq5+a8pXV4E
	5cPaV4I1kmhGBgVkmVQiiNrMeoearUc2NYtUdAC8fzjiGhEBuABjkvCa3upd1FID20Ld
	IMtsTQW96dI0tGIh3xClqVXL2HsPDMJCwRjb1xbbfNhRHxBNS+5q9RjlqUFu1xuggGGK
	sJ5gf4/Gco7mLz8vfrGFtYr5dfYaI0uUa3RstnJofaSnwSj2VgUw9xb0b9VV+qYMj7U6
	uuMLAhsziGh5i98IHezcv07ruFtHV+Y8+yRk0nulBfEAjDmIlXNdWa7z4M5NRakiZcMv
	YIJQ==
X-Gm-Message-State: ALKqPwd/htJeBrgyDwZoiytJulwUzW/bNbbZDvu+AaCBALI5ARSqDw5B
	ikwDP3QGJxWdkw5/dj5M7t0fTHMMo6edeQVpMig=
X-Google-Smtp-Source: AB8JxZr8qfE5zzsJ5C7dn+s3vW1SOF+ETcdEUjHgbPqMuebVeGWlrZmguCJO253fAHXtyvEY/zgXgLfu7ln5KH/FYP0=
X-Received: by 2002:ab0:4c44:: with SMTP id
	d4-v6mr2880234uag.128.1526517867124; 
	Wed, 16 May 2018 17:44:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Wed, 16 May 2018 17:44:26
	-0700 (PDT)
In-Reply-To: <20180516233046.10217-1-ross.burton@intel.com>
References: <20180516233046.10217-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 16 May 2018 17:44:26 -0700
Message-ID: <CAJ86T=UXSzh13a9WGy20s7VG-gWebybN7raSL2eFawPXRtQGsw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][rocko] libnl: protect against buffer overflow (CVE-2017-0553)
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
X-List-Received-Date: Thu, 17 May 2018 00:44:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 4:30 PM, Ross Burton <ross.burton@intel.com> wrote:

Looks like a duplicate of:

  http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150743.html

?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/libnl/libnl/overflow.patch | 39 +++++++++++++++++++++++++
>  meta/recipes-support/libnl/libnl_3.2.29.bb      |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-support/libnl/libnl/overflow.patch
>
> diff --git a/meta/recipes-support/libnl/libnl/overflow.patch b/meta/recipes-support/libnl/libnl/overflow.patch
> new file mode 100644
> index 00000000000..777fac3ea1a
> --- /dev/null
> +++ b/meta/recipes-support/libnl/libnl/overflow.patch
> @@ -0,0 +1,39 @@
> +CVE: CVE-2017-0553
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
> +From: Thomas Haller <thaller@redhat.com>
> +Date: Mon, 6 Feb 2017 22:23:52 +0100
> +Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
> +
> +In general, libnl functions are not robust against calling with
> +invalid arguments. Thus, never call libnl functions with invalid
> +arguments. In case of nlmsg_reserve() this means never provide
> +a @len argument that causes overflow.
> +
> +Still, add an additional safeguard to avoid exploiting such bugs.
> +
> +Assume that @pad is a trusted, small integer.
> +Assume that n->nm_size is a valid number of allocated bytes (and thus
> +much smaller then SIZE_T_MAX).
> +Assume, that @len may be set to an untrusted value. Then the patch
> +avoids an integer overflow resulting in reserving too few bytes.
> +---
> + lib/msg.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/msg.c b/lib/msg.c
> +index 9af3f3a0..3e27d4e0 100644
> +--- a/lib/msg.c
> ++++ b/lib/msg.c
> +@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
> +       size_t nlmsg_len = n->nm_nlh->nlmsg_len;
> +       size_t tlen;
> +
> ++      if (len > n->nm_size)
> ++              return NULL;
> ++
> +       tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
> +
> +       if ((tlen + nlmsg_len) > n->nm_size)
> \ No newline at end of file
> diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.2.29.bb
> index 7d4839ba506..746fd3d4153 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.29.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.29.bb
> @@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
>             file://fix-pktloc_syntax_h-race.patch \
>             file://fix-pc-file.patch \
> +           file://overflow.patch \
>  "
>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

