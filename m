Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 334EA65C85
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEo9PS025885; Fri, 13 Feb 2015 14:51:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 42fXJGD5JUKo; Fri, 13 Feb 2015 14:51:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEpChD025932
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:51:23 GMT
Message-ID: <1423839071.20217.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 13 Feb 2015 14:51:11 +0000
In-Reply-To: <1423831491.5765.25.camel@Saturn.local.all>
References: <1423831491.5765.25.camel@Saturn.local.all>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Recipe which builds for ARCH '${TUNE_PKGARCH}' and 'all' fail
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
X-List-Received-Date: Fri, 13 Feb 2015 14:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-13 at 13:44 +0100, Max Krummenacher wrote:
> Hi
> 
> If a recipe builds a package for the default ARCH (I think this is
> ${TUNE_PKGARCH}) and one for ARCH 'all' then this fails when building
> in the same directory a second time for a machine with different
> ${TUNE_PKGARCH}.
> Observed with dizzy (armv7at2hf-vfp vs armv7at2hf-vfp-neon) and
> master (MACHINE=qemux86-64 vs qemuarm)
> 
> 
> ERROR: The recipe mixed-arch-test is trying to install files into a
> shared area when those files already exist. Those files and their
> manifest location are:
>    /mnt/sdc2/oe-disk/oe-core_master/oe-core/build/tmp-glibc/deploy/ipk/all/mixed-arch-test-a_1.0-r0_all.ipk
>  Matched in manifest-core2-64-mixed-arch-test.package_write_ipk
> 
> 
> An example in the wild is meta-java/recipes-core/rhino/rhino_1.7r4.bb
> which builds: rhino_1.7r4-r0_armv7at2hf-vfp.ipk and
> librhino-java_1.7r4-r0_all.ipk.
> 
> See below for a simple test recipe which reproduces the error.
> 
> 
> Is this intended behavior or an issue oe-core?
> 
> 
> Simple workaround:
> - don't build machines with different architectures in the same build
> directory.
> 
> Workarounds at recipe level:
> - build all packages for TUNE_PKGARCH, even if the nature of the package
> would be 'all'.
> - have two recipes, one providing packages to TUNE_PKGARCH, the other
> one to 'all'.

The issue is that for true allarch packages you should be able to
inherit the allarch class. That does some magic which means it shouldn't
rebuild for each MACHINE.

Cheers,

Richard


