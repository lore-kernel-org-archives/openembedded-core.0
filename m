Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id DB1616BDFB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 23:56:26 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so4699385oah.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 16:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=V1AzdrasQGd1SE/UNyHI3nUi+jPQdZ+Z21RAgaDoCGw=;
	b=hQKIuNLwk9uS5gqyH+L0JdQuQvSCKWqMokG6l5CiXZ77k+DaD49PuY/Dk1xVM5xA3j
	MqQ9aCj/xUlshLPIgx9/thDSHZsnkevfwvpVdVG4ZgfPOyLbEtTfMP8UENXontPtEpm8
	4a/9/Xk1sXb4chQYifshPHqyrCNhlWlYXT1Hdz45ZVP3rG7Zyz09aXpYMrhCgvGW6VIE
	GQPdBYvsyyBCYEGmkgovYwrfWxufe2SRVu/8UZoMLQ0NdUp1uiF3lmuGbMnX8IqN8K41
	3oYc/XOMb6BysAh1pcsk6oq3JEKWiGSCY0ya6tCKKNzYToiqs4xuRIRNfDC8kvcNqGm3
	8PLA==
MIME-Version: 1.0
X-Received: by 10.182.44.167 with SMTP id f7mr3788412obm.3.1378511788708; Fri,
	06 Sep 2013 16:56:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 6 Sep 2013 16:56:28 -0700 (PDT)
In-Reply-To: <CAJTo0LbLaH4-YTJVo_yr-gsaaSbXXe9Ucfbq_i+4gO+qKa354Q@mail.gmail.com>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
	<CAJTo0LbLaH4-YTJVo_yr-gsaaSbXXe9Ucfbq_i+4gO+qKa354Q@mail.gmail.com>
Date: Fri, 6 Sep 2013 20:56:28 -0300
X-Google-Sender-Auth: PYk2AlxQf-EGm8e8qs5pXR5J2dg
Message-ID: <CAP9ODKo0KQ3gJd+eCfzDF0QX9EYb_NhRRX6NWJOKsxWth7_wxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	Darren Hart <darren.hart@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
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
X-List-Received-Date: Fri, 06 Sep 2013 23:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 6, 2013 at 3:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 September 2013 09:33, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> I'd also appreciate someone (Ross maybe?) confirming that if we build
>> application A against mesa, then change over to a machine that uses emgd
>> and swizzle the libs around in the sysroot, do we need to recompile the
>> app? This approach is assuming we do not need to do that. If we do,
>> there is a different approach we need to take.
>
> So what's happening is that we're revising the original OpenGL policy
> that I posted in October last year:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2012-October/070122.html
>
> tl;dr: I proposed that 1) we rename all GL packages so they identify
> their provider (ie libgl-mesa, we do that), 2) no dependencies on
> specific GL implementations, 3) only Mesa stages.  The theory was that
> Mesa can be considered a canonical implementation of the various GL
> platforms and that we can *build* against Mesa but *install* the right
> hardware-specific GL implementation into the images.
>
> Nice in theory and it should work, but sadly that isn't the case - the
> thread has more details.  Short version is that some applications *do*
> rely on specific GL headers, so you can't just swap them around in
> reality.
>
> Maybe it is time to have a mesa-gl recipe alongside mesa that *just*
> builds the GL libraries.  EMGD can depend on it for the driver modules
> it installs, and presumably other vendors with binary drivers can
> install it for the software rendering/GLX support (Otavio etc, please
> step in here!).

Yes; we have both situations at Freescale ARM BSP.

For the AMD GPU binaries, which are used in MX5 SoCs we *just* use
mesa GL and do software rendering. For Vivante GPU binaries, used for
MX6, we use mesa GL *headers* but Vivante provides a libGL binary.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

