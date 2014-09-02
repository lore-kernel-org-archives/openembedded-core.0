Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C10676A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 06:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s826Hi9h022376; Tue, 2 Sep 2014 07:17:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Hz8OXLXvtz-G; Tue,  2 Sep 2014 07:17:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s826Hflp022373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 2 Sep 2014 07:17:42 +0100
Message-ID: <1409638663.29296.242.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 02 Sep 2014 07:17:43 +0100
In-Reply-To: <CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
	<540530B8.8040107@windriver.com>
	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
	<540539E6.2030508@windriver.com>
	<CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 06:17:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-02 at 00:33 -0300, Otavio Salvador wrote:
> On Tue, Sep 2, 2014 at 12:30 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> >
> >
> > On 09/02/2014 11:17 AM, Otavio Salvador wrote:
> >>
> >> On Mon, Sep 1, 2014 at 11:51 PM, Robert Yang <liezhi.yang@windriver.com>
> >> wrote:
> >>>
> >>>
> >>> On 09/02/2014 10:30 AM, Otavio Salvador wrote:
> >>>>
> >>>>
> >>>> Hello,
> >>>>
> >>>> During our regression tests we found the following error:
> >>>>
> >>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
> >>>> PREFERRED_PROVIDER entry to match jpeg
> >>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
> >>>> PROVIDES 'libxext-native' (but
> >>>
> >>>
> >>>
> >>> Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
> >>> doesn't provide native, but libxext_1.3.2.bb does.
> >>>
> >>> Seems that we need remove the git version since it is older:
> >>>
> >>> PV = "1.0.99.1+gitr${SRCPV}"
> >>>
> >>> And doesn't see a license issue.
> >>
> >>
> >> This has been reproduced in our autobuilder.
> >>
> >> It removes:
> >>
> >> x11 and wayland
> >>
> >> and adds:
> >>
> >> directfb
> >>
> >> Can you try to reproduce it?
> >>
> >
> > Yes, I can reproduce the error, sorry, please revert this as a quick
> > workaround:
> >
> > Author: Robert Yang <liezhi.yang@windriver.com>
> > Date:   Tue Jul 29 01:02:44 2014 -0700
> >
> >     qemu-native: depends on libxext-native when enable sdl
> >
> >
> > The DISTRO_FEATURES affects the native recipe, I'm not sure whether this is
> > intended or not.
> 
> This is an error in our autobuilder for regression test; Richard,
> could you revert this in OE-Core?

I think that illustrates the problem but is perhaps not the correct fix.

We did hit some issues like this with poky-tiny and I ended up fixing
this like:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=8b70d4b2863f48e843fb6ac9e4a939ae63338093

and also

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fd0398f2c1355597a95242e6c8400eae6ad60fa4

Cheers,

Richard




