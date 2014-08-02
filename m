Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF216084E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 20:06:39 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so7679503pab.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rUEyFibHXVRQb7yQk1a3JZhhNV7suGxKwuo+wm1NRJY=;
	b=pPcPu8RTMdMvHAP5QznDzq6FDShmSAzDX3xvJrKqaVAFuOCFUkUMZX2/V8ztXy5DQu
	0YfN4/8hGEewaTdRkCMrvCkVho074rBRydheUfcm51Qh2Kefp7tgLYvNy/5Kn82/hJKP
	TukDC1eGCz51fr9w7Zbly3d/mRosXSheDMIZkkDJ5qg1T9WhqLv8X3aArM2Wq3hjcSae
	cKGVUhKyxP3f8F95b9rIIVCjxlDyNpG1DNEhjQQcQZ031jVW7dUE2xq9YlOxXKSEiUX6
	0ocMGJij7XvpVhdmE+TwVdRKMwQMqGBvkFfIvMmLVbY3x3GnmizY11IhGiqJQA9mty3O
	jX9w==
X-Received: by 10.66.122.3 with SMTP id lo3mr14341581pab.7.1407010000712;
	Sat, 02 Aug 2014 13:06:40 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	vy3sm10307436pbc.92.2014.08.02.13.06.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Aug 2014 13:06:40 -0700 (PDT)
Date: Sat, 2 Aug 2014 13:09:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20140802200959.GA22882@haswell>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<CAMKF1srw7Rho8mFxL9nfB-wm3OQsx8QPV_DMqEQ4Miv8uxiFdg@mail.gmail.com>
	<alpine.LFD.2.11.1408021555440.5174@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1408021555440.5174@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Sat, 02 Aug 2014 20:06:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14-08-02 15:57:00, Robert P. J. Day wrote:
> On Sat, 2 Aug 2014, Khem Raj wrote:
> 
> > On Sat, Aug 2, 2014 at 9:34 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > say, pkg_prerm() functions would never be written with respect to the
> > > variable ${D}, which would be relevant only during image creation. but
> > > i can see things like this in sysklogd.inc:
> > >
> > > pkg_prerm_${PN} () {
> > >         if test "x$D" = "x"; then
> >
> > note that its not ${D} (bitbake context) but $D which is evaluated
> > in the context when the script is run.
> 
>   i still don't understand ... what are the possible values of $D
> here, and what would they represent?

At build time it will not be expanded by bitbake like ${D} is. but
during image creation it will be. But when doing on-device install of
this package $D will be empty. Its a way to differentiate actions during
image creation and on-device install/update/remove

-Khem

