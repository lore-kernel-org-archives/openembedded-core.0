Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 09CD560AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:18:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s5so210235wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tTBRGdhPTRjkcySL/CtXh7NL2Zjx5O9fhLUWGANc2hg=;
	b=URcorqAcL4pY4cy026WwiCp9Gllw+zsY2y9Vc3R2TbFxYkcU7uJklPiHiC+LpOM5cH
	0JqFPPNnoOALzJQJSiwvWNbO/guM/JKY5f7gMptRRTbv9Z9t8t3dsS5c3SO+gpH97UGv
	mTOep0A7r5EFh+tmsPxzCe9ExktepPM7UjgJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tTBRGdhPTRjkcySL/CtXh7NL2Zjx5O9fhLUWGANc2hg=;
	b=JaYprLIbzB6imvs/LnqfDo4KoqxwHyIMTPPgeZOrlVhKYanMvI9eXLU4FimOFo90Fq
	Z7hOUA7VXlT+QSdhmV/vUq/R0AE2kRBtP7Sf2C6Z1cbrMm0ZKhPufvoi/C4/gClVGJ9Y
	x4rR9NxgUc1UL7B7vT/5SknquPhly0BUv/TNWr41QnCKOEsRGe5V/5EXn0bFQ/yZeh6C
	IRUSY9S8wuyngKtzmenFQzVKaAHOkMMNaGf5W/YE6E2SvuUHdW5lPi7tBX6yaIUvf6DC
	CHo0LMvBekfMayzctf64ENlEH3kR8w+unx7GvnZsTUppg9Rpq2HzfX19I27Oobh4Mt2p
	4q1A==
X-Gm-Message-State: ANhLgQ09zaM+Fm/cSNcOLYOKBEAKtab7rvKfQqA1d7RyE5vPizqErjBb
	Vi+EcOPcivLQkLbM/POFjArbeglf+y0=
X-Google-Smtp-Source: ADFU+vtsleqNIvPHm8iSPAeQyil6LYO1/uBYVoH+mus/zqjB8Yu8pnH1w7tPoSEM2in88s3Pys/sBA==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr215475wrq.412.1583882314763;
	Tue, 10 Mar 2020 16:18:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	62sm14115619wri.30.2020.03.10.16.18.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:18:34 -0700 (PDT)
Message-ID: <a6f3718866f85a6208023b253bec26bf6b5d4172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:18:33 +0000
In-Reply-To: <20200309142139.15741-3-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-3-pbarker@konsulko.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] archiver.bbclass: Make do_deploy_archives a recursive dependency
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
X-List-Received-Date: Tue, 10 Mar 2020 23:18:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:
> To ensure that archives are captured for all dependencies of a typical
> bitbake build we add do_deploy_archives to the list of recursive
> dependencies of do_build. Without this, archives may be missed for
> recipes such as gcc-source which do not create packages or populate a
> sysroot.
> 
> do_deploy_archives is also added to the recursive dependencies of
> do_populate_sdk so that all sources required for an SDK can be captured.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  meta/classes/archiver.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index fef7ad4f62..c11d36d708 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -604,7 +604,9 @@ addtask do_ar_configured after do_unpack_and_patch
>  addtask do_ar_mirror after do_fetch
>  addtask do_dumpdata
>  addtask do_ar_recipe
> -addtask do_deploy_archives before do_build
> +addtask do_deploy_archives
> +do_build[recrdeptask] += "do_deploy_archives"
> +do_populate_sdk[recrdeptask] += "do_deploy_archives"

We implemented the --runall option to bitbake to try and avoid having
recrdeptask versions of most tasks. Does that not work here? It should
also work for the SDK I think?

Cheers,

Richard






