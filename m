Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6C76AC15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 07:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5R7DkWH028744; Sat, 27 Jun 2015 08:14:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pva2n0CMazHJ; Sat, 27 Jun 2015 08:14:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5R7EenZ028818
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 27 Jun 2015 08:14:52 +0100
Message-ID: <1435389280.10583.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 27 Jun 2015 08:14:40 +0100
In-Reply-To: <CAJ86T=VpxtnCn=HvFRoy_uQs__OJF=ErzpnPf5S1N+6J0=c65A@mail.gmail.com>
References: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
	<1435358156.10583.34.camel@linuxfoundation.org>
	<1435358821.10583.36.camel@linuxfoundation.org>
	<CAJ86T=VpxtnCn=HvFRoy_uQs__OJF=ErzpnPf5S1N+6J0=c65A@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pbzip2: add initial recipe, pbzip2 v1.1.12
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
X-List-Received-Date: Sat, 27 Jun 2015 07:15:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-06-26 at 16:06 -0700, Andre McCurdy wrote:
> On Fri, Jun 26, 2015 at 3:47 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2015-06-26 at 23:35 +0100, Richard Purdie wrote:
> >> On Thu, 2015-06-25 at 12:46 -0700, Andre McCurdy wrote:
> >> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> > ---
> >> >  meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb | 27 +++++++++++++++++++++++++++
> >> >  1 file changed, 27 insertions(+)
> >> >  create mode 100644 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
> >> >
> >> > diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
> >> > new file mode 100644
> >> > index 0000000..fb70d0c
> >> > --- /dev/null
> >> > +++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
> >> > @@ -0,0 +1,27 @@
> >> > +SUMMARY = "PBZIP2 is a parallel implementation of bzip2"
> >> > +DESCRIPTION = "PBZIP2 is a parallel implementation of the bzip2 block-sorting \
> >> > +file compressor that uses pthreads and achieves near-linear speedup on SMP \
> >> > +machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
> >> > +newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
> >> > +HOMEPAGE = "http://compression.ca/pbzip2/"
> >> > +SECTION = "console/utils"
> >> > +LICENSE = "BSD"
> >> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4c4f2edec9679d5abef3514a816b54a4"
> >> > +
> >> > +DEPENDS = "bzip2"
> >>
> >> http://errors.yoctoproject.org/Errors/Details/12617/
> >>
> >> probably as bzip2-native is in ASSUME_PROVIDED at a guess and the bzip2
> >> headers weren't installed :/.
> >>
> >> We might have to force this to build bzip2-native, the only issue with
> >> that is installing bzip2 itself into the sysroot will cause a race like
> >> we've had with tar and gzip :(. We might have to teach it to install the
> >> libs but not the binaries in the native case (and do a PROVIDES +=
> >> "bzip2-replacement-native" or something so we can depend on the right
> >> thing.
> >
> > Turns out we've been here before. We can fix this with:
> >
> > DEPENDS_append_class-native = " bzip2-replacement-native"
> >
> > I'll send out a patch.
> 
> Thanks.
> 
> I'm wondering why I haven't seen an issue though - no build errors
> here and I don't have any bzip2 headers on the host.

Something else must have built bzip2-replacement-native then and it was
just luck. If you cleansstate bzip2-replacement-native and
pbzip2-native, then just built the latter you should see it.

Cheers,

Richard


