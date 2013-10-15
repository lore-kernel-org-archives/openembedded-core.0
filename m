Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5303B610FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:52:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9FEpwIg017840; Tue, 15 Oct 2013 15:51:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sXTAaxronb9y; Tue, 15 Oct 2013 15:51:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9FEpq2x017835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 15 Oct 2013 15:51:53 +0100
Message-ID: <1381848709.29912.424.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2013 15:51:49 +0100
In-Reply-To: <CAMKF1sr=L9W+T1izdxJGRznd3BnZLYW58qPs0y5EnRkETZp68A@mail.gmail.com>
References: <1381844435.29912.422.camel@ted>
	<CAMKF1sr=L9W+T1izdxJGRznd3BnZLYW58qPs0y5EnRkETZp68A@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross-canadian: Fix SHLIBSDIR when using multilib
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
X-List-Received-Date: Tue, 15 Oct 2013 14:52:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-15 at 07:45 -0700, Khem Raj wrote:
> On Tue, Oct 15, 2013 at 6:40 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Both nativesdk and multilib use MLPREFIX for their partciular purposes. When
> > we have both set, cross-canadian can confuse SHLIBSDIR. This forces the
> > variable to the correct value for cross-canadian, fixing toolchains in
> > multilib builds.
> >
> > [YOCTO #5333]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> > index 4387d05..7181c60 100644
> > --- a/meta/classes/cross-canadian.bbclass
> > +++ b/meta/classes/cross-canadian.bbclass
> > @@ -95,3 +95,8 @@ USE_NLS = "${SDKUSE_NLS}"
> >  # We have to us TARGET_ARCH but we care about the absolute value
> >  # and not any particular tune that is enabled.
> >  TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
> > +
> > +# If MLPREFIX is set by multilib code, shlibs
> > +# points to the wrong place so force it
> > +SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs"
> > +SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs"
> 
> in the patch that did not work for me
> I was using ${SDKPKGSUFFIX} instead of hardcoding 'nativesdk'
> and += instead of =

Well, one of the fields only takes a single value and there is only one
correct value here so = is more correct. I also needed my preceding
patch but I tested this and it did work afterwards...

You could try this (and the other patch) and see if it helps?

Cheers,

Richard


