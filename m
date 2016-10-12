Return-Path: <matt@madison.systems>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 578EC71A8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 18:03:38 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id b75so87312605lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 11:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+vdvSM2tVxpx2ULTIF66pX87C5fItjSGj5sSUlz2s38=;
	b=o+Bun2XmZTbkC2xBpxhFLZuptOhB/CejZxgaJQZuvEUdXPGxuqpQamN2T/M/3XRM3C
	p9zV0RhgjBHrh9behTadqNIF7YCije/L8ZhvrxTGhrnPJeNSBA/BZSrZrtInK8ZkcCqJ
	VSM/pg0QsEwhctcTyrHkcZoGrb0FaanwF08j/arQk3cUj/1hMMlZkLvgLiAnsrLjWdFL
	JcxujfDizdcuZk3tpAJN+GtU12/VNicujKMYgruj3Htdk8XSQIo1GLxY4L0DLDkUZT0F
	INRejYG+fjIITddHGG3G/FxiL0jA0BsusumMQXRm632W5z528g3tt6j6yJ3SRA2CnLAv
	7sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+vdvSM2tVxpx2ULTIF66pX87C5fItjSGj5sSUlz2s38=;
	b=RlTG/BzdItdsarAJYV5VCeoQf/wixVz3nSlyaPDf78dcrt78ReWjakoGfXta6WXmaD
	ukI6hsYcfXi2WWmWA1PiuduPu+gG2wQ3vfw/lK4dkhkFHk/GXTk0gv6PG8KsKAuvAYWx
	JpcfgNdcHH1QD8MTc6lM6eYnleVlOV++IqToSPySJgg/+1OJG3ri+BWLJd1UbRpJjsw9
	QIONx4MUMYCB0hyNbepZjS5XysjxbfLXXjm9pDu8pU1oo0jU231JPm9VKWrt0g1t8iQM
	mI7u5MCQnoNHsUSo8LjjzMFri2fTt0TYEeiqxlyc/JfNFCorK3MKm6xN3l3d2RCB0XsP
	w2pA==
X-Gm-Message-State: AA6/9RlbL/FLYtCdZv3WTx+OT3bjv6psnD1VkFIzpEA/kjfAJ5Pgj3pyqM97OtreU0Oq9EuRKeFqIz4uADRmGg==
X-Received: by 10.25.12.78 with SMTP id 75mr3126929lfm.177.1476295419075; Wed,
	12 Oct 2016 11:03:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.201.195 with HTTP; Wed, 12 Oct 2016 11:03:38 -0700 (PDT)
In-Reply-To: <1476291665.16008.59.camel@pbcl.net>
References: <1476291665.16008.59.camel@pbcl.net>
From: Matt Madison <matt@madison.systems>
Date: Wed, 12 Oct 2016 11:03:38 -0700
Message-ID: <CAGgRHJoQWX=+WtcXzOTN4k6MLLerfCFFf8RJXVARpjug4+pYSw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts in DL_DIR
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
X-List-Received-Date: Wed, 12 Oct 2016 18:03:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2016 at 10:01 AM, Phil Blundell <pb@pbcl.net> wrote:
> I just ran into an annoying problem with two recipes whose upstreams
> both use the same poor naming scheme for their downloadable tarballs
> which causes the sources to collide in DL_DIR.  One of them is eudev,
> which has:
>
> SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz
>
> This shows up as a source checksum error when the second package finds
> what it thinks are its sources in DL_DIR, but of course they are not
> the files that it wanted.
>
> I couldn't immediately find any easy way to work around this
> difficulty.  Setting "localpath=eudev_v{$PV}.tar.gz" in eudev's SRC_URI
> looks superficially like it ought to do the right thing, but although
> this changes the location that the fetcher will search for the
> downloaded file it doesn't actually cause wget to put the file there so
> this doesn't work either.

I use ";downloadfilename=${BPN}-${PV}.tar.gz" to deal with this
problem, and it's worked well for me.

-Matt

>
> I suppose I could define DL_DIR in terms of ${PN}, which would
> presumably fix this problem at the cost of causing all my previous
> downloads to be repeated.  Or I could stop using eudev, or wait for one
> of the two packages to release a new version. :-)  Any better
> suggestions?
>
> thanks
>
> p.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

