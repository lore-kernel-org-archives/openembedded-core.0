Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqWUq-0004yg-Nr
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 22:04:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jan 2012 12:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100128935"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by azsmga001.ch.intel.com with ESMTP; 26 Jan 2012 12:56:50 -0800
Message-ID: <4F21BE12.3000008@linux.intel.com>
Date: Thu, 26 Jan 2012 12:56:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	christopher Larson <kergoth@gmail.com>
Subject: Source Archiver Class
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
X-List-Received-Date: Thu, 26 Jan 2012 21:04:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



This is clearly coming to a head and we need to a better definition of 
what we are doing and direction we are going.  We recently had the 2 
different implementation suggested on the list to accomplish WORKDIR 
archiving along with the existing sourcepkg, distribute_src, 
copyleft_compliance and other possibly others.

My understanding of what we are trying to tackle include a variety of 
legal and policy requirements.

This is a progression list of what the source archives should include:

1 - Original Upstream Archive & Patches
     - 2 archives (tarballs)
2 - Original Source code & Patches
     - could include additional code
     - post unpack
     - 1 archive
3 - Original Source code & Patches & temp (scripts & logs)
     - Could possibly include the .bb and .inc files
     - 2 archives (from #2 & temp tarball)
4 - Patched source code
     - original source code could be removed
     - post do_patch
5 - Patched source code & temp
     - 2 archives (from #4 & temp tarball)
6 - Configured Source
     - post do_configure
7 - SRPM format of Original Source & Patches
   - rpm will apply the patches
   - internally contains #2 above
8 - SRPM various of #3 above
...
100 - Buildable SRPM
   - can actually build, this is way future!

(Patches = patch files & series list)

Each of these build on the previous in some way, the key being that we 
generate a tarball for the source from the existing state of the 
WORKDIR, a challenge maybe to create the source snapshot after the build 
has already occurred.

The SPDX License info could also be included in any of these

After talking with Richard, we think we have a novel approach to make 
this work. It would entail using the postfuncs feature similar to the 
way that Shared State does it's work. The existing copyleft_compliance 
class functionality can be folded into this as a filter. Additional 
flags could be passed from individual classes to a core set of methods 
in an archiver class defining the type of data (source, patches, temp, 
env, recipe info, ...) and format (tar, sprm, ...)

I noted that recipe type code might be better suited as generic code, as 
I believe there are other places that could benefit from that code.

The sourcepkg class seems to be a basic archiver and differ that 
includes the metadata/environment (as dumpdata), this could be replaced 
by the new approach.  While the src_distribute class copies the 
downloaded archive and then creates a link, into LICENSE directories 
along with the patches. The src_distribute by default seems to move 
files and create links (incorrectly btw!). This work can be done by the 
archiver class.

The Nugget: Create a new core "archiver" class that implements a general 
functions that can archive the original tarball or workdir at various 
states along task list with additional metadata (recipe info, temp dir, 
environment). This class would be inherited by a set of classes that use 
the postfunc (similar to sstate) that setup what level of archive is 
needed (based on the list above).

Thoughts, Comments?

Thanks



-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



