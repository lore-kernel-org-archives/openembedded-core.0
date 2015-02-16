Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 64C6060167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:19:43 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id k48so31478647wev.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=08p4kj/ulYrUPjEwYsMCS5aNLvCJMsn1fj7DUssd0U8=;
	b=UljW/Z6u0sersk0n+dCiP+z/JAX0Kk89tAhzOz6FLjGoVmPiXC0NJo9HK+Kwt0AN/1
	w0hJk/UmnxP/J7algWQdgzY+kS99OzevOW5WtfcRa/dtTwdtua153hYfD4Sl+aWMJ7Zc
	jrKQUAx8nrgmBe6T0xdf+N4n/xLPaMCvZuhv3LKXVt3w4fCGQbo2emKBuF0SpCeU/lPW
	SUNnmlGZbLC7S+kkE6dcyXF9Fv5AdRa7dOoVB5geZMLg9fmn8MI++UFeBzIzlNkYBB6L
	MdTYdqwT31mNuCgFbmNB7hkXNT28LkfB5PFdPE6HBSPWrsysXijxDR2Jnfs2k9zpPHh9
	9zaQ==
X-Received: by 10.194.190.162 with SMTP id gr2mr55137165wjc.13.1424121584510; 
	Mon, 16 Feb 2015 13:19:44 -0800 (PST)
Received: from [192.168.0.7] (212-41-103-86.adsl.solnet.ch. [212.41.103.86])
	by mx.google.com with ESMTPSA id ka1sm24534971wjc.2.2015.02.16.13.19.43
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:19:43 -0800 (PST)
Message-ID: <1424121582.3728.4.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Feb 2015 22:19:42 +0100
In-Reply-To: <1423839071.20217.87.camel@linuxfoundation.org>
References: <1423831491.5765.25.camel@Saturn.local.all>
	<1423839071.20217.87.camel@linuxfoundation.org>
X-Mailer: Evolution 3.10.4 
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
X-List-Received-Date: Mon, 16 Feb 2015 21:19:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi


Am Freitag, den 13.02.2015, 14:51 +0000 schrieb Richard Purdie:
> On Fri, 2015-02-13 at 13:44 +0100, Max Krummenacher wrote:
> > Hi
> > 
> > If a recipe builds a package for the default ARCH (I think this is
> > ${TUNE_PKGARCH}) and one for ARCH 'all' then this fails when building
> > in the same directory a second time for a machine with different
> > ${TUNE_PKGARCH}.
> > Observed with dizzy (armv7at2hf-vfp vs armv7at2hf-vfp-neon) and
> > master (MACHINE=qemux86-64 vs qemuarm)
> > 
> > 
> > ERROR: The recipe mixed-arch-test is trying to install files into a
> > shared area when those files already exist. Those files and their
> > manifest location are:
> >    /mnt/sdc2/oe-disk/oe-core_master/oe-core/build/tmp-glibc/deploy/ipk/all/mixed-arch-test-a_1.0-r0_all.ipk
> >  Matched in manifest-core2-64-mixed-arch-test.package_write_ipk
> > 
> > 
> > An example in the wild is meta-java/recipes-core/rhino/rhino_1.7r4.bb
> > which builds: rhino_1.7r4-r0_armv7at2hf-vfp.ipk and
> > librhino-java_1.7r4-r0_all.ipk.
> > 
> > See below for a simple test recipe which reproduces the error.
> > 
> > 
> > Is this intended behavior or an issue oe-core?
> > 
> > 
> > Simple workaround:
> > - don't build machines with different architectures in the same build
> > directory.
> > 
> > Workarounds at recipe level:
> > - build all packages for TUNE_PKGARCH, even if the nature of the package
> > would be 'all'.
> > - have two recipes, one providing packages to TUNE_PKGARCH, the other
> > one to 'all'.
> 
> The issue is that for true allarch packages you should be able to
> inherit the allarch class. That does some magic which means it shouldn't
> rebuild for each MACHINE.
> 
> Cheers,
> 
> Richard
> 
Hi

Thank you Richard. Inheriting allarch indeed makes the error go away.
There is still the less important issue that the package in the earlier
TUNE_PKGARCH feed is deleted while the one in the latest is built.

However your comment also made me realize that at least for the rhino
recipe all packages can be put into the allarch group which makes the
whole a non issue.

Regards Max






