Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 56F68610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 22:36:29 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id eu11so127559pac.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OovNFFXaK4Qv0HQpdmBOSCu7eREoyQE67QCwjfkHaJ0=;
	b=vWvbCO2vrEQ3erdmUaeiwGW1de7NyeHhPqa5arrovFsBki2fZPdhbyYXKre5TYmUoG
	HgvHgvxZNrdqiEbuh0pqjfRJQySRNIEMliyLGsz1wjmSygeBLT1CrDwVxjxPqVXl5bWO
	xzttGtng/MUK3po1cA7UElk19o+2tSYeU2WCelgp7ooEBxQ+DidDHDSwJfDjjitdLdoM
	ieA4qNjiAQHKYhqKdeweSsI1LGkp1MK+SJ8fBVeA+64Gae/cL/IOuo7HYoZU9DosL4RS
	75UuKZjHAZzyn3XnUpYo6E1PKUPaxyDygzIrRmEPfFb/0+e7s3Q4BOLArZYs1K9OiOMs
	QeWw==
X-Received: by 10.66.174.107 with SMTP id br11mr6237696pac.105.1407191790720; 
	Mon, 04 Aug 2014 15:36:30 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id ki8sm7712252pdb.89.2014.08.04.15.36.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 15:36:30 -0700 (PDT)
Date: Mon, 4 Aug 2014 15:39:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20140804223948.GC11951@haswell>
References: <53DF9F25.1060404@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <53DF9F25.1060404@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: blocking pie in recipes that build shared object files
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
X-List-Received-Date: Mon, 04 Aug 2014 22:36:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-04 09:56:37, Peter A. Bigot wrote:
> I've now hit two recipes in meta-openembedded that fail on armv7-a because
> SECURITY_CFLAGS has -pie as an option that leaks into a link command
> building a shared object file.  This produces:
> 
> |
> /prj/oe/omap/build-beaglebone-master/tmp/sysroots/beaglebone/usr/lib/Scrt1.o:
> In function `_start':
> | /prj/oe/omap/build-beaglebone-master/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/eglibc/2.19-r0/eglibc-2.19/libc/csu/../ports/sysdeps/arm/start.S:128:
> undefined reference to `main'
> | collect2: error: ld returned 1 exit status
> | error: command 'arm-poky-linux-gnueabi-gcc' failed with exit status 1
> 
> In openembedded-core meta/conf/distro/include/security_flags.inc provides a
> bunch of package-specific overrides to use SECURITY_NO_PIE_CFLAGS for this
> sort of package.
> 
> It's not clear to me how that should be accomplished for recipes that are
> not part of openembedded-core.  For
> http://patches.openembedded.org/patch/77165/ for python-smbus in meta-python
> I chose to override it in the bb file.
> 
> What is the best-practices solution to this problem?

may be add SECURITY_CFLAGS_pn-blah = "${SECURITY_NO_PIE_CFLAGS}"
to layer.conf of given layer where recipe resides

