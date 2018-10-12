Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE67679BEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 20:56:04 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id e126so13063662vsc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nh1/xTHifE9qV8+4ZTRJF0QLFJ7HuVFQWvMS9Zoltas=;
	b=MjS6nOdVoY5666vTuWVXDUOyy24aWeAvVtyW72c5ClQtFKZQE7+R234tzB2NFFc34a
	s7M3W/7fhQMcxulyjnrZ7+Wys9XJb+SNlCKt2wu7MwXkpPIVsq9z663bB9e6wldORXUk
	fNWo8m8xb8GRidg0XBgR5xF50VvwVyAgtgpzKeKyTUDM17pnooQ0IQ+/wNJ8XnM2PxoE
	Dqbosuj7HQiAJ/0c7xpe1nxxIzbUctHScqWDeTbu5/33KEcy18N59r7X2oeIpt5sPsKG
	FhNumXlMmg6L/rHFqAfjjOwNia7wWC9UKMTZER7b+VBAn4K3z71vtyIozeeaJ+MR4xRe
	5qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nh1/xTHifE9qV8+4ZTRJF0QLFJ7HuVFQWvMS9Zoltas=;
	b=q7eXHY9NGWCmgAZMZkXG9mGpiXwJmvy+3nY7G5WpEKfW089DjGo1/qYwnVv0TdTnOf
	QdXAV3Bl0wFJLpEP0eZ6cTqJiUULYB2EcPHsv2/H4jcoYMo4UTOUHZeVmsTRjvZv70bG
	dh7vogRbd/clq3pjwDubnCFs2tu1AQuA6mUKsxt3R2ZCvxQWTd1inBAcvgp4Hx1r07bD
	Guccg7j+s62/1gYqzarj8LNS0BWa2QEKDPcWIUG1EJ0EqAdSEOXY3/EwFg8IKJWRTs3I
	9DVTppiJDl35JMTKAuuOpYLHmapr/BSkyn8JmewIOjveKUWw/BWBeQY0HMFQagMCz41T
	lSsg==
X-Gm-Message-State: ABuFfojEiymFnUGx3JoOMN7aacVSDynnwWaqrk2khbTZ8wmdeXkufTlX
	LKMzE8cmKii4oB3HdBh9xl35o+3SWA+RzMUYPMs=
X-Google-Smtp-Source: ACcGV62kRT5BObSiOew8izMGm6Bjs/XbJhSKE28HO36n93VsGLL5Z/R7ElE1Wak9T+rI1qVdx5Kp1yFPJR5AuvQhZJ8=
X-Received: by 2002:a67:c285:: with SMTP id k5mr3138044vsj.130.1539377765477; 
	Fri, 12 Oct 2018 13:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2748:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 13:56:04
	-0700 (PDT)
In-Reply-To: <20181012202823.4003-1-raj.khem@gmail.com>
References: <20181012202823.4003-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Oct 2018 13:56:04 -0700
Message-ID: <CAJ86T=WjWNPB+upTuQN8EndUGFC_jBqSRO59Xy=7RZANoaSPdA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Do not use thumb1 ISA on armv6
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
X-List-Received-Date: Fri, 12 Oct 2018 20:56:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This does not work and is unsupported so lets compile glibc in ARM mode
> always on armv6 SOCs

Note the comments in glibc-collateral.inc:

  # This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
  # will fail to find main glibc, for details see
  # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
  ARM_INSTRUCTION_SET_armv4 = "arm"
  ARM_INSTRUCTION_SET_armv5 = "arm"

Either the two recipes need to be kept in sync or the comment no longer applies?

> Fixes [YOCTO #12929]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index ddf0c6b80e..99c92ce46e 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -56,6 +56,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
> +ARM_INSTRUCTION_SET_armv6 = "arm"
>
>  # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
>  # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

