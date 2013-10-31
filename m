Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 11E546D3B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 03:32:59 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so3923837ieb.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 20:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oWPynblMofrNS2V2z/7A5bjafModCeLdRhZqOuoFHp8=;
	b=ectRBU8F1OhCMH7+69jzoIAdQ4/te/xAEVuZR9VCSCVcTRACBf7h7UpKcAdt01xa48
	9WEQ3xGAy70UVdFN3ff3h6FdEP62Zlal8DwAQlYuVW9mebhKIiyCzKjTz2sfmzc29MIT
	NCkMGAC86bafUz4W3nv44/p1sMPu0kh6bN7EMEO6bfIiQZPql4rQvv8qfQ3fKoJ94bw4
	I1y7LoaOXAoESbLdPVEBM3LMEQ5yE1/HOHodiLsgqadxRlZwgDC/Ir1rDXCC2gxb20tE
	7mu7Yc5IW3LFI/1O/E4ECIgEYe1YJJkihOeDd2RfCruA0+GsvYlJn/WBdpawLpXvWKHO
	yy2w==
X-Received: by 10.50.61.179 with SMTP id q19mr4802859igr.33.1383190380943;
	Wed, 30 Oct 2013 20:33:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 20:32:30 -0700 (PDT)
In-Reply-To: <8375914656f9a76b45495b0bb7209df9a7fde180.1383098783.git.Qi.Chen@windriver.com>
References: <cover.1383098783.git.Qi.Chen@windriver.com>
	<8375914656f9a76b45495b0bb7209df9a7fde180.1383098783.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 20:32:30 -0700
Message-ID: <CAMKF1sokaQmkE6imxFxYD88UB2woFrFkybRprAkbd3kHhSucjg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] iproute2: explicitly add 'bash' to its RDEPENDS
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
X-List-Received-Date: Thu, 31 Oct 2013 03:33:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 29, 2013 at 7:07 PM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> If we build a minimal image with iproute2 installed, the following
> error will appear during rootfs.
>
> error: Can't install iproute2-3.10.0-r0.0@i586: no package provides /bin/bash
>
> The problem is that iproute2 has an implicit dependency on 'bash'.
> This dependency is from per-file dependency checking. But as 'bash'
> is not explicitly specified in the RDEPENDS in recipe, it's not built.
> This leads to the above error.

To be a bit more surgical if you could figure out which script is it
which is asking for it that will help
to determine if we can create a separate package for these scripts which
have dependency on bash and then create a RDEPEND for this new package instead.

>
> Fix this problem by explicitly adding 'bash' to the RDEPENDS.
>
> [YOCTO #5415]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 3db21db..40f6a6c 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>                      file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
>
>  DEPENDS = "flex-native bison-native iptables"
> +RDEPENDS_${PN} = "bash"
>
>  inherit update-alternatives
>
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

