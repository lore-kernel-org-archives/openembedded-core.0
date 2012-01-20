Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RoEnj-0007dw-Ge for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 14:46:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KDd3xJ018662
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 13:39:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17073-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 13:38:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KDcskX018656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 13:38:56 GMT
Message-ID: <1327066733.4268.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jan 2012 13:38:53 +0000
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCC088E@SHSMSX102.ccr.corp.intel.com>
References: <1327001920.23015.1.camel@ted> <4F192381.1020603@linux.intel.com>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCC088E@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc: Ensure that the shared source directory shared the same sstate hashes
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
X-List-Received-Date: Fri, 20 Jan 2012 13:46:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 08:49 +0000, Lu, Lianhao wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Saul Wold
> > Sent: Friday, January 20, 2012 4:19 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH] gcc: Ensure that the shared source directory shared the same sstate hashes
> > 
> > On 01/19/2012 11:38 AM, Richard Purdie wrote:
> > > The fetch/unpack/patch/headerfix tasks are shared and hence their sstate hashes
> > > should also match. Sadly this is not the case since:
> > >
> > > a) gcc-runtime applies an additional patch
> > > b) The do_headerfix task was missing from libgcc
> > > c) The do_headerfix task is a shell task and hence depends
> > >     on all exported variables which can vary between cross and target
> > >     recipes.
> > >
> > > To fix this, the patch moves the patch to the common code, adds
> > > the headerfix task to a common include file and disabled shell
> > > dependencies on the do_headerfix task since its clear in this case
> > > we don't need thsoe dependencies since we just call sed.
> > >
> > > With this patch applied, all these recipes now share common sstate checksums.
> > >
> > Richard,
> > 
> > I tried both a sstate build with and existing tmp and a clean tmp, the
> > existing tmp seemed to work ok, but with a clean tmp (and sstate), I got
> > the following patch issue still.
> > 
> > This was with BB_SIGNATURE_HANDLER ?= 'basichash' set.
> > 
> > ERROR: Command Error: exit status: 1  Output:
> > Could not link file
> > `.pc/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch/configure' to `configure': No
> > such file or directory
> > Applying patch gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > patching file configure.ac
> > Hunk #1 FAILED at 3073.
> > 1 out of 1 hunk FAILED -- rejects in file configure.ac
> > patching file configure
> > Hunk #1 FAILED at 7594.
> > 1 out of 1 hunk FAILED -- rejects in file configure
> > Patch gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch does not apply (enforce with -f)
> > ERROR: Function failed: patch_do_patch
> > ERROR: Logfile of failure stored in:
> > /intel/poky2/builds/binutils/tmp/work-shared/gcc-4.6.2+svnr181430-r20/temp/log.do_patch.15457
> > NOTE: package libgcc-4.6.2+svnr181430-r20: task do_patch: Failed
> > ERROR: Task 882
> > (/intel/poky2/distro/meta/recipes-devtools/gcc/libgcc_4.6.bb, do_patch)
> > failed with exit code '1'
> > 
> > I have not tried a clean sstate / clean tmp.
> > 
> Well, using the poky-conrib/rpurdie/t1 branch, it seems that the libgcc still has different signature with 
> gcc-cross-initial for task patch. But bitbake-diffsigs reports nothing. gcc-runtime seems to be ok now.

I looked into this and the problem is that the quilt-native dependency
is removed in the target cases (libgcc/gcc-runtime) but not in the cross
cases thanks to BB_HASHTASK_WHITELIST. I'm trying to figure out how to
solve that.

Cheers,

Richard




