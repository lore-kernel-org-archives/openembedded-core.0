Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZMhi-0004Kv-5n
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 15:43:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 May 2012 06:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="145776782"
Received: from unknown (HELO helios.localnet) ([10.252.120.40])
	by orsmga001.jf.intel.com with ESMTP; 29 May 2012 06:32:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Tue, 29 May 2012 14:32:58 +0100
Message-ID: <11156699.ieWXhGW3v3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAOHjBZu6_vfPkPnVj9E48nc=1jEO9dqMG8hkrtLkLesbWZ8g6w@mail.gmail.com>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
	<3418839.G4f3PdLdKK@helios>
	<CAOHjBZu6_vfPkPnVj9E48nc=1jEO9dqMG8hkrtLkLesbWZ8g6w@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 May 2012 13:43:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 29 May 2012 15:20:14 Giuseppe Condorelli wrote:
> What I'm not understanding is how I can invoke my shell function. Do you
> mean I have to invoke it as append function of populate_rootfs one? 

If you aren't including packaging data in the resulting image (i.e. 
IMAGE_FEATURES does not contain "package-management"), you need to do your rpm 
calls from a function called via ROOTFS_POSTPROCESS_COMMAND because afterwards 
the data will be removed and rpm will not be usable.

> What I really need is a way to query the rpm database
> out from the build system, as we normally do with host packages.
> I tried to have a standalone run of  the rpm command the
> list_installed_packages invokes but (obviously) I got a long series of
> errors.

Below is what I meant - you could put this into some bbclass that you could 
add using INHERIT += "someclass.bbclass" in local.conf:

------------- snip --------------
ROOTFS_POSTPROCESS_COMMAND += "do_some_packaging_stuff ; "

do_some_packaging_stuff() {
	list_installed_packages > /path/to/output/file
}
------------- snip --------------

Substitute list_installed_packages for a similar rpm query command to the one 
list_installed_packages uses.

Out of interest, what information are you querying from the packaging system?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


