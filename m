Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0F43A60167
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 13:04:04 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id 29so2783347yhl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=55HcohUHwkEJkwdYszIm2oqf6xDBUeRVWByO5GyD6I0=;
	b=VOb+VVu78bZARq5xwEu26oKWUNhSZOLXX+dyGV8ExxA5+mVGDAcSbZqax+HpoFU9wI
	679wpr73ea29ytaDWvFrRdihsan0MIhzP8N4ILbOdv3d3bfIwy5wzn4dvjsFGYfsi3Ex
	xDWFewD7IuMsw/KalNrgl0UENpGDkCVzDANYmsVV1HhwrvM/bmRLywvh6lqZhP9onAFK
	BD/CnFdwH1miH85V89dgmnTvqwNZHjPfPoN34dx2RqGy8xT4zBl9xXEFLgdX7k0mkT/j
	rXw8tkkPSHuOZidcsJgEytMC/O3WuPRyWh9s5S5iH2NxzMvmsbPXhF29rtZ+l1GZw/I+
	kjeQ==
MIME-Version: 1.0
X-Received: by 10.236.189.198 with SMTP id c46mr31989209yhn.47.1399122245238; 
	Sat, 03 May 2014 06:04:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Sat, 3 May 2014 06:04:05 -0700 (PDT)
In-Reply-To: <1399069283-22753-1-git-send-email-tudor.florea@enea.com>
References: <1399069283-22753-1-git-send-email-tudor.florea@enea.com>
Date: Sat, 3 May 2014 10:04:05 -0300
X-Google-Sender-Auth: _txSdxEdOp3W42LD8kLqmnCnX-g
Message-ID: <CAP9ODKo6mWfTkRzxbGUeRsNi4gaEUqqEUzkfKjw1T=fJFn79fQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tudor Florea <tudor.florea@enea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] curl: Backport a fix for a build issue
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
X-List-Received-Date: Sat, 03 May 2014 13:04:07 -0000
Content-Type: text/plain; charset=UTF-8

Hello Tudor,

On Fri, May 2, 2014 at 7:21 PM, Tudor Florea <tudor.florea@enea.com> wrote:
> mkhelp: generate code for --disable-manual as well
>
> This allows configure --disable-manual to run and build without having
> to regenerate the src/tool_hugehelp.c file which otherwise is necessary
> since we ship tarballs with that file present.
>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>

Thanks for looking at this. Comments below...

>  .../curl/generate_code_for_disable_manual.patch    |   38 ++++++++++++++++++++
>  meta/recipes-support/curl/curl_7.36.0.bb           |    1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
>
> diff --git a/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch b/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
> new file mode 100644
> index 0000000..dc755e4
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
> @@ -0,0 +1,38 @@
> +Upsteam-Status Backport [fixed in 7.37.0]
> +commit 38d582ff541353d738858299d4a2b78bafac03ed
> +Author: Daniel Stenberg <daniel@haxx.se>
> +Date:   Wed Mar 26 13:22:10 2014 +0100
> +
> +    mkhelp: generate code for --disable-manual as well
> +
> +    This allows configure --disable-manual to run and build without having
> +    to regenerate the src/tool_hugehelp.c file which otherwise is necessary
> +    since we ship tarballs with that file present.
> +
> +    Reported-by: Remi Gacogne
> +    Bug: http://curl.haxx.se/bug/view.cgi?id=1350

Upstream-Status please.

...
> diff --git a/meta/recipes-support/curl/curl_7.36.0.bb b/meta/recipes-support/curl/curl_7.36.0.bb
> index 6f55463..bd7191d 100644
> --- a/meta/recipes-support/curl/curl_7.36.0.bb
> +++ b/meta/recipes-support/curl/curl_7.36.0.bb
> @@ -11,6 +11,7 @@ DEPENDS_class-nativesdk = "nativesdk-zlib"
>
>  SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://pkgconfig_fix.patch \
> +           file://generate_code_for_disable_manual.patch \
>  "
>
>  # curl likes to set -g0 in CFLAGS, so we stop it

The manual detection is floating as it was reproduced in our builder
and worked for you initially. Please pass --disable-manual explicitly.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

