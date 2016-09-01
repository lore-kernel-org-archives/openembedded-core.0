Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 133BC6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:14:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so13259463wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Sep 2016 09:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l/q1SMOp0s2XJN4tOfD6XtSFx2z8bZPJ1rko7Qi3nf8=;
	b=RsBIY6Ubp9laII3d0MXQUKkIwmZRKyN1f/rI0Mnjlsh8jelILWYGG3SPFIc0dzQTC/
	FkAeO2EpzUCzRgVXzcK9C2i9wbTFiKDWMsIKtQ5eI9mPTL5CL+m+wJMmJXqU30vCp0oc
	V2EHpSc+C+kP8SllvOOynz9p/MawESiOQgufEqXtr/KKRZPPKVqYTvx49dtMnXNTAopP
	stdjEfmEUb+2FFcg8VRrW4tIHFrnGPjYKia6ldgtk4IDkYV3QeoeBzD0CZT9BRfFr1oh
	vn5CHFtkRGs6BRJVMAIQJAFA/E6wT2PHeBCOiN4aQRxqTekR+vK3tw/5puyp3kwDzvZF
	lqzQ==
X-Gm-Message-State: AE9vXwNZEpsY5XPsqQquSoU33LOFhjVPpViaFiIX546R97B917BOmeaskuo20BiFH6+YWA==
X-Received: by 10.28.163.65 with SMTP id m62mr3522564wme.65.1472746457997;
	Thu, 01 Sep 2016 09:14:17 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id a3sm6060691wjw.15.2016.09.01.09.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Sep 2016 09:14:16 -0700 (PDT)
Message-ID: <1472746455.27417.57.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 01 Sep 2016 17:14:15 +0100
In-Reply-To: <81c8d462-9f65-cd7c-7dfe-f3acd2e21e18@windriver.com>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
	<94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
	<1472566766.8449.29.camel@andred.net>
	<78886c10-2951-9a57-31dd-0e1e78d19815@windriver.com>
	<1472633650.12967.15.camel@andred.net>
	<81c8d462-9f65-cd7c-7dfe-f3acd2e21e18@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] kernel-yocto: streamline patch, configuration and audit phases
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
X-List-Received-Date: Thu, 01 Sep 2016 16:14:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mi, 2016-08-31 at 16:17 -0400, Bruce Ashfield wrote:
> On 2016-08-31 4:54 AM, André Draszik wrote:
> > 
> > On Di, 2016-08-30 at 14:35 -0400, Bruce Ashfield wrote:
> > > 
> > > Can you clarify for me if you are are using SRC_URI items tagged with
> > > 'kmeta', i.e. a directory of fragments, or are you just adding
> > > .cfg/.scc
> > > items directly to the SRC_URI ?
> > 
> > I do both:
> > 
> > in the 1st layer, my kernel recipe boils down to:
> > 
> > SRC_URI = "\
> >     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-
> > stable.git;protocol=git;nocheckout=1;branch=${KBRANCH} \
> >     file://0001-a-patch.patch \
> >     file://kernel-meta;type=kmeta;destsuffix=${KMETA} \
> > "
> > 
> > KERNEL_FEATURES_append = " patches/some-patches.scc"
> > KERNEL_FEATURES_append = " patches/more-patches.scc"
> > KERNEL_FEATURES_append = " patches/even-more-patches.scc"
> > 
> > some of the above in turn include additional .scc items recursively.
> > 
> > 
> > In the 2nd layer, my .bbappend boils down to:
> > 
> > FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-4.4:"
> > 
> > KERNEL_FEATURES_append_tgm = " patches/tgm.scc"
> > 
> > 2nd-layer.scc is located in ${THISDIR}/kernel-meta/patches/ in the 2nd
> > layer. I don't specifically add another SRC_URI item tagged with 'kmeta'
> > (or
> > any other explicit SRC_URI item for that matter).
> 
> One more clarification. From our problem description, are you saying
> that in your runs, only the meta data from layer2 is getting copied
> and not that from layer1 ?

That is what I had inferred from the error message:

| DEBUG: Executing shell function do_kernel_metadata
| ERROR. input file "patches/some-patches.scc" does not exist
| ERROR: could not process input files: <2nd_layer>/recipes-kernel/linux/linux-ramips-4.4/tgm/defconfig <1st_layer>/recipes-kernel/linux/linux-ramips-4.4/0001-a-patch.patch patches/some-patches.scc patches/more-patches.scc patches/even-more-patches.scc patches/tgm.scc
|        See /tmp/tmp.mPP1jtatxm for details
| ERROR. input file "patches/some-patches.scc" does not exist
| ERROR: could not process input files: <2nd_layer>/recipes-kernel/linux/linux-ramips-4.4/tgm/defconfig <1st_layer>/recipes-kernel/linux/linux-ramips-4.4/0001-a-patch.patch patches/some-patches.scc patches/more-patches.scc patches/even-more-patches.scc patches/tgm.scc
|        See /tmp/tmp.v9LU9ccpbl for details
| WARNING: exit code 1 from a shell command.


> I ran my sanity test, and saw meta data from both my layers copied ..
> so I'm worried that I misunderstood the issue you are seeing.

I can see that they are actually copied indeed, but it doesn't find them...
The file /tmp/tmp.v9LU9ccpbl mentioned above is empty.

> But looking at the code, I can definitely do some minor tweaks in this
> area .. I'm just trying to get the reproducer nailed down.

I can try to create one for you if you prefer tomorrow, rather than wasting
your time with this, if you don't get any further?


Andre'


