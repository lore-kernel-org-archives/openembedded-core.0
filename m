Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 473CA72A85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:16:23 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbwkq0Xsxz3hk4S;
	Tue, 28 Apr 2015 23:16:18 +0200 (CEST)
X-Auth-Info: 4T3B3nUXQC/iezw+28hk4GCcyWSgAliUxvyfcdh4yaw=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lbwkp3tqDzvdWV; 
	Tue, 28 Apr 2015 23:16:18 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 28 Apr 2015 23:15:19 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<1430239116-7671-9-git-send-email-marex@denx.de>
	<553FD4E4.3000900@windriver.com>
In-Reply-To: <553FD4E4.3000900@windriver.com>
MIME-Version: 1.0
Message-Id: <201504282315.19422.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] kernel: Build uImage only when really needed
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
X-List-Received-Date: Tue, 28 Apr 2015 21:16:23 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, April 28, 2015 at 08:43:48 PM, Bruce Ashfield wrote:
> On 2015-04-28 12:38 PM, Marek Vasut wrote:
> > Build the uImage file using the kernel build system only when
> > it is really required, which is only in case KEEPUIMAGE == yes.
> > Otherwise, just build zImage, since the Yocto build system will
> > handle the uImage generation for us.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Koen Kooi <koen@dominion.thruhere.net>
> > Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> > 
> >   meta/classes/kernel-uimage.bbclass | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/meta/classes/kernel-uimage.bbclass
> > b/meta/classes/kernel-uimage.bbclass index ce8f96f..acde9ae 100644
> > --- a/meta/classes/kernel-uimage.bbclass
> > +++ b/meta/classes/kernel-uimage.bbclass
> > @@ -6,6 +6,14 @@ python __anonymous () {
> > 
> >           depends = d.getVar("DEPENDS", True)
> >           depends = "%s u-boot-mkimage-native" % depends
> >           d.setVar("DEPENDS", depends)
> > 
> > +
> > +	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> > +	# to kernel.bbclass . We override the variable here, since we need
> > +	# to build uImage using the kernel build system if and only if
> > +	# KEEPUIMAGE != yes. Otherwise, we pack compressed vmlinux into
> > +	# the uImage .
> 
> I keep reading this, and must be inverting the logic in my head.
> 
> If we've set KEEPUIMAGE = yes, that means we just want to let the
> kernel build the uImage and perform no extra generation steps.
> 
> When I read this, it looks like if I set the keep flag, I'll be
> overriden to build a zImage. Is that intentional ? I'd think we
> would have just left it alone or set it to uImage (unless we
> are saying that everyone should be building zImage now .. but
> I know some old ppc targets that do want to build uImages).

Uhhh, you're obviously right. The logic in the __anonymous function is
clearly inverted. Thanks for spotting this!

Best regards,
Marek Vasut

