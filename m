Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CD8E0731D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 21:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0LLs0Cc015843; Thu, 21 Jan 2016 21:54:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JLWkig_dk4nD; Thu, 21 Jan 2016 21:54:00 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0LLrvLI015828
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Jan 2016 21:53:58 GMT
Message-ID: <1453413237.27999.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>, Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 21 Jan 2016 21:53:57 +0000
In-Reply-To: <CAP0W-R=Nqx=eqhvXD6Ex=RB8NxiPZcpwWqSMA+RvT1W3CMct2g@mail.gmail.com>
References: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
	<56A08BE4.1090306@windriver.com>
	<CAP0W-R=Nqx=eqhvXD6Ex=RB8NxiPZcpwWqSMA+RvT1W3CMct2g@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: disable libblkid again
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
X-List-Received-Date: Thu, 21 Jan 2016 21:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-21 at 08:44 +0100, Koen Kooi wrote:
> On 21 January 2016 at 08:42, Robert Yang <liezhi.yang@windriver.com>
> wrote:
> > 
> > 
> > On 01/21/2016 03:20 PM, Koen Kooi wrote:
> > > 
> > > We use the util-linux one and do_install deletes it anyway.
> > > 
> > > See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for
> > > more info.
> > > 
> > > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > > ---
> > >   meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> > > b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> > > index c82e99a..f244473 100644
> > > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> > > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> > > @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =
> > > "v(?P<pver>\d+\.\d+(\.\d+)*)$"
> > > 
> > >   EXTRA_OECONF += "--libdir=${base_libdir} -
> > > -sbindir=${base_sbindir} \
> > >                   --enable-elf-shlibs --disable-libuuid --disable
> > > -uuidd \
> > > -                --enable-libblkid --enable-verbose-makecmds"
> > > +                --disable-libblkid --enable-verbose-makecmds"
> > 
> > 
> > Thanks, maybe we also need cleanup other codes like:
> > 
> >     # We use blkid from util-linux now so remove from here
> >     rm -f ${D}${base_libdir}/libblkid*
> 
> That one should stay in, because we *really* don't want it to end up
> in packages.
> 
> > 
> > And:
> > 
> > ALTERNATIVE_${PN}-doc = "libblkid.3 blkid.8"
> > ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
> > ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
> 
> I don't have a strong opinion on those, RP?

The reply from Ross suggests we do need to remove these otherwise the
system warns about missing files...

Cheers,

Richard

