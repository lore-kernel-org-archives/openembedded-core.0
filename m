Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUvyN-00034m-Li
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 11:26:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 02:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,540,1363158000"; d="scan'208";a="290900667"
Received: from unknown (HELO helios.localnet) ([10.255.13.249])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2013 02:08:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Apr 2013 10:08:17 +0100
Message-ID: <3738122.KTlYndMO5D@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130424084615.GG3217@jama>
References: <20130424084615.GG3217@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Reexecuting do_fetch after do_unpack failed with reference is not a tree
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
X-List-Received-Date: Wed, 24 Apr 2013 09:26:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 24 April 2013 10:46:15 Martin Jansa wrote:
> I guess this will be hard to fix correctly, but please comment if I've
> overlooked something:
> 
> 1) update foo git repository with new commit ABCD, but forget to push it
> 2) bump SRCREV in foo.bb to ABCD
> 3) run bitbake foo, it will run do_fetch to catch new changes in remote
>    repo, but ABCD is not there, so do_unpack will fail like this:
> 
>    NOTE: Running task 2289 of 4227 (ID: 1185, foo.bb, do_unpack)
>    NOTE: recipe foo-1.0+gitr2+ABCD: task do_unpack: Started
>    ERROR: Function failed: Fetcher failure: Fetch command failed with exit
> code 128, output: fatal: reference is not a tree: ABCD
> 
> 4) realize missing "git push" in step 1) and push it now
> 5) run bitbake foo again, but do_unpack is still failing, because
>    do_fetch checksums is the same (nothing changed in metadata) so stamp
>    is still valid.
> 
> 6) fix it with "bitbake -c fetch -f foo", but that could be complicated
>    if bump SRCREV was pushed already and possibly many builders already
>    executed do_fetch, so maybe push PR bump or something like that.
> 
> Only better solution than 6) I can think of, is to detect
> "fatal: reference is not a tree" in do_unpack and if it's git repository
> then remove do_fetch stamp and hope it was fixed in remote git repo.

I don't think this can work. The only way to fix this would be to check if the 
specified SRCREV (and/or branch/tag if specified) is valid during do_fetch and 
fail there if it isn't.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


