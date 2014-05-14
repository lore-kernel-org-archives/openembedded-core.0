Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (unknown [209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 373DD6601E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 00:54:44 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so1165981iec.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 17:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fsbmq/LkujR7XgMMg45FLqBRtZ4VmId3rnnMACOCGmA=;
	b=RRBCkNIeEWuUZ+763Tf1t7dX8ylf6b60Qh925usLpIZ11lBjBYHjtdgM/buN2M6Ckk
	EiBJM+F5ftV9a/wHmyVldelFyk6M7qcBbSii14tEWycIFe4fRvZx6jZuFubcWbkOB2+G
	q03XkzDr/vQfA85TnOzfA9cWp0NpFKzDDW1lWXCAzxMxN4wv79HwapbsYAWsqbP+cPbG
	1MOU05zWCgnMTtXB9Ds9V7wB8BfZ3m9yd32cbSfW4wfxpl+qvrf9ADfvgBZYuAAxXllH
	6wBzvs+n0984Uu+mNAXoJhtgR4DcQozcez10KGhFA9uQubRccGOlLwDxG86XvRbiR/KC
	+hOQ==
X-Received: by 10.43.93.5 with SMTP id bs5mr274290icc.11.1400028885641; Tue,
	13 May 2014 17:54:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Tue, 13 May 2014 17:54:15 -0700 (PDT)
In-Reply-To: <CAGw0TDOG3uPt36sRbA5gqKcyTRkLi6sqdOgs6xkhZ5KFbp_omw@mail.gmail.com>
References: <CAGw0TDOG3uPt36sRbA5gqKcyTRkLi6sqdOgs6xkhZ5KFbp_omw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 May 2014 17:54:15 -0700
Message-ID: <CAMKF1spJif6MDdHVF+zha2epA9jE61nZQNw_=AGQvGse+Ru4tg@mail.gmail.com>
To: Charles Oram <charles@oram.co.nz>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libmtp "Makefile.am: No such file or directory" build error
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
X-List-Received-Date: Wed, 14 May 2014 00:54:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 13, 2014 at 5:33 PM, Charles Oram <charles@oram.co.nz> wrote:
> Hi,
> I am building an image using Yocto Project (dora branch) for the Cubox-i and
> I am getting an error when trying to build libmtp.
>
> Here is part of the log file (log.do_unpack) with the error:
>
> DEBUG: Executing shell function skip_udev_rules_generation
> sed: can't read Makefile.am: No such file or directory
> WARNING: exit code 2 from a shell command.
> ERROR: Function failed: skip_udev_rules_generation (log file is located at
> /home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/libmtp/1.1.5-r0/temp/log.do_unpack.14617)
>
> libmtp_1.1.5.bb has the following in it:
>
> skip_udev_rules_generation () {
>     sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' Makefile.am
>     cp ${WORKDIR}/69-libmtp.rules ${S}/
> }
>
> but it looks to me like it should be:
>
> skip_udev_rules_generation () {
>     sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' ${S}/Makefile.am
>     cp ${WORKDIR}/69-libmtp.rules ${S}/
> }
>
> i.e. with ${S}/ path to Makefile.am.
>
> With this change it builds (not sure yet wither it runs as I have other
> build errors to fix).

thats correct fix. Please submit a path to relevant layer. Follow
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

> I'm still learning about Yocto and OpenEmbedded - does this fix look right?
>
> regards,
> Charles
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

