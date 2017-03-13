Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4A71C77711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:36:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Mar 2017 07:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="1141543384"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2017 07:36:40 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<77fe606e011b51fe2551e2e4e5a2b25f682ebb2c.1489144807.git.alexander.kanavin@linux.intel.com>
	<5b89b6ce-5a17-3cf6-dbaf-dc941daf29af@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d92a6914-f15c-c7ff-111f-2379c5a459f9@linux.intel.com>
Date: Mon, 13 Mar 2017 16:35:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <5b89b6ce-5a17-3cf6-dbaf-dc941daf29af@windriver.com>
Subject: Re: [PATCH 38/44] package_rpm.bbclass: do not strip multilib prefixes from package names, do not add multilib prefix to package arch
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
X-List-Received-Date: Mon, 13 Mar 2017 14:36:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 07:04 PM, Mark Hatle wrote:
> On 3/10/17 5:24 AM, Alexander Kanavin wrote:
>> This is done for reasons I cannot establish, and greatly complicates the code
>> that installs packages into rootfs.
>
> RPM internally resolves ELF dependencies through a resolution system.
>
> If you look at a typical Fedora, SuSe, etc system you will often see:
>
> glibc-x.y.i386.rpm
> glibc-x.y.x86-64.rpm
>
> When a package asks for 'glibc', the system will go out and match the one for
> the arch that is being requested.

I don't know the core reason for it, but it actually does not happen, 
and I saw it firsthand. When a package needs a library, the resolver 
will pick the library package with the architecture that has the higher 
priority in the list of architectures, not the architecture that would 
match the package correctly.


When using smart, there seems to be a similar issue:

# Pull in multilib requires since rpm may not pull in them
# correctly, for example,
# lib32-packagegroup-core-standalone-sdk-target requires
# lib32-libc6, but rpm may pull in libc6 rather than lib32-libc6
# since it doesn't know mlprefix (lib32-), bitbake knows it and
# can handle it well, find out the RDEPENDS on the chain will
# fix the problem. Both do_rootfs and do_populate_sdk have this
# issue.
# The attempt_only packages don't need this since they are
# based on the installed ones.
#
# Separate pkgs into two lists, one is multilib, the other one
# is non-multilib.

... which is then followed by the most hackish, impementrable code that 
recursively walks RDEPENDS and massages that into a list that is given 
to smart, effectively subverting smart's own dependency resolution. I do 
not want to carry this into rpm4/dnf (or even spend time understanding 
it), and so I dropped both the multilib prefix stripping, and the code 
that works around it.

By the way, I don't know about Fedora, but SuSE does use -32bit suffixes 
in package names.


Alex

