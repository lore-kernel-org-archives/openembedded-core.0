Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Skjej-0001wI-4g
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:27:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2012 15:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171795758"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2012 15:16:14 -0700
Message-ID: <4FEE292E.6020806@linux.intel.com>
Date: Fri, 29 Jun 2012 15:16:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
	<d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
	<CAMKF1so_1JQY-4eRWZ8Xkq4ixQ7cCmCSVAEohtjRJEFd9KoZiA@mail.gmail.com>
	<4FEE253F.805@linux.intel.com>
	<CAMKF1sp9Nw4ko-8b1TC0u0r+dyyWaO_TbrTKUuFWBribxF-h0w@mail.gmail.com>
In-Reply-To: <CAMKF1sp9Nw4ko-8b1TC0u0r+dyyWaO_TbrTKUuFWBribxF-h0w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 22:27:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 03:09 PM, Khem Raj wrote:
>
>
> On Friday, June 29, 2012, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>  > On 06/29/2012 02:52 PM, Khem Raj wrote:
>  >>
>  >>
>  >> On Friday, June 29, 2012, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>
>  >> <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>> wrote:
>  >> > By doing this we can easily add addtional packages that can be
>  >> > greedy before PN, but after some of the other standard packages.
>  >> >
>  >> > This will also allow us to simplify the lib_package class to set
>  >> > this variable.
>  >> >
>  >> > Signed-off-by: Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>
>  >> <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>>
>  >> > ---
>  >> >  meta/conf/bitbake.conf |    3 ++-
>  >> >  1 file changed, 2 insertions(+), 1 deletion(-)
>  >> >
>  >> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>  >> > index 9377ee6..df4907e 100644
>  >> > --- a/meta/conf/bitbake.conf
>  >> > +++ b/meta/conf/bitbake.conf
>  >> > @@ -254,7 +254,8 @@ SOLIBSDEV_darwin = ".dylib"
>  >> >  SOLIBSDEV_darwin8 = ".dylib"
>  >> >  SOLIBSDEV_darwin9 = ".dylib"
>  >> >
>  >> > -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
>  >> ${PN}-locale ${PN}"
>  >> > +PACKAGE_BEFORE_PN ?= ""
>  >> > +PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
>  >> ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>  >> >  PACKAGES_DYNAMIC = "${PN}-locale-*"
>  >> >  FILES = ""
>  >> >
>  >>
>  >>
>  >> Can it appear at the beginning before pn-dbg?
>  >> Then you could just prepend I don't think any of those predefined
>  >> packages will have anything of interest that's in pn-bin
>  >
>  > No that's won't work since pn-dev wants to get -config binaries and
> sometimes there are other binaries that pn-dev wants, I did try that
> initially, by having -bin in front with =+ and got failures.
>  >
>  > This has been a tricky set of changes to deal with.
>
>
> Hmm this variable really looks very specific not something for general
> bitbake.conf I think
> Can pn-bin appear after pn  since in case of libraries on should not
> have much interest

No it can't appear after because PN is greedy and will grab all the 
bindir and base_bindir executable.  If anything I could move PN-bin 
definition back into lib_package, but I found it clear to define it in 
bitbake.conf with all the other PN-* definitions.

Sau!

>  > Sau!
>  >
>  >> > --
>  >> > 1.7.10.4
>  >> >
>  >> >
>  >> > _______________________________________________
>  >> > Openembedded-core mailing list
>  >> > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  >> <mailto:Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>>
>  >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>  >> >
>  >>
>  >>
>  >> _______________________________________________
>  >> Openembedded-core mailing list
>  >> Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>  >


