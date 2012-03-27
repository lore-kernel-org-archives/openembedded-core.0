Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCd1t-0007eU-Bp
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 22:30:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Mar 2012 13:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="122359304"
Received: from unknown (HELO helios.localnet) ([10.252.123.228])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2012 13:21:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 27 Mar 2012 21:21:03 +0100
Message-ID: <1658718.eaPkFfPBtZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F7203EA.4030104@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<1443918.kuu0Jnlh65@helios> <4F7203EA.4030104@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Setup for VMDK to use Direct Disk
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
X-List-Received-Date: Tue, 27 Mar 2012 20:30:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 March 2012 11:16:10 Saul Wold wrote:
> Yes, there is an issue with genext2fs needing memory to build the
> filesystem first.  I noted in another email thread that the Debian build
> system had so resort to dd, mkfs.ext3, mounting and copying. The issue
> with that is that it requires root privileges which is forbidden with
> bitbake.
> 
> genext2fs combines the making and copying of the fs into one process, if
> there is a way to populate the filesystem image with the bits without
> root privs that's what we need to look towards.

Yes, the mount alternative won't work for us. virt-make-fs from the libguestfs 
tools might be a possibility but its large set of dependencies could be an 
issue unless we can pare them down somehow.

> This is turning into a non-trivial problem.

Indeed :/

> I am beginning to think that we might have to have 2 vmdk images for the
> build appliance to work correctly. 1 for the rootfs and the second for
> the build space (10G-20G) with DL_DIR populated.

That might mitigate the problem, yes. If genext2fs requires the same amount of 
RAM as the target filesystem then maybe we need to do an available  RAM check 
first and bail out if there isn't enough.

> > I guess this might have something to do with my DL_DIR not being clean
> > beforehand (since it seems to be copying it into the rootfs in its
> > entirety).
>
> I have created a clean DL_DIR to work with by doing a world fetch and
> then using that DL_DIR to build into the image.

I guess we can just put that in the docs for now. For future improvement 
though I wonder if we can trick the fetcher into just pulling across the 
current files into the rootfs. I'll put that on my todo list for later.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


