Return-Path: <matt@console-pimps.org>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E89360809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 19:05:31 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so10256717wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=VumOVXDOQHmYOLBWO8Jz7Q+piBLusyJcXpiQOqd8IXI=;
	b=bAqzqqft4YM+yX0nb0hXlnjskL0xkEzFSezK9/aFwTx4fY+V5xuNLZoulHziEN4qzu
	wr/llltxzhGeTRY1FBuVST1++9voJYrXClS3bbyu8no4+DrR8X5KWeGegFd4fWs1mDQi
	apnRrxrdQ0ZIB/2rKgcB9BW+lwX57l/aJ7QH80+8Mf26mhdVpGqji/qQ7PAHZ03KdF/g
	dqxQ9u5rmPvqiUoPbzy9ebtwoBzm2JGZ3kn07A9yIRBR4WyxSQZJgiGM/IFVOQEDtFt9
	sCkvyltvOfUJzaGs7ulOlCo78y0UKyHxZ10LF6GkUUkfqD50HxsiAr4w+1CeZ5rGrDmC
	JqVw==
X-Gm-Message-State: ALoCoQkVBRq4vlSQkBGKOgeadb3ITo/aeuNNAp945c0g9aMP6d+ZsZV270IFPpOzMEnQJP6NA0/L
X-Received: by 10.180.74.198 with SMTP id w6mr513751wiv.7.1407870332481;
	Tue, 12 Aug 2014 12:05:32 -0700 (PDT)
Received: from localhost ([94.8.35.160])
	by mx.google.com with ESMTPSA id r1sm59190711wia.21.2014.08.12.12.05.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 12:05:31 -0700 (PDT)
Date: Tue, 12 Aug 2014 20:05:29 +0100
From: Matt Fleming <matt@console-pimps.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140812190529.GK15082@console-pimps.org>
References: <1407857266-13529-1-git-send-email-matt@console-pimps.org>
	<20140812155138.GR14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140812155138.GR14848@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Darren Hart <dvhart@linux.intel.com>, Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes-devtools: Add OVMF recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 19:05:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 12 Aug, at 05:51:38PM, Martin Jansa wrote:
> 
> I don't think we have iasl in oe-core.
 
Oops, my bad. I thought I'd checked that but turns out I was looking in
the wrong tree.

I'll include the iasl recipe with the next submission.

> Also the styleguide says you should use space around = (SRCREV, DEPENDS,
> COMPATIBLE_HOST, BUILD_OPTIMIZATION, GCC_VER)
 
Thanks, I'll update the patch.

> > +# OVMF has trouble building with the default optimization of -O2.
> > +BUILD_OPTIMIZATION="-pipe"
> > +
> > +# OVMF supports IA only, although it could conceivably support ARM someday.
> > +COMPATIBLE_HOST='(i.86|x86_64).*'
> > +
> > +do_patch_append() {
> > +    bb.build.exec_func('do_fix_iasl', d)
> > +    bb.build.exec_func('do_fix_toolchain', d)
> 
> Why don't you fix them in do_configure_prepend?

What's the tradeoff?

Though I realise that we're not actually *patching* anything and so
do_configure_prepend() probably does make more semantic sense.

Ah, after a bit of grepping I see that it's a pretty common pattern. OK,
sure, I'll update this.

Thanks for the review.

-- 
Matt Fleming, Intel Open Source Technology Center

