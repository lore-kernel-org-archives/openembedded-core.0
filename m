Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@intel.com>) id 1TOWaE-0005dY-Uw
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 18:35:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2012 09:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,602,1344236400"; d="scan'208";a="157294209"
Received: from unknown (HELO [10.255.13.204]) ([10.255.13.204])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Oct 2012 09:20:37 -0700
Message-ID: <1350490844.2185.119.camel@ted>
From: Richard Purdie <richard.purdie@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 17 Oct 2012 17:20:44 +0100
In-Reply-To: <507D17CA.9060309@windriver.com>
References: <cover.1350300631.git.kai.kang@windriver.com>
	<b2e451207c62285312f27eb6a6d2003ecbc534f2.1350300631.git.kai.kang@windriver.com>
	<507D17CA.9060309@windriver.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nativesdk-perl: fix dependecy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 16:35:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-16 at 16:16 +0800, Robert Yang wrote:
> Hi Richard,
> 
> Here are more details for this problem:
> 
> RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"
> 
> The PACKAGES would be reset by do_split_packages since:
> 
> PACKAGES_DYNAMIC = "perl-module-*"
> PACKAGES_DYNAMIC_virtclass-nativesdk = "nativesdk-perl-module-*"
> 
> Then:
> 1) The target perl-modules RRECOMMENDS on perl-module-*, this is what
>     we expect.
> 
> 2) But the nativesdk-perl-modules doesn't RRECOMMENDS on
>     nativesdk-perl-module-*, this is not what we expect.
> 
> I have checked the value of PACKAGES after do_split_packages, it has been
> set correctly (it contains the nativesdk-perl-module-* packages)
> 
> But the:
> 
> RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"
> 
> doesn't work correctly for nativesdk, the d.getVar('RRECOMMENDS_perl-modules', 
> True) doesn't get the new value of the PACKAGES, it gets the value of PACKAGES
> before the do_split_packages.
> 
> The current patch would fix the problem, but I don't know the root cause,
> do you have any comments or directions, please?

The root cause is the way the class extension code works. I think in
this case, moving the setting of the RRECOMMENDS_perl-modules to where
you set it is the correct thing to do. We need to include this
explanation in the patch/commit though.

Cheers,

Richard



