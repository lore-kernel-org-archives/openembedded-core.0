Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC6160438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 23:25:03 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so407773ykq.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 16:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=oJSUAuc8DfB3mv2jIi+vDzeT54VLdGa1pZR/OcAnono=;
	b=cmUIllAZJ7mS6O/FQ2z8FVqdPhsw3ffieXxm+AkLdV3AYylIj4j+4OvIlz+CMk67Lc
	aslPoyNFsQwaZzMfZVVhYQ0eDen/fL5F4BNxyff8w0fXapC8Nj14iDafPYHhOWYID8Hs
	ajoHoNQxYw97EhiOBe1R4UK9S8vTp+drUheD9GOM/hOUABqSSWl3FCBsL+Ifp6aXM2RU
	6dI8uJrCn4ev4bvFL3HLDQKa9y27K7LozsYEMCjiCskGyKZ4etK9n3QKRtS/WZ92VFe8
	HBQZoXQo/+O8h4RiNhXJ/QmBUjIv/+ogZk1j7QpMeLTAtQxR0IHahjEmDokCMd7WJsYy
	wGrg==
MIME-Version: 1.0
X-Received: by 10.236.85.208 with SMTP id u56mr11637338yhe.48.1407972304962;
	Wed, 13 Aug 2014 16:25:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 13 Aug 2014 16:25:04 -0700 (PDT)
In-Reply-To: <53EBD780.9060005@mlbassoc.com>
References: <53EBD780.9060005@mlbassoc.com>
Date: Wed, 13 Aug 2014 20:25:04 -0300
X-Google-Sender-Auth: PyNol2_APuXqi1X11Kg7j6-L_pY
Message-ID: <CAP9ODKpND6P-x7ZKE9SuZ6vbfFF8RxoVSL3X9UDzj-WhV9yTpw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 considered evil
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
X-List-Received-Date: Wed, 13 Aug 2014 23:25:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 6:24 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I've found that the latest GCC doesn't work very well, at
> least not on ARM (and obviously other architectures as well [1])
> When I build Google Chromium browser for my i.MX boards using
> GCC-4.9.x, no pages can be rendered - massive bloodshed and
> failures are shown on the console.  If I use the older GCC 4.8.2,
> everything else the same, all is well.
>
> Here's my configuration:
> BB_VERSION        = "1.23.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-13.10"
> TARGET_SYS        = "arm-amltd-linux-gnueabi"
> MACHINE           = "teton-p0382"
> DISTRO            = "amltd"
> DISTRO_VERSION    = "1.6+snapshot-20140812"
> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta              = "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
> meta-amltd        = "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
> meta-teton-imx6-p0382 = "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
> meta-fsl-arm      = "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
> meta-fsl-arm-extra = "master:12e560967b7136222c325d11633295fe3a0c701c"
> meta-browser      = "master:da93c8e386133a15eff1414d9307c8f2c7a44787"
>
> Should this be filed as a bug?  I don't have much data other than it
> simply breaks (and chrome is not the easiest thing to debug!).  Other
> applications seem OK, but I am loathe to trust it...
>
> I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and I hope
> it doesn't vanish like 4.7.x did too quickly).
>
> [1]
> http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken
>
> Note: I've also tried this on qemux86 (a totally different
> architecture) and chrome bombs just as badly!

I confirm that GCC 4.9 does NOT work for Chromium 35. At this moment I
am not aware of any fix for it.

IIRC the Chromium 37 works though.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

