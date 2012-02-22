Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0LwG-0004hh-Es
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:49:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2012 15:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="113615227"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2012 15:41:14 -0800
Message-ID: <4F457D1A.8010707@linux.intel.com>
Date: Wed, 22 Feb 2012 15:41:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F457B4B.4000507@palm.com>
In-Reply-To: <4F457B4B.4000507@palm.com>
Subject: Re: sharing DL_DIR?
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
X-List-Received-Date: Wed, 22 Feb 2012 23:49:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/22/2012 03:33 PM, Rich Pixley wrote:
> Is it reasonable to expect to share DL_DIR between multiple builds?
>
Absolutely, We share DL_DIR via NFS across multiple machines and builds.

> That is, are downloads properly locked so that multiple concurrent
> downloads of the same file won't collide? And if so, are they NFS safe
> locks?
>
Yes, as far as I know.

> Or must each build download it's own copies of every component?
>
No need.

> I ask because our, (Palm), branch has been, but it's a bit of a nuisance
> to pick a suitable locking mechanism that is both functional and performant.
>
>   * Flock/lockf aren't reliably supported in heterogeneous environments.
>   * The old lockfiles don't work over NFS. Lock directories apparently
>     do, but trying to clean these up after interruptions or failures is
>     a losing battle so if we do use these, we end up with orphan locks
>     periodically.
>   * With NFS as a possibility, we can't assume any kernel local IPC
>     mechanism, so sysV ipc is out.
>   * It seems like a pretty huge overhead to try to create any sort of
>     zeroconf overhead.
>
> Our solution so far has been to use NFS lock directories for multiple
> machine builds and flock/lockf for single machine builds. This mostly
> works, though it's not ideal, and it's significantly faster than
> downloading/copying all of the component source multiple times even over
> local mirrors.
>
I think we are using a very basic locking mechism that creates the 
lockfile and a donefile when complete.  It seems to work well enough.

Sau!

> --rich
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


