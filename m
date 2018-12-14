Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E48506B50B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 04:57:07 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i7so4901770qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 20:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rveB2935TGzqKvj0jKuSTk/tXv4bvxbMVbuJrCLSEiw=;
	b=Ne+ZiBZoHMK3YVLST+a57fobkxdSVmcDoJXLCeXrXgen3rK6mObJYFnZGRhn8aOlvy
	8ZVy4rIbWeF7HpFxVytTEFSLz1R698kWoivS0QceC/WZ9VdUMT0IEs6Pm01I8LOnLqZb
	oNXp2jJw/s8T8Sy2cgEleoVroigTjzgTM0BehsEmGPxXA3CuxJ7zAWc1h7Y6FiJXmHVz
	xPvHEyle/cn4/Qo8AwdDGZ/00brhOoBeNEHAuQEq3wWJSWDrljhWdYeGNP6FCnGkveS5
	NAO0QOpl1KqlLp7FVhjTkMbXa7F0rqkBveT17IbL7ozNb21iG6WwcfCvx7khX74wX4fU
	imNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rveB2935TGzqKvj0jKuSTk/tXv4bvxbMVbuJrCLSEiw=;
	b=F7yapixG0K32+n98hf3kmbbsLKRtSuB5w5TqQGrCcKApc5ctgyi3SDFmxgVN8D/dyI
	4YDMr9La4yVWo78BNzbL3iIbKKzTFjT3Bn5Cy5K94wFuIe1y1m9gs7oBn9S1jOd2siZe
	4pgNhg+VFKrYHgbOx4CRefQYaXn1rOzIrvy9giR5MCiT3MtxBAgnEw8cIGJthWzhnWCu
	rdl7kTx84edPBV8jewPj71szyi8d55GH7HG3P8WFR/Jd6eH1FBayATJhajwT9WGDBaCA
	f6XZw6PRchoTn0//MA79a4b6puSJlD6estMLbEIzVz9edzX6xb49IyzQdiisvImi+1LF
	yafg==
X-Gm-Message-State: AA+aEWYwql1N58KEpCoKuE60J4egMKRBpxZ/68BBZeAEQQEvKZCLdHa3
	PXPgSm8JxyeRgZaEV/Pppoh+ZiLPqvC8yNhZU4VfdiR0eD4=
X-Google-Smtp-Source: AFSGD/WvaqGWwwLaWhW6vTQAo0QAxPkV2ToqWQOpGloioPLjs47UJ80+tn0hU4BgEGwGZ88v/aKnVuvYkUkYqFZuK10=
X-Received: by 2002:aed:3c0c:: with SMTP id t12mr1466100qte.226.1544763428772; 
	Thu, 13 Dec 2018 20:57:08 -0800 (PST)
MIME-Version: 1.0
References: <1544739463-14029-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1544739463-14029-1-git-send-email-jaewon.lee@xilinx.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 14 Dec 2018 14:56:57 +1000
Message-ID: <CA+aJhH09dR4Fe9mBF+vTTdeGAURw+LWpQPeaVdTyM+96-bQkxA@mail.gmail.com>
To: jaewon.lee@xilinx.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] device-tree.bbclass: Add support to compile overlays separately
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
X-List-Received-Date: Fri, 14 Dec 2018 04:57:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Dec 2018 at 08:18, Jaewon Lee <jaewon.lee@xilinx.com> wrote:
>
> Currently only dts files are considered when looping through files to
> compile. Modifying the loop to compile other files that are overlays.
> Also surrounding this check with a try block as the function to find
> overlays parses the file for a '/plugin/' tag, and there may be files in
> the DT_FILES_PATH directory that are not parseable.
>
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/classes/devicetree.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
> index 8fe5a5e..db10b86 100644
> --- a/meta/classes/devicetree.bbclass
> +++ b/meta/classes/devicetree.bbclass
> @@ -120,9 +120,12 @@ python devicetree_do_compile() {
>      includes = expand_includes("DT_INCLUDE", d)
>      listpath = d.getVar("DT_FILES_PATH")
>      for dts in os.listdir(listpath):
> -        if not dts.endswith(".dts"):
> -            continue # skip non-.dts files
>          dtspath = os.path.join(listpath, dts)
> +        try:
> +            if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") or devicetree_source_is_overlay(dtspath)

This is missing the trailing "):". Otherwise looks good.

Regards,
Nathan

> +                continue # skip non-.dts files and non-overlay files
> +        except:
> +            continue # skip if can't determine if overlay
>          devicetree_compile(dtspath, includes, d)
>  }
>
> --
> 2.7.5
>

