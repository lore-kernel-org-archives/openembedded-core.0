Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 39DC76086F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 09:10:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v14-v6so944599wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 02:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iwqw8N07cNDoDW0q4JaLkIQA3UXNX2NUmUdq2xVedmE=;
	b=DJ3EK10xYk+HmEv7qgpAGl0u8TcHY7XmGCKKq1HXxP72smigtQRqombYnDhBgkiROj
	Pqv2Yg30JkrpKC9LbvgQY0eBFO1pL4fkHKAf5+JhQNp8b5jhC9brd/bRIPe4Ebmo0czi
	tB8zSleLXPy4czENNt9jWxvwOHZLK3yr8tTPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iwqw8N07cNDoDW0q4JaLkIQA3UXNX2NUmUdq2xVedmE=;
	b=m4pmczN8HEH3Sz7ITmTjDvs4p8jUPMKlViSo5IhXrX6+nWhV3+Aoo+ikXARMZJGh39
	grHU2bpl4jc6h2mOMN6UrSEfUS5UVC0ozDcsIygWQEy/CBGHwMXlaWd06gGxvMoYCGz9
	PVmhAfBWtAYk+Kk/R764fscZsYyWnd3QDVMfLyJDoCPiINl+Tik1JSzQt4BRBQ+7Eheu
	3phP3colYr8kw38uxk7/NjQTsLl3S1m9W5DHkwTHu3PcEkRDktOOZdGIYVzQshXPFNCX
	wA+YlIm88kGbG0/mJ/VCS1OjkMoNMDuElXk9RFhl57TfVblpO22XAWvlFaQrv08NZ3MU
	sVnw==
X-Gm-Message-State: AOUpUlEG7j9/nV2veo82daKjpap8e051PPjwwjuAwCAUHppjgi+XcsGE
	w66tNbupc+l+NNmTQIcbvhdR0g==
X-Google-Smtp-Source: AAOMgperRUToun7Da+NYnLPn8C5EfaO115OVEuVMoxfEnQxTGtYhup/Ni4RM4titINRGDxH70WV02A==
X-Received: by 2002:adf:91e5:: with SMTP id 92-v6mr916984wri.124.1532596230697;
	Thu, 26 Jul 2018 02:10:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j8-v6sm1135474wru.41.2018.07.26.02.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 02:10:29 -0700 (PDT)
Message-ID: <1e41274ab544bfa905bf98a75d6729c492bec19b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 10:10:28 +0100
In-Reply-To: <bc64ac66-d4cb-acb3-5e8e-9bf15ce86317@windriver.com>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
	<a8f34da6-a6e8-4419-1258-87262cf6b772@windriver.com>
	<bc64ac66-d4cb-acb3-5e8e-9bf15ce86317@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 1/6] oeqa: Add selftest parallelisation support
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
X-List-Received-Date: Thu, 26 Jul 2018 09:10:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-26 at 14:00 +0800, Robert Yang wrote:
> 
> On 07/26/2018 11:03 AM, Robert Yang wrote:
> > Hi RP,
> > 
> > On 07/17/2018 12:33 AM, Richard Purdie wrote:
> > > This allows oe-selftest to take a -j option which specifies how
> > > much test
> > > parallelisation to use. Currently this is "module" based with
> > > each module
> > > being split and run in a separate build directory. Further
> > > splitting could
> > > be done but this seems a good compromise between test setup and
> > > parallelism.
> > > 
> > > You need python-testtools and python-subunit installed to use
> > > this but only
> > > when the -j option is specified.
> > 
> > Should we add python-testtools-native and python-subunit-native,
> > please ?
> > 
> > And add them to TESTIMAGEDEPENDS ?
> 
> After talked with Qi, this won't work since we use host's python3. So
> we need install them on host, or use buildtools-tarball.

Correct, this is why the modules are only loaded if you use the -j
option, so the dependency is only needed if you use bitbake -j. That at
 least minimises the cross-section of users affected.

You can't use buildtools-tarball as yet as we don't have the -native or
-nativesdk recipes you mention to add to it.

Cheers,

Richard




