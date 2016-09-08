Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 969B662132
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:45:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so8454679wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 08:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tbMsIeC9kTlUkzo3gyb4i9Qy9NI39neNvmZFuTeTuO0=;
	b=D7r0KPrILd26Pu2cWE3pJ7wfuXtUgpzlG5l7JqL/3++PJnzetMA4k9ZJKUKC0AyhAS
	5Qx9Azj84hRWvJrJIUrTMI8FODzNvHgxJcOOqSLjt+3+VqhRSiSeZ0AIdQ67MjZru5FD
	1r8DOu64AgEM92KIiu0VpcdeKGnY11bo/gwZhdyTcdze+Q2gydbNjwh7eCe2yyno48UR
	EZ4R7ZpKq059iyiHreFdlyI5NAP8t9rD6o+dFWljRMWURSh0c4mi0ArzCnHwAgq6u0Zr
	urYwAwSCHg/ItdPNfVPiblVFwH4366+xoQEmcPfpMs/HC8T/hRoJXcbZ/alo0Z1JPSqy
	b2nw==
X-Gm-Message-State: AE9vXwNKhfDwP03sVwblGsseipKarsKfIzynEXYlpSgmb3y9+El7Zf5pA2qeSC8gU27GWg==
X-Received: by 10.194.205.2 with SMTP id lc2mr276546wjc.175.1473349505742;
	Thu, 08 Sep 2016 08:45:05 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id l10sm640814wju.20.2016.09.08.08.45.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Sep 2016 08:45:04 -0700 (PDT)
Message-ID: <1473349503.26345.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Andre McCurdy
	<armccurdy@gmail.com>
Date: Thu, 08 Sep 2016 16:45:03 +0100
In-Reply-To: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: MIPS: Make toolchain basename generic
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
X-List-Received-Date: Thu, 08 Sep 2016 15:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Do, 2016-09-08 at 14:14 +0100, Zubair Lutfullah Kakakhel wrote:
> For the hard float case, COMPATIBLE_HOST should be set to ".*-linux"
> since OE can support multiple distro layers, not just poky.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> ---
> Pointed out by Andre McCurdy but patch v1 had already been accepted
> and applied.
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 3d49131..42fd27f 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -39,8 +39,8 @@ COMPATIBLE_HOST_armv5 = 'null'
>  COMPATIBLE_HOST_armv6 = 'null'
>  
>  # valgrind doesn't like mips soft float
> -COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft",
> "null", "mips-poky-linux", d)}"
> -COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft",
> "null", "mipsel-poky-linux", d)}"
> +COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft",
> "null", ".*-linux", d)}"
> +COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft",
> "null", ".*-linux", d)}"

Can it not just be set to mips or mipsel? Why .*-linux?

COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mips", d)}"
COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mipsel", d)}"

Cheers,
Andre'



