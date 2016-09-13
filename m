Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD17377047
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 07:44:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b184so1058301wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nFkgupwx0qneUeDq/dsxLT1fzaRYhxKlLupU0KfUgTQ=;
	b=DBPfC5jWzV0f/ovU5ITxd/CZKjoI1aTwX2BKPndnTiXKbrCAWbVXa7+SaKCIRKcTXg
	4bHARUop3/YJxNE/EEpv9R9cANWUfUKqHRcU7IwgVStYZ2DKw3Eqe6mlBIJZWLpSvxyJ
	SIquDaHcLVFBd3c2pyqwAxx62R/7LlrOrRgcrXDVcCdJ7DdmMcBwPgEB45V+fkKG27L/
	/ijWg8yN++drVQjAOiznXX9tJ9qzDNGOI0vcxVEon96HBWkLc4FmqfeSn2otI6uNx24+
	JhvQGaOOoydcdSEvaVJAZbZ3q6LF8YNkfcJJc2buisHLPlIC1YQ5mACRZATSIq3fo8+P
	NcDA==
X-Gm-Message-State: AE9vXwPyv3r4xPMZEwEqfhTZDHeqhazNcNdR0/BZs2rH/GM+GPSIxN84hjVSjHR4MZ/YiQ==
X-Received: by 10.194.94.138 with SMTP id dc10mr22057519wjb.40.1473752682718; 
	Tue, 13 Sep 2016 00:44:42 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	137sm3906347wmi.16.2016.09.13.00.44.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Sep 2016 00:44:41 -0700 (PDT)
Message-ID: <1473752680.5279.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Sep 2016 08:44:40 +0100
In-Reply-To: <CAJTo0LYGsh5fwJhsf57OcSxnRWxC2nXEM=dUbO+SeQKvnwos7A@mail.gmail.com>
References: <20160905083442.27787-1-git@andred.net>
	<1473693988.22823.1.camel@andred.net>
	<CAJTo0LYGsh5fwJhsf57OcSxnRWxC2nXEM=dUbO+SeQKvnwos7A@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: do not check size of the debugfs image
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
X-List-Received-Date: Tue, 13 Sep 2016 07:44:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Somebody did mention last week (Monday?) on IRC that mails are not arriving.
In the mailman web interface they aren't missing though (which is what I
sometimes use to check)... Strange

Andre'


On Mo, 2016-09-12 at 16:36 +0100, Burton, Ross wrote:
> Well there must have been some list/gmail snafu, as I definitely don't
> have
> this patch locally but patchwork has it.  I wonder what else I'm
> missing...
> 
> Ross
> 
> On 12 September 2016 at 16:26, André Draszik <git@andred.net> wrote:
> 
> > 
> > ping
> > 
> > On Mo, 2016-09-05 at 09:34 +0100, André Draszik wrote:
> > > 
> > > The debugfs is supposed to be used in addition to the
> > > normal image for debugging purposes, it doesn't make
> > > sense to artificially limit its maximum size.
> > > 
> > > Signed-off-by: André Draszik <git@andred.net>
> > > ---
> > >  meta/classes/image.bbclass | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > index 07bd2d6..cb7d06d 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -538,6 +538,12 @@ def get_rootfs_size(d):
> > >      base_size += rootfs_alignment - 1
> > >      base_size -= base_size % rootfs_alignment
> > > 
> > > +    # Do not check image size of the debugfs image. This is not
> > > supposed
> > > +    # to be deployed, etc. so it doesn't make sense to limit the size
> > > +    # of the debug.
> > > +    if (d.getVar('IMAGE_BUILDING_DEBUGFS', True) or "") == "true":
> > > +        return base_size
> > > +
> > >      # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
> > >      if rootfs_maxsize:
> > >          rootfs_maxsize_int = int(rootfs_maxsize)
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 

