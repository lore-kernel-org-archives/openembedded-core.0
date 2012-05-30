Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZgOm-0006Kn-F5
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 12:45:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2012 03:34:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149423142"
Received: from unknown (HELO helios.localnet) ([10.255.12.128])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2012 03:34:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Wed, 30 May 2012 11:34:43 +0100
Message-ID: <1793641.qLjaTPpfTI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAOHjBZsuZjS=mbkEm56=BkcoROj8-X7LUdHDrO-m6p3PWvoyPw@mail.gmail.com>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
	<CAOHjBZvsH6mQVtHPb8V4tOuKTpjPhCX2yy065yRqR5eQW9=Y-A@mail.gmail.com>
	<CAOHjBZsuZjS=mbkEm56=BkcoROj8-X7LUdHDrO-m6p3PWvoyPw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to query installed rpm packages
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
X-List-Received-Date: Wed, 30 May 2012 10:45:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 May 2012 12:29:02 Giuseppe Condorelli wrote:
> > If you aren't including packaging data in the resulting image (i.e.
> > IMAGE_FEATURES does not contain "package-management"),
> 
> Adding the package-management I saw target rpm is set to be built.
> So I can think I'll have the rpm inside the target fs I'll install via oe
> system.
> How can it help me if I query installed packages from host?

Adding package-management to IMAGE_FEATURES does two things:

1) Adds rpm to the image to be run on the target
2) Avoids deleting the rpm database files so that rpm actually works

It's #2 that I was referring to earlier - if the rpm database has been 
deleted, rpm on the host will not be able to query the contents of the image. 
Even if they are going to be deleted we can just put our operations before 
that happens - we just need to inject them in the right place. Putting a call 
into ROOTFS_POSTPROCESS_COMMAND achieves this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


