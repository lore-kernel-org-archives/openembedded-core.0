Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SkjOS-0001XS-PY
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:10:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2012 14:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="159875177"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2012 14:59:27 -0700
Message-ID: <4FEE253F.805@linux.intel.com>
Date: Fri, 29 Jun 2012 14:59:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341004548.git.sgw@linux.intel.com>
	<d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
	<CAMKF1so_1JQY-4eRWZ8Xkq4ixQ7cCmCSVAEohtjRJEFd9KoZiA@mail.gmail.com>
In-Reply-To: <CAMKF1so_1JQY-4eRWZ8Xkq4ixQ7cCmCSVAEohtjRJEFd9KoZiA@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Jun 2012 22:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 02:52 PM, Khem Raj wrote:
>
>
> On Friday, June 29, 2012, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>  > By doing this we can easily add addtional packages that can be
>  > greedy before PN, but after some of the other standard packages.
>  >
>  > This will also allow us to simplify the lib_package class to set
>  > this variable.
>  >
>  > Signed-off-by: Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>>
>  > ---
>  >  meta/conf/bitbake.conf |    3 ++-
>  >  1 file changed, 2 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>  > index 9377ee6..df4907e 100644
>  > --- a/meta/conf/bitbake.conf
>  > +++ b/meta/conf/bitbake.conf
>  > @@ -254,7 +254,8 @@ SOLIBSDEV_darwin = ".dylib"
>  >  SOLIBSDEV_darwin8 = ".dylib"
>  >  SOLIBSDEV_darwin9 = ".dylib"
>  >
>  > -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
> ${PN}-locale ${PN}"
>  > +PACKAGE_BEFORE_PN ?= ""
>  > +PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
> ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>  >  PACKAGES_DYNAMIC = "${PN}-locale-*"
>  >  FILES = ""
>  >
>
>
> Can it appear at the beginning before pn-dbg?
> Then you could just prepend I don't think any of those predefined
> packages will have anything of interest that's in pn-bin

No that's won't work since pn-dev wants to get -config binaries and 
sometimes there are other binaries that pn-dev wants, I did try that 
initially, by having -bin in front with =+ and got failures.

This has been a tricky set of changes to deal with.

Sau!

>  > --
>  > 1.7.10.4
>  >
>  >
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>  >
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


