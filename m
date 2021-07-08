Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web10.12874.1625754882731096175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 07:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=Fy5J/jUG;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 1V6smUU9b7QW91V6tmqSkF; Thu, 08 Jul 2021 15:34:40 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=H+BAP9Qi c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8nJEP1OIZ-IA:10 a=e_q4qTt1xDgA:10 a=NkFYxjL-eoRBABLRooAA:9 a=wPNLvfGTeEIA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description;
	bh=FR0quCsbHttSJaWRQ3U1hyGvu6WHQzgyRAaFPSMSsYw=; b=Fy5J/jUGQNgF3JP8uSdQTkOSYo
	QQ7vpkagYsoXlWvCEVMJW61j6Pfhk5VYKovme2ihLcUE22w6u5hvGmwB49osnD2PenrrjzbbCUkcC
	AklQMwjUOWcuEj9xOTvTyjq8nOW1x3U1DGeV9MaX7P0WGav/JsmMZyHec1T+fc4jNLtSEGKFzxHd8
	GrOfrU7bdri3mtL2A4SsSknzqzSj4O5LJsUAA/oX65eul1/shK9fDGqGNpySOiURajkcT64mIKYyw
	b9vZYmMW2fnDx9jU/YgHWES1zyWuo5FX5Y+ppJgOaGyqAsP0W+rTD3HNZBo8nLPUGhVfQQiw492cK
	MkgwrodQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m1V6s-0004Ai-JK; Thu, 08 Jul 2021 15:34:38 +0100
Date: Thu, 8 Jul 2021 15:34:38 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] license: Drop adding RRECOMMENDS for license packages
Message-ID: <20210708143438.GA15344@mcrowe.com>
References: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
 <20210708082623.GA25489@mcrowe.com>
 <2302b1a994beea1e8cafb536a123d6ca9d375085.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <2302b1a994beea1e8cafb536a123d6ca9d375085.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfAjp+SSiDmo9Mr7iO51Vek1GMy+Qd+56IL9R6+f1ENzIZ6waVxY54/p9/JFdaKrBGbs11rt1l1nYptoPIosBNmsMaCHKr1WSOQ/T+bHxFzxpyPcsD+09
 nJF6j6h8JUXdy8S/UtASinbfK0JE33RLnFwfWsoZGc+oc4rF+Aedwu+/R6CS6pbFdzuGQVwnVxYsoA==
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thursday 08 July 2021 at 09:33:12 +0100, Richard Purdie wrote:
> On Thu, 2021-07-08 at 09:26 +0100, Mike Crowe wrote:
> > On Wednesday 07 July 2021 at 18:06:07 +0100, Richard Purdie wrote:
> > > This changes behaviour when LICENSE_CREATE_PACKAGE is in use. Packages
> > > no longer have RRECOMMENDS adding to them.
> > > 
> > > It was highlighted that this doesn't apply to PACKAGES_DYNAMIC, nor can
> > > it easily be made to do so. There is also a much easier way to handle this
> > > which is:
> > > 
> > > IMAGE_INSTALL_COMPLEMENTARY += "*-lic"
> > > 
> > > which works on a per image basis and doesn't change the underlying
> > > package dependencies. I propose we switch to this instead.

[snip]

> > Since the equivalent for "*-dbg" is to add dbg-pkgs to IMAGE_FEATURES, I
> > think that adding:
> > 
> >  COMPLEMENTARY_GLOB[lic-pkgs] = "*-lic"
> > 
> > to license_image.bbclass is a cleaner solution.
> 
> Yes, I like that.

It seems to work well for me.

> > We could make the feature
> > imply LICENSE_CREATE_PACKAGE="1" but it feels strange for an image feature
> > to affect the packages when they are built so perhaps that isn't a good
> > idea.
> 
> I agree, I'm not sure that would be too helpful. Maybe a comment next to
> the line above mentioning it needs to be set? We might also be able to
> add a warning if it wasn't set but lic-pkgs was used?

The comment is easy, as is documenting the image feature. If I add
"lic-pkgs" to EXTRA_IMAGE_FEATURES but don't set LICENSE_CREATE_PACKAGE="1"
then there are no errors when building the image. I added:
--8<--
python() {
    if not oe.data.typed_value('LICENSE_CREATE_PACKAGE', d):
        features = set(oe.data.typed_value('IMAGE_FEATURES', d))
        if 'lic-pkgs' in features:
            bb.error("'lic-pkgs' in IMAGE_FEATURES but LICENSE_CREATE_PACKAGE not enabled to generate -lic packages")
}
-->8--
to license_image.bbclass which reports the problem, but does so for every
image even if it isn't being built. An alternative would be to add a new
function to ROOTFS_PREPROCESS_COMMAND which does the check at image
creation time.

Do you have a preference, or is there a better way that I've missed?

Thanks.

Mike.
