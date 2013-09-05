Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F30606B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:53:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85C6BPp006843; Thu, 5 Sep 2013 13:06:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ncbDUaRAzeLZ; Thu,  5 Sep 2013 13:06:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85C66vk006833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 13:06:07 +0100
Message-ID: <1378381972.32427.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nitin.a.kamble@intel.com
Date: Thu, 05 Sep 2013 12:52:52 +0100
In-Reply-To: <1378369981.32427.23.camel@ted>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: meta-intel@yoctoproject.org, darren.hart@intel.com, saul.wold@intel.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
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
X-List-Received-Date: Thu, 05 Sep 2013 11:53:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 09:33 +0100, Richard Purdie wrote:
> This is certainly better and is heading in the right direction. The two
> issues I can see are:
> 
> a) do_populate_sysroot still needs to run again
> b) do_packagedata installs pkgdata (shlibs) which says mesa provides 
>    some of these libs yet is no shouldn't for the given MACHINE.
> 
> I did think this shouldn't be too difficult to fix however life is never
> quite straightforward.
> 
> For a), rather than change things before we create the sstate package, I
> was thinking we could change than at installation of the sstate package.
> We have SSTATEPOSTINSTFUNCS however these run after we have placed the
> files in the sysroot so its too late. SSTATEPREINSTFUNCS sounds better
> but this actually runs before unpacking the sstate files which is too
> early for us.
> 
> There is only one user of SSTATEPREINSTFUNCS (useradd.bbclass) so I'm
> going to propose we rename that one to a more logical
> SSTATEPREUNPACKFUNCS and add PREINSTFUNCS at a more sensible place. We
> can then add a SSTATEPREINSTFUNCS to the mesa recipe which for
> do_populate_sysroot and do_populate_sysroot_setscene deletes the files
> in question. That should resolve a).
> 
> b) is more tricky since pkgdata is arch specific, not machine specific.
> I had thought it was machine specific but checking now, its not.
> 
> To be quite honest, I don't like what pkgdata does at the moment. We
> have cleaned things up a lot compared to where they used to be but the
> search process the system uses to find information is truly horrid.
> 
> It would be rather tempting to decide to install pkgdata in a machine
> specific directory much like we do with populate_sysroot already. There
> would be minimal performance overhead since the files are small and we
> could then bin all the "search all, then arch, then machine" type lookup
> code we have right now. If we did make it machine specific, we could
> then use the same trick we use in a) but for do_packagedata and instead
> of removing files, it would run some carefully crafted sed operations.
> 
> Right now, we might not need to fix this 100% properly. If emgd installs
> itself as machine specific, it should be first in the providers search
> paths so the second lot of pkgdata should get ignored. emgd is of course
> not machine specific at the moment, nor should it be apart from this
> issue :/.
> 
> This also raises some other questions. The existing code in meta-intel
> adds EMGD into the DEPENDS. It does this so the normal PROVIDES for
> virtual/libgl and friends don't have to change. It does mean the sstate
> checksums for anything depending on mesa change however. If we don't
> have the dependency, things may try and build before emgd is built,
> libGL would be missing and things would break.
> 
> So somehow we need to add in the dependency let leave the sstate
> checksums unchanged. This is possible in the sstate checksum validation
> code but its probably easiest to change that in the core, not
> meta-intel :/.
> 
> I'd also appreciate someone (Ross maybe?) confirming that if we build
> application A against mesa, then change over to a machine that uses emgd
> and swizzle the libs around in the sysroot, do we need to recompile the
> app? This approach is assuming we do not need to do that. If we do,
> there is a different approach we need to take.
> 
> So in summary, this problem is far from simple, we do have most of the
> pieces we need to fix it with some tweaking but some of the changes are
> invasive and might need to be deferred to 1.6. As it stands, the change
> will cause issues due to the changed DEPENDS. We do need to think
> carefully about this and solve it once and for all in a way which works
> optimally but the existing workaround might be best until we can pull
> all the better pieces together.
> 
> I hope this was a relatively clear explanation of the problem, let me
> know if I need to clarify anything. I've cc'd OE-Core since I think more
> people probably need to see/think about this.

It actually get worse (or maybe slightly better) when you think about
the shlibs code.

Imagine application A links against libGL. It therefore gets an RDEPENDS
on the package that provides libGL. With emgd in the mix, the package
providing libGL changes and as things stand today, I suspect it gets
rebuild.

So lets assume that we add leave the mesa pkgdata/shlibs code in place
and actively stop emgd putting conflicting shlibs provides in place
(easy to do).

We could then make the emgd-binary packages RPROVIDE/RCONFLICT the right
mesa packages. We'd then need to make sure the package manager behaviour
is correct in that:

a) If an image is mesa based, installing the app pulls in libGL as
normal, doesn't touch emgd.
b) In an EMGD image, installing the app pulls in libgl, however XSERVER
also pulls in emgd-binary and this then replaces the libGL package.

In theory this should all be possible and would resolve the problem in
b) in my original email without the need to make pkgdata machine
specific (we should do that for other reasons but we're getting off
track).

So perhaps there is a way out of this but it isn't simple...

Cheers,

Richard






