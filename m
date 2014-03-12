Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DFB876F378
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:09:49 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hl1so15015233igb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=H52lPyFrddLUiQSn4MMyuS7L7hZMs0wK+jtqW1Dpsz8=;
	b=RdWDh/ukaQY1p9yim65ZIZuGuty3vBeJDKOYmQgCG2ccQrpdWsXPwr6lgt9gZsjHXT
	NRSjScC+BNoIP5DTvxga6b5z1KQSG5DDBif0yAxcGMzRtq05Eqgp7gS2GroxbeiYsyJ3
	ihkSDA9NZEunWG58XC16BKloEQ/nuUn0XCzsnTVoOOPtN4gAJ8Hp+fxKiM8ljeFUPYbJ
	GjyCsF+oR+/Q0ymYlA7FiMlheyTfCZOspIqEz53o8nyrw6z188K+8hLIT5SOBoKJHfq2
	1p73seEbaSvcI5gvhyno4F/rspSXhrIar50XbvPBaji+TzxuVpXYdKUUIQEwCFcWZrEK
	63Dw==
X-Received: by 10.42.20.6 with SMTP id e6mr37294395icb.29.1394647790559; Wed,
	12 Mar 2014 11:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Wed, 12 Mar 2014 11:09:20 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2014 11:09:20 -0700
Message-ID: <CAMKF1sq-vbPkBJvHk08ZzM2AUHd3APs2mn_-D3fsenWT0Ls2vw@mail.gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Wed, 12 Mar 2014 18:09:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mats

On Wed, Mar 12, 2014 at 8:30 AM, Mats K=C3=A4rrman <Mats.Karrman@tritech.se=
> wrote:
> Hi,
>
> I face a problem with libm. With my Dora build the following assertion do=
esn't hold:
>
> sqrt( pow( sqrt( 2.0 ), 4.0 ) ) =3D=3D 2.0
>
> 1) With my old OE-classic / glibc-2.9 / PowerPC-hf it holds.
> 2) With my Debian desktop PC / glibc-2.17 / amd64 it holds.
> 3) With my new OE-core Dora / eglibc-2.18 / PowerPC-hf it doesn't hold.
>
> Close enough one can think but the standardized test case I run requires =
the result to be 2.0.
> A simple test program:
> --------------------------------------------------------------------
> #include <stdio.h>
> #include <math.h>
>
> int main(){
>
>         double two =3D 2.0;
>         double four =3D 4.0;
>
>         double s1 =3D sqrt(two);
>         printf("sqrt(%.20f) =3D %.20f\n", two, s1);
>         double p   =3D pow(s1, four);
>         printf("pow(%.20f, %.20f) =3D %.20f\n", s1, four, p);
>         double s2 =3D sqrt(p);
>         printf("sqrt(%.20f) =3D %.20f\n", p, s2);
>
> }
> --------------------------------------------------------------------
>
> results from 1 and 2 (identical):
> sqrt(2.00000000000000000000) =3D 1.41421356237309514547
> pow(1.41421356237309514547, 4.00000000000000000000) =3D 4.000000000000000=
88818
> sqrt(4.00000000000000088818) =3D 2.00000000000000000000
>
> results from 3:
> sqrt(2.00000000000000000000) =3D 1.41421356237309492343
> pow(1.41421356237309492343, 4.00000000000000000000) =3D 3.999999999999998=
66773
> sqrt(3.99999999999999866773) =3D 1.99999999999999955591
>
> Does anyone know if this is a known "feature" of eglibc or know any other=
 reason
> for this difference?
>
We have done changes since OE-Classic days in the FPU area for ppc.
what ppc machine is it ? I have access to p2020 based machine (e500v2)
and it works as expected with
dora/eglibc-2.18

> Best Regards,
> Mats
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

