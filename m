Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U0z9x-0000YO-3Q
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 19:46:55 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0VIV6Y9024375;
	Thu, 31 Jan 2013 10:31:07 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 31 Jan 2013 13:31:02 -0500
Message-Id: <cover.1359656303.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel/multlib: fixes and performance tweak
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
X-List-Received-Date: Thu, 31 Jan 2013 18:47:03 -0000
X-List-Received-Date: Thu, 31 Jan 2013 18:47:03 -0000

Richard/Saul,

I bumped these couple of patches to the front of my queue, since one is
for a multilib issue we just ran into, and the other is a performance
tweak that I've been running with for a while (and it hasn't caused
problems).

The first change is a minor change to the packaging of the kernel to save
some time during the install phase. No use cases have been broken here, but
it's worth having more eyes on this to see if we've missed something. Every
little bit can help.

Note: I haven't checked this against your latest series, so I hope this
isn't redundant at this point.

[PATCH 1/2] kernel: avoid copying unnecessary files during do_install

    kernel: avoid copying unnecessary files during do_install
    
    kernel_do_install() populates $kerneldir with files needed to build
    external modules. To accomplish this there are several copy commands
    to get source from the kernel source tree and build trees after which
    a 'clean' is performed. Since we are copying from the build tree we
    get about 1G of .o and .cmd files copied over only to have them
    removed when we clean. This adds additional IO overhead as well as
    overhead caused by pseudo. By avoiding copying these files in the
    first place we get multiple gains:
      * avoid initial copy
      * avoid file deletes during clean
      * reduce pseudo overhead
    
    Additionally we are making use of cpio vs cp which tends to be
    significantly faster at performing copies.
    
    With these changes I observe a 15-30% decrease in the time to complete
    the do_install() operation on the kernel.
    
    [YOCTO #3517]

The second change was done partly by myself and the rest by Mark Hatle. We
ran into linux-dummy showing up as a multlib prefixed dependency when building
in our configurations. The reason was that linux-dummy doesn't inherit 
kernel.bbclass and hence wasn't being skipped. Rather than brining the 
extra overhead and potential side effects from kernel.bbclass, I decided
to check for recipes that provide virtual/kernel and skip based on that
test, versus the include. 

** I don't have enough background to know if there's a potential problem with
this, but it definitely passes our testing after the change.

Mark also found that we needed to skip kernel-module based packages from being
extended with the multib prefix and that makes up the second part of the fix.

[PATCH 2/2] multilib: skip packages that provide virtual/kernel

    multilib: skip packages that provide virtual/kernel
    
    Rather than keying on recipes that inherit kernel.bbclass, we should
    be checking for providers of virtual/kernel when skipping kernel
    recipes in multlib builds.
    
    Not all providers of virtual/kernel inherit kernel.bbclass (notably
    linux-dummy), so checking on the provider is a more complete check.
    
    We need to be sure to check for inheritance of module-base as well, this
    allows for packages that provides modules to avoid the multilib renaming.

cc: Mark Hatle <mark.hatle@windriver.com>
cc: Mark Asselstine <mark.asselstine@windriver.com>

Cheers,

Bruce

The following changes since commit 8d80483e2f0f755a61087be1dffaf595fbc467fd:

  bitbake: bitbake-layers: print the recipe's depends that crosses a layer boundary (2013-01-31 14:00:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  multilib: skip packages that provide virtual/kernel

Mark Asselstine (1):
  kernel: avoid copying unnecessary files during do_install

 meta/classes/kernel.bbclass   |    7 +++++--
 meta/classes/multilib.bbclass |    4 +++-
 meta/lib/oe/classextend.py    |    2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.10.4



