Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A9D8760116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 22:20:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2016 15:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,315,1464678000"; d="scan'208";a="134346673"
Received: from mabubaka-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.98])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2016 15:20:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 06 Jul 2016 10:20:14 +1200
Message-ID: <1938729.OmKoPsHsuH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
	<CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Tue, 05 Jul 2016 22:20:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 05 Jul 2016 08:12:14 Khem Raj wrote:
> On Tue, Jul 5, 2016 at 1:21 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> > On Mon, Jul 4, 2016 at 8:58 AM, Burton, Ross <ross.burton@intel.com> 
wrote:
> >> On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com> wrote:
> >>> Say I have a proprietary library which only I can build from source
> >>> and I have a conventional recipe which builds it within OE. I would
> >>> now like to create a tar file of the library and headers etc, plus a
> >>> companion recipe based on bin_package.bbclass to allow others to make
> >>> use of the library in their OE builds. ie the situation described
> >>> here:
> >>> 
> >>> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#packag
> >>> ing-externally-produced-binaries
> >>> 
> >>> Is there a recommended way to create the tar file to support that?
> >>> e.g. a class which automatically creates a deployable tar file of a
> >>> recipe's ${D} directory?
> >> 
> >> You *may* be able to use package_tar in the recipe in some way to achieve
> >> this.
> > 
> > It only seems to support creating tar files after packages have been
> > split ( ie individual tar files for each subdirectory under
> > ${WORKDIR}/packages-split ). I don't think it's going to be directly
> > useful for creating a tar file of ${D}.
> 
> package_tar is just another packaging format here so you will get
> individual package separately
> you might want to add another class to package everything into 1 thats
> a separate issue, you have
> to either add this via a bbclass or additional function

Right. Another thing - you probably want to tar up ${PKGD} rather than ${D}; 
then you get the result of all of the processing that happens during packaging  
(other than the splitting to individual packages) such as debug symbol 
stripping.

I think we'd take a patch to have a variable that told package_tar to do this, 
it does seem useful in this context.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

