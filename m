Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C2F7660110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 22:36:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2016 14:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,555,1444719600"; d="scan'208";a="879325976"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2016 14:36:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Jan 2016 11:36:07 +1300
Message-ID: <1731469.ftd10BAJx1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <E820897B-DAC3-4691-A276-923CB1C48FB0@gmail.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<10682729.sQ8qah7Y6F@peggleto-mobl.ger.corp.intel.com>
	<E820897B-DAC3-4691-A276-923CB1C48FB0@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Mon, 11 Jan 2016 22:36:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 11 Jan 2016 13:17:14 Khem Raj wrote:
> > On Jan 11, 2016, at 1:07 PM, Paul Eggleton <paul.eggleton@linux.intel.com>
> > wrote:> 
> > On Mon, 11 Jan 2016 09:36:36 Paul Eggleton wrote:
> >> On Mon, 11 Jan 2016 09:26:39 Paul Eggleton wrote:
> >>> On Fri, 08 Jan 2016 18:22:49 Richard Purdie wrote:
> >>>> xz gives better compression results than bzip/gz but is often slower.
> >>>> Using parallel compression mitigates this somewhat and is particularly
> >>>> useful for the SDK.
> >>>> 
> >>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>>> 
> >>>> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb
> >>>> b/meta/recipes-support/pixz/pixz_1.0.6.bb new file mode 100644
> >>>> index 0000000..e6e4ac2
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
> >>>> @@ -0,0 +1,14 @@
> >>>> +SUMMARY = "Parallel, indexed xz compressor"
> >>>> +
> >>>> +DEPENDS = "xz libarchive"
> >>>> +
> >>>> +SRC_URI =
> >>>> "https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar
> >>>> .
> >>>> xz
> >>>> "
> >>> 
> >>> Can we rely on this never changing? I thought we'd experienced problems
> >>> with github's release tarballs being generated on the fly in the past...
> >> 
> >> Another thing, this seems to fail to build without asciidoc:
> >> 
> >> ------------ snip ------------
> >> checking for src/pixz.1... no
> >> checking for a2x... no
> >> configure: error: AsciiDoc not found, not able to generate the man page.
> >> ------------ snip ------------
> >> 
> >> This is also related to not supporting B != S, since src/pixz.1 does
> >> exist,
> >> just in S and not B. If you inherit autotools-brokensep instead of
> >> autotools it works.
> > 
> > Possibly a bit obvious, but even inheriting autotools-brokensep isn't
> > enough, because if it runs "make clean" on re-executing do_configure,
> > src/pixz.1 gets deleted and you get the same issue.
> 
> Adding --without-manpage might get you past this issue.

I'm afraid that's not a valid option for this configure script.

I had more shenanigans trying to build the target version. In the end I needed 
to add "ac_cv_file_src_pixz_1=yes" to EXTRA_OECONF and inherit pkgconfig.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

