Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id ABD6D773D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:31:39 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g23so150042734wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MJL2Z77bCgZtxsGh45/Ghuc6Glwm+a1vtnvl8KnGtbQ=;
	b=f4k76ZTIZIuhJHEL2i1fRgY213N4cAxDHWw4RzAN6NqfmVahwdRAwUeijn69tHys9z
	WTK9GXxUohpfc1mtA28ADACyIL5VxnLpXrg9xH4ZedXrec8RgNTxFa2D6n4ie98iZz7r
	HUPSwjGjF5ZbuUFYXjjNDlAAeuOr6YirM7SyiVK7c/ODkQlUzoTkkOT1ayyOZavYEIPp
	lIZBpYV43hTj2YDXUjsjxSxdC3EFbgz+I10G7o28XXMkZATQ9z6KejsJhKzgNlcf/n6n
	x5drONY1dWSDCJDTuwLmyLHJRRpZPhk+ujbJ2nzyK+PrL4y3IU+O/gg6ldTgueooderY
	ww8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MJL2Z77bCgZtxsGh45/Ghuc6Glwm+a1vtnvl8KnGtbQ=;
	b=YTq0+Vj16d0rSoxUCADdazOP/G14OAU4uBgaWApQ6H6G9gQirnv2YQ129nRKDb/QOt
	hKWhsx0j4YaLaFuf27UkN2tox15hTLjmrjhxB0kQTjFSuHa68A9eZJz+O2t2QClJkrCI
	gsh9N0ywHLhhemg1wV1FubJfciikAg0ds9bUtiQSfGF3VO0eOrgoXcdjBt4wUjDDY07b
	Lzr8Tuf0KRJfvI+T5IF0ltpkictUU3Y7izSyT4bfY0PN+mCEE+4VrFhS6kefD0ti+SrA
	jDm9Om5ykL6lSV9PnyftAZT7i9L1YGUna3JoCgiEBwRnBrXvmfhC2b6DSMs85yV4aVrm
	HiaQ==
X-Gm-Message-State: AIkVDXK7hxXMFsBq2SUEv12ODRxtTQO3v/H06fBUDgN9auUSOjZUhQWuNp+F5jUExE+P5AcHdj34M5F3Ato8Mw==
X-Received: by 10.28.36.87 with SMTP id k84mr7378184wmk.64.1482330701034; Wed,
	21 Dec 2016 06:31:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Wed, 21 Dec 2016 06:31:20 -0800 (PST)
In-Reply-To: <1482329997-20677-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1482329997-20677-1-git-send-email-ed.bartosh@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 21 Dec 2016 15:31:20 +0100
Message-ID: <CAD4b0_Kh=LmRhtmKdpS48E5VAb66fj7f2PVbqYeirLj-ZrTX=Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: fix parsing of 'bitbake -e' output
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
X-List-Received-Date: Wed, 21 Dec 2016 14:31:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 3:19 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Current parsing code can wrongly interpret arbitrary lines
> that are of 'key=value' format as legitimate bitbake variables.
>
> Implemented more strict parsing of key=value pairs using
> regular expressions.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/utils/oe/misc.py | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
> index fe188c9..1dbbe92 100644
> --- a/scripts/lib/wic/utils/oe/misc.py
> +++ b/scripts/lib/wic/utils/oe/misc.py
> @@ -27,6 +27,7 @@
>  """Miscellaneous functions."""
>
>  import os
> +import re
>  from collections import defaultdict
>  from distutils import spawn
>
> @@ -155,14 +156,11 @@ class BitbakeVars(defaultdict):
>          """
>          if "=" not in line:
>              return
> -        try:
> -            key, val = line.split("=")
> -        except ValueError:
> +        match = re.match("^(\w+)=(.+)", line)

match = re.match(r"^(\w+)=(.+)", line)

I don't remember if regexps are cached when compiled in re.match(), but
perhaps it would be better to `re.compile(r"^(\w+)=(.+)")` in
BitbakeVars.__init__() and just use a cached object here?

> +        if not match:
>              return
> -        key = key.strip()
> -        val = val.strip()
> -        if key.replace('_', '').isalnum():
> -            self[image][key] = val.strip('"')
> +        key, val = match.groups()
> +        self[image][key] = val.strip('"')
>
>      def get_var(self, var, image=None):
>          """
> --
> 2.1.4
>

-- 
Maciej Borzecki
RnDity

