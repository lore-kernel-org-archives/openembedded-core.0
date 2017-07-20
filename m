Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1C84F782BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:58:23 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id o8so21504374qtc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vM5JvAW022wTKrCWdehZzc4tBpl72dlQieYetHm0vbw=;
	b=T+GbLapnErdJ8favm+bg1JZ7VlM0IOfroBSwLqY+dRxSUTnbTWdy0YMqbFwGNPZyZw
	C3Wa2Hzk3ZfkUSxPaSZvzRclUhWwrXTe7XyBVSzq2qIt4VL/FmCH3lK0EUP3WJeWqXtT
	W9eOhGnada0STw4yzEf6mJYQnBFy2SzL7Bgag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vM5JvAW022wTKrCWdehZzc4tBpl72dlQieYetHm0vbw=;
	b=K5rodrt0tiKOtWUJR8uCg+mYCPhJXPaTZXNPO5VWx+39qnkYiwFAgGT3B2dItKpl0S
	yOi2WRRceH0s+Yq2fhjTq2nXKQpgxMV/Q5GQA55LkUmGBWsgfDl7bwKDK0f6jhOlG9cY
	SJJWShqcoC8SuFfn/zhCplnLja4PXjxRr7XbYGXwSw2UWKq3tZ7/eW0zRIu0sGsd1Fa1
	IzHSi/e9STsRzk+I+4IAykWfAgAy5IBowLVKhK+qJIvDlkBbH8Yn6Yx6puwcc2jskvEy
	gR/jznGGMW0C4qRoL6xvOfAghjyyVNpRNm7i5dDsdEMo1wKMMZfqmXEaZSWUYbFhgCJd
	OTaQ==
X-Gm-Message-State: AIVw113oPBDw18bjya8G2GVQs0nxvzNmnTBKPfEX6ZTtjv1NEEfY5jt2
	yYkRrRmhLo/ocou1HC1XtovQ2BUn/G2pacqGKw==
X-Received: by 10.237.39.135 with SMTP id a7mr5003741qtd.164.1500555504876;
	Thu, 20 Jul 2017 05:58:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.194 with HTTP; Thu, 20 Jul 2017 05:58:04 -0700 (PDT)
In-Reply-To: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jul 2017 14:58:04 +0200
Message-ID: <CAP71Wjz2gS1PYWZzZ2FYb72F_T2dP30266Xcy70eRJvftjsKUA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 12:58:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 1:56 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> in config.log we can see:
> WARNING: aarch64-linaro-linux-pkg-config not found, library detection may fail.
>
> ffmpeg configure script is not looking for pkg-config at the rigt place since it
> is assuming cross compilation. let's force its value in the recipe.
>
> This patches 'fixes' library detection and brings the following diff:
>
> * RDEPENDS: ++libxcb (>= 1.12) libxcb-shape (>= 1.12) libxcb-shm (>= 1.12) libxcb-xfixes (>= 1.12)
> * PKGSIZE : 79167 -> 87823

I should have mentioned that we could do the following:

--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
@@ -87,6 +87,10 @@ EXTRA_OECONF = " \
     --enable-pic \
     --enable-shared \
     --enable-pthreads \
+    --disable-libxcb \
+    --disable-libxcb-shm \
+    --disable-libxcb-xfixes \
+    --disable-libxcb-shape \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     \

and it would make this patch a no-op instead. the patch would only
'fix' the pkg-config mistmatch. and we can fixup the xcb dependencies
as a follow up patch instead. i am opened to suggestions..

>
> Which basically means that the following conf options were left dangling in EXTRA_OECONF:
>
> --enable-libxcb
> --enable-libxcb-shm
> --enable-libxcb-xfixes
> --enable-libxcb-shape
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
> index f4bb2ba1f5..442d4f4532 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
> @@ -107,6 +107,7 @@ EXTRA_OECONF = " \
>      --datadir=${datadir}/ffmpeg \
>      ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
>      --cpu=${@cpu(d)} \
> +    --pkg-config=pkg-config \
>  "
>
>  EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
> --
> 2.11.0
>

