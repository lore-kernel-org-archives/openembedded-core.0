Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1384C78223;
	Mon, 28 Aug 2017 15:53:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 28 Aug 2017 08:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="305234067"
Received: from swold-mobl2.jf.intel.com ([10.255.74.240])
	by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2017 08:53:02 -0700
Message-ID: <1503935582.27472.231.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 08:53:02 -0700
In-Reply-To: <CAMKF1srChtUATL3_GFx4hzUz81y7SxVM8UbXsahKJwYVJ0iLqw@mail.gmail.com>
References: <1503933912.27472.227.camel@linux.intel.com>
	<CAMKF1srChtUATL3_GFx4hzUz81y7SxVM8UbXsahKJwYVJ0iLqw@mail.gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded List <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Usage of "elf" IMAGE_TYPES
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
X-List-Received-Date: Mon, 28 Aug 2017 15:53:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-28 at 08:31 -0700, Khem Raj wrote:
> On Mon, Aug 28, 2017 at 8:25 AM, Saul Wold <sgw@linux.intel.com>
> wrote:
> > 
> > 
> > Folks,
> > 
> > I know it's late in our 2.4 cycle, but we recently discovered that
> > mkelfImage fails due to a recent upgrade to binutils. In doing some
> > research, mkelfimage was removed back in Oct 2014 from the coreboot
> > repo. It was replaced with cbfstool.
> > 
> > Unless I hear otherwise, I recommend that we mark elf Images as
> > deprecated for 2.4 and remove them in 2.5.
> > 
> > I have not yet dived into exactly what binutil change triggered the
> > failure.
> > 
> > Further thoughts?
> 
> you should describe what the errors are, maybe then we can make
> further
> inroads into problem. As far as removal is concerned, I support that
> 
My Bad!  During testing we found the following bug: https://bugzilla.yo
ctoproject.org/show_bug.cgi?id=11967

The code that goes along with the Internal error is: 
       /* A sanity check against bad versions of binutils */
        if (params->convert_magic != CONVERT_MAGIC) {
                die("Internal error convert_magic %16llx != %16llx\n",
                        (unsigned long long)(params->convert_magic),
CONVERT_MAGIC);
        }

params->convert_magic is set inside some assembly code:
        .section ".trailer", "a"
        /* Constants set at build time, these are at the very end of my
image */
        .balign 16
        .global params
params:
convert_magic:
        .quad   CONVERT_MAGIC

It might be a simple fix, but I have not dived the rest of the way!

Sau!


> > 
> > 
> > Sau!
> > 
> > _______________________________________________
> > Openembedded-architecture mailing list
> > Openembedded-architecture@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-archite
> > cture

