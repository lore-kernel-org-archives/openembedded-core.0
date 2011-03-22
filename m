Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q29vd-00066G-84
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:19:54 +0100
Received: by iwn10 with SMTP id 10so8245923iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 15:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ABV13uts+hDX+OJndBIV9+JLW8Cq6NdxS88ZXjeCYLU=;
	b=OJtMJ6dQlU4UD8/P9PJbpjbVby2MMMLgU3u3Bg4Ff9Ta+YHJc5vWAXFVf654AWODj0
	NIwLpK1fjfq5BMkp4uxtgZRovkz1E83NtUkwY3Tvjk1I5WhBI55p6O0iXBTSkc0e+Pl6
	n/qV6ZRDutEX3PuTscw/I3Q7ejjtwTRFDJI3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iirkmr94fLBQ6PdArCHZ3ojDY/oU87iC0vO4vsGxWrc6QO7E05lUovfGiAP4wr3TLa
	qK+EtxSOQnT2zCI9vo1y91KB/IeqzUCr170ifklsdxlo9oLSS5fBlDgtA5ZwF35hA/zT
	l9DUWfPmFAg3Jcmi/XlOpD+Uo3uCmTslJTcro=
Received: by 10.43.47.67 with SMTP id ur3mr4514646icb.391.1300832282041;
	Tue, 22 Mar 2011 15:18:02 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wu1sm4859924icb.10.2011.03.22.15.18.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 15:18:01 -0700 (PDT)
Date: Tue, 22 Mar 2011 15:18:14 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110322221814.GA13076@sakrah.homelinux.org>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
	<20110322184459.GE26336@sakrah.homelinux.org>
	<32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: MIPS rootfs creation failure
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
X-List-Received-Date: Tue, 22 Mar 2011 22:19:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 19:54), Koen Kooi wrote:
> 
> Op 22 mrt 2011, om 19:44 heeft Khem Raj het volgende geschreven:
> 
> > On (22/03/11 19:42), Koen Kooi wrote:
> >> 
> >> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
> >> 
> >>> Hi
> >>> 
> >>> I did an update of oe-core yesterday and now mips is failing with this
> >>> error. It was not there 2 days back.
> >>> 
> >>> | Configuring sysvinit.
> >>> | Collected errors:
> >>> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> >>> for task-base:
> >>> |  *    kernel-misc *
> >>> |  * opkg_install_cmd: Cannot install package task-base.
> >>> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
> >>> 
> >>> I have not bisected but if anyone else is seeing it I would like to know
> >> 
> >> I think thats fallout from the kernel.bbclass change:
> >> 
> >> meta/classes/kernel.bbclass:FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel
> >> 
> >> I don't know what purpose that package has, but try rebuilding the kernel and see what happens. We might need to blacklist it from being included in the kernel-modules meta-package.
> >> 
> > 
> > I have already build everything from scratch even deleted sstate cache
> 
> Can you give this a try?
> 
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta/classes$ git diff kernel.bbclass 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3eb6659..9f014d4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
>         metapkg = "kernel-modules"
>         bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
>         bb.data.setVar('FILES_' + metapkg, "", d)
> -       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf' ]
> +       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
>         for l in module_deps.values():
>                 for i in l:
>                         pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).gro
> 
> I think that should go in regardless, but I'm curious if it fixes your problem. The meta-pkg should only pickup kernel-module-* and kernel-firmware-*, so a whitelist would be even bettter.
> 

It did not fix the problem. I tried bitbake -c cleanall virtual/kernel
bitbake console-image

> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


