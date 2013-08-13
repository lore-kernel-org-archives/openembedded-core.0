Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3022F6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 20:11:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7DKMLAH019741; Tue, 13 Aug 2013 21:22:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4fU2wEQl4apJ; Tue, 13 Aug 2013 21:22:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7DKMHj9019725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 13 Aug 2013 21:22:19 +0100
Message-ID: <1376424663.1838.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2013 21:11:03 +0100
In-Reply-To: <8B119486-AEBF-46F6-9EB1-BC31C81A80D3@gmail.com>
References: <6741EAAB26B57F4995668065CB62D86B33933627@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKhTFiKC8BwPhtULqmtkuzgYV3MVPOCLn64ibgGYjuaGA@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33933DFC@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKiRwXD8gJhG+7XDSHSGEvZY3YBR5MxBZieVMYPd_sL1g@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33934034@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKCKapZsVm-sShNcfN_sE+hQM=1oWPoz-=g-PRMnzwTiw@mail.gmail.com>
	<8B119486-AEBF-46F6-9EB1-BC31C81A80D3@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, "Sywula,
	Krzysztof M" <krzysztof.m.sywula@intel.com>
Subject: Re: Yocto toolchain for Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 20:11:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-13 at 09:17 -0700, Khem Raj wrote:
> On Aug 12, 2013, at 6:34 AM, Francois Retief <fgretief@gmail.com>
> wrote:

> > My understanding is that MinGW is the libc library for Win32
> > environments. So we need to "replace" eglibc with mingw for all code
> > that execute on the Win32 platform.  In the case of OpenEmbedded, it
> > is all packages that start with "nativesdk-" when is
> > SDKMACHINE="x86_64-mingw32".
> > 
> > 
> > Over the weekend I worked on this by disabling the eglibc recipes
> > and seeing what packages are missing.  The eglibc recipe provides
> > the "virtual/nativesdk-libc" package. My understanding is that this
> > virtual package must be implemented by MingGW.  In the process I
> > also found that pthreads-win32 was needed and added a recipe for
> > this.
>
> 
> Not really but if you stub eglibc from nativesdk out then make sure
> the host libc is plugged in correctly at all places where its
> expected. Its safer to let it
> build its own nativesdk eglibc. Since we also modify the shared
> library load paths in dynamic linker to use own nativesdk libraries
> first if available

Think about this for a second Khem - we're building a gcc which will run
on windows. Having a nativesdk-eglibc is therefore not desirable or even
possible, we need the mingw runtime instead.

I looked into this and NLS is enabled for nativesdk so it was trying to
build eglibc for libiconv and libintl. I've hacks on my branch to force
NLS off and use the libs as uclibc does. The takeaway of this is we
really need to make NLS properly configurable for nativesdk and then
this becomes much easier to solve.

I pushed some updates onto my branch and meta-toolchain now builds a
nice looking SDK tarball with ipk packaging, rpm for some reason has
missing files (some problem with smart). Whether the compiler there
works or is useful on windows I have no idea.

I've probably done all I plan to do with this which was really a bit of
fun for me to prove what is/is not possible. I'd be interested if anyone
tries using it though.

Cheers,

Richard


