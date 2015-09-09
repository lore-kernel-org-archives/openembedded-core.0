Return-Path: <denis@denix.org>
X-Greylist: delayed 3605 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Sep 2015 23:07:54 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 739507422C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 23:07:54 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF003W9K3Z1Y90@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 09 Sep 2015 17:07:16 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=IkcTkHD0fZMA:10 a=ff-B7xzCdYMA:10
	a=M9ly5U59Uz78ArfR3HAA:9	a=QEXdDO2ut3YA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 23981161BE5; Wed,
	9 Sep 2015 18:07:11 -0400 (EDT)
Date: Wed, 09 Sep 2015 18:07:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20150909220711.GL8323@denix.org>
References: <20150812032630.GF26375@denix.org>
	<7151A67B-1A6D-458C-AE94-580834380909@gmail.com>
MIME-version: 1.0
In-reply-to: <7151A67B-1A6D-458C-AE94-580834380909@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: oprofile rebuilds for different MACHINES (sstate)
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
X-List-Received-Date: Wed, 09 Sep 2015 23:07:56 -0000
Content-type: text/plain; charset=utf-8
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, Aug 11, 2015 at 09:35:42PM -0700, Khem Raj wrote:
> 
> > On Aug 11, 2015, at 8:26 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > So, I've been debugging the issue of oprofile rebuilding from one MACHINE to
> > another (causing PR issues, etc). I was able to trace it down to this line:
> > 
> > EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="
> > 
> > And STAGING_KERNEL_DIR resolves to this:
> > 
> > STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
> > 
> > Now, obviously, when MACHINE changes, sstate invalidates do_configure and
> > rebuilds oprofile.
> > 
> > The question is, what is the proper fix in this case - mark oprofile as
> > machine-specific with PACKAGE_ARCH = "${MACHINE_ARCH}", since it will be
> > configuring and building against (potentially) completely different kernel
> > tree. So, just mark it explicitly and be safe...
> > 
> > Or another option is to tell sstate to ignore changes to the above variables
> > with this simple line:
> > 
> > EXTRA_OECONF[vardepsexclude] = "STAGING_KERNEL_DIR"
> > 
> > This also does the trick, but I'm a bit worried there could be side-effects of
> > using oprofile against the wrong kernel... Any recommendations?
> 
> Using kernel staging dir is unnecessary here, oprofile’s configure is poking for user space APIs
> in linux/perf_event.h so linux-libc-headers dependency is enough. and use —with-kernel=${STAGING_EXECPREFIXDIR}
> instead of STAGING_KERNEL_DIR, that should fix it.

Thanks. It didn't seem to help with oprofile, as it changes hashes anyway due 
to the kernel:do_populate_sysroot...

But it did help with cryptodev-tests re-packaging - patch is on the list.

-- 
Denys

