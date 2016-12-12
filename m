Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 27D906011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 06:37:44 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 50so7572184uae.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 22:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ReP26tIJM9LdmWVDGwZqiQQFz7HYgQf3mXftGpQI75s=;
	b=F3UuTJqf39vbT9aMR+vj53xzuYCAseWiyRAO+DFCcgHRyRgddybI/wsFY+iqpI2PFp
	ohkBdAz3lLlATVsuoAXdiCDSxbOTr/TwvwmIhjywKA9zyvUS3H2pYQEkt6q33n52PwTW
	+3Wyq8ZNv0b2c6CiI5CebEp2bwIRx2VeCoJ4z8XIf+3DJzJahvsFf5o/iXm11/70BalX
	LDob8wdaBUsU5kPx4lz+spZm/u3NbU2kpuBT8Pm5Fo5+LJzRJT4Lbmrcv7BzfDQ1ZJXq
	PbwL04CuXJZgJew/Vgc2NuT7ZhOkSEFZ3Aame2j/Cxr8LOwGpOO0fvbp5pg5Eoaq8xhv
	pdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ReP26tIJM9LdmWVDGwZqiQQFz7HYgQf3mXftGpQI75s=;
	b=UtYVo9r7B2DBMHMNWj/iKtsWZhNrhA0BRdcOSGZDVXhqQuo5bwR706vceuRkPHLYoi
	ZKWZfNv48aUptF5MRSl8m7rsHhwSy2TzSmIxU4hYUo3cXzlmY72BexsArAx4hPK/ZIgq
	GxkvebD3dgzGiWNbnrwAwPi+pQvQdTv5ikYYMKNuYnPq0yFkSVSG0uZPJlm6RMJ/hRxs
	MTyoA0b+hLzmmWooGqOR2UkSWXNiMrs22iyuHca6ScqUmci0YXk8jRuZu60Vrs5KHlhh
	b98FRYMpGDX2sHkzpCT/rBLmaUXLu0i65VFNCjGj17clpi8eTypd3Pcxiy4b64Bxvm9M
	WvRQ==
X-Gm-Message-State: AKaTC00sMiQB1xWjqTKettc5DmbI2TtQ55m+QL0ZoZNH3c4jGJu+VArbjdoBU9Y4JVlWNFjoWKYh1F3iRNG4pQ==
X-Received: by 10.159.48.146 with SMTP id j18mr70972033uab.6.1481524665996;
	Sun, 11 Dec 2016 22:37:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sun, 11 Dec 2016 22:37:15 -0800 (PST)
In-Reply-To: <20161212054215.20513-1-jackie.huang@windriver.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Dec 2016 22:37:15 -0800
Message-ID: <CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
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
X-List-Received-Date: Mon, 12 Dec 2016 06:37:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 11, 2016 at 9:42 PM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The strlen will be inlined when compile with -O, -O1 or -Os,
> so there is no symbol for strlen in ld-linux-x86-64.so.2,
> causing a fatal error in valgrind:
>
> valgrind: Fatal error at startup: a function redirection
> valgrind: which is mandatory for this platform-tool combination
> valgrind: cannot be set up. Details of the redirection are:
> valgrind:
> valgrind: A must-be-redirected function
> valgrind: whose name matches the pattern: strlen
> valgrind: in an object with soname matching: ld-linux-x86-64.so.2
>
> so add -fno-builtin-strlen when compile with -O, -O1 or -Os.

This is a bug in valgrind, I read the same on forums. KDE has proposed a fix
https://bugsfiles.kde.org/attachment.cgi?id=82043
can you check if this fixes the issue

>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index e85c704..7f3e0f6 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -16,8 +16,8 @@ python () {
>      if opt_effective == "-O0":
>          bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN', True), opt_effective))
>      if opt_effective in ("-O", "-O1", "-Os"):
> -        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
> -        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
> +        bb.note("%s doesn't build cleanly with %s, adding -Wno-error and -fno-builtin-strlen to SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
> +        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error -fno-builtin-strlen")
>  }
>
>  # siteconfig.bbclass runs configure which needs a working compiler
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

