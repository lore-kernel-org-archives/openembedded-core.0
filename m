Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508D3C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 22:25:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6709.1710195936912469706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 15:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YwtmSu1D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC0CE240005;
	Mon, 11 Mar 2024 22:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710195935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkKsV4im7VNpyqFKTYY6JbFQpxapCJ+0sHdqz+GlDoc=;
	b=YwtmSu1DRbyTjsJIErybJjUgXqjHL9/BZD77AVpuY5xbAYwBjugxrPWv/Ku2Kf4XqCFf+6
	DUwD/SaRF4qfHN8AwvNCBDlNxi/HT+aqt9xYkGfyPGpuR2SZ6yg6ncUYW19GRvn/iU8h64
	bWvjma2VQtjna0SSI0KCTbmEet1SRTbGSE9IMpEBrLfi6zAPz0zD3tGXui+mSaPoOz6z++
	OYmQftur+v3mKP3qHskJ+mo2O+aO+fICCmKh9SSPhX+aO+xVgY/t+RHY279tidLo0js2zJ
	IT43h+WiMw12OFrQS8jCQDNK7F7/9/Ss4M2VeC9IzY44LZgiRgXQZvufFuCT7A==
Date: Mon, 11 Mar 2024 23:25:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: leimaohui@fujitsu.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix conflict error when enbale multilib
 on aarch64.
Message-ID: <202403112225341e0cd1cf@mail.local>
References: <20240226053210.3501-1-leimaohui@fujitsu.com>
 <CAMKF1sqh5ngJdQfKvgQ-9Omc6U6SeKE2DzV6127-ep2iyS=8Jg@mail.gmail.com>
 <TY3PR01MB11056E0F4F06FD30D842303E3A0272@TY3PR01MB11056.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11056E0F4F06FD30D842303E3A0272@TY3PR01MB11056.jpnprd01.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 22:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196966

https://lore.kernel.org/all/b023614f7765fc003a4aa854440c0b66d200d27b.camel@linuxfoundation.org/

On 07/03/2024 16:22:32-0800, leimaohui via lists.openembedded.org wrote:
> Ping 
> 
> 
> 
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Monday, February 26, 2024 2:19 PM
> > To: Lei, Maohui <leimaohui@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] glibc: Fix conflict error when enbale multilib on
> > aarch64.
> > 
> > lgtm.
> > 
> > On Sun, Feb 25, 2024 at 9:32 PM leimaohui via lists.openembedded.org
> > <leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Lei Maohui <leimaohui@fujitsu.com>
> > >
> > > Error: Transaction test error:
> > >   file /usr/include/finclude/math-vector-fortran.h from install of
> > > lib32-libc6-dev-2.39+git0+312e159626-r0.armv7ahf_neon conflicts with
> > > file from package libc6-dev-2.39+git0+312e159626-r0.aarch64
> > >
> > > The difference of math-vector-fortran.h between 32bit and 64bit is as
> > > the following:
> > >
> > > ---
> > tmp/work/aarch64-linux/glibc/2.39+git/image/usr/include/finclude/math-vecto
> > r-fortran.h    2024-02-26 03:41:59.560000000 +0000
> > > +++ tmp/work/armv7ahf-neon-xmllib32-linux-gnueabi/lib32-glibc/2.39+git
> > > +++ /image/usr/include/finclude/math-vector-fortran.h 2024-02-26
> > > +++ 02:22:28.592000000 +0000
> > > @@ -15,33 +15,5 @@
> > >  !   You should have received a copy of the GNU Lesser General Public
> > >  !   License along with the GNU C Library; if not, see
> > >  !   <https://www.gnu.org/licenses/>.
> > > -!GCC$ builtin (acos) attributes simd (notinbranch) -!GCC$ builtin
> > > (acosf) attributes simd (notinbranch) -!GCC$ builtin (asin) attributes
> > > simd (notinbranch) -!GCC$ builtin (asinf) attributes simd
> > > (notinbranch) -!GCC$ builtin (atan) attributes simd (notinbranch)
> > > -!GCC$ builtin (atanf) attributes simd (notinbranch) -!GCC$ builtin
> > > (atan2) attributes simd (notinbranch) -!GCC$ builtin (atan2f)
> > > attributes simd (notinbranch) -!GCC$ builtin (cos) attributes simd
> > > (notinbranch) -!GCC$ builtin (cosf) attributes simd (notinbranch)
> > > -!GCC$ builtin (exp) attributes simd (notinbranch) -!GCC$ builtin
> > > (expf) attributes simd (notinbranch) -!GCC$ builtin (exp10) attributes
> > > simd (notinbranch) -!GCC$ builtin (exp10f) attributes simd
> > > (notinbranch) -!GCC$ builtin (exp2) attributes simd (notinbranch)
> > > -!GCC$ builtin (exp2f) attributes simd (notinbranch) -!GCC$ builtin
> > > (expm1) attributes simd (notinbranch) -!GCC$ builtin (expm1f)
> > > attributes simd (notinbranch) -!GCC$ builtin (log) attributes simd
> > > (notinbranch) -!GCC$ builtin (logf) attributes simd (notinbranch)
> > > -!GCC$ builtin (log10) attributes simd (notinbranch) -!GCC$ builtin
> > > (log10f) attributes simd (notinbranch) -!GCC$ builtin (log1p)
> > > attributes simd (notinbranch) -!GCC$ builtin (log1pf) attributes simd
> > > (notinbranch) -!GCC$ builtin (log2) attributes simd (notinbranch)
> > > -!GCC$ builtin (log2f) attributes simd (notinbranch) -!GCC$ builtin
> > > (sin) attributes simd (notinbranch) -!GCC$ builtin (sinf) attributes
> > > simd (notinbranch) -!GCC$ builtin (tan) attributes simd (notinbranch)
> > > -!GCC$ builtin (tanf) attributes simd (notinbranch)
> > > +
> > > +! No SIMD math functions are available for this platform.
> > >
> > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc-package.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-package.inc
> > > b/meta/recipes-core/glibc/glibc-package.inc
> > > index 1ef987be0a..19eb7afa81 100644
> > > --- a/meta/recipes-core/glibc/glibc-package.inc
> > > +++ b/meta/recipes-core/glibc/glibc-package.inc
> > > @@ -167,6 +167,7 @@ do_install_armmultilib () {
> > >         oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h
> > > ieee754.h
> > >
> > >         oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h
> > > sys/ucontext.h sys/user.h
> > > +       oe_multilib_header finclude/math-vector-fortran.h
> > >  }
> > >
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196838): https://lists.openembedded.org/g/openembedded-core/message/196838
> Mute This Topic: https://lists.openembedded.org/mt/104577604/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

