Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1F06A4E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 08:07:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4S8BaFI032685; Tue, 28 May 2013 09:11:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hOBZrQm0Vt68; Tue, 28 May 2013 09:11:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4S8BVw6032678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 28 May 2013 09:11:32 +0100
Message-ID: <1369728433.14887.145.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 May 2013 09:07:13 +0100
In-Reply-To: <CCC27A1E-27F7-4D70-B7A5-30F2118D3D0C@gmail.com>
References: <1369665656-20275-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CCC27A1E-27F7-4D70-B7A5-30F2118D3D0C@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc 4.8: use /lib/ for AArch64
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
X-List-Received-Date: Tue, 28 May 2013 08:07:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-27 at 16:23 -0700, Khem Raj wrote:
> On May 27, 2013, at 7:40 AM, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> wrote:
> 
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > ---
> > meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
> > .../gcc/gcc-4.8/use-lib-for-aarch64.patch          | 23 ++++++++++++++++++++++
> > 2 files changed, 24 insertions(+)
> > create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> > index a9786da..5142c0f 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> > @@ -66,6 +66,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> > 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> > 	   file://0035-wcast-qual-PR-55383.patch \
> > 	   file://gcc-4.8-PR56797.patch \
> > +	   file://use-lib-for-aarch64.patch \
> > 	  "
> > SRC_URI[md5sum] = "e6040024eb9e761c3bea348d1fa5abb0"
> > SRC_URI[sha256sum] = "b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
> > new file mode 100644
> > index 0000000..a647e93
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
> > @@ -0,0 +1,23 @@
> > +From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > +
> > +AArch64 is built with /lib/ as prefix but GCC 4.8 tries to use /lib64/
> > +path so build fails.
> > +
> > +It may affect builds when /lib64/ will be used but so far it is not
> > +default.
>
> what is the multilib strategy for aarch64? i think using lib64 for 64bit and keep /lib for 32bit apps
> would be ideal so you can keep the existing apps running. In OE we have convoluted x86_64 where
> when not using mutlilib it uses /lib for 64bit apps and when doing multilib it does /lib64 for default 64bit apps and /lib
> for 32bit apps its quite confusing. For arm lets not follow those footsteps and use /lib64 for 64bit from
> the onset and then multilib can come later and will fit in nicely.

In OE, the system is configurable to whatever you want. Why don't we
ensure that works for aarch64 like it does for everything else?

Cheers,

Richard


