Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5DIU-0006mJ-Au
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 11:41:21 +0100
Received: by mail-vc0-f179.google.com with SMTP id gb23so4342254vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 02:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0ykhxpeLKtEWeX4yUIns+xJGJfY2ZFU07/4ExTnyKAE=;
	b=D+cLKhsr3E8Lu45RPju+7HLaqU1UlaO2szgtxIJHtLiFHb3pLllwDbQXfkqGV/qUs9
	3CTk4VmamoQNRaXTOvr/qTSlt8O2v1eAs8n+siS0Zj6lwt9YKHTaspZmTO22/ovKG8yW
	0SEA1h3TOHnLWNG8h/oyxNJfikVHQw8MkapjtNUTp0AdlTei16h6xig6qtXSCrQpfG62
	oQsgPcIF6s+w6AoicLJ/N7sAvM/pyqIEM9JAM9PvimeRH3GTzLEkrBZoR5Xp0oR2SulV
	i1oYwaDxEFgJWO934AM45Bg4nlNmfadFlv17hm6zHOLyGk0KcYFJKqoVeecEj/XEGiJV
	PBLA==
X-Received: by 10.58.18.201 with SMTP id y9mr2387855ved.36.1360664710547; Tue,
	12 Feb 2013 02:25:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 02:24:50 -0800 (PST)
In-Reply-To: <2760168.9kFd94gL1F@helios>
References: <2760168.9kFd94gL1F@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 10:24:50 +0000
Message-ID: <CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkJ0iEJMgUKubS7e/qCkySN0mtKFxrF+UF5cajQT+MnirSx8sYjbkzB38A9+8/0lMhMjf7x
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 10:41:23 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2013 17:09, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> I'd like to make an attempt to remove all appends and overlayed recipes from
> the meta-oe layer. As I've said previously, I don't believe meta-oe - as a
> collection of very useful additional recipes that many wish to be able to use
> on top of their OE-Core based build configurations - should be making any
> possibly unexpected changes to those configurations. Any such changes ought to
> be the province of distro layers alone.

Hear hear!

> * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe that is
> ahead of 1.0; the OE-Core version has two patches not in the meta-oe version
> but that both have been merged upstream in the git revision being used in the
> meta-oe version. There is no newer stable release. What do we do here? Should
> we ask upstream (Chris) for a new stable release?

Is anyone actually using tslib these days?  oe-core dropped kdrive,
and we don't package the apparently unmaintained input driver for
Xorg.  I guess a new upstream would be good, and then move to meta-oe.

> * xserver-nodm-init: the two versions are quite distinct. Not sure I
> understand the full history here but perhaps someone else can fill in the
> blanks...?

I don't understand the full history either yet, but this is clearly
something that needs to be sorted.

> * meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> As far as I can tell this just adds an /etc/busybox-syslog.default file
> containing OPTIONS="-C64" and seems to have been added for systemd support.
> I'm not sure why this wasn't moved to meta-systemd, but I assume it needs to
> be merged into OE-Core now that systemd support is being added there... ?

When it's understood *what* that does, then we can evaluate it for oe-core.

> * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> Another bbappend apparently for systemd support. Again, this should have been
> moved to meta-systemd; do we now need to merge it into OE-Core?

Yes, half of it has been merged to master already. The rest should be
in Radu's branch, we can sort that today.

> * meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
> Builds against external libav instead of using the builtin copy of ffmpeg,
> apparently for better performance on ARM (and presumably that is not the only
> benefit). It's less clear to me what should be done with this, but I'd still
> rather it could be eliminated. OE-Core does not have ffmpeg/libav; one wonders
> if it should or not.

libav/gst-ffmpeg/gst-av (as it's called in gst1.0) has interesting
legal issues, but I do think it should be in oe-core.

Ross


