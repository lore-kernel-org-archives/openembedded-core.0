Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1U4xlo-0007zF-DE; Mon, 11 Feb 2013 19:06:25 +0100
Received: by mail-oa0-f51.google.com with SMTP id h2so6507303oag.38
	for <multiple recipients>; Mon, 11 Feb 2013 09:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fNuouELcn/Nzu5LwU0tiHcuYAVJmRcoyXM/4mk0h4a4=;
	b=ihzvNN0OAdPt5sZkg94pzwURYeBmdIDsha+O3lPgySUOtZ6sUK42kYh1h1t0X+OqIl
	eufS/QtvEEzAQqHWVyuKPbB75KUfEPezjr9mrXw82nyPxG4rsdNDUqwMKfdk3nQa6eN3
	GfbjiH5I4y7Nyde1HAz8HAS4QhE/SvDM/6GyWcgPt+mh43YGkvBBSs0MYaO7bVp0VBDK
	WGCMqgS+DlBKl42yk1Ga4xpgZoZkwULk7kbKgU9m64j4QOvRDGXev7LBiRy2jFYvjSxa
	RQO1Dh4IaZrtEIWu+VNj+foF5Lak8mRsZHx964TIO9TBMMtiilCSpV2X/fA8k51zjRqu
	vnAA==
MIME-Version: 1.0
X-Received: by 10.60.170.44 with SMTP id aj12mr7651501oec.42.1360605025515;
	Mon, 11 Feb 2013 09:50:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 11 Feb 2013 09:50:25 -0800 (PST)
In-Reply-To: <2760168.9kFd94gL1F@helios>
References: <2760168.9kFd94gL1F@helios>
Date: Mon, 11 Feb 2013 15:50:25 -0200
X-Google-Sender-Auth: plhLkZ4lxFDpX0xP4iVgrdwUdiQ
Message-ID: <CAP9ODKpa99P4ZKu+JyPXfruLjAV01Oo2G-MTZOc83g0d5JN1uQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 18:06:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 3:09 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
...
> Currently we have the following overlayed recipes:
>
> * icon-naming-utils: meta-oe has a newer version (0.8.90 vs OE-Core's 0.8.7)
> and it uses BBCLASSEXTEND rather than OE-Core's native recipe. I would propose
> to just move the meta-oe version to OE-Core since it appears to be superior.

Agreed.

> * libmad: both layers have the same version. The meta-oe version has some
> slightly different versions of the MIPS compiler flag fix and -fforce-mem removal
> patches but I think these can be ignored, since the OE-Core versions of these
> patches have proper headers and are presumably working. The OE-Core version
> has LICENSE_FLAGS that the meta-oe one doesn't, but is missing an avr32-
> specific optimisation patch that is in the meta-oe version. What would we do
> with the latter? Is it appropriate to add to the OE-Core recipe?

Well maybe clean it and keep the avr32 specific optimization?

> * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe that is
> ahead of 1.0; the OE-Core version has two patches not in the meta-oe version
> but that both have been merged upstream in the git revision being used in the
> meta-oe version. There is no newer stable release. What do we do here? Should
> we ask upstream (Chris) for a new stable release?

It'd be good; in meanwhile we could move meta-oe version to OE-Core.

...
> As far as bbappends go we have:
>
> * meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> As far as I can tell this just adds an /etc/busybox-syslog.default file
> containing OPTIONS="-C64" and seems to have been added for systemd support.
> I'm not sure why this wasn't moved to meta-systemd, but I assume it needs to
> be merged into OE-Core now that systemd support is being added there... ?

Agreed.

> * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> Another bbappend apparently for systemd support. Again, this should have been
> moved to meta-systemd; do we now need to merge it into OE-Core?

Agreed.

> * meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
> This is adding qwt to the qte toolchain. As far as I am concerned this is a
> distro policy decision - Qwt is a third-party library that is not part of Qt.
> I believe this should be moved to the layers for whichever distros want this.

I think people using qte toolchain ought to comment on it.

> * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see this
> as a distro policy decision; these should move to the layers for whichever
> distros want this. FWIW, this is particularly egregious if you've already
> built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.

Yes; I think I agree also because *most* people won't use these
backends so better to handle this in the specific
layers/distros/whatever needs it.

> * meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
> Builds against external libav instead of using the builtin copy of ffmpeg,
> apparently for better performance on ARM (and presumably that is not the only
> benefit). It's less clear to me what should be done with this, but I'd still
> rather it could be eliminated. OE-Core does not have ffmpeg/libav; one wonders
> if it should or not.

Dropping it would be a regression IMO so we might try to work in a
solution to OE-Core?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


