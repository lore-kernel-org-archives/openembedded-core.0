Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5798760CEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 09:59:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r979xAAV014437; Mon, 7 Oct 2013 10:59:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K_xkKdf1RSbS; Mon,  7 Oct 2013 10:59:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r979x2Mg014427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 7 Oct 2013 10:59:04 +0100
Message-ID: <1381139937.29912.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 07 Oct 2013 10:58:57 +0100
In-Reply-To: <52524055.2090303@windriver.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
	<1380872773.18603.570.camel@ted> <52524055.2090303@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Mon, 07 Oct 2013 09:59:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-10-07 at 01:02 -0400, Bruce Ashfield wrote:
> On 13-10-04 3:46 AM, Richard Purdie wrote:
> > On Thu, 2013-10-03 at 20:02 -0400, Bruce Ashfield wrote:
> >> When building against the sysroot, out of tree modules can require modpost
> >> and other utilities normally found in the kernel's scripts directory. For
> >> the kernel source in the staging dir, these scripts have been removed to
> >> avoid mixing archiectures when packaging kernel-dev (among other things).
> >
> > Its also to avoid mixing architectures when packaging the sstate for
> > do_populate_sysroot. The sstate for that task is now native arch
> > specific after this patch but its task hash is not. Even if we made it
> > native specific, that means the kernel would rebuild entirely if you
> > switch 32 bit to 64 bit native machine. We therefore cannot merge this
> > patch as is.
> >
> > Instead do something like:
> >
> >
> > SSTATEPOSTINSTFUNCS += "kernelheaders_sstate_postinst"
> >
> > kernelheaders_sstate_postinst () {
> > 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
> > 	then
> > 		( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};
> > 		  oe_runmake scripts
> > 		)
> > 	fi
> > }
> >
> > This will rerun the oe_runmake scripts each time the sstate package is
> > installed. It slows down the use of sstate but should be correct whether
> > the build machine is 32 or 64 bit.
> 
> I poked with this a bit over the weekend, and never did get the right 
> results.
> 
> I can make the scripts trigger, but since the sysroot population appears
> to already be done, but build scripts don't actually make it into the
> sysroot for use during module builds.
> 
> I tried a few variants of the below, all trying to get the actual
> tmp/sysroots/<machine> to have the scripts, with no luck. Dumping the
> available variables didn't get me anything really promising either.
> 
> I'll have another look in the morning, since I'm sure it is just me not
> understanding the ordering of things .. but any pointers would of course
> be appreciated.
> 
> Cheers,
> 
> Bruce
> 
> STATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
> kernelscripts_sstate_postinst () {
>          if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o 
> "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
>                  sysroot_stage_dir ${D}${KERNEL_SRC_PATH} 
> ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>                  oe_runmake -C ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH} scripts
> 	fi
> } 
>  

Ah, I had it slightly wrong. Try:

kernelheaders_sstate_postinst () {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
 		( cd ${KERNEL_SRC_PATH};
 		  oe_runmake scripts
 		)
 	fi
 }

since the files are actually installed at this point, therefore we
operate on the final location.

The risk here is that when we uninstall the sstate package, we don't
track the generated files. We can probably live with that for now.

What we really needs is a preinst but the one we have is really a
preunpack :/.

Ultimately, I think we need to rename the preinst to preunpack and add a
real preinst...

Cheers,

Richard


