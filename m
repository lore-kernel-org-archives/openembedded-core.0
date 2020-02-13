Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D2E8D60BC4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 07:31:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48J7Vy0gZBz4K;
	Thu, 13 Feb 2020 08:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581579114;
	bh=iN0Tfu585ChZgzT4v2h6hLZeO2n4DBI2mHBkuVFrppY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2kBsRHcV/rnJ4E6mXVrP6Ssi3y3dWcbBwMsuM56lSFuUv3VSmbhJ9tJe3JfPwlRU
	MkBD1cjKk/k3M59DXa75O1D1GXXn0VgNDuc/FigMpBvaTQzuEQDvoxaE9MVJkb+zC3
	CC56OOpLUeYAGLZ8R8Fwt4CxkQMPm9VCvNh2MgZIzaOu6WAVePRylRgOZPJD49djs1
	RoG4MXukCubBrwEhsE7TlGkvRVs/XJ2ZGcuKX2KtWYM0Ye0M9lO6hyBVwG86ip5XE/
	JyAMPek44d/Zlfjq02mQG2KOPqz8AS8jKZWKuDCD4TujFrT3ExgHkhHF2nO5uCT+/2
	Ig4F8SFYWiOasNr3VH76ePAWO+/hbfHChdTIEZw2lUhdSEOqpKIdv+z15Vdbqd6bIx
	J/XUBiHK9sBz7fsIJzouR9xTPhIT60oR40QcMB+Yb8x2fwPPrzANBJPJBvbu+US9/i
	vYXwUrC0FeCTiWO7gn4z7xziyY1Q+CkO47RWWk3N4SHTJzKg1qixh5x7kshR3OT0An
	ipYDWmhbvTdIctuE6uiXEqa8Qi2dWmQsEnOxrIyYmSqLw/2anRe37iOVKLl7VDxRWW
	YroPKsi666On6rt807oYy6vAw8Ymwc8EmoExlPYHYUvLX1OdvWRx6HCG9dN0ASyScX
	kniZiNK4Dq75dYk6+Y+7daRE=
Date: Thu, 13 Feb 2020 09:31:51 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200213073151.GA20530@localhost>
References: <cover.1581575578.git.raj.khem@gmail.com>
	<11cf7d82deafd496d30a4a28a38a3b1121762f9e.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <11cf7d82deafd496d30a4a28a38a3b1121762f9e.1581575578.git.raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] binutils: Bail out if gold is used on 32/64 bit RISC-V
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
X-List-Received-Date: Thu, 13 Feb 2020 07:31:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 12, 2020 at 10:38:22PM -0800, Khem Raj wrote:
> gold is not supporting risc-v yet and, this will cause subltle errors
> during build e.g. autoconf not finding certain features like visibility
> and it could take a while to unwind the problem. Its better to error out
> early
>...
> @@ -163,3 +165,8 @@ inherit update-alternatives
>  ALTERNATIVE_PRIORITY = "100"
>  
>  ALTERNATIVE_${PN}_class-target = "${USE_ALTERNATIVES_FOR}"
> +
> +python () {
> +    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d):
> +        bb.fatal("Gold linker does not _yet_ support RISC-V architecture please remove ld-is-gold from DISTRO_FEATURES")
> +}

This lacks some check for RISC-V,
currently it errors for all architectures.

cu
Adrian

