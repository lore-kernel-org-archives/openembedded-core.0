Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QL7eH-0004AM-4D
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 07:44:21 +0200
Received: by yxn22 with SMTP id 22so1197609yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=9ULuWSuYFKZDeO3kDzPorWRNBCsSPy7I6o5t9R2kGR8=;
	b=Ur+27tbJbfMkuEKgGfPFiMFp8E2q2GOXKBG1mf4OL21tTB7i9NBrzWZsgPvQ2phdeb
	lqtwA3Liu0UZJyNZlOIE1X4UWSNFG/bY9RAzqYrMqB1g9OZROAKzYy3vwJI7BDv+kA1K
	PjreWPqnOH+0uuXvlh8sK/2aK+n8VxRGgMtQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wK7ygMVbfkWCLK4bCtpQSIx0f2IpHB6LqtvnUuwNq0RXnpPIcfZIhrsZtxTkXJO4bv
	AeadMrBAZj4z3SaYdjY19QmgpOwTJMZQIaPkrrbWFtMqLsQPGG+KHw9A+mdwYWxEsEfO
	wMWmr4zqqjis/HYpHz2ItPOS8q8dtV3xqHJHo=
MIME-Version: 1.0
Received: by 10.91.43.1 with SMTP id v1mr1968289agj.130.1305351683706; Fri, 13
	May 2011 22:41:23 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Fri, 13 May 2011 22:41:23 -0700 (PDT)
In-Reply-To: <2bcca2da6cb16866886a329d7f7a74edde7ebabf.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<2bcca2da6cb16866886a329d7f7a74edde7ebabf.1305329659.git.dvhart@linux.intel.com>
Date: Sat, 14 May 2011 01:41:23 -0400
Message-ID: <BANLkTi=asVetXO8z9ht4Pd6JYm_yrEb9gg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 08/10] send-pull-request: fix greedy auto-cc regex
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 May 2011 05:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 7:38 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> A greedy regular expression caused emails to be harvested from patches
> that were quoted in the commit message. Ensure only tags that start at th=
e
> beginning of the line are considered for harvesting.
>
> NOTE: users are still responsible for verifying the recipients list and t=
o
> =A0 =A0 =A0ensure they do not spam people!

This is key!

But a change for the better.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Saul Wold <sgw@linux.intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0scripts/send-pull-request | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index d265c47..b294d35 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -90,7 +90,7 @@ done
> =A0if [ $AUTO -eq 1 ]; then
> =A0 =A0 =A0 =A0harvest_recipients TO "^[Tt][Oo]: *"
> =A0 =A0 =A0 =A0harvest_recipients CC "^[Cc][Cc]: *"
> - =A0 =A0 =A0 harvest_recipients CC "^.*-[Bb][Yy]: *"
> + =A0 =A0 =A0 harvest_recipients CC "^[A-Z][A-Za-z-]*-[Bb][Yy]: *"
> =A0fi
>
> =A0AUTO_TO=3D"$(git config sendemail.to)"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


